import 'package:flutter_test/flutter_test.dart';
import 'package:eco_tips/features/favorites/data/favorites_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FavoritesStore', () {
    test('initially loads empty favorites', () async {
      SharedPreferences.setMockInitialValues({});
      final notifier = FavoritesNotifier();
      await Future.delayed(Duration.zero);
      expect(notifier.state, isEmpty);
    });

    test('toggleFavorite adds and removes favorites', () async {
      SharedPreferences.setMockInitialValues({});
      final notifier = FavoritesNotifier();
      await Future.delayed(Duration.zero);

      await notifier.toggleFavorite('tip1');
      expect(notifier.state.contains('tip1'), isTrue);

      await notifier.toggleFavorite('tip1');
      expect(notifier.state.contains('tip1'), isFalse);
    });

    test('favorites persist across writes', () async {
      SharedPreferences.setMockInitialValues({});
      final notifier = FavoritesNotifier();
      await Future.delayed(Duration.zero);

      await notifier.toggleFavorite('tip1');
      await notifier.toggleFavorite('tip2');

      final newNotifier = FavoritesNotifier();
      await Future.delayed(Duration.zero);

      expect(newNotifier.state.contains('tip1'), isTrue);
      expect(newNotifier.state.contains('tip2'), isTrue);
    });
  });
}
