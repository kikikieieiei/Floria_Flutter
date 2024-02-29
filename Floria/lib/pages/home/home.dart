import 'package:flutter/material.dart';
import 'package:project_test/pages/all%20category/allCategory.dart';
import 'package:project_test/pages/bouquet%20category/bouquetCategory.dart';
import 'package:project_test/pages/home/components/carousel.dart';
import 'package:project_test/pages/home/components/circleButton.dart';
import 'package:project_test/pages/home/components/popularProducts.dart';
import 'package:project_test/pages/home/components/navigateToPage.dart';
import 'package:project_test/pages/calendar/calendar.dart';
// import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 30, right: 30, bottom: 0),
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
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            buildCarouselSlider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCircularButton("assets/icons/all.svg", "All", () {
                    print('Button All pressed');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllCategory()),
                    );
                  }),
                  buildCircularButton("assets/icons/bouquet.svg", "Bouquet",
                      () {
                    print('Button Bouquet pressed');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BouquetCategory()),
                    );
                  }),
                  buildCircularButton("assets/icons/vase.svg", "Vase",
                      () => print('Button Vase pressed')),
                  buildCircularButton("assets/icons/flower.svg", "Flower",
                      () => print('Button Flower pressed')),
                  buildCircularButton("assets/icons/calendar.svg", "Calendar",
                      () {
                    print("Button Calendar pressed");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Calendar()),
                    );
                  })
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, top: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular",
                  style: TextStyle(
                      fontFamily: "OpenSans",
                      color: Color(0xffC33355),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
            buildPopularProducts(),
          ],
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
