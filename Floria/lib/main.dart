import 'package:flutter/material.dart';
import 'package:project_test/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      // initialRoute: '/profile',
      // routes: {
      //   // '/':(context) => Login(),
      //   '/home':(context) => Home(),
      //   '/favorite':(context) => Favorite(),
      //   '/'
      //   '/profile':(context) => Profile()
      // },
    );
  }
}
