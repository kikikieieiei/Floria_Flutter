import "package:flutter/material.dart";
import 'package:project/pages/home/components/navigateToPage.dart';
import "package:project/data/data.dart" as data;

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Favorite",
            style: TextStyle(
                color: Color(0xffC33355),
                // fontFamily: "Yeseva One",
                fontWeight: FontWeight.bold),
          ),
        ),
        body: GridView.builder(
          padding:
              const EdgeInsets.only(top: 45, left: 30, right: 30, bottom: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 13.0,
            mainAxisSpacing: 60,
          ),
          itemCount: data.favoriteProduct.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 110,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4E7EA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: OverflowBox(
                        maxWidth: 160,
                        maxHeight: 160,
                        child: Transform.translate(
                            offset: Offset(5.0, -21.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/flower/" +
                                    data.favoriteProduct[index].product.image,
                              ),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            data.favoriteProduct[index].product.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            data.favoriteProduct[index].product.price
                                    .toString() +
                                " Baht",
                            style: TextStyle(color: Color(0xffB1B1B1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
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
