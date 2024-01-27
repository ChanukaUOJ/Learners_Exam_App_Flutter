import 'package:flutter/material.dart';
import 'package:learners_exam_app/categories/road_signs/road_signs_base.dart';
import 'package:learners_exam_app/categorymodel.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RoadSignBase(),
                ),
              );
            },
            child: const Categorymodel(
              img: 'images/png/bridge.png',
              textEnglish: "Road Signs",
              textSinahala: "(මාර්ග සංඥා)",
              color: Colors.white,
            ),
          ),
          // InkWell(
          //   onTap: () {},
          //   child: const Categorymodel(
          //     img: 'images/png/pen.png',
          //     textEnglish: "MCQ",
          //     textSinahala: "(බහුවරණ ප්‍රශ්ණ)",
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
    );
  }
}
