import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app_router.dart';
import '../login/auth/auth_provider.dart';
import 'widgets/search_word.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final validation = ref.watch(authProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Look up a word!',
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                validation.signOut();
                context.goNamed(AppRoute.home.name);
              },
            ),
          ],
        ),
        body: const SearchWord());
  }
}
