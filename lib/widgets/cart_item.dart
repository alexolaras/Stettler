import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/quantity_cart.dart';

import '../classes/product.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItem});

  final Product cartItem;

  @override
  State<StatefulWidget> createState() {
    return _CartItemState();
  }
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(widget.cartItem.image),
            ),
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  widget.cartItem.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'CHF ${widget.cartItem.price.toString()}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    QuantityCart(product: widget.cartItem),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
