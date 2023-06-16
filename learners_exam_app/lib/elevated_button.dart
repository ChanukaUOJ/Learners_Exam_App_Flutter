import 'package:flutter/material.dart';

class ElevatedButtonModified extends StatelessWidget {
  const ElevatedButtonModified(
      {required this.text, required this.moveBack, super.key});

  final String text;
  final void Function() moveBack;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: moveBack,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: const Color.fromARGB(255, 24, 46, 53),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
