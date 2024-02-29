import 'package:flutter/material.dart';

Widget buildAddNewCardContainer() {
  return Padding(
    padding: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffC33355)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Color(0xffC33355),
            ),
          ),
        ),
        SizedBox(width: 8),
        Text(
          "Add New Card",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
  );
}
