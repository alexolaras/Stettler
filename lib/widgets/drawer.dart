import 'package:flutter/material.dart';
import 'package:stettlerproapp/screens/home.dart';
import 'package:stettlerproapp/screens/client_list.dart';
import 'package:stettlerproapp/screens/login.dart';
import 'package:stettlerproapp/screens/order_history.dart';
import 'package:stettlerproapp/screens/product_list.dart';
//import 'package:stettlerproapp/classes/order.dart';

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
                          builder: (context) => const Home(),
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
                          builder: (context) => const ClientList(),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductList(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Historique commandes",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const OrderHistory(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Déconnexion",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ));
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
