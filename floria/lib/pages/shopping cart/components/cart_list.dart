import 'package:flutter/material.dart';
import 'package:floria/models/shopping_cart_model.dart';
import 'package:floria/pages/shopping%20cart/components/quantity_button.dart';

class CartList extends StatefulWidget {
  final Cart item;
  final Function(Cart) remove;

  const CartList({Key? key, required this.item, required this.remove})
      : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  String? selectedRadio = '';

  setSelectedRadio(String? value) => setState(() {
        if (selectedRadio == value) {
          selectedRadio = null;
        } else {
          selectedRadio = value;
        }
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setSelectedRadio(widget.item.product.name);
      },
      child: Row(
        children: [
          SizedBox(
            width: 393,
            height: 120,
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF4E7EA),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Radio<String>(
                        fillColor: MaterialStateColor.resolveWith(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return Color(0xffC33355);
                            }
                            return Color(0xffC33355);
                          },
                        ),
                        value: widget.item.product.name,
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          setSelectedRadio(val);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: SizedBox(
                        width: 90,
                        height: 90,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.asset(
                            "assets/images/flower/" + widget.item.product.image,
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item.product.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffC33355),
                            ),
                          ),
                          Text(widget.item.product.price.toString() + " Baht"),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: QuantityButton(initialQuantity: widget.item.quantity),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
