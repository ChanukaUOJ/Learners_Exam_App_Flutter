import 'package:flutter/material.dart';

import 'categories.dart';
import 'drawer_modified.dart';

class QuizBasedScreen extends StatefulWidget {
  const QuizBasedScreen({super.key});

  @override
  State<QuizBasedScreen> createState() => _QuizBasedScreenState();
}

class _QuizBasedScreenState extends State<QuizBasedScreen> {
  Widget currentScreen = const Categories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 83, 209, 153),
      drawer: const DrawerModified(),
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 24, 46, 53),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 83, 209, 153),
      ),
      body: currentScreen,
    );
  }
}
