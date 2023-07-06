import 'package:flutter/material.dart';
import 'package:stettlerproapp/classes/client.dart';

class ClientSettings extends StatelessWidget {
  const ClientSettings({super.key, required this.icon, required this.text, required this.onPressed});

  final IconData icon;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Icon(icon, size: 26,),
              const SizedBox(width: 10,),
              Text(text, style: Theme.of(context).textTheme.bodyMedium!.copyWith(),)
            ],
          ),
        ),
      ),
    );
  }
}
