import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eco_tips/lib.dart';
import 'package:eco_tips/features/tips/domain/tip.dart';
import 'package:eco_tips/features/tips/presentation/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  final testTips = [
    Tip(
      id: '1',
      title: 'Test Tip 1',
      action: 'Action 1',
      impact: 'Impact 1',
      category: Category.energy,
    ),
    Tip(
      id: '2',
      title: 'Test Tip 2',
      action: 'Action 2',
      impact: 'Impact 2',
      category: Category.food,
    ),
  ];

  testWidgets('HomeScreen renders tips and chips', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          tipsProvider.overrideWithValue(AsyncValue.data(testTips)),
          selectedCategoryProvider.overrideWithValue(Category.energy),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    expect(find.text('Test Tip 1'), findsOneWidget);
    expect(find.text('Test Tip 2'), findsNothing);

    expect(find.byType(ChoiceChip), findsNWidgets(Category.values.length + 1));
  });

  testWidgets('Favorite toggle updates UI and persists state', (WidgetTester tester) async {
    final container = ProviderContainer();
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    // Initially no favorites
    expect(container.read(favoritesProvider).isEmpty, isTrue);

    // Tap favorite icon on first tip
    await tester.tap(find.byIcon(Icons.favorite_border).first);
    await tester.pumpAndSettle();

    expect(container.read(favoritesProvider).contains(testTips[0].id), isTrue);

    // Tap again to remove
    await tester.tap(find.byIcon(Icons.favorite).first);
    await tester.pumpAndSettle();

    expect(container.read(favoritesProvider).contains(testTips[0].id), isFalse);
  });

  testWidgets('Navigation to detail and content rendering', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          tipsProvider.overrideWithValue(AsyncValue.data(testTips)),
          selectedCategoryProvider.overrideWithValue(Category.energy),
        ],
        child: MaterialApp(
          onGenerateRoute: (settings) {
            if (settings.name == '/tip_detail') {
              final tip = settings.arguments as Tip;
              return MaterialPageRoute(
                builder: (_) => Scaffold(
                  body: Text('Detail: ' + tip.title),
                ),
              );
            }
            return MaterialPageRoute(builder: (_) => const HomeScreen());
          },
        ),
      ),
    );

    await tester.tap(find.text('Test Tip 1'));
    await tester.pumpAndSettle();

    expect(find.text('Detail: Test Tip 1'), findsOneWidget);
  });
}
