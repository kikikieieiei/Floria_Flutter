
import 'package:flutter/material.dart';
import 'package:project/pages/home/components/carousel.dart';

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
            padding: const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 0),
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
                    fontFamily: 'OpenSans'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                  borderSide: BorderSide.none
                ),
              ),
            ),
          ),
          buildCarouselSlider()
        ],
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
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
        ]
      ),
    );
  }
}
