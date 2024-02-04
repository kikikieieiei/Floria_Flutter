import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

  Widget buildPopularProducts() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 1; i <= 3; i++)
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 10),
                    height: 300,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffF4E7EA),
                    ),
                    child: Image.asset(
                      'assets/images/popular flower/popflow$i.png',
                      scale: 0.1,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//   Widget buildPopularProducts() {
//     const products: ["name1", 2000, "assets/image/"]
//   return Padding(
//     padding: const EdgeInsets.only(left: 10),
//     child: CarouselSlider(
//       options: CarouselOptions(
//         aspectRatio: 16 / 9,
//       ),
//       items: products.map((product) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Column(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(top: 30),
//                   height: 300,
//                   width: 170,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: const Color(0xffF4E7EA),
//                   ),
//                   child: Stack(
//                     children: [
//                       Image.asset(
//                         product.imagePath,
//                         scale: 0.1,
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         left: 0,
//                         right: 0,
//                         child: Container(
//                           padding: const EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color: Colors.black.withOpacity(0.5),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 product.name,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     '\$${product.price.toString()}',
//                                     style: const TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   IconButton(
//                                     icon: const Icon(
//                                       Icons.shopping_cart,
//                                       color: Colors.white,
//                                     ),
//                                     onPressed: () {
//                                       // Handle adding to cart
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       }).toList(),
//     ),
//   );
// }

// }
