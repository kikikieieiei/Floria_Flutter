import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           title: Text(
                   "All   Bonquet    Vase    Flowers",
                   style: TextStyle(
                  fontSize: 15,  // Set the font size to 15
                  color: Color(0xFFB1B1B1),  // Set the text color to B1B1B1
                 ),
                ),
              ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          ProductBox(
            name: "Asters",
            description:
                "Asters symbolize love, wisdom, faith, and color. It conveys deep emotional love and affection for someone.",
            image: "asters.png",
          ),
          ProductBox(
            name: "Bluebell",
            description:
                "Bluebell is a symbol of humility, constancy, gratitude and everlasting love.",
            image: "bluebell.png",
          ),
          ProductBox(
            name: "Pink carnation",
            description:
                "Pink carnation flower meanings include gratitude and the concept of never forgetting someone.",
            image: "pink.png",
          ),
          ProductBox(
            name: "Daisy",
            description:
                "Daisy flower can be purity, innocence, new beginnings, joy and cheerfulness.",
            image: "daisy.png",
          ),
          ProductBox(
            name: "Pink geraniums",
            description:
                "Pink geraniums hint at a gentle affection and a growing love that is yet to be announced.",
            image: "pink_g.png",
          ),
          ProductBox(
            name: "Lily",
            description:
                "Lily flower is a symbol of love, innocence, purity, fertility, and rebirth.",
            image: "lily.png",
          ),
          ProductBox(
            name: "Pink tulips",
            description:
                "Pink tulips are known for meaning affection, caring, good wishes, and love.",
            image: "pink_t.png",
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
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.image,
  }) : super(key: key);

  final String name;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),  // Add margins here
      width: 315, // Set the width to 315
      height: 94, // Set the height to 94
      child: Card(
        color: Color(0xFFF4E7EA),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              "assets/flowrs/" + image,
              width: 78,
              height: 78,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      this.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Color(0xFFC33355),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            this.description,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFC33355),
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
