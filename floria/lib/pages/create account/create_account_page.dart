import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:floria/pages/create%20account/components/create_account_form.dart';
import 'package:floria/pages/home/components/navigate_to_page.dart';

class CreateAccount extends StatefulWidget {
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffC33355),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
        title: Text(
          "Create account",
          style: TextStyle(
            color: Color(0xffC33355),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
          child: CreateAccountForm(
            onEmailChanged: (value) {
              setState(() {
                _email = value;
              });
            },
            onPasswordChanged: (value) {
              setState(() {
                _password = value;
              });
            },
            onConfirmPasswordChanged: (value) {
              setState(() {
                _confirmPassword = value;
              });
            },
            passwordError:
                _password != _confirmPassword ? "Passwords don't match" : null,
            onSubmit: () async {
              // if (_password != _confirmPassword) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       backgroundColor: Color(0xffDC5273),
              //       content: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               'Passwords don\'t matchh',
              //               style: TextStyle(color: Colors.white),
              //             ),
              //           ],
              //         ),
              //       ),
              //       duration: Duration(seconds: 3),
              //     ),
              //   );
              //   return;
              // }
        
              try {
                // Create user account
                UserCredential userCredential =
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _email,
                  password: _password,
                );
        
                // Save user data to Firestore
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(userCredential.user!.uid)
                    .set({
                  'username': "-",
                  'name': "-",
                  'email': _email,
                  'phone': "-",
                  'birthdate': Timestamp.fromDate(DateTime(1999, 1, 1)),
                  'address': "-",
                  'image': "",
                  'carts': [],
                  'favorites': []
                });
        
                print(
                    "Create an account successfully: ${userCredential.user?.email}");
        
                // Navigate to the home page
                navigateToPage(context, 0, removeBack: true);
                // Navigator.pushReplacementNamed(context, '/home');
              } catch (e) {
                if (e is FirebaseAuthException) {
                  if (e.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Color(0xffC33355),
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'The account already exists for that email.',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    print("The account already exists for that email.");
                  } else {
                    print("Failed to create an account: ${e.message}");
                  }
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
