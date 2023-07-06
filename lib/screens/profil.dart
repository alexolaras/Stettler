import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/client.dart';
import 'package:stettlerproapp/screens/accounting.dart';
import 'package:stettlerproapp/screens/general.dart';
import 'package:stettlerproapp/widgets/app_bar.dart';
import 'package:stettlerproapp/widgets/client_settings.dart';
import 'package:stettlerproapp/widgets/styled_button.dart';

import '../widgets/styled_button_small.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key, required this.client}) : super(key: key);

  final List<Client> client;

  @override
  Widget build(BuildContext context) {
    Widget content = const Scaffold(
      appBar: CustomAppBar(
        title: "Profil",
      ),
      body: Text("No people found"),
    );

    if (client.isNotEmpty) {
      content = SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
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
                  onPressed: () {},
                ),
                ClientSettings(
                    icon: Icons.person_2_outlined,
                    text: "Général",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => General(client: client[0]),
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
                          builder: (context) => Accounting(client: client[0]),
                        ),
                      );
                    }),
                ClientSettings(
                    icon: Icons.crop_original_rounded,
                    text: "Ventes",
                    onPressed: () {}),
                ClientSettings(
                    icon: Icons.crop_original_rounded,
                    text: "Rabais",
                    onPressed: () {}),
                ClientSettings(
                    icon: Icons.crop_original_rounded,
                    text: "Tournées",
                    onPressed: () {}),
                ClientSettings(
                    icon: Icons.crop_original_rounded,
                    text: "Remarques",
                    onPressed: () {}),
              ],
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 100, 20, 50),
              child: StyledButtonSmall(
                  text: "CRÉER COMMANDE",
                  onPressed: () {},
                  color: Colors.blue[600]!),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: const CustomAppBar(title: "Profil"),
      body: content,
    );
  }
}
