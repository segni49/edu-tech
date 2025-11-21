import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eco_tips/features/tips/domain/tip.dart';
import 'package:eco_tips/features/favorites/data/favorites_store.dart';
import 'package:eco_tips/l10n/app_localizations.dart';

class TipCard extends ConsumerWidget {
  final Tip tip;

  const TipCard({Key? key, required this.tip}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final isFavorite = favorites.contains(tip.id);
    final loc = AppLocalizations.of(context);

    return Semantics(
      label: '${loc.appTitle} Tip: ${tip.title}, category ${tip.category.name}. Favorite ${isFavorite ? 'on' : 'off'}.',
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: ListTile(
          title: Text(tip.title),
          subtitle: Chip(label: Text(tip.category.name.toUpperCase())),
          trailing: IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: isFavorite ? Colors.red : null),
            tooltip: isFavorite ? loc.removeFromFavorites : loc.addToFavorites,
            onPressed: () {
              ref.read(favoritesProvider.notifier).toggleFavorite(tip.id);
            },
          ),
          onTap: () {
            Navigator.pushNamed(context, '/tip_detail', arguments: tip);
          },
        ),
      ),
    );
  }
}
