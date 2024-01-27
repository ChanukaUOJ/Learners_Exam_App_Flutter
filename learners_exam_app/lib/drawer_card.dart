import 'package:flutter/material.dart';

class DrawerCard extends StatelessWidget {
  const DrawerCard(
      {required this.img,
      required this.title,
      required this.subtitle,
      required this.color,
      required this.screen,
      super.key});

  final String img;
  final String title;
  final String subtitle;
  final Color color;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
      child: Card(
        color: color,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 24, 46, 53),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Image.asset(
                img,
                width: 35,
                height: 35,
                color: const Color.fromARGB(255, 83, 209, 153),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
