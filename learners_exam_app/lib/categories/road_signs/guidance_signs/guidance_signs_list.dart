import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:learners_exam_app/categories/road_signs/warning_signs/waring_signs_model.dart';

import 'package:learners_exam_app/categories/road_signs/warning_signs/warning_signs.dart';

import 'guidance_signs.dart';
import 'guidance_signs_model.dart';

class GuidanceSignList extends StatefulWidget {
  const GuidanceSignList({super.key});

  @override
  State<GuidanceSignList> createState() => _GuidanceSignListState();
}

class _GuidanceSignListState extends State<GuidanceSignList> {
  Future<List<GuidanceSignModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle
        .loadString("json_database/Road_signs/guidance_signs.json");
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => GuidanceSignModel.fromJSON(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    Widget tapScreen = const GuidanceSigns();

    return FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(
            child: Text("${data.error}"),
          );
        } else if (data.hasData) {
          var items = data.data as List<GuidanceSignModel>;
          return ListView.builder(
              itemCount: items.length,
              itemBuilder: ((context, index) => Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    elevation: 5,
                    color: const Color.fromARGB(255, 255, 238, 177),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 25,
                        left: 15,
                        right: 15,
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              items[index].guidanceImg.toString(),
                              width: 250,
                            ),
                          ),
                          Text(
                            items[index].id.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            items[index].guidanceTitle.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            items[index].guidanceDescription.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
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
