import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:floria/pages/home/components/navigate_to_page.dart';
import 'package:floria/pages/product/components/quantity_button.dart';
import 'package:floria/pages/product/components/add_products_to_cart.dart';
import 'package:floria/pages/product/components/add_and_remove_favorite_product.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;
  final String previousRoute;

  const ProductDetailPage(
      {Key? key, required this.product, required this.previousRoute})
      : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavorite = false;
  int _quantity = 1;
  String? imageUrl;

  Future<void> _fetchImage() async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('assets/images/flower/${widget.product['image']}');
    final downloadUrl = await ref.getDownloadURL();
    setState(() {
      imageUrl = downloadUrl;
    });
  }

  @override
  void initState() {
    super.initState();
    checkFavoriteStatus(); // Call a method to check the favorite status
    _fetchImage();
  }

  void checkFavoriteStatus() async {
    // Get the current user's ID (assuming you have implemented Firebase Auth)
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      // Check if the product is favorited by the user
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        // Get the user's favorites array from Firestore
        List<dynamic> favorites = snapshot.data()?['favorites'] ?? [];

        // Check if the current product is in the favorites array
        bool isProductFavorited =
            favorites.any((fav) => fav['name'] == widget.product['name']);

        setState(() {
          isFavorite = isProductFavorited;
        });
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xffC33355),
            ),
            onPressed: () {
              navigateBack(context, widget.previousRoute, removeBack: true);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 180,
                    height: 250,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: 180,
                            height: 180,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4E7EA),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 180,
                            height: 180,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFFF4E7EA),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: OverflowBox(
                                maxWidth: 270,
                                maxHeight: 270,
                                child: Transform.translate(
                                  offset: Offset(5.0, -21.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Image.network(
                                      imageUrl ??
                                          '', // Use imageUrl if available, otherwise use an empty string
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child; // Return the image if it's loaded
                                        } else {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              color: Color(0xffC33355),
                                            ),
                                          );
                                        }
                                      },
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return Center(
                                          child: Text(
                                              'Failed to load image'), // Show an error message if the image fails to load
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product['name'],
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffC33355),
                    ),
                  ),
                  Text(
                    widget.product['category'],
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffC33355),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.product['meaning'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffC33355),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.product['price'].toString() + " Baht",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xffC33355),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      QuantityButton(
                        initialQuantity: _quantity, // Pass initial quantity
                        onQuantityChanged: (newQuantity) {
                          setState(() {
                            _quantity = newQuantity;
                          });
                        },
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                          if (isFavorite) {
                            addToFavorite(context, widget.product);
                          } else {
                            removeFavorite(context, widget.product);
                          }
                        },
                        padding: EdgeInsets.zero,
                        icon: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffC33355),
                          ),
                          padding: EdgeInsets.zero,
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {
                          addToCart(context, widget.product,
                              _quantity); // Add to cart action
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.zero), // Remove padding
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffC33355)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Container(
                          width: 230,
                          height: 40,
                          child: Center(
                            child: Text(
                              "Add to cart",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
