import "package:flutter/material.dart";

import 'package:floria/pages/home/home.dart';
import 'package:floria/pages/favorite/favorite.dart';
import 'package:floria/pages/shopping%20cart/shopping_cart.dart';
import 'package:floria/pages/profile/profile.dart';
import 'package:floria/pages/all%20category/all_category.dart';
import 'package:floria/pages/bouquet%20category/bouquet_category.dart';
import 'package:floria/pages/vase%20category/vase_category.dart';

void navigateToPage(BuildContext context, int index,
    {bool removeBack = false}) {
  String routeName;
  switch (index) {
    case 0:
      print("/home");
      routeName = '/home';
      break;
    case 1:
      print("/favorite");
      routeName = '/favorite';
      break;
    case 2:
      print("/shoppingCart");
      routeName = '/shoppingCart';
      break;
    case 3:
      print("/profile");
      routeName = '/profile';
      break;
    default:
      print("/");
      routeName = '/';
  }

  if (removeBack) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _getPageFromRouteName(routeName, context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
        transitionDuration: Duration.zero,
      ),
      (route) => false,
    );
  } else {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _getPageFromRouteName(routeName, context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
        transitionDuration: Duration.zero,
      ),
    );
  }
}

void navigateBack(BuildContext context, String previousRoute,
    {bool removeBack = false}) {
  String routeName = '';
  switch (previousRoute) {
    case '/home':
      print('/home');
      routeName = '/home';
      break;
    case '/favorite':
      print('/favorite');
      routeName = '/favorite';
      break;
    case '/shoppingCart':
      routeName = '/shoppingCart';
      print(routeName);
      break;
    case '/allCategory':
      print('/allCategory');
      routeName = '/allCategory';
      break;
    case '/bouquetCategory':
      print('/bouquetCategory');
      routeName = '/bouquetCategory';
      break;
    case '/vaseCategory':
      print('/vaseCategory');
      routeName = '/vaseCategory';
      break;
    default:
      print('default');
      Navigator.pop(context);
  }

  if (removeBack) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _getPageFromRouteName(routeName, context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
        transitionDuration: Duration.zero,
      ),
      (route) => false,
    );
  } else {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _getPageFromRouteName(routeName, context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
        transitionDuration: Duration.zero,
      ),
    );
  }
}

Widget _getPageFromRouteName(String routeName, BuildContext context) {
  switch (routeName) {
    case '/home':
      return Home();
    case '/favorite':
      return Favorite();
    case '/cart':
      return ShoppingCart();
    case '/profile':
      return Profile();
    case '/shoppingCart':
      return ShoppingCart();
    case '/allCategory':
      return AllCategory();
    case '/bouquetCategory':
      return BouquetCategory();
    case '/vaseCategory':
      return VaseCategory();
    default:
      return Home();
  }
}
