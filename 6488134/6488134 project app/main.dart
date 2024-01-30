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
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Listing")),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          ProductBox(
              name: "iPhone",
              description: "iPhone is the stylist phone ever",
              price: 1000,
              image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-card-40-iphone15prohero-202309_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1693086369818"),
          ProductBox(
              name: "Pixel",
              description: "Pixel is the most featureful phone ever",
              price: 800,
              image: "https://media.wired.com/photos/652db3f0b44e9598aea19183/1:1/w_1775,h_1775,c_limit/Best-Pixel-Phones-Gear.jpg"),
          ProductBox(
              name: "Laptop",
              description: "Laptop is most productive development tool",
              price: 2000,
              image: "https://media.wired.com/photos/64daad6b4a854832b16fd3bc/4:3/w_1787,h_1340,c_limit/How-to-Choose-a-Laptop-August-2023-Gear.jpg"),
          ProductBox(
              name: "Tablet",
              description: "Tablet is the most useful device ever for meeting",
              price: 1500,
              image: "tablet.png"),
          ProductBox(
              name: "Pendrive",
              description: "Pendrive is useful storage medium",
              price: 100,
              image: "pendrive.png"),
          ProductBox(
              name: "Floppy Drive",
              description: "Floppy drive is useful rescue storage medium",
              price: 20,
              image: "floppy.png"),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key? key, this.name, this.description, this.price, this.image})
      : super(key: key);
  final String? name;
  final String? description;
  final int? price;
  final String? image;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = Image.asset("assets/images/default_image.png");

    if (image != null && image!.startsWith("https")) {
      imageWidget = Image.network(image!);
    } else {
      imageWidget = Image.asset("assets/images/" + (image ?? "default_image.img"));
    }

    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            imageWidget,
            // Image.asset("assets/images/" + (image ?? "default_image.img")),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.name ?? "",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.description ?? ""),
                    Text("Price: " + this.price.toString()),
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
