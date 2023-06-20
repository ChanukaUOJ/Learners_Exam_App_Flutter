import 'package:flutter/material.dart';
import 'package:learners_exam_app/categories/road_signs/warning_signs/waring_signs_list.dart';

import '../../../background.dart';
import '../../../drawer_modified.dart';

class WarningSigns extends StatefulWidget {
  const WarningSigns({super.key});

  @override
  State<WarningSigns> createState() => _WarningSignsState();
}

class _WarningSignsState extends State<WarningSigns> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 83, 209, 153),
        drawer: const DrawerModified(),
        appBar: AppBar(
          foregroundColor: const Color.fromARGB(255, 24, 46, 53),
          centerTitle: true,
          title: const Text(
            "අනතුරු ඇඟවීමේ සලකුණු",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 24, 46, 53),
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 83, 209, 153),
          //backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
              ),
            )
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: WarningSignList(),
        ),
      ),
    );
  }
}
