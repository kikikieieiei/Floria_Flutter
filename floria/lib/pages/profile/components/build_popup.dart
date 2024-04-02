import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

enum EditType {
  String, // Default type for string editing
  Birthdate, // Type for editing birthdate
  Image, // Type for editing profile image
}

Widget buildPopUp(BuildContext context, String title, String initialValue,
    String documentId, EditType editType) {
  TextEditingController textController =
      TextEditingController(text: initialValue);

  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xffC33355),
          ),
        ),
        SizedBox(height: 10),
        if (editType == EditType.Birthdate)
          TextFormField(
            controller: textController,
            cursorColor: Color(0xffC33355),
            readOnly: true, // Prevent manual editing
            onTap: () async {
              // Show date picker when text field is tapped
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                // Format the picked date as desired
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                textController.text = formattedDate;
              }
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffC33355)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffC33355)),
              ),
              suffixIcon: Icon(
                Icons.calendar_today,
                color: Color(0xffC33355),
              ),
            ),
          )
        else
          TextFormField(
            controller: textController,
            cursorColor: Color(0xffC33355),
            style: TextStyle(
              color: Color(0xffC33355),
            ),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffC33355)),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffC33355)),
              ),
            ),
          ),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () async {
          String newValue = textController.text;
          print('New value for $title: $newValue'); // Debug output
          try {
            dynamic valueToUpdate = newValue; // Initialize with string value

            if (editType == EditType.Birthdate) {
              // Convert the string date to a DateTime object
              DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(newValue);
              // Convert DateTime to Firestore Timestamp
              valueToUpdate = Timestamp.fromDate(parsedDate);
              print(
                  'Converted date to Timestamp: $valueToUpdate'); // Debug output
            }

            String fieldToUpdate;
            switch (editType) {
              case EditType.Birthdate:
                fieldToUpdate = 'birthdate';
                break;
              case EditType.Image:
                fieldToUpdate = 'image';
                break;
              default:
                fieldToUpdate = title.toLowerCase();
            }
            await FirebaseFirestore.instance
                .collection('users')
                .doc(documentId)
                .update({fieldToUpdate: valueToUpdate});
            print('Updated $title to $newValue');
            Navigator.of(context).pop();

            // Notify the profile widget to update with new data
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Color(0xffDC5273),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Profile updated successfully',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } catch (e) {
            print('Error updating $title: $e');
            // Handle error, show snackbar or dialog
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: Color(0xffC33355),
        ),
        child: const Text(
          'Update',
          style: TextStyle(color: Colors.white),
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: const Text(
          'Cancel',
          style: TextStyle(color: Color(0xffC33355)),
        ),
      ),
    ],
  );
}
