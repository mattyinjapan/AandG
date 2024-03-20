import 'package:a_and_g/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'auth/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to Dictionary!',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer(
          builder: (context, watch, _) {
            final validation = ref.watch(authProvider);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    key: const Key('emailTextField'),
                    onChanged: (value) => validation.validateEmail(value),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorText: validation.emailError.length > 0
                          ? validation.emailError
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    key: const Key('passwordTextField'),
                    onChanged: (value) => validation.validatePassword(value),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: validation.passwordError.length > 0
                          ? validation.passwordError
                          : null,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (validation.emailError == '' &&
                            validation.passwordError == '')
                        ? () {
                            validation.signIn();
                            context.goNamed(AppRoute.home.name);
                          }
                        : null,
                    child: const Text('Login'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}