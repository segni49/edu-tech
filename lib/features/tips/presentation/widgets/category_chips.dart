import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eco_tips/features/tips/domain/tip.dart';
import 'package:eco_tips/features/tips/domain/tip_repository.dart';
import 'package:eco_tips/l10n/app_localizations.dart';

class CategoryChips extends ConsumerWidget {
  const CategoryChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final loc = AppLocalizations.of(context);

    final categories = [
      null, // Represents "All"
      ...Category.values,
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = selectedCategory == category;
          final label = category == null ? loc.categoryAll : loc.category(category.name);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ChoiceChip(
              label: Text(label),
              selected: isSelected,
              onSelected: (_) {
                ref.read(selectedCategoryProvider.notifier).state = category ?? Category.values.first;
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
