import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learners_exam_app/categories/road_signs/road_signs_base.dart';
import 'package:learners_exam_app/global_variable.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool isConnected = connectivityResult != ConnectivityResult.none;

    await Future.delayed(const Duration(seconds: 3));

    if (isConnected) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const RoadSignBase(),
        ),
      );
    } else {
      // Show an error message or perform actions for no internet connection
      // For example:
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'No Internet Connection',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
              'Please check your internet connection and try again.'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              onPressed: () {
                Navigator.pop(context);
                SystemNavigator.pop();
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariable.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/main_app_images/beelogo.png",
              width: 100,
              color: const Color.fromARGB(255, 27, 27, 27),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 175.0),
              child: LinearProgressIndicator(
                backgroundColor: Color.fromARGB(255, 204, 204, 204),
                minHeight: 5,
                valueColor: AlwaysStoppedAnimation(
                  Color.fromARGB(255, 12, 12, 12),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Version 1.0"),
          ],
        ),
      ),
    );
  }
}
