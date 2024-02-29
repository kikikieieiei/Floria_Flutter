import 'package:flutter/material.dart';

Widget buildRedContainerWithImageAndText() {
  bool _isSelected = false;

  return StatefulBuilder(
    builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
        child: Container(
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
            // border: Border.all(color: Color(0xffC33355)),
            color: Color(0xFFF4E7EA),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 8, top: 2, bottom: 4, right: 8),
                child: Icon(
                  Icons.credit_card,
                  color: Color(0xffC33355),
                ),
              ),
              Text(
                "My Card",
                style: TextStyle(color: Color(0xffC33355), fontWeight: FontWeight.w600),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    _isSelected = !_isSelected;
                  });
                },
                child: Radio<bool>(
                  value: true,
                  groupValue: _isSelected,
                  onChanged: (value) {
                    setState(() {
                      _isSelected = value!;
                    });
                  },
                  fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Color(0xffC33355); // Change inactive color to pink
                      }
                      return Color(0xffC33355);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
