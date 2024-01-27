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
  final Uri privacyPolicyUrl = Uri.parse(
      'https://fiverrchamiyah.blogspot.com/p/driving-license-exam-app-sri-lanka.html');
  final Uri termsandConditionUrl = Uri.parse(
      'https://fiverrchamiyah.blogspot.com/p/driving-license-exam-app-sri-lanka_27.html');

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
          // const DrawerCard(
          //   img: "images/png/pen.png",
          //   title: "MCQ",
          //   subtitle: "(බහුවරණ ප්‍රශ්ණ)",
          //   color: Colors.white,
          //   screen: RoadSignBase(),
          // ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            thickness: 2,
            endIndent: 50,
            indent: 50,
            color: Color.fromARGB(50, 24, 46, 53),
          ),

          const SizedBox(
            height: 30,
          ),
          Image.asset(
            "images/main_app_images/beelogo.png",
            width: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => launchUrl(privacyPolicyUrl),
            child: const Text(
              "Privacy Policy",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          InkWell(
            onTap: () => launchUrl(termsandConditionUrl),
            child: const Text(
              "Terms and Conditions",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Copyright @ 2024 Appsblee",
            style: TextStyle(fontSize: 13),
          ),
          const Text(
            "All Rights Reserved",
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
