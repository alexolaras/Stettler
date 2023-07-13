import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/product.dart';

class Quantity extends StatefulWidget {
  const Quantity({super.key, required this.product});

  final Product product;

  @override
  State<Quantity> createState() {
    return _QuantityState();
  }
}

class _QuantityState extends State<Quantity> {
  int _productQuantity = 1;

  void _decreaseQuantity() {
    setState(() {
      if (_productQuantity > 1) {
        _productQuantity--;
      }
    });
  }

  void _increaseQuantity() {
    if (_productQuantity < widget.product.quantity) {
      setState(() {
        _productQuantity++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
            child: Text(
              'Quantité',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: const Color.fromARGB(150, 124, 125, 129),
                    fontSize: 12,
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _decreaseQuantity,
                icon: const Icon(
                  Icons.remove_circle,
                  size: 45,
                  color: Color.fromARGB(255, 229, 36, 36),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                _productQuantity.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: _increaseQuantity,
                icon: const Icon(
                  Icons.add_circle,
                  size: 45,
                  color: Color.fromARGB(255, 229, 36, 36),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
