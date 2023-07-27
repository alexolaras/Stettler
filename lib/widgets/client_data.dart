import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/classes/order.dart';

class ClientData extends StatelessWidget {
  const ClientData({super.key, required this.client});

  final Client client;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(7),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Row(
        children: [
          /*client.orderList[client.orderList.length - 1].orderStatus ==
                  OrderStatus.pending
              ?*/ Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 186, 246, 218),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.check_circle_rounded,
                    color: Color.fromARGB(255, 34, 193, 87),
                    size: 30,
                  ),
                ),
              /*Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 243, 243),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.cancel_outlined,
                    color: Color.fromARGB(255, 239, 84, 72),
                    size: 30,
                  ),
                ),*/
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  client.orderList[client.orderList.length - 1].orderNumber,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Text(
                    client.name,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color.fromARGB(150, 124, 125, 129),
                        fontSize: 14),
                  ),
                  Text(
                    client.surname,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color.fromARGB(150, 124, 125, 129),
                        fontSize: 14),
                  ),
                  Text(
                    '|',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color.fromARGB(150, 124, 125, 129),
                        fontSize: 14),
                  ),
                  Text(
                    client.id,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color.fromARGB(150, 124, 125, 129),
                        fontSize: 14),
                  ),
                ]
                    .map((widget) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: widget,
                        ))
                    .toList(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
