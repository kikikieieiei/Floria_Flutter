import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:floria/pages/base%20page/base_page.dart';
import 'package:floria/pages/profile/components/build_popup.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Profile",
      selectedIndex: 3,
      buildContent: (userDocumentSnapshot) {
        if (userDocumentSnapshot == null ||
            userDocumentSnapshot.data() == null) {
          return _buildProfileSetupWidget();
        }
        return _buildProfileList(userDocumentSnapshot);
      },
    );
  }

  Widget _buildProfileSetupWidget() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Please login or create an account to set up your profile.",
              style: TextStyle(
                fontSize: 17,
                color: Color(0xffC33355),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/"); // Navigate to the login page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffDC5273),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                "Create an account",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileList(
    DocumentSnapshot<Map<String, dynamic>> userDocumentSnapshot,
  ) {
    var userData = userDocumentSnapshot.data();
    var documentId = userDocumentSnapshot.id; // Get the document ID
    if (userData == null) {
      return SizedBox(); // Return an empty widget if user data is null
    }

    var birthDateTimestamp = userData['birthdate'] as Timestamp?;
    var birthDate = birthDateTimestamp?.toDate(); // User's birthdate

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (_, index) {
          // Extract user data
          var username = userData['username'] ?? ''; // Username from Firestore
          var image = userData['image'] ?? ''; // Image URL from Firestore
          var name = userData['name'] ?? ''; // User's name
          var email = userData['email'] ?? ''; // User's email
          var phoneNo = userData['phone'] ?? ''; // User's phone number
          var address = userData['address'] ?? ''; // User's address

          // Format birthDate as a string
          String formattedDate = birthDate != null
              ? DateFormat('yyyy-MM-dd').format(birthDate)
              : '';

          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              // Image widget
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  if (image.isNotEmpty)
                    CircleAvatar(
                      radius: 50,
                      child: Image.network(
                        image,
                        // width: 70,
                        // height: 70,
                        fit: BoxFit.cover,
                      ),
                    )
                  else
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0xffF9DDE3),
                      child: Icon(
                        Icons.person,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(
                          0xffDC5273), // Example color for the circular background
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        // Handle edit action for image
                        showDialog(
                          context: context,
                          builder: (context) => buildPopUp(context, 'Image',
                              image, documentId, EditType.Image),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30), // Spacer
              // Username text
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => buildPopUp(context, 'username',
                            username, documentId, EditType.String));
                  },
                  child: Text(
                    username,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffC33355)),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Email',
                        style:
                            TextStyle(color: Color(0xffC33355), fontSize: 16),
                      ),
                      subtitle: Text(
                        email,
                        style:
                            TextStyle(color: Color(0xffC33355), fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      title: Text(
                        'Name',
                        style:
                            TextStyle(color: Color(0xffC33355), fontSize: 16),
                      ),
                      subtitle: Text(
                        name,
                        style:
                            TextStyle(color: Color(0xffC33355), fontSize: 14),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.edit, color: Color(0xffC33355)),
                        onPressed: () {
                          // Handle edit action for name
                          showDialog(
                              context: context,
                              builder: (context) => buildPopUp(context, 'Name',
                                  name, documentId, EditType.String));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      title: Text(
                        'Birthdate',
                        style:
                            TextStyle(color: Color(0xffC33355), fontSize: 16),
                      ),
                      subtitle: Text(
                        formattedDate,
                        style:
                            TextStyle(color: Color(0xffC33355), fontSize: 14),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => buildPopUp(
                                    context,
                                    'Birthdate',
                                    formattedDate,
                                    documentId,
                                    EditType.Birthdate));
                          },
                          icon: Icon(
                            Icons.calendar_today,
                            color: Color(0xffC33355),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      title: Text(
                        'Phone',
                        style:
                            TextStyle(color: Color(0xffC33355), fontSize: 16),
                      ),
                      subtitle: Text(
                        phoneNo,
                        style:
                            TextStyle(color: Color(0xffC33355), fontSize: 14),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.edit, color: Color(0xffC33355)),
                        onPressed: () {
                          // Handle edit action for name
                          showDialog(
                              context: context,
                              builder: (context) => buildPopUp(context, 'Phone',
                                  phoneNo, documentId, EditType.String));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      title: Text(
                        'Address',
                        style:
                            TextStyle(color: Color(0xffC33355), fontSize: 16),
                      ),
                      subtitle: Text(
                        address,
                        style:
                            TextStyle(color: Color(0xffC33355), fontSize: 14),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.edit, color: Color(0xffC33355)),
                        onPressed: () {
                          // Handle edit action for name
                          showDialog(
                              context: context,
                              builder: (context) => buildPopUp(
                                  context,
                                  'Address',
                                  address,
                                  documentId,
                                  EditType.String));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
