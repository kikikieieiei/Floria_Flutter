import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:floria/pages/product/product_detail_page.dart';

Widget buildPopularProducts() {
  // String? imageUrl;

  Future<String> _getFirebaseStorageUrl(String storagePath) async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child(storagePath);
      return await ref.getDownloadURL();
    } catch (e) {
      print('Error fetching download URL: $e');
      return '';
    }
  }

  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Column(
      children: [
        SizedBox(
          // width: 170,
          height: 230,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('products')
                .where('popular', isEqualTo: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Color(0xffC33355),
                ));
              }
              return ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  var product = document.data() as Map<String, dynamic>;
                  return GestureDetector(
                    onTap: () {
                      // Navigate to product detail page with product data
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            product: product,
                            previousRoute: '/home',
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 20),
                          width: 150,
                          height: 160,
                          child: FutureBuilder<String>(
                            future: _getFirebaseStorageUrl(
                                "assets/images/flower/" + product['image']),
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffF4E7EA),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                product['price'].toString() + " Baht",
                                style: TextStyle(color: Color(0xffB1B1B1)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),
        )
      ],
    ),
  );
}
