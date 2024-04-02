import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:floria/pages/home/components/navigate_to_page.dart';

class LoginWithEmailAndPassword {
  static Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
    required Function(bool) loginFailedCallback,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      navigateBack(context, '/home', removeBack: true);
      // Navigator.pushReplacementNamed(context, '/home');
      print("Login with email and password: ${email}");
    } catch (e) {
      print('Failed to sign in: $e');
      loginFailedCallback(true);
    }
  }
}
