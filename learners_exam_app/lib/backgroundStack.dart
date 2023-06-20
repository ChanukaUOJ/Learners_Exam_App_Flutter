import 'package:flutter/material.dart';

import 'background.dart';

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({required this.screen, super.key});

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        bottom: 0,
        child: ClipPath(
          clipper: BackgroundCliper(),
          child: Container(
            color: const Color.fromARGB(255, 54, 180, 123),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.75,
            // decoration: const BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [
            //       //Colors.white,
            //       Color.fromARGB(255, 83, 209, 153),
            //       Color.fromARGB(255, 24, 46, 53),
            //     ],
            //     //begin: Alignment.bottomLeft,
            //     //end: Alignment.topRight,
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //   ),
            // ),
          ),
        ),
      ),
      screen
    ]);
  }
}
