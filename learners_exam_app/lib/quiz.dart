import 'package:flutter/material.dart';
import 'package:learners_exam_app/splash_screen.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Raleway"),
      home: const Scaffold(
        backgroundColor: Color.fromARGB(255, 83, 209, 153),
        body: SizedBox(
          width: double.infinity,
          child: SplashScreen(),
        ),
      ),
    );
  }
}
