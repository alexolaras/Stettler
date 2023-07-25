import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 70,
      decoration: const BoxDecoration(color: Colors.white),
      child: BottomAppBar(
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 70,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavItem(Icons.home_outlined, 0, size: 30),
              buildNavItem(Icons.search, 1, size: 30),
              buildNavItem(Icons.shopping_bag_outlined, 2, size: 30),
              buildNavItem(Icons.person_outline, 3, size: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(IconData icon, int index, {double size = 24}) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? Colors.black : Colors.white.withOpacity(.60);

    return Expanded(
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: GestureDetector(
          onTap: () => _onItemTapped(index),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (isSelected)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 2,
                    width: 10,
                    color: Colors.black,
                  ),
                ),
              Icon(icon, color: color, size: size),
            ],
          ),
        ),
      ),
    );
  }
}
