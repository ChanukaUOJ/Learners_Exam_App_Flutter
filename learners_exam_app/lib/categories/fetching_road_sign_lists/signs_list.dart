import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:learners_exam_app/categories/fetching_road_sign_lists/signs_model.dart';
import 'package:provider/provider.dart';
import 'package:learners_exam_app/ad_state.dart';

class SignList extends StatefulWidget {
  final String listName;
  const SignList({required this.listName, super.key});

  @override
  State<SignList> createState() => _SignListState();
}

class _SignListState extends State<SignList> {
  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;

  Future<List<SignModel>> readJsonData() async {
    final jsondata = await rootBundle.rootBundle
        .loadString("json_database/Road_signs/${widget.listName}.json");
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => SignModel.fromJSON(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    _initAd();
  }

  void _initAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: onAdLoaded, onAdFailedToLoad: ((error) => print(error))),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _isAdLoaded = true;

    // _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
    //   onAdDismissedFullScreenContent: (ad) {
    //     _interstitialAd.dispose();
    //   },
    //   onAdFailedToShowFullScreenContent: (ad, error) => {
    //     _interstitialAd.dispose(),
    //   },
    // );
  }

  void _showFullScreenImage(String imagePath) {
    showDialog(
      context: context,
      builder: (context) => GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AdState adState = Provider.of<AdState>(context);

    String appBarName = "";
    Color appBarBackgroundColor = Colors.black;

    if (widget.listName == "warning_signs") {
      appBarName = "අනතුරු ඇඟවීමේ සලකුණු";
      appBarBackgroundColor = const Color.fromARGB(255, 189, 111, 1);
    } else if (widget.listName == "regulatory_signs") {
      appBarName = "නියාමන සලකුණු";
      appBarBackgroundColor = const Color.fromARGB(255, 230, 59, 59);
    } else if (widget.listName == "guidance_signs") {
      appBarName = "මඟපෙන්වීමී තොරතුරු සලකුණු";
      appBarBackgroundColor = const Color.fromARGB(255, 25, 168, 80);
    } else if (widget.listName == "various_signs") {
      appBarName = "විවිධ සලකුණු";
      appBarBackgroundColor = const Color.fromARGB(255, 101, 20, 139);
    } else if (widget.listName == "roadmark_signs") {
      appBarName = "මාර්ග ලකුණු කිරීම්";
      appBarBackgroundColor = const Color.fromARGB(255, 17, 17, 17);
    } else if (widget.listName == "traffic_light_signs") {
      appBarName = "රථ වාහන ආලෝක සංඥා";
      appBarBackgroundColor = const Color.fromARGB(255, 194, 179, 43);
    } else if (widget.listName == "vehicle_control_signs") {
      appBarName = "රථ වාහන පාලන සංඥා";
      appBarBackgroundColor = const Color.fromARGB(255, 47, 130, 199);
    } else if (widget.listName == "other_signs") {
      appBarName = "අමතර";
      appBarBackgroundColor = const Color.fromARGB(255, 187, 41, 90);
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 201, 201),
      appBar: AppBar(
        centerTitle: true,
        elevation: 3,
        backgroundColor: appBarBackgroundColor,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(appBarName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder(
          future: readJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(
                child: Text("${data.error}"),
              );
            } else if (data.hasData) {
              var items = data.data as List<SignModel>;
              return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        (index % 4 == 0)
                            ? SizedBox(
                                height: 50,
                                child: AdWidget(
                                    ad: BannerAd(
                                  adUnitId: adState.bannerAdUnitId,
                                  size: AdSize.banner,
                                  request: const AdRequest(),
                                  listener: adState.bannerAddListener,
                                )..load()),
                              )
                            : const SizedBox(),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 5,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                              bottom: 25,
                              left: 15,
                              right: 15,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(7.0),
                                    decoration: BoxDecoration(
                                      // border: Border.all(width: 1.5),
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: appBarBackgroundColor
                                          .withOpacity(0.25),
                                    ),
                                    child: Text(
                                      items[index].id.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (_isAdLoaded) {
                                          _interstitialAd.show();
                                          _showFullScreenImage(
                                            items[index].img.toString(),
                                          );
                                        }
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 40),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.5,
                                                color: appBarBackgroundColor),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Image.asset(
                                            items[index].img.toString(),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      items[index].title.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      items[index].description.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
