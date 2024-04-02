import 'package:flutter/material.dart';

import 'package:floria/pages/base%20page/base_page.dart';
import 'package:floria/pages/home/components/build_carousel.dart';
import 'package:floria/pages/home/components/build_category_button.dart';
import 'package:floria/pages/home/components/build_search_bar.dart';
import 'package:floria/pages/home/components/popular_products.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      selectedIndex: 0,
      buildContent: ((userDocumentSnapshot) {
        return ListView(
          children: [
            buildSearchBar(),
            buildCarouselSlider(),
            buildCategoryButton(context),
            Padding(
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
        );
      }),
    );
  }
}
