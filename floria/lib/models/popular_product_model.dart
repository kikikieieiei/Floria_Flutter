import 'package:floria/models/product_model.dart';

class PopularProduct extends Product {
  PopularProduct(
      {required String name,
      required int price,
      required String meaning,
      required String image,
      required String category,
      required List<String> keywords})
      : super(
            name: name,
            price: price,
            meaning: meaning,
            image: image,
            category: category,
            keywords: keywords);
}
