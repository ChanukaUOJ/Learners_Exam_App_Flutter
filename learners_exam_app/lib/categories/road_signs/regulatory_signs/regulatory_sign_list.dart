import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/material.dart';
import 'package:learners_exam_app/categories/road_signs/regulatory_signs/regulatory_sign_model.dart';

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
                        top: 15,
                        bottom: 25,
                        left: 15,
                        right: 15,
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              items[index].regulatoryImg.toString(),
                              width: 250,
                            ),
                          ),
                          Text(
                            items[index].regulatoryId.toString(),
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
                            items[index].regulatoryTitle.toString(),
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
                            items[index].regulatoryDescription.toString(),
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
