import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learners_exam_app/categories/road_signs/road_signs_base.dart';
import 'package:learners_exam_app/categorymodel.dart';
import 'package:learners_exam_app/elevated_button.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    void back() {
      setState(() {
        Navigator.of(context).pop(context);
      });
    }

    return Center(
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        // /mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Categories",
            style: GoogleFonts.raleway(
              textStyle: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            //height: 425,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
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
                InkWell(
                  onTap: () {},
                  child: const Categorymodel(
                    img: 'images/png/pen.png',
                    textEnglish: "MCQ",
                    textSinahala: "(බහුවරණ ප්‍රශ්ණ)",
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Categorymodel(
                    img: 'images/png/modelpapers.png',
                    textEnglish: "Model Papers",
                    textSinahala: "(ආදර්ශ ප්‍රශ්ණ)",
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Categorymodel(
                    img: 'images/png/supportus.png',
                    textEnglish: "Support Us!",
                    textSinahala: "(උදව් කරන්න)",
                    color: Color.fromARGB(255, 255, 238, 177),
                  ),
                )
              ],
            ),
          ),
          ElevatedButtonModified(
            text: "ඉවත්වන්න",
            moveBack: back,
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
