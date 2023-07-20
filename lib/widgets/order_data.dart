import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stettlerproapp/classes/order.dart';

class OrderData extends StatelessWidget {
  const OrderData({super.key, required this.order});

  final Order order;

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          order.isFinished
              ? Container(
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
                )
              : Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 243, 243),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.watch_later_outlined,
                    color: Color.fromARGB(255, 239, 84, 72),
                    size: 30,
                  ),
                ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.orderNumber,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        order.client.name,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: const Color.fromARGB(150, 124, 125, 129),
                            fontSize: 12),
                      ),
                      Text(
                        order.client.surname,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: const Color.fromARGB(150, 124, 125, 129),
                            fontSize: 12),
                      ),
                      Text(
                        '|',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: const Color.fromARGB(150, 124, 125, 129),
                            fontSize: 12),
                      ),
                      Text(
                        order.client.id,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: const Color.fromARGB(150, 124, 125, 129),
                            fontSize: 12),
                      ),
                    ]
                        .map((widget) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: widget,
                            ))
                        .toList(),
                  )
                ],
              ),
            ],
          ),
          Expanded(
            child: order.isFinished
                ? Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Validée',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.blue[400]),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(order.orderDate),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: const Color.fromARGB(
                                    150,
                                    124,
                                    125,
                                    129,
                                  ),
                                  fontSize: 12),
                        )
                      ],
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Progress bar...',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.red),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          'A terminer',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.blue[500]),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
