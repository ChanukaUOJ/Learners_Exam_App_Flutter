import 'package:flutter/material.dart';
import 'package:learners_exam_app/backgroundStack.dart';

import 'background.dart';
import 'categories.dart';
import 'drawer_modified.dart';

class QuizBasedScreen extends StatefulWidget {
  const QuizBasedScreen({super.key});

  @override
  State<QuizBasedScreen> createState() => _QuizBasedScreenState();
}

class _QuizBasedScreenState extends State<QuizBasedScreen> {
  Widget currentScreen = const Categories();

  getStartedButtonPressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: const Color.fromARGB(255, 83, 209, 153),
        //backgroundColor: const Color.fromARGB(255, 255, 238, 177),
        backgroundColor: Colors.white,
        drawer: const DrawerModified(),
        appBar: AppBar(
          foregroundColor: const Color.fromARGB(255, 24, 46, 53),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: getStartedButtonPressed,
              icon: const Icon(Icons.close),
            ),
          ],
          //backgroundColor: const Color.fromARGB(255, 83, 209, 153),
          backgroundColor: Colors.white,
        ),
        body: BackgroundStack(
          screen: currentScreen,
        ),
      ),
    );
  }
}
