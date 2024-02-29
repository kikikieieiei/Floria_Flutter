import 'package:flutter/material.dart';
import 'package:project_test/pages/home/components/navigateToPage.dart';
import 'package:project_test/models/shopping_cart_model.dart';
import 'package:project_test/pages/payment/payment.dart';
import 'package:project_test/pages/shopping cart/components/cart_list.dart';
import 'package:project_test/data/data.dart' as data;

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int _selectedIndex = 2;

  removeItem(Cart item) => setState(() {
        data.cart.remove(item);
      });

  double calculateTotalPrice() {
    double total = 0;

    for (int i = 0; i < data.cart.length; i++) {
      total += data.cart[i].product.price * data.cart[i].quantity;
    }

    return total;
  }

  List<Cart> getOrders() {
    List<Cart> orders = [];

    for (int i = 0; i < data.cart.length; i++) {
      Cart cartItem = data.cart[i];
      orders.add(cartItem);
    }

    return orders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Shopping Cart",
          style: TextStyle(
              color: Color(0xffC33355),
              // fontFamily: "Yeseva One",
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.cart.length,
                itemBuilder: (_, index) {
                  return CartList(
                    item: data.cart[index],
                    remove: removeItem,
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${calculateTotalPrice().toStringAsFixed(2)} Baht',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentOptionsScreen(
                                    totalPrice: calculateTotalPrice(),
                                    orders: getOrders(),
                                  )));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xffDC5273)),
                    ),
                    child:
                        Text('Checkout', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ],
        ),
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
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '')
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });
    navigateToPage(context, index);
  }
}
