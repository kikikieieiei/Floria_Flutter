import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:firebase_storage/firebase_storage.dart';

Widget buildCarouselSlider() {
  return Container(
    margin: EdgeInsets.only(top: 35),
    child: FutureBuilder<List<String>>(
      future: getSliderUrls(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            decoration: BoxDecoration(color: Colors.white),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Text(
              'Error loading images'); // Show an error message if loading fails
        } else if (snapshot.hasData) {
          return CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 4,
              autoPlay: true,
            ),
            items: snapshot.data!.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        } else {
          return CircularProgressIndicator(); // Show a loading indicator while fetching data
        }
      },
    ),
  );
}

Future<List<String>> getSliderUrls() async {
  List<String> urls = [];
  for (int i = 1; i <= 3; i++) {
    String storagePath = 'assets/images/slider/slider$i.png';
    Reference ref = FirebaseStorage.instance.ref().child(storagePath);
    String url = await ref.getDownloadURL();
    urls.add(url);
  }
  return urls;
}
