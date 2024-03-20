import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/error_page.dart';
import 'features/home/home_page.dart';
import 'features/login/auth/auth_provider.dart';
import 'features/login/login_page.dart';

final _key = GlobalKey<NavigatorState>();

enum AppRoute { login, home }

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: false,
    initialLocation: '/',
    refreshListenable: authState,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const HomePage(),
        redirect: (context, state) {
          final isAuthenticated = authState.isLoggedIn;

          if (state.fullPath == '/${AppRoute.login.name}') {
            return isAuthenticated ? null : '/${AppRoute.login.name}';
          }

          return isAuthenticated ? null : '/${AppRoute.login.name}';
        },
      ),
      GoRoute(
        path: '/${AppRoute.login.name}',
        name: AppRoute.login.name,
        builder: (context, state) => const LoginPage(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
});
