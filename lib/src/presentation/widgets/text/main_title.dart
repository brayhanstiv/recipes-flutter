// Packages
import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  final String text;

  const MainTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.indigo,
        fontSize: 30,
        fontWeight: FontWeight.normal,
      ),
      textAlign: TextAlign.start,
    );
  }
}
