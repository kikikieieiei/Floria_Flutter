import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addToCart(
  BuildContext context,
  Map<String, dynamic> product,
  int quantity,
) async {
  try {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get a reference to the user's document in Firestore
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      // Get the current carts data from the user's document
      DocumentSnapshot<Map<String, dynamic>> userData =
          await userRef.get() as DocumentSnapshot<Map<String, dynamic>>;
      Map<String, dynamic> userDataMap = userData.data() ?? {};

      // Get the current carts data and update it with the new product
      List<dynamic> carts = userDataMap['carts'] ?? [];
      bool productExists = false;

      for (int i = 0; i < carts.length; i++) {
        Map<String, dynamic> cartItem = carts[i];
        if (cartItem['product']['id'] == product['id']) {
          // Product already exists, update quantity
          cartItem['quantity'] += quantity;
          carts[i] = cartItem;
          productExists = true;
          break;
        }
      }

      if (!productExists) {
        // Product does not exist, add new entry
        carts.add({
          'product': product,
          'quantity': quantity,
        });
      }

      // Update the 'carts' field in the user's document
      await userRef.update({'carts': carts});

      // Show a snackbar or toast to indicate successful addition to cart
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              'Product added to cart',
              style: TextStyle(color: Colors.white),
            ),
          ),
          duration: Duration(seconds: 1),
          backgroundColor: Color(0xffC33355),
        ),
      );
    }
  } catch (e) {
    // Handle any errors that occur during the addition process
    print('Error adding product to cart: $e');
    // Show an error snackbar or toast
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            'Error adding product to cart',
            style: TextStyle(color: Colors.white),
          ),
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Color(0xffC33355),
      ),
    );
  }
}
