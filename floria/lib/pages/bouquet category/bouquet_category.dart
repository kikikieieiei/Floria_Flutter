import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:floria/pages/product/product_detail_page.dart';
import 'package:floria/pages/home/components/navigate_to_page.dart';

class BouquetCategory extends StatefulWidget {
  const BouquetCategory({Key? key}) : super(key: key);

  @override
  State<BouquetCategory> createState() => _BouquetCategoryState();
}

class _BouquetCategoryState extends State<BouquetCategory> {

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bouquet",
          style: TextStyle(
            color: Color(0xffC33355),
            fontWeight: FontWeight.bold,
          ),
        ),
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xffC33355),
            ),
            onPressed: () {
              navigateBack(context, "/home");
            },
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where('category', isEqualTo: "Bouquet")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xffC33355),
              ),
            );
          }
          List<DocumentSnapshot> documents = snapshot.data!.docs;
          return GridView.builder(
            padding:
                const EdgeInsets.only(top: 45, left: 30, right: 30, bottom: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 13.0,
              mainAxisSpacing: 60,
            ),
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              var product = documents[index].data() as Map<String, dynamic>;
              // print("product = " + product['image']);

              return GestureDetector(
                onTap: () {
                  // Navigate to the product detail page with the selected product data
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: product,
                        previousRoute: '/bouquetCategory',
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
                                  future: _getFirebaseStorageUrl(
                                      "assets/images/flower/" +
                                          product['image']),
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
                                product['name'] ?? '',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                (product['price']?.toString() ?? '') + " Baht",
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
        },
      ),
    );
  }
}
