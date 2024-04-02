import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:floria/pages/home/components/navigate_to_page.dart';

class BasePage extends StatefulWidget {
  final Widget Function(
          DocumentSnapshot<Map<String, dynamic>>? userDocumentSnapshot)
      buildContent;
  final String title;
  final int selectedIndex;

  const BasePage({
    Key? key,
    required this.buildContent,
    this.title = "",
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late User? _user;
  DocumentSnapshot<Map<String, dynamic>>? _userDocumentSnapshot;
  bool _isLoading = true;
  bool _isMounted = false; // Flag to track widget mount state

  @override
  void initState() {
    super.initState();
    _isMounted = true; // Set mounted flag to true
    _checkAuthenticationStatus(); // Check authentication status on widget initialization
  }

  @override
  void dispose() {
    super.dispose();
    _isMounted = false; // Set mounted flag to false when disposing
    // Dispose any resources here if needed
  }

  void _checkAuthenticationStatus() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (_isMounted) {
        // Check if widget is still mounted
        setState(() {
          _user = user;
          if (_user != null) {
            _fetchUserDataFromFirebase();
          } else {
            _isLoading = false;
          }
        });
      }
    });
  }

  void _fetchUserDataFromFirebase() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(_user!.uid)
        .snapshots() // Listen to real-time updates
        .listen((DocumentSnapshot<Map<String, dynamic>> snapshot) {
      if (_isMounted) {
        // Check if widget is still mounted
        setState(() {
          if (snapshot.exists) {
            _userDocumentSnapshot = snapshot;
            _isLoading = false; // Set loading state to false after data fetch
          } else {
            _userDocumentSnapshot = null;
            _isLoading =
                false; // Set loading state to false if document doesn't exist
          }
        });
      }
    });
  }

  void _logout() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && user.isAnonymous) {
        // delete anonymous account after logging out
        await user.delete();
        print("Anonymous account deleted.");
      }
      await FirebaseAuth.instance.signOut();
      // Navigate back to the login page
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/",
        (Route<dynamic> route) => false,
      );
      print("Logout Successfully");
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(
                color: Color(0xffC33355),
              ),
            ),
          )
        : Scaffold(
            appBar: widget.title != ""
                ? AppBar(
                    surfaceTintColor: Colors.transparent,
                    leading: Navigator.canPop(context)
                        ? IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        : null,
                    // App bar configuration
                    title: Text(
                      widget.title,
                      style: TextStyle(
                          color: Color(0xffC33355),
                          // fontFamily: "Yeseva One",
                          fontWeight: FontWeight.bold),
                    ),
                    actions: widget.title == "Profile"
                        ? [
                            IconButton(
                              onPressed: _logout,
                              icon: Icon(Icons.logout),
                              color: Color(0xffC33355),
                            ),
                          ]
                        : null,
                  )
                : null,
            body: widget.buildContent(_userDocumentSnapshot),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                splashColor:
                    Colors.transparent, // Set splash color to transparent
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                selectedItemColor: const Color(0xffC33355),
                unselectedItemColor: const Color(0xffF9DDE3),
                currentIndex: widget.selectedIndex,
                onTap: (index) {
                  navigateToPage(context, index, removeBack: true);
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
                ],
              ),
            ),
          );
  }
}
