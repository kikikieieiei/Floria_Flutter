import 'package:flutter/material.dart';
import 'package:floria/data/data.dart' as data;
import 'package:floria/models/product_model.dart';

class BouquetCategory extends StatefulWidget {
  const BouquetCategory({Key? key}) : super(key: key);

  @override
  State<BouquetCategory> createState() => _BouquetCategoryState();
}

class _BouquetCategoryState extends State<BouquetCategory> {
  @override
  Widget build(BuildContext context) {
    // Filter bouquet products
    final List<Product> bouquetProducts = data.allProduct
        .where((product) => product.category.contains("Bouquet"))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bouquet Products",
          style: TextStyle(
              color: Color(0xffC33355),
              // fontFamily: "Yeseva One",
              fontWeight: FontWeight.bold),
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
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: GridView.builder(
        padding:
            const EdgeInsets.only(top: 45, left: 30, right: 30, bottom: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13.0,
          mainAxisSpacing: 60,
        ),
        itemCount: bouquetProducts
            .length, // Set itemCount to the length of bouquetProducts
        itemBuilder: (BuildContext context, int index) {
          final bouquetProduct = bouquetProducts[
              index]; // Use bouquetProducts instead of data.allProduct

          return Container(
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
                          child: Image.asset(
                            "assets/images/flower/" + bouquetProduct.image,
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
                          bouquetProduct.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          bouquetProduct.price.toString() + " Baht",
                          style: TextStyle(color: Color(0xffB1B1B1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
