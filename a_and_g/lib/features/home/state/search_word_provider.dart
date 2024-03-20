import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchWordProvider = StateProvider<String>((ref) => '');

void updateSearchWordProvider(String word, ref) {
  ref.read(searchWordProvider.notifier).state = word;
}
