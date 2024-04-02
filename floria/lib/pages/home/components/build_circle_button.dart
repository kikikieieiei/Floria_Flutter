import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

import 'package:firebase_storage/firebase_storage.dart';

Widget buildCircularButton(
    String storagePath, String label, Function onPressed) {
  return FutureBuilder<String>(
    future: _getSvgUrl(storagePath),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator(
          color: Color(0xffC33355),
        );
      } else if (snapshot.hasError) {
        return Text('Error loading SVG');
      } else {
        String svgUrl = snapshot.data!;
        return GestureDetector(
          onTap: onPressed as void Function()?,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF9DDE3),
                  ),
                  child: Center(
                    child: SvgPicture.network(
                      svgUrl,
                      width: 27,
                      height: 27,
                      color: Color(0xffC33355),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xffC33355),
                  fontSize: 13,
                  fontFamily: 'OpenSans',
                ),
              ),
            ],
          ),
        );
      }
    },
  );
}

Future<String> _getSvgUrl(String storagePath) async {
  Reference ref = FirebaseStorage.instance.ref().child(storagePath);
  return await ref.getDownloadURL();
}
