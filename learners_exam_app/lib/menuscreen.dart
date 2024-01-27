import 'package:flutter/material.dart';
import 'package:learners_exam_app/categories.dart';
import 'package:learners_exam_app/drawer_modified.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        drawer: const DrawerModified(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 12, 12, 12),
          title: const Text(
            "Menu",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: const Categories(),
      ),
    );
  }
}
