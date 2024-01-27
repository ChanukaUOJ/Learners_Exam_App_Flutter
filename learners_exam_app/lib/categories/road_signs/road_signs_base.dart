import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:learners_exam_app/ad_state.dart';
import 'package:learners_exam_app/categories/road_signs/road_sign_list.dart';
import 'package:learners_exam_app/global_variable.dart';
import 'package:provider/provider.dart';

import '../../drawer_modified.dart';

class RoadSignBase extends StatefulWidget {
  const RoadSignBase({super.key});

  @override
  State<RoadSignBase> createState() => _RoadSignBaseState();
}

class _RoadSignBaseState extends State<RoadSignBase> {
  BannerAd? banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: const AdRequest(),
          listener: adState.bannerAddListener,
        )..load();
      });
    });
  }

  Widget buildAdWidget() {
    if (banner != null) {
      return AdWidget(ad: banner!);
    } else {
      // Replace the following with your default ad widget
      return Container(
        color: Colors.grey, // Placeholder color
        child: const Center(
          child: Text('Ad loading failed or is null'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariable.backgroundColor,
        drawer: const DrawerModified(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0),
          child: AppBar(
            elevation: 0,
            title: const Text(
              "Road Signs",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            centerTitle: true,
            // actions: [
            //   IconButton(
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //     icon: const Icon(
            //       Icons.close,
            //     ),
            //   )
            // ],
          ),
        ),
        body: Column(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 30.0, left: 12.0, right: 12.0, bottom: 12.0),
                child: RoadSignList(),
              ),
            ),
            SizedBox(
              height: 50,
              child: buildAdWidget(),
            )
          ],
        ),
      ),
    );
  }
}
