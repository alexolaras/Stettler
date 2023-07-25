import 'package:flutter/material.dart';

class ClientData extends StatelessWidget {
  const ClientData(
      {super.key, required this.name, required this.surname, required this.id});

  final String name;
  final String surname;
  final String id;

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
          Container(
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
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  "2342342",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color.fromARGB(150, 124, 125, 129),
                        fontSize: 14),
                  ),
                  Text(
                    surname,
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
                    id,
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
