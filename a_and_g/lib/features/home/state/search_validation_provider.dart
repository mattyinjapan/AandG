import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchValidationProvider =
    ChangeNotifierProvider((ref) => LoginValidation());

class LoginValidation extends ChangeNotifier {
  String _error = '';

  String get error => _error;

  void validateWord(String word, ref) {
    _error = (word.length > 2 ? '' : 'Word must be 2 characters or more');
    notifyListeners();
  }
}
