import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/screens/order_details.dart';
import 'package:stettlerproapp/widgets/order_data.dart';

import '../classes/product.dart';
import '../data/dummy_data.dart';
import '../providers/orders_provider.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';

class ClientOrders extends ConsumerStatefulWidget {
  const ClientOrders({super.key, required this.client});

  final Client client;
  @override
  OrderHistoryState createState() => OrderHistoryState();
}

class OrderHistoryState extends ConsumerState<ClientOrders> {
  double calculateTotalPrice(List<int> quantityList, List<Product> orderedItems) {
  double totalPrice = 0;

  for (int i = 0; i < quantityList.length; i++) {
    double price = orderedItems[i].price;
    totalPrice += quantityList[i] * price;
  }

  return totalPrice;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Commandes des clients",
        function: CustomAppBarFunction.back,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.all(10),
              child: Text(
                "Vos dernières commandes",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                //final filteredOrders = ref.watch(ordersProvider);
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.client.orderList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => OrderDetails(
                                order: widget.client.orderList[index],////////////
                                client: people.firstWhere((person) =>
                                    person.id ==
                                    widget.client.orderList[index].clientId),
                                cartItems:
                                    widget.client.orderList[index].orderedItems,
                                quantityList: widget
                                    .client.orderList[index].orderedQuantity!,
                                totalPrice: ValueNotifier<double>(
                                  calculateTotalPrice(
                                      widget.client.orderList[index]
                                          .orderedQuantity!,
                                      widget.client.orderList[index]
                                          .orderedItems),
                                ),
                              ),
                            ),
                          );
                        },
                        child: OrderData(
                          order: widget.client.orderList[index],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
