import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, Set<int>>((ref) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<Set<int>> {
  FavoritesNotifier() : super({}) {
    loadFavorites();
  }

  final Box _favoritesBox = Hive.box('favorites');

  void loadFavorites() {
    final favIds = _favoritesBox.get('favorites');
    state = favIds != null ? Set<int>.from(favIds) : {};
  }

  void toggleFavorite(int id) {
    final newState = Set<int>.from(state);
    if (newState.contains(id)) {
      newState.remove(id);
    } else {
      newState.add(id);
    }
    _favoritesBox.put('favorites', newState.toList()); // Save updated list
    state = newState;
  }

  bool isFavorite(int id) => state.contains(id);
}
