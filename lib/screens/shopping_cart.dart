import 'package:flutter/material.dart';
import 'package:stettlerproapp/widgets/cart_item.dart';

import '../classes/product.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key, required this.cartItems});

  final List<Product> cartItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Panier",
        function: 'back',
        additionalIcon: Icons.delete,
      ),
      drawer: const CustomDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: CartItem(
                      cartItem: cartItems[index],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
