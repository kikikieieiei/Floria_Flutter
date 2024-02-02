import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Image.asset("name")
                    );
                  },
                );
              }).toList(),
            ),
          ),
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
