import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/material.dart';

import 'package:learners_exam_app/categories/road_signs/warning_signs/regulatory_sign.dart';
import 'package:learners_exam_app/categories/road_signs/warning_signs/regulatory_sign_model.dart';

class RegulatorySignList extends StatefulWidget {
  const RegulatorySignList({super.key});

  @override
  State<RegulatorySignList> createState() => _RegulatorySignListState();
}

class _RegulatorySignListState extends State<RegulatorySignList> {
  // ignore: non_constant_identifier_names
  Future<List<RegulatorySignModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle
        .loadString("json_database/Road_signs/regulatory_signs.json");
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => RegulatorySignModel.fromJSON(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ReadJsonData(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(
            child: Text("${data.error}"),
          );
        } else if (data.hasData) {
          var items = data.data as List<RegulatorySignModel>;
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
                          top: 5, bottom: 15, left: 15, right: 15),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              items[index].regulatoryImg.toString(),
                              width: 150,
                            ),
                          ),
                          Text(
                            items[index].regulatoryId.toString(),
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
                            items[index].regulatoryTitle.toString(),
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
                            items[index].regulatoryDescription.toString(),
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
