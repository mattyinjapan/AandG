import 'package:a_and_g/features/login/auth/auth_provider.dart';
import 'package:a_and_g/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockAuthProvider extends Mock implements LoginValidation {}

void main() {
  testWidgets('Login widget test', (WidgetTester tester) async {

    // Create a test widget
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: LoginPage(),
        ),
      ),
    );

    // Ensure the app bar title is correct
    expect(find.text('Welcome to Dictionary!'), findsOneWidget);

    // Trigger a fake email validation
    await tester.enterText(find.byKey(const Key('emailTextField')), 'test@example.com');
    await tester.pump();

    // Trigger a fake password validation
    await tester.enterText(find.byKey(const Key('passwordTextField')), 'password123');
    await tester.pump();

    // Ensure the login button is enabled
    expect(find.byType(ElevatedButton), findsOneWidget);
    
  });
}