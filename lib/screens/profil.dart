import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/client.dart';
//import 'package:stettlerproapp/main.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/widgets/client_settings.dart';

class Profil extends StatelessWidget {
  const Profil({super.key, required this.client});

  final List<Client> client;

  @override
  Widget build(BuildContext context) {
    Widget content = const Scaffold(
        appBar: CustomAppBar(
          title: "Profil",
        ),
        body: Text("No people found"));

    if (client.isNotEmpty) {
      content = Column(
        children: [
          Expanded(
            child: Container(
              constraints: const BoxConstraints(maxHeight: double.infinity),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: client.length,
                itemBuilder: (ctx, index) => Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${client[index].name} ${client[index].surname}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 20)),
                        Text(
                          client[index].email,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          client[index].phoneNumber,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          '${client[index].address.number} ${client[index].address.street} ${client[index].address.postalCode} ${client[index].address.city}',
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
                    Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 249, 219, 219)),
                          child: const Icon(Icons.edit_rounded,
                              color: Color.fromARGB(255, 229, 37, 36)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Information client",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
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
          ),
          const Expanded(
            child: Column(children: [
              ClientSettings(icon: Icons.person_2_outlined, text: "General"),
              ClientSettings(icon: Icons.person_2_outlined, text: "Historique"),
              ClientSettings(icon: Icons.person_2_outlined, text: "Ventes"),
              ClientSettings(icon: Icons.person_2_outlined, text: "Rabais"),
              ClientSettings(icon: Icons.person_2_outlined, text: "Remarques"),
            ],)
          )
        ],
      );
    }

    return Scaffold(
      appBar: const CustomAppBar(title: "Profil"),
      body: content,
    );
  }
}
