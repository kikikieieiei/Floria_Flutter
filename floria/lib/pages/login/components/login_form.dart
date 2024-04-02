import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final Function(String) onEmailChanged;
  final Function(String) onPasswordChanged;
  final Function() onLoginAnonymously;
  final Function() onForgotPasswordPressed;
  final Function() onLoginPressed;
  final bool loginFailed;

  const LoginForm({
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onLoginAnonymously,
    required this.onForgotPasswordPressed,
    required this.onLoginPressed,
    required this.loginFailed,
    Key? key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          TextField(
            onChanged: widget.onEmailChanged,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Color(0xffC33355).withOpacity(0.5)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffC33355)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffC33355)),
              ),
            ),
            cursorColor: Color(0xffC33355),
            style: TextStyle(color: Color(0xffC33355)),
          ),
          SizedBox(height: 10.0),
          TextField(
            onChanged: widget.onPasswordChanged,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(color: Color(0xffC33355).withOpacity(0.5)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffC33355)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffC33355)),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xffC33355),
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            cursorColor: Color(0xffC33355),
            style: TextStyle(color: Color(0xffC33355)),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: widget.onForgotPasswordPressed,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xffC33355)),
                  ),
                ),
              ],
            ),
          ),
          if (widget.loginFailed)
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                'Invalid email or password. Please try again.',
                style: TextStyle(color: Color(0xffC33355), fontSize: 13),
              ),
            ),
          SizedBox(height: 20.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xffDC5273)),
                minimumSize:
                    MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
              ),
              onPressed: widget.onLoginPressed,
              child: Text('Login', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xffDC5273)),
                minimumSize:
                    MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
              ),
              onPressed: widget.onLoginAnonymously,
              child:
                  Text('Login as guest', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 10),
          Text("or", style: TextStyle(color: Color(0xffC33355))),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                minimumSize:
                    MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Color(0xffDC5273)),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/createAccount');
                print("Create an account tapped");
              },
              child: Text(
                'Create an account',
                style: TextStyle(color: Color(0xffDC5273)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
