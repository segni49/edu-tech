import 'package:flutter_test/flutter_test.dart';
import 'package:eco_tips/features/tips/domain/tip.dart';

void main() {
  group('Tip.fromJson', () {
    test('parses valid JSON correctly', () {
      final json = {
        'id': '1',
        'title': 'Test Tip',
        'action': 'Do something',
        'impact': 'It helps',
        'category': 'energy',
      };

      final tip = Tip.fromJson(json);

      expect(tip.id, '1');
      expect(tip.title, 'Test Tip');
      expect(tip.action, 'Do something');
      expect(tip.impact, 'It helps');
      expect(tip.category, Category.energy);
    });

    test('throws error on missing fields', () {
      final json = {
        'id': '1',
        'title': 'Test Tip',
        'action': 'Do something',
        // 'impact' missing
        'category': 'energy',
      };

      expect(() => Tip.fromJson(json), throwsArgumentError);
    });

    test('throws error on invalid category', () {
      final json = {
        'id': '1',
        'title': 'Test Tip',
        'action': 'Do something',
        'impact': 'It helps',
        'category': 'invalid',
      };

      expect(() => Tip.fromJson(json), throwsArgumentError);
    });

    test('throws error on exceeding max length', () {
      final json = {
        'id': '1',
        'title': 'T' * 121,
        'action': 'A' * 501,
        'impact': 'I' * 301,
        'category': 'energy',
      };

      expect(() => Tip.fromJson(json), throwsArgumentError);
    });
  });
}
