import 'package:flutter/material.dart';

class CreateAccountForm extends StatefulWidget {
  final Function(String) onEmailChanged;
  final Function(String) onPasswordChanged;
  final Function(String) onConfirmPasswordChanged;
  final VoidCallback onSubmit;
  final String? passwordError;

  const CreateAccountForm({
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onConfirmPasswordChanged,
    required this.onSubmit,
    this.passwordError,
    Key? key,
  }) : super(key: key);

  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            errorText: widget.passwordError,
          ),
          cursorColor: Color(0xffC33355),
          style: TextStyle(color: Color(0xffC33355)),
        ),
        SizedBox(height: 10.0),
        TextField(
          onChanged: widget.onConfirmPasswordChanged,
          obscureText: _obscureConfirmPassword,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            labelStyle: TextStyle(color: Color(0xffC33355).withOpacity(0.5)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffC33355)),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffC33355)),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Color(0xffC33355),
              ),
              onPressed: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
            errorText: widget.passwordError,
          ),
          cursorColor: Color(0xffC33355),
          style: TextStyle(color: Color(0xffC33355)),
        ),
        SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: widget.onSubmit,
          child: Text(
            'Create an account',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffDC5273),
          ),
        ),
      ],
    );
  }
}
