import 'package:flutter/material.dart';
import "package:project_test/data/data.dart" as data;

Widget buildPopularProducts() {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Column(
      children: [
        SizedBox(
          // width: 170,
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var product in data.popularproduct)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 20),
                      width: 150,
                      height: 160,
                      child: Image.asset("assets/images/flower/" + product.image),
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
                            product.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            product.price.toString() + " Baht",
                            style: TextStyle(color: Color(0xffB1B1B1)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        )
      ],
    ),
  );
}
