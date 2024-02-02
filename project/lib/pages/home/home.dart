import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 30),
            child: TextFormField(
              cursorColor: Color(0xffC33355),
              style: TextStyle(color: Color(0xffC33355)),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffF9DDE3),
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
                    fontFamily: 'OpenSans'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                  borderSide: BorderSide.none
                ),
              ),
            )
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xffC33355),
        unselectedItemColor: Color(0xffF9DDE3),
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
      ]),
    );
  }
}
