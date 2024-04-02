import 'package:flutter/material.dart';

import 'package:floria/pages/home/components/build_circle_button.dart';

Widget buildCategoryButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildCircularButton("assets/icons/all.svg", "All", () {
          print('Button All pressed');
          Navigator.pushNamed(
            context,
            "/allCategory",
          );
        }),
        buildCircularButton("assets/icons/bouquet.svg", "Bouquet", () {
          print('Button Bouquet pressed');
          Navigator.pushNamed(
            context,
            "/bouquetCategory",
          );
        }),
        buildCircularButton("assets/icons/vase.svg", "Vase", () {
          print('Button Vase pressed');
          Navigator.pushNamed(
            context,
            "/vaseCategory",
          );
        }),
        buildCircularButton("assets/icons/calendar.svg", "Calendar", () {
          print("Button Calendar pressed");
          Navigator.pushNamed(context, "/calendar");
        })
      ],
    ),
  );
}
