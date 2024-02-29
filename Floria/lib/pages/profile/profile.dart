import "package:flutter/material.dart";
import 'package:project_test/pages/home/components/navigateToPage.dart';
import 'package:project_test/data/data.dart' as data;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: Text(
            "Profile",
            style: TextStyle(
                color: Color(0xffC33355),
                // fontFamily: "Yeseva One",
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Color(0x80DC5273), shape: BoxShape.circle),
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  data.profile.username,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffC33355)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    String title = '';
                    String subtitle = '';

                    if (index == 0) {
                      title = 'Name';
                      subtitle = data.profile.name;
                    } else if (index == 1) {
                      title = 'Email';
                      subtitle = data.profile.email;
                    } else if (index == 2) {
                      title = 'Phone';
                      subtitle = data.profile.phoneNo;
                    } else if (index == 3) {
                      title = 'Birthdate';
                      subtitle = data.profile.birthDay;
                    } else if (index == 4) {
                      title = 'Address';
                      subtitle = data.profile.location;
                    }

                    return ListTile(
                      title: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color(0xffC33355),
                        ),
                      ),
                      subtitle: Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xffC33355),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 50,
                      ),
                      trailing: Icon(
                        Icons.edit,
                        color: Color(0xffC33355),
                      ),
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent, // Set splash color to transparent
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xffC33355),
            unselectedItemColor: const Color(0xffF9DDE3),
            currentIndex: _selectedIndex,
            onTap: (index) {
              _onItemTapped(index, context);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
            ],
          ),
        ));
  }

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });
    navigateToPage(context, index);
  }
}
