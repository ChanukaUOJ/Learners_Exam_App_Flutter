import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categorymodel extends StatelessWidget {
  const Categorymodel(
      {required this.img,
      required this.textEnglish,
      required this.textSinahala,
      required this.color,
      super.key});

  final String img;
  final String textEnglish;
  final String textSinahala;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 190,
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 24, 46, 53),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Image.asset(
                img,
                width: 40,
                height: 40,
                color: const Color.fromARGB(255, 83, 209, 153),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              textEnglish,
              style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              textSinahala,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
