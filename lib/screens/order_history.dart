import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stettlerproapp/classes/order.dart';
import 'package:stettlerproapp/data/dummy_data.dart';
import 'package:stettlerproapp/widgets/order_data.dart';

import '../providers/orders_provider.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';

class OrderHistory extends ConsumerStatefulWidget {
  const OrderHistory({super.key});

  @override
  OrderHistoryState createState() => OrderHistoryState();
}

class OrderHistoryState extends ConsumerState<OrderHistory> {
  final TextEditingController _searchController = TextEditingController();
  List<Order> filteredOrders = [];
  List<Order> orderList = [];


  void initialList() {
    for (final client in people) {
      for (final order in client.orderList) {
        ref.read(ordersProvider.notifier).addOrder(order);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initialList();
      orderList = ref.read(ordersProvider);
      filteredOrders = orderList;
    });
  }

  void _searchOrder(String query) {
    final suggestions = orderList.where((order) {
      final name = order.clientName.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();

    setState(() {
      filteredOrders = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: "Mise à jour commandes AGIO",
          function: CustomAppBarFunction.drawer),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 0,
                    color: Color.fromARGB(150, 124, 125, 129),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(150, 124, 125, 129),
                ),
                hintText: 'N°Bulletin ou référence client',
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color.fromARGB(150, 124, 125, 129),
                      fontSize: 14,
                    ),
              ),
              onChanged: _searchOrder,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.all(10),
              child: Text(
                'Vos dernières commandes',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: filteredOrders.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: OrderData(
                      order: filteredOrders[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
