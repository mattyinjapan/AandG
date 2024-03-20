import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = ChangeNotifierProvider((ref) => LoginValidation());

class LoginValidation extends ChangeNotifier {
  String _emailError = '';
  String _passwordError = '';

  String get emailError => _emailError;
  String get passwordError => _passwordError;

  bool isLoggedIn = false;

  void validateEmail(String email) {
    _emailError = (_isValidEmail(email) ? '' : 'Invalid email address')!;
    notifyListeners();
  }

  void validatePassword(String password) {
    _passwordError =
        (password.length > 8 ? '' : 'Password must be 8 characters or more')!;
    notifyListeners();
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void signIn() {
    isLoggedIn = true;
    notifyListeners();
  }

  void signOut() {
    isLoggedIn = false;
    notifyListeners();
  }
}
