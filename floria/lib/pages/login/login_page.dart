import 'package:flutter/material.dart';

import 'package:floria/pages/login/components/login_form.dart';
import 'package:floria/pages/login/components/login_anonymously.dart';
import 'package:floria/pages/login/components/login_with_email_and_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';
  bool _loginFailed = false;

  void _login() async {
    await LoginWithEmailAndPassword.login(
      email: _email,
      password: _password,
      context: context,
      loginFailedCallback: (failed) {
        setState(() {
          _loginFailed = failed;
        });
      },
    );
  }

  void _loginAnonymously() async {
    await LoginAnonymously.login(
      context: context,
      loginFailedCallback: (failed) {
        setState(() {
          _loginFailed = failed;
        });
      },
    );
  }

  void _forgotPassword() {
    print("Forgot Password Tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
        title: Text(
          "Login",
          style: TextStyle(
            color: Color(0xffC33355),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(0xffC33355), // Set color of the back arrow
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                  color: Color(0xffC33355),
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Back!",
                style: TextStyle(
                  color: Color(0xffC33355),
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              LoginForm(
                onEmailChanged: (value) {
                  _email = value;
                },
                onPasswordChanged: (value) {
                  _password = value;
                },
                onLoginPressed: _login,
                onLoginAnonymously: _loginAnonymously,
                onForgotPasswordPressed: _forgotPassword,
                loginFailed: _loginFailed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
