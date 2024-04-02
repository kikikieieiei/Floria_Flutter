import "package:flutter/material.dart";

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:floria/pages/base%20page/base_page.dart';
import 'package:floria/pages/product/product_detail_page.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  
  Future<String> _getFirebaseStorageUrl(String storagePath) async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child(storagePath);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error fetching download URL: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "My Favorite",
      selectedIndex: 1,
      buildContent: (userDocumentSnapshot) {
        if (userDocumentSnapshot == null ||
            userDocumentSnapshot.data() == null) {
          return _buildFavoriteSetupWidget();
        }
        return _buildFavoriteList(userDocumentSnapshot);
      },
    );
  }

  Widget _buildFavoriteSetupWidget() {
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
              "Please login or create an account to favorite a products.",
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

  Widget _buildFavoriteList(
    DocumentSnapshot<Map<String, dynamic>> userDocumentSnapshot,
  ) {
    var userData = userDocumentSnapshot.data();
    if (userData == null) {
      return SizedBox(); // Return an empty widget if user data is null
    }

    return GridView.builder(
      padding: const EdgeInsets.only(top: 45, left: 30, right: 30, bottom: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13.0,
        mainAxisSpacing: 60,
      ),
      itemCount: userData['favorites']?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        var favorite = userData['favorites']?[index];
        if (favorite == null) return SizedBox();

        return GestureDetector(
          onTap: () {
            // Navigate to the product detail page with the selected product data
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  product: favorite,
                  previousRoute: '/favorite',
                ),
              ),
            );
          },
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 110,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4E7EA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: OverflowBox(
                      maxWidth: 160,
                      maxHeight: 160,
                      child: Transform.translate(
                        offset: Offset(5.0, -21.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: FutureBuilder<String>(
                            future: _getFirebaseStorageUrl("assets/images/flower/" + favorite['image']),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator(
                                  color: Color(0xffC33355),
                                );
                              } else if (snapshot.hasError) {
                                // print(snapshot.data);
                                return Text('Error loading image');
                              } else {
                                return Image.network(snapshot.data ?? '');
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          favorite['name'] ?? '', // Use null-aware operator
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          (favorite['price']?.toString() ?? '') +
                              " Baht", // Use null-aware operator
                          style: TextStyle(color: Color(0xffB1B1B1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
