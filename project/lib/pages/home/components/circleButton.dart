import "package:flutter/material.dart";

Widget buildCircularButton(IconData icon, String label, Function onPressed) {
  return GestureDetector(
    onTap: () {
      onPressed();
    },
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            height: 60, 
            width: 60, 
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffF9DDE3),
            ),
            child: Center(
              child: Icon(
                icon,
                color: Color(0xffC33355),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Color.fromARGB(255, 227, 141, 159),
            // fontWeight: FontWeight.bold,
            fontSize: 12,
            fontFamily: 'OpenSans',
          ),
        ),
      ],
    ),
  );
}
