import 'package:flutter/material.dart';

Widget buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 0),
    child: TextFormField(
      cursorColor: const Color(0xffC33355),
      style: const TextStyle(color: Color(0xffC33355)),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF9DDE3),
        isDense: true,
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xffC33355),
          size: 24,
        ),
        hintText: 'Search...',
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 227, 141, 159),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        // fontFamily: 'OpenSans'),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(45),
            borderSide: BorderSide.none),
      ),
    ),
  );
}