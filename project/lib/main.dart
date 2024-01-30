import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Text("Home"),
    Text("Favorite"),
    Text("Cart"),
    Text("Account")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floria'),
      ),
      body: Center(child: _pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 500, // Add elevation here
        selectedIconTheme: IconThemeData(color: Color(0xFFDC5273)),
        unselectedIconTheme: IconThemeData(color: Color.fromARGB(255, 250, 184, 201)),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home, size: 28),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.favorite, size: 28),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.shopping_cart, size: 28),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.person, size: 28),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
