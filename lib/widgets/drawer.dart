import 'package:flutter/material.dart';
import 'package:stettlerproapp/screens/accueil.dart';
import 'package:stettlerproapp/screens/liste_clients.dart';
import 'package:stettlerproapp/screens/se_connecter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Center(
                    child: Container(
                  width: 150,
                  child: Image.asset('lib/assets/images/logo.png'),
                )),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Accueil",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Accueil(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Clients",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ListeClients(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Articles",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () {
                      //Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Historique commandes",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Déconnexion",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
