import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:floria/pages/shopping%20cart/components/quantity_button.dart';
import 'package:floria/pages/home/components/navigate_to_page.dart';

class CartList extends StatefulWidget {
  final Map<String, dynamic> item;
  final DocumentSnapshot<Map<String, dynamic>> userDocumentSnapshot;

  const CartList({
    Key? key,
    required this.item,
    required this.userDocumentSnapshot,
  }) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  bool _isActive = false;
  late Future<String> _imageURL;

  @override
  void initState() {
    super.initState();
    _imageURL = _getFirebaseStorageUrl("assets/images/flower/" +
        (widget.item['product'] != null
            ? widget.item['product']['image'] ?? ''
            : ''));
  }

  Future<String> _getFirebaseStorageUrl(String storagePath) async {
    Reference ref = FirebaseStorage.instance.ref().child(storagePath);
    return await ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isActive = !_isActive;
        });
      },
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 120,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF4E7EA),
                    borderRadius: BorderRadius.circular(10)),
                child: FutureBuilder<String>(
                  future: _imageURL,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: Color(0xffC33355),
                      ));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error loading image'));
                    } else {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: SizedBox(
                              width: 90,
                              height: 90,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.network(
                                  snapshot.data ?? '',
                                  width: 50,
                                  height: 50,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Color(0xffC33355),
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 18, left: 35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.item['product'] != null
                                      ? widget.item['product']['name'] ?? ''
                                      : '',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffC33355),
                                  ),
                                ),
                                Text(
                                  widget.item['product'] != null &&
                                          widget.item['product']['price'] !=
                                              null
                                      ? widget.item['product']['price']
                                              .toString() +
                                          " Baht"
                                      : "",
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: QuantityButton(
                                        item: widget.item,
                                        initialQuantity:
                                            widget.item['quantity'],
                                        onQuantityChanged: (value) {
                                          setState(() {
                                            widget.item['quantity'] = value;
                                          });
                                        },
                                        userDocumentSnapshot:
                                            widget.userDocumentSnapshot,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          size: 30,
                                          color: Color(0xffC33355)
                                              .withOpacity(0.5),
                                        ),
                                        onPressed: () {
                                          _deleteCartItem(widget.item);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _deleteCartItem(Map<String, dynamic> itemToDelete) {
    if (!mounted) {
      return;
    }

    DocumentReference userRef = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userDocumentSnapshot.id);

    List<dynamic> carts =
        List.from(widget.userDocumentSnapshot.data()?['carts']);

    // Remove the item from the carts list
    carts.removeWhere(
        (item) => item['product']['id'] == itemToDelete['product']['id']);

    userRef.update({
      'carts': carts,
    }).then((value) {
      if (!mounted) {
        return;
      }

      setState(() {
        print('Item removed from Firestore');
        navigateBack(context, '/shoppingCart', removeBack: true);
      });
    }).catchError((error) {
      print('Error removing item: $error');
    });
  }
}
