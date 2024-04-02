import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class LoginAnonymously {
  static Future<void> login({
    required BuildContext context,
    required Function(bool) loginFailedCallback,
  }) async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      Navigator.pushReplacementNamed(context, "/home");
      print("Login as guest");
    } catch (e) {
      print('Failed to sign in anonymously: $e');
      loginFailedCallback(true);
    }
  }
}
