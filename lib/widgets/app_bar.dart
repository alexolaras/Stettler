import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;
  //final void Function() onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: IconButton(
            alignment: Alignment.center,
            icon: const Icon(Icons.menu),
            color: Colors.black,
            onPressed: (){
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 229, 36, 36),
      centerTitle: true,
      title: Text(title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      elevation: 0,
    );
  }
}
