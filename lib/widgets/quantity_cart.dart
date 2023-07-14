import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/product.dart';

class QuantityCart extends StatefulWidget {
  const QuantityCart({super.key, required this.product});

  final Product product;
  @override
  State<StatefulWidget> createState() {
    return _QuantityCartState();
  }
}

class _QuantityCartState extends State<QuantityCart> {
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 229, 36, 36),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: _decreaseQuantity,
                  icon: const Icon(
                    Icons.remove,
                    size: 20,
                    color: Colors.white,
                  ),
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
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 229, 36, 36),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: _increaseQuantity,
                  icon: const Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
