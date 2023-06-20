import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:learners_exam_app/categories/road_signs/warning_signs/waring_signs_model.dart';

import 'package:learners_exam_app/categories/road_signs/warning_signs/warning_signs.dart';

class WarningSignList extends StatefulWidget {
  const WarningSignList({super.key});

  @override
  State<WarningSignList> createState() => _WarningSignListState();
}

class _WarningSignListState extends State<WarningSignList> {
  Future<List<WarningSignModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle
        .loadString("json_database/Road_signs/warning_signs.json");
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => WarningSignModel.fromJSON(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    Widget tapScreen = const WarningSigns();

    return FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(
            child: Text("${data.error}"),
          );
        } else if (data.hasData) {
          var items = data.data as List<WarningSignModel>;
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
                        top: 5,
                        bottom: 15,
                        left: 15,
                        right: 15,
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              items[index].warningImg.toString(),
                              width: 150,
                            ),
                          ),
                          Text(
                            items[index].id.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            items[index].warningTitle.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            items[index].warningDescription.toString(),
                            textAlign: TextAlign.center,
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
