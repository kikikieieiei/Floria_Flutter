import 'package:flutter/material.dart';

class QuantityButton extends StatefulWidget {
  final int initialQuantity;

  const QuantityButton({required this.initialQuantity});

  @override
  _QuantityButtonState createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int _quantity = 0;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildQuantityButton(
          onPressed: _decrementQuantity,
          icon: Icons.remove,
        ),
        Text(
          _quantity.toString(),
          style: const TextStyle(fontSize: 16),
        ),
        _buildQuantityButton(
          onPressed: _incrementQuantity,
          icon: Icons.add,
        ),
      ],
    );
  }

  Widget _buildQuantityButton(
      {required VoidCallback onPressed, required IconData icon}) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffC33355).withOpacity(0.5),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
