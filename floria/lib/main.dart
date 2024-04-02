import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:floria/pages/login/login_page.dart';
import 'package:floria/pages/create%20account/create_account_page.dart';
import 'package:floria/pages/home/home.dart';
import 'package:floria/pages/favorite/favorite.dart';
import 'package:floria/pages/shopping%20cart/shopping_cart.dart';
// import 'package:floria/pages/payment/payment.dart';
// import 'package:floria/pages/profile/profile.dart';
import 'package:floria/pages/all%20category/all_category.dart';
import 'package:floria/pages/bouquet%20category/bouquet_category.dart';
import 'package:floria/pages/vase%20category/vase_category.dart';
import 'package:floria/pages/calendar/calendar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FloriaApp());
}

class FloriaApp extends StatelessWidget {
  const FloriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/createAccount': (context) => CreateAccount(),
        '/home': (context) => Home(),
        '/favorite': (context) => Favorite(),
        '/shoppingCart':(context) => ShoppingCart(),
        // '/payment':(context) => PaymentOptionsScreen(),
        // '/profile': (context) => Profile(),
        '/allCategory':(context) => AllCategory(),
        '/bouquetCategory':(context) => BouquetCategory(),
        '/vaseCategory':(context) => VaseCategory(),
        '/calendar': (context) => Calendar()
      },
    );
  }
}
