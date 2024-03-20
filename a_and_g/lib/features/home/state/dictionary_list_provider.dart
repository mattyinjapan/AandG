import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/dictionary.dart';

final dictionaryListProvider = StateProvider<List<Dictionary>>((ref) => []);