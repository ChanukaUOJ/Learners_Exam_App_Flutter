import 'package:flutter/material.dart';
import 'package:learners_exam_app/categories/road_signs/road_sign_list.dart';

class SubCategoryModel extends StatelessWidget {
  const SubCategoryModel(
      {required this.title,
      required this.subtitle,
      required this.containerHeight,
      required this.dataList,
      super.key});

  final String title;
  final String subtitle;
  final double containerHeight;
  final Widget dataList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          height: containerHeight,
          decoration: const BoxDecoration(
              //color: Color.fromARGB(255, 255, 255, 255),
              ),
          child: dataList,
        )
      ],
    );
  }
}
