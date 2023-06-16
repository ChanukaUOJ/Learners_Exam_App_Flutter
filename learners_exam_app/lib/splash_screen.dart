import 'package:flutter/material.dart';
import 'package:learners_exam_app/second_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _nextScreen();
  }

  _nextScreen() async {
    await Future.delayed(const Duration(milliseconds: 3400), () {});

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SecondScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "images/main_app_images/logoforquiz.png",
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        const CircularProgressIndicator(
          strokeWidth: 5,
          valueColor: AlwaysStoppedAnimation(
            Color.fromARGB(255, 24, 46, 53),
          ),
        ),
      ],
    );
  }
}
