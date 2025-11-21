import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eco_tips/features/tips/domain/tip.dart';
import 'package:eco_tips/features/tips/domain/tip_repository.dart';
import 'package:eco_tips/features/tips/presentation/widgets/tip_card.dart';
import 'package:eco_tips/features/tips/presentation/widgets/category_chips.dart';
import 'package:eco_tips/l10n/app_localizations.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tipsAsync = ref.watch(tipsProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.appTitle),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CategoryChips(),
          ),
          Expanded(
            child: tipsAsync.when(
              data: (tips) {
                final filteredTips = selectedCategory == Category.values.first
                    ? tips
                    : tips.where((tip) => tip.category == selectedCategory).toList();

                if (filteredTips.isEmpty) {
                  return Center(child: Text(loc.noTipsFound));
                }

                return ListView.builder(
                  itemCount: filteredTips.length,
                  itemBuilder: (context, index) {
                    final tip = filteredTips[index];
                    return TipCard(tip: tip);
                  },
                );
              },
              loading: () => Center(child: Text(loc.loading)),
              error: (error, _) => Center(child: Text(loc.errorLoadingTips(error.toString()))),
            ),
          ),
        ],
      ),
    );
  }
}
