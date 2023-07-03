import 'package:flutter/material.dart';

class EnterpriseSquare extends StatelessWidget {
  const EnterpriseSquare({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white
                ),
          ),
        ),
      ),
    );
  }
}
