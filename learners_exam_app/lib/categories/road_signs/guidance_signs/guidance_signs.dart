import 'package:flutter/material.dart';
import '../../../background.dart';
import '../../../drawer_modified.dart';
import 'guidance_signs_list.dart';

class GuidanceSigns extends StatefulWidget {
  const GuidanceSigns({super.key});

  @override
  State<GuidanceSigns> createState() => _GuidanceSignsState();
}

class _GuidanceSignsState extends State<GuidanceSigns> {
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
            "මඟපෙන්වීමී තොරතුරු සලකුණු",
            style: TextStyle(
              fontSize: 17,
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
          child: GuidanceSignList(),
        ),
      ),
    );
  }
}
