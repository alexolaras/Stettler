import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stettlerproapp/classes/order.dart';
import 'package:stettlerproapp/widgets/order_data.dart';

import '../providers/orders_provider.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';

class OrderHistory extends ConsumerStatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  OrderHistoryState createState() => OrderHistoryState();
}

class OrderHistoryState extends ConsumerState<OrderHistory> {
  final TextEditingController _searchController = TextEditingController();
  List<Order> filteredOrders = [];
  List<Order> orderList = [];

  @override
  void initState() {
    super.initState();
    orderList = ref.read(ordersProvider);
    filteredOrders = orderList;
  }

  void _searchOrder(String query) {
    final suggestions = orderList.where((order) {
      final name = order.client.name.toLowerCase();
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
          title: "Liste clients", function: CustomAppBarFunction.drawer),
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
                hintText: 'Nom ou référence client',
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
                'Liste clients',
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
                    onTap: () {
                      // Implement onTap action here.
                    },
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
