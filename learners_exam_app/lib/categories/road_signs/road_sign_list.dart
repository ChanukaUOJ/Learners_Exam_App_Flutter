import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learners_exam_app/categories/road_signs/regulatory_signs/regulatory_sign.dart';
import 'package:learners_exam_app/categories/road_signs/road_signs_category_model.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:learners_exam_app/categories/road_signs/warning_signs/warning_signs.dart';

import 'guidance_signs/guidance_signs.dart';

class RoadSignList extends StatefulWidget {
  const RoadSignList({super.key});

  @override
  State<RoadSignList> createState() => _RoadSignListState();
}

class _RoadSignListState extends State<RoadSignList> {
  // ignore: non_constant_identifier_names
  Future<List<RoadSignsCategoryModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle
        .loadString("json_database/Road_signs/road_sign_categories.json");
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => RoadSignsCategoryModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    Widget activeList = const WarningSigns();
    String activeListString = "1";

    return FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(
            child: Text("${data.error}"),
          );
        } else if (data.hasData) {
          var items = data.data as List<RoadSignsCategoryModel>;
          return ListView.builder(
              itemCount: items.length,
              itemBuilder: ((context, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    elevation: 5,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          activeListString = items[index].id.toString();

                          if (activeListString == "2") {
                            activeList = const RegulatorySign();
                          } else if (activeListString == "3") {
                            activeList = const GuidanceSigns();
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => activeList,
                            ),
                          );
                        });
                      },
                      leading: Image.asset(
                        items[index].img.toString(),
                      ),
                      title: Text(
                        items[index].title.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(
                        Icons.arrow_circle_right,
                        color: Color.fromARGB(190, 24, 46, 53),
                      ),
                    ),
                  )));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
