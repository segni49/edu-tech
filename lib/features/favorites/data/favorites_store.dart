import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, Set<String>>((ref) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<Set<String>> {
  static const _prefsKey = 'favorites';

  FavoritesNotifier() : super({}) {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList(_prefsKey) ?? [];
    state = favs.toSet();
  }

  Future<void> toggleFavorite(String tipId) async {
    final newState = Set<String>.from(state);
    if (newState.contains(tipId)) {
      newState.remove(tipId);
    } else {
      newState.add(tipId);
    }
    state = newState;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefsKey, state.toList());
  }
}
