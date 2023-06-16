import 'package:flutter/material.dart';
import 'package:learners_exam_app/drawer_modified.dart';

class RoadSignBase extends StatefulWidget {
  const RoadSignBase({super.key});

  @override
  State<RoadSignBase> createState() => _RoadSignBaseState();
}

class _RoadSignBaseState extends State<RoadSignBase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 83, 209, 153),
      drawer: const DrawerModified(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 83, 209, 153),
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
      body: Column(
        children: [
          const Text(
            "Road Sign Categories",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            height: 500,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
}
