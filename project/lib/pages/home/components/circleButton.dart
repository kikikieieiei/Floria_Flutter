import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

Widget buildCircularButton(String svgPath, String label, Function onPressed) {
  return GestureDetector(
    onTap: () {
      onPressed();
    },
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF9DDE3),
            ),
            child: Center(
              child: SvgPicture.asset(
                svgPath,
                width: 30,
                height: 30,
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
            // fontWeight: FontWeight.bold,
            fontSize: 13,
            fontFamily: 'OpenSans',
          ),
        ),
      ],
    ),
  );
}
