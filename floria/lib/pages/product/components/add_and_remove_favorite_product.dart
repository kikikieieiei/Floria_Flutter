import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addToFavorite(
    BuildContext context, Map<String, dynamic> product) async {
  try {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Get a reference to the user's document in Firestore
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      // Update the 'favorites' array in the user's document
      await userRef.update({
        'favorites': FieldValue.arrayUnion([product])
      });

      // Show a snackbar or toast to indicate successful addition to favorites
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              'Product added to favorites',
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
    print('Error adding product to favorites: $e');
    // Show an error snackbar or toast
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            'Error adding product to favorites',
            style: TextStyle(color: Colors.white),
          ),
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Color(0xffC33355),
      ),
    );
  }
}

Future<void> removeFavorite(
    BuildContext context, Map<String, dynamic> product) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);
      await userRef.update({
        'favorites': FieldValue.arrayRemove([product])
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              'Product removed from favorites',
              style: TextStyle(color: Colors.white),
            ),
          ),
          duration: Duration(seconds: 1),
          backgroundColor: Color(0xffC33355),
        ),
      );
    }
  } catch (e) {
    print('Error removing product from favorites: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            'Error removing product from favorites',
            style: TextStyle(color: Colors.white),
          ),
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Color(0xffC33355),
      ),
    );
  }
}
