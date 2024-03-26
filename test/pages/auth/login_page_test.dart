import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_screen_app/pages/auth/login_page.dart';
import 'package:login_screen_app/pages/auth/register_page.dart';
import 'package:login_screen_app/pages/home_page.dart';

void main() {
  testWidgets(
    'LoginPage UI Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      // Verify if the title text is displayed.
      expect(find.text('Momentum'), findsOneWidget);

      // Verify if the "Log in" text is displayed.
      expect(find.text('Log in'), findsOneWidget);

      // Verify if the email and password text fields are displayed.
      expect(find.byType(TextFormField), findsNWidgets(2));

      // Enter valid email and password.
      await tester.enterText(
          find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password');

      // Tap on the login button.
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Verify if it navigates to HomePage after tapping on the login button.
      expect(find.byType(HomePage), findsOneWidget);

      // Tap on the login button.
      await tester.tap(find.text('Back'));
      await tester.pumpAndSettle();

      // Verify if it navigatd back to LoginPage
      expect(find.byType(LoginPage), findsOneWidget);

      // Tap on the register button.
      await tester.tap(find.text('Register'));
      await tester.pumpAndSettle();

      // Verify if it navigates to RegisterPage after tapping on the register button.
      expect(find.byType(RegisterPage), findsOneWidget);
    },
  );
}
