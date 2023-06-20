import 'package:flutter/material.dart';
import 'package:learners_exam_app/categories/road_signs/road_sign_list.dart';
import 'package:learners_exam_app/categories/road_signs/sub_category_model.dart';
import 'package:learners_exam_app/drawer_modified.dart';

import '../../background.dart';

class RoadSignBase extends StatefulWidget {
  const RoadSignBase({super.key});

  @override
  State<RoadSignBase> createState() => _RoadSignBaseState();
}

class _RoadSignBaseState extends State<RoadSignBase> {
  Widget subCategoryScreens = const SubCategoryModel(
    title: "Road Sign Categories",
    subtitle: "(මාර්ග සංඥා වර්ග)",
    containerHeight: 525,
    dataList: RoadSignList(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: const Color.fromARGB(255, 83, 209, 153),
        drawer: const DrawerModified(),
        appBar: AppBar(
          foregroundColor: const Color.fromARGB(255, 24, 46, 53),
          elevation: 0,
          //backgroundColor: const Color.fromARGB(255, 83, 209, 153),
          backgroundColor: Colors.white,
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
        body: Stack(
          children: [
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
                  //       Colors.white,
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
            subCategoryScreens,
          ],
        ),
      ),
    );
  }
}
