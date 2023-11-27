/// run this in terminal::::  flutter test integration_test/app_test.dart
///
/// test how individual pieces work together as a whole,
/// capture the performance of an application running on a real device
import 'package:flutter/material.dart';
import 'package:flutter_project_template_riverpod/modules/login_signup/splash_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_project_template_riverpod/common/values/string_manager.dart';
import 'package:flutter_project_template_riverpod/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap the button, navi to MainTabPage', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await pumpUntil(
        tester: tester,
        condition: find.byType(SplashPage),
        check: findsOneWidget,
      );
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      // To welcome page
      expect(find.text(FZStrings.goToMainTab), findsOneWidget);

      // Finds the  button to tap on.
      final Finder goToMainTab = find.byKey(const Key(FZStrings.goToMainTab));

      // Emulate a tap on the button.
      await tester.tap(goToMainTab);
      // Trigger a frame.
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      expect(find.text('Home'), findsOneWidget);

      final bookPageFinder =
          find.byKey(const Key(FZStrings.bookBottomNavigationBarItem));
      final tripsPageFinder =
          find.byKey(const Key(FZStrings.tripsBottomNavigationBarItem));
      final supportPageFinder =
          find.byKey(const Key(FZStrings.supportBottomNavigationBarItem));
      final accountPageFinder =
          find.byKey(const Key(FZStrings.accountBottomNavigationBarItem));
      final homePageFinder =
          find.byKey(const Key(FZStrings.homeBottomNavigationBarItem));

      /// navi to bookPage
      await tester.tap(bookPageFinder);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      /// navi to trips Page
      await tester.tap(tripsPageFinder);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      /// navi to support Page
      await tester.tap(supportPageFinder);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      /// navi to account Page
      await tester.tap(accountPageFinder);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      /// navi to home Page
      await tester.tap(homePageFinder);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();
    });
  });
}

pumpUntil({
  required WidgetTester tester,
  Finder? condition,
  Matcher? check,
  int interval = 1,
  int maxRetries = 20,
  List<Finder?>? conditions,
  bool ensureVisible = false,
}) async {
  assert(interval > 0);
  conditions = conditions ?? [condition];
  int awaited = 0;
  while (awaited <= maxRetries) {
    await tester.pumpAndSettle();
    if (check != null && conditions.first != null) {
      for (var c in conditions) {
        try {
          expect(c, check);
          await tester.pumpAndSettle();
          if (ensureVisible) await tester.ensureVisible(c!);
          return;
        } on Exception catch (_) {}
      }
    }
    await Future.delayed(Duration(seconds: interval));
    awaited += interval;
  }
  if (check != null && conditions.first != null) {
    for (var c in conditions) {
      expect(c, check);
    }
  }
}
