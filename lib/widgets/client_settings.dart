import 'package:flutter/material.dart';

class ClientSettings extends StatelessWidget {
  const ClientSettings({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        
        children: [
          Icon(icon),
          Text(text)
        ],
      ),
    );
  }
}
