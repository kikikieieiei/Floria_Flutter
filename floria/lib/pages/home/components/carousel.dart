import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget buildCarouselSlider() {
  return Container(
    margin: EdgeInsets.only(top: 35),
    child: CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 16/4,
        autoPlay: true,
      ),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/slider/slider$i.png',
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    ),
  );
}
