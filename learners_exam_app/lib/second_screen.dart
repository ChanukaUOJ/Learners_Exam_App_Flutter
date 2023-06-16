import 'package:flutter/material.dart';
import 'package:learners_exam_app/elevated_button.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learners_exam_app/quiz_based_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void enterButton() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const QuizBasedScreen(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Lottie.asset(
          "images/main_app_images/json/firstscreen.json",
          width: 320,
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButtonModified(
          moveBack: enterButton,
          text: "ඇතුල්වන්න",
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Get Started!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "it's free!",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
