import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;

import 'mcq_model.dart';

class McqList extends StatefulWidget {
  const McqList({super.key});

  @override
  State<McqList> createState() => _McqListState();
}

class _McqListState extends State<McqList> {
  // ignore: non_constant_identifier_names
  Future<List<McqModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString("json_database/mcqAll.json");
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => McqModel.fromJSON(e)).toList();
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
          var items = data.data as List<McqModel>;
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
                          Text(
                            items[index].mcqIndex.toString(),
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
                            items[index].mcqTitle.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // Text(
                          //   items[index].mcqAnswer.toString(),
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(fontSize: 18),
                          // ),
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
