import 'package:flutter/material.dart';
import 'package:stettlerproapp/screens/home.dart';
import 'package:stettlerproapp/widgets/cart_item.dart';
import 'package:stettlerproapp/widgets/checkout_total.dart';

import '../classes/product.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/styled_button_small.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart(
      {super.key,
      required this.cartItems,
      required this.quantityList,
      required this.totalPrice});

  final List<Product> cartItems;
  final List<int> quantityList;
  final ValueNotifier<double> totalPrice;

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  void updateCartItemQuantity(int index, int newQuantity, double newPrice) {
    setState(() {
      widget.quantityList[index] = newQuantity;
      widget.totalPrice.value = newPrice;
    });
  }

  showCheckoutDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Center(
          child: Text(
        'Commande validée !',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.bold),
      )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            child: Text(
              "Vous trouverez la commande dans votre historique",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 100, 101, 116),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 44, 213, 111)),
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            child: TextButton(
              child: Text("CONFIRMER",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const Home(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  for (int index = 0;
                      index < widget.quantityList.length;
                      index++)
                    InkWell(
                      onTap: () {},
                      child: CartItem(
                        cartItem: widget.cartItems[index],
                        quantity: widget.quantityList[index],
                        totalPrice: widget.totalPrice.value,
                        updateQuantityCallback: (newQuantity, newPrice) {
                          updateCartItemQuantity(index, newQuantity, newPrice);
                        },
                      ),
                    ),
                ],
              ),
            ),
            CheckoutTotal(
              totalPrice: widget.totalPrice,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: StyledButtonSmall(
                  text: "VALIDER COMMANDE",
                  onPressed: () => showCheckoutDialog(context),
                  color: Colors.blue[600]!),
            )
          ],
        ),
      ),
    );
  }
}
