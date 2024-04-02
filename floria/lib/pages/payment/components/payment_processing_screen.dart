import 'package:floria/pages/home/components/navigate_to_page.dart';
import 'package:flutter/material.dart';

class PaymentProcessingScreen extends StatefulWidget {
  @override
  _PaymentProcessingScreenState createState() =>
      _PaymentProcessingScreenState();
}

class _PaymentProcessingScreenState extends State<PaymentProcessingScreen> {
  bool showCheckmark = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        showCheckmark = true;
        Future.delayed(Duration(seconds: 2), () {
          navigateBack(context, "/home", removeBack: true);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showCheckmark
                ? Icon(
                    Icons.check_circle_outline,
                    size: 46,
                    color: Colors.green,
                  )
                : CircularProgressIndicator(
                    color: Color(0xffC33355),
                  ),
            SizedBox(
              height: 20,
            ),
            Text(
              showCheckmark ? "Payment successful!" : "Processing payment...",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xffC33355),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
