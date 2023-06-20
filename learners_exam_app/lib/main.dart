import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learners_exam_app/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: "Raleway"),
    home: const SplashScreen(),
  ));
}
