import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learners_exam_app/categories/road_signs/road_signs_base.dart';
import 'package:url_launcher/url_launcher.dart';

import 'drawer_card.dart';

class DrawerModified extends StatefulWidget {
  const DrawerModified({super.key});

  @override
  State<DrawerModified> createState() => _DrawerModifiedState();
}

class _DrawerModifiedState extends State<DrawerModified> {
  var url = Uri.parse(
      'https://play.google.com/store/apps/details?id=com.appblee.rolldicesimple&hl=en&gl=US');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Text(
            "Categories",
            style: GoogleFonts.raleway(
              textStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 2,
            endIndent: 50,
            indent: 50,
            color: Color.fromARGB(50, 24, 46, 53),
          ),
          const SizedBox(
            height: 20,
          ),
          const DrawerCard(
            img: "images/png/bridge.png",
            title: "Road Sign",
            subtitle: "(මාර්ග සංඥා)",
            color: Colors.white,
            screen: RoadSignBase(),
          ),
          const DrawerCard(
            img: "images/png/pen.png",
            title: "MCQ",
            subtitle: "(බහුවරණ ප්‍රශ්ණ)",
            color: Colors.white,
            screen: RoadSignBase(),
          ),
          const DrawerCard(
            img: "images/png/modelpapers.png",
            title: "Model Papers",
            subtitle: "(ආදර්ශ ප්‍රශ්ණ)",
            color: Colors.white,
            screen: RoadSignBase(),
          ),
          const DrawerCard(
            img: "images/png/supportus.png",
            title: "Support Us!",
            subtitle: "(උදව් කරන්න)",
            color: Color.fromARGB(255, 255, 238, 177),
            screen: RoadSignBase(),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            thickness: 2,
            endIndent: 50,
            indent: 50,
            color: Color.fromARGB(50, 24, 46, 53),
          ),
          Image.asset(
            "images/main_app_images/logoforquiz.png",
            width: 80,
          ),
          const Text(
            "2023",
            style: TextStyle(fontSize: 20),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                launchUrl(url);
              },
              child: const Text("Roll Dice"),
            ),
          )
        ],
      ),
    );
  }
}
