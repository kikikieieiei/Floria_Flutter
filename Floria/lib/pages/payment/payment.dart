import 'package:flutter/material.dart';
import 'package:project_test/models/shopping_cart_model.dart';
// import 'package:flutter/widgets.dart';
import 'package:project_test/pages/payment/components/addNewCardButton.dart';
import 'package:project_test/pages/payment/components/containerWithTextandImage.dart';

class PaymentOptionsScreen extends StatelessWidget {
  final double totalPrice;
  final List<Cart> orders;

  PaymentOptionsScreen({
    required this.totalPrice,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xffC33355),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Payment Options',
          style:
              TextStyle(color: Color(0xffC33355), fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: Text(
                  "My Orders",
                  style: TextStyle(
                      color: Color(0xffC33355),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5),
                ),
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ListView.builder(
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Row(
                            children: [
                              Image(
                                image: AssetImage("assets/images/flower/" +
                                    orders[index].product.image),
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(width: 50),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    orders[index].product.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "Price: ${orders[index].product.price} Baht",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    "Quantity: ${orders[index].quantity}",
                                    style: TextStyle(fontSize: 14),
                                  )
                                ],
                              )
                            ],
                          ));
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Price:',
                                style: TextStyle(
                                  color: Color(0xffC33355),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '${totalPrice.toStringAsFixed(2)} Baht',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Text(
                  "Deliver Info.",
                  style: TextStyle(
                    color: Color(0xffC33355),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5),
                ),
              ),
              Container(
                width: double.infinity,
                height: 285,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/map/map.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Faculty of ICT, Mahidol University, Salaya",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                              Text("Bidiboo",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11.5)),
                              Text(
                                "No additional note",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11.5),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: Text(
                  "Credit & Debit Cards",
                  style: TextStyle(
                    color: Color(0xffC33355),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5),
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        buildRedContainerWithImageAndText(),
                        buildRedContainerWithImageAndText(),
                        buildAddNewCardContainer(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50), // Add space for the bottom navigation bar
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 30, top: 30, bottom: 40, right: 30),
        decoration: BoxDecoration(
          // color: Color(0xffF4EFE7),
          color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${totalPrice.toStringAsFixed(2)} Baht',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xffDC5273)),
              ),
              child: Text('Checkout', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
