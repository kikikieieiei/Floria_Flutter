import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:floria/pages/base%20page/base_page.dart';
import 'package:floria/pages/shopping%20cart/components/cart_list.dart';
import 'package:floria/pages/payment/payment.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  double calculateTotalPrice(List<dynamic>? cartItems) {
    if (cartItems == null) {
      return 0.0;
    }

    double total = 0.0;
    for (var item in cartItems) {
      if (item != null && item['product'] != null && item['quantity'] != null) {
        total += (item['product']['price'] ?? 0.0) * (item['quantity'] ?? 0);
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Shopping Cart',
      selectedIndex: 2,
      buildContent: (userDocumentSnapshot) {
        // print('User Document Snapshot: $userDocumentSnapshot'); // Debug print

        if (userDocumentSnapshot == null || !userDocumentSnapshot.exists) {
          // print('User document snapshot is null or does not exist'); // Debug print
          return _buildShoppingCartSetupWidget();
        }

        // Check if the user is anonymous (guest)
        if (FirebaseAuth.instance.currentUser?.isAnonymous ?? true) {
          return _buildShoppingCartSetupWidget();
        }

        List<dynamic>? cartItems = userDocumentSnapshot.data()?['carts'];

        if (cartItems == null) {
          // print('Cart items are null'); // Debug print
          return _buildShoppingCartSetupWidget();
        }

        // print('Cart items: $cartItems'); // Debug print
        return _buildShoppingCartList(userDocumentSnapshot, cartItems);
      },
    );
  }

  Widget _buildShoppingCartSetupWidget() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Please login or create an account to see your shopping cart.",
              style: TextStyle(
                fontSize: 17,
                color: Color(0xffC33355),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffDC5273),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                "Create an account",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShoppingCartList(
    DocumentSnapshot<Map<String, dynamic>> userDocumentSnapshot,
    List<dynamic>? cartItems,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems?.length ?? 0,
              itemBuilder: (_, index) {
                Map<String, dynamic> item =
                    cartItems![index] as Map<String, dynamic>;
                return CartList(
                  item: item,
                  userDocumentSnapshot: userDocumentSnapshot,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${calculateTotalPrice(cartItems).toStringAsFixed(2)} Baht',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    double totalPrice = calculateTotalPrice(cartItems);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentOptionsScreen(
                          totalPrice: totalPrice,
                          orders: cartItems!,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xffDC5273)),
                  ),
                  child:
                      Text('Checkout', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
