import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/screens/accounting.dart';
import 'package:stettlerproapp/screens/general.dart';
import 'package:stettlerproapp/screens/product_list.dart';
import 'package:stettlerproapp/screens/remarks.dart';
import 'package:stettlerproapp/screens/sales.dart';
import 'package:stettlerproapp/screens/delivery.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/widgets/client_settings.dart';

import '../classes/order.dart';
import '../providers/orders_provider.dart';
import '../widgets/styled_button_small.dart';
import 'discount.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key, required this.client});

  final Client client;

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends ConsumerState<Profile> {
  void _addToOrderHistory() {
    final Order order = Order(
      orderNumber: _generateOrdercode(),
      clientName: widget.client.name,
      clientSurname: widget.client.surname,
      clientId: widget.client.id,
      orderedItems: widget.client.cartProducts,
      orderedQuantity: widget.client.quantityList,
      orderStatus: OrderStatus.pending,
    );

    ref.read(ordersProvider.notifier).addOrder(order);

    widget.client.cartProducts = [];
    widget.client.quantityList = [];
    widget.client.totalPrice = ValueNotifier<double>(0);
  }

  String _generateOrdercode() {
    final random = Random();
    const availableChars = '1234567890';
    final randomString = List.generate(
      7,
      (index) => availableChars[random.nextInt(availableChars.length)],
    ).join();

    return randomString;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Scaffold(
      appBar: CustomAppBar(
        title: "Profil",
        function: CustomAppBarFunction.back,
      ),
      body: Text("No people found"),
    );

    content = SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            child: Stack(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.client.name} ${widget.client.surname}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 20)),
                        Text(
                          widget.client.email,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.client.phoneNumber,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '${widget.client.address.number} ${widget.client.address.street} ${widget.client.address.postalCode} ${widget.client.address.city}',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      ]
                          .map((widget) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: widget,
                              ))
                          .toList(),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 249, 219, 219),
                    ),
                    child: const Icon(
                      Icons.edit_rounded,
                      color: Color.fromARGB(255, 229, 37, 36),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Information client",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Suivez vos bulletins de livraison en direct et votre catalogue d'objets.",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ClientSettings(
                icon: Icons.workspace_premium_outlined,
                text: "Historique",
                onPressed: () {
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => (),
                      ),
                    );*/
                },
              ),
              ClientSettings(
                  icon: Icons.person_2_outlined,
                  text: "Général",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => General(client: widget.client),
                      ),
                    );
                  }),
              ClientSettings(
                  icon: Icons.settings,
                  text: "Comptabilité",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Accounting(client: widget.client),
                      ),
                    );
                  }),
              ClientSettings(
                  icon: Icons.crop_original_rounded,
                  text: "Ventes",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sales(client: widget.client),
                      ),
                    );
                  }),
              ClientSettings(
                  icon: Icons.crop_original_rounded,
                  text: "Rabais",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Discount(client: widget.client),
                      ),
                    );
                  }),
              ClientSettings(
                  icon: Icons.crop_original_rounded,
                  text: "Tournées",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Delivery(client: widget.client),
                      ),
                    );
                  }),
              ClientSettings(
                  icon: Icons.crop_original_rounded,
                  text: "Remarques",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Remarks(client: widget.client),
                      ),
                    );
                  }),
            ],
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 100, 20, 50),
            child: StyledButtonSmall(
                text: "CRÉER COMMANDE",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => ProductList(client: widget.client),
                    ),
                  );
                },
                color: Colors.blue[600]!),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: "Profil",
        function: CustomAppBarFunction.back,
        saveUnfinishedOrder:
            widget.client.cartProducts.isNotEmpty ? _addToOrderHistory : () {},
      ),
      body: content,
    );
  }
}
