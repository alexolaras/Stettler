import 'package:flutter/material.dart';
import 'package:stettlerproapp/screens/home.dart';
import 'package:stettlerproapp/screens/product_list.dart';
import 'package:stettlerproapp/screens/profile.dart';
import 'package:stettlerproapp/screens/shopping_cart.dart';

import '../classes/client.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.client});

  final Client client;

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Add navigation logic based on the selected index
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const Home()));
        break;
      case 1:
        Navigator.of(context).pop();
        break;
      case 2:
        //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ShoppingCart()));
        break;
      case 3:
        //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => )));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color.fromARGB(255, 165, 165, 165),
            ),
            label: '',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Color.fromARGB(255, 165, 165, 165),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Color.fromARGB(255, 165, 165, 165),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: Color.fromARGB(255, 165, 165, 165),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 30,
        onTap: _onItemTapped,
        );
  }
}
