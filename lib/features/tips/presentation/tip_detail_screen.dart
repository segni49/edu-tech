import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eco_tips/features/tips/domain/tip.dart';
import 'package:eco_tips/features/favorites/data/favorites_store.dart';
import 'package:eco_tips/l10n/app_localizations.dart';

class TipDetailScreen extends ConsumerWidget {
  final Tip tip;

  const TipDetailScreen({Key? key, required this.tip}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final isFavorite = favorites.contains(tip.id);
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(tip.title),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: isFavorite ? Colors.red : null),
            tooltip: isFavorite ? loc.removeFromFavorites : loc.addToFavorites,
            onPressed: () {
              ref.read(favoritesProvider.notifier).toggleFavorite(tip.id);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(label: Text(tip.category.name.toUpperCase())),
            const SizedBox(height: 16),
            Text(loc.tipDetailAction, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(tip.action, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
            Text(loc.tipDetailImpact, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(tip.impact, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
