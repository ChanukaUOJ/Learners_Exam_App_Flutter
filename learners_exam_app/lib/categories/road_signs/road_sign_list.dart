import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learners_exam_app/categories/fetching_road_sign_lists/signs_list.dart';
import 'package:learners_exam_app/categories/road_signs/road_signs_category_model.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;

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
    Widget activeList = const SignList(
      listName: "",
    );
    String activeListString = "";

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
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 0,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 2, 1, 34)
                                .withOpacity(0.75),
                            width: 1.25),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            activeListString = items[index].id.toString();
                            if (activeListString == "1") {
                              activeList = const SignList(
                                listName: "warning_signs",
                              );
                            } else if (activeListString == "2") {
                              activeList = const SignList(
                                listName: "regulatory_signs",
                              );
                            } else if (activeListString == "3") {
                              activeList = const SignList(
                                listName: "guidance_signs",
                              );
                            } else if (activeListString == "4") {
                              activeList = const SignList(
                                listName: "various_signs",
                              );
                            } else if (activeListString == "5") {
                              activeList = const SignList(
                                listName: "roadmark_signs",
                              );
                            } else if (activeListString == "6") {
                              activeList = const SignList(
                                listName: "traffic_light_signs",
                              );
                            } else if (activeListString == "7") {
                              activeList = const SignList(
                                listName: "vehicle_control_signs",
                              );
                            } else if (activeListString == "8") {
                              activeList = const SignList(
                                listName: "other_signs",
                              );
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
