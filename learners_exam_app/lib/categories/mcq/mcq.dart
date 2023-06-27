import 'package:flutter/material.dart';
import 'package:learners_exam_app/categories/mcq/mcq_list.dart';
import '../../../drawer_modified.dart';

class Mcq extends StatefulWidget {
  const Mcq({super.key});

  @override
  State<Mcq> createState() => _McqState();
}

class _McqState extends State<Mcq> {
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
            "All MCQ List",
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
          child: McqList(),
        ),
      ),
    );
  }
}
