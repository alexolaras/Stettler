import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/separator.dart';

class CheckoutTotal extends StatefulWidget {
  const CheckoutTotal({super.key, required this.totalPrice});

  final ValueNotifier<double> totalPrice;

  @override
  State<StatefulWidget> createState() {
    return _CheckoutTotalState();
  }
}

class _CheckoutTotalState extends State<CheckoutTotal> {
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sous-total',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color.fromARGB(150, 124, 125, 129),
                      fontSize: 14),
                ),
                Text(
                  'CHF ${widget.totalPrice.value.toStringAsFixed(2)}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 22),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TVA',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color.fromARGB(150, 124, 125, 129),
                      fontSize: 14),
                ),
                Text(
                  'CHF ${(widget.totalPrice.value * 0.2).toStringAsFixed(2)}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 22),
                ),
              ],
            ),
          ),
          const Padding(
            padding:  EdgeInsets.all(8.0),
            child:  Separator(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOTAL',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color.fromARGB(150, 124, 125, 129),
                      fontSize: 14),
                ),
                Text(
                  'CHF ${widget.totalPrice.value.toStringAsFixed(2)}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 26),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
