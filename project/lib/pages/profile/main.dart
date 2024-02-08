import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController name = TextEditingController(text: 'Chalita');
  TextEditingController surname = TextEditingController(text: 'Rungfarangrong');
  TextEditingController birthday = TextEditingController(text: '24/04/2003');
  TextEditingController email =
      TextEditingController(text: 'Chalita.run@student.mahidol.ac.th');
  TextEditingController tel = TextEditingController(text: '083-999-9999');
  TextEditingController location =
      TextEditingController(text: 'Mahidol University, Salaya, Nakhonpathom');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFFC33355),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/picture/1.jpeg'),
            ),
            SizedBox(height: 10),
            SizedBox(height: 20),
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Name',
                filled: true,
                fillColor: Color(0xFFF4EFE7),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: Color(0xFFF4EFE7),
                  ),
                ),
              ),
            ),
            SizedBox(height: 7),
            TextFormField(
              controller: surname,
              decoration: InputDecoration(
                labelText: 'Surname',
                filled: true,
                fillColor: Color(0xFFF4EFE7),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: Color(0xFFF4EFE7),
                  ),
                ),
              ),
            ),
            SizedBox(height: 7),
            TextFormField(
              controller: birthday,
              decoration: InputDecoration(
                labelText: 'Birthday',
                filled: true,
                fillColor: Color(0xFFF4EFE7),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: Color(0xFFF4EFE7),
                  ),
                ),
              ),
            ),
            SizedBox(height: 7),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Color(0xFFF4EFE7),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: Color(0xFFF4EFE7),
                  ),
                ),
              ),
            ),
            SizedBox(height: 7),
            TextFormField(
              controller: tel,
              decoration: InputDecoration(
                labelText: 'Tel.',
                filled: true,
                fillColor: Color(0xFFF4EFE7),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: Color(0xFFF4EFE7),
                  ),
                ),
              ),
            ),
            SizedBox(height: 7),
            TextFormField(
              controller: location,
              decoration: InputDecoration(
                labelText: 'Location',
                filled: true,
                fillColor: Color(0xFFF4EFE7),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                    color: Color(0xFFF4EFE7),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Your sign-out logic here
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFDC5273),
                minimumSize: Size(160, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Sign Out',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xffC33355),
        unselectedItemColor: const Color(0xffF9DDE3),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
