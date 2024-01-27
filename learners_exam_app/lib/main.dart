import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:learners_exam_app/ad_state.dart';
import 'package:learners_exam_app/global_variable.dart';
import 'package:learners_exam_app/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(
    Provider.value(
      value: adState,
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Raleway",
        // useMaterial3: true,

        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 1, 30, 34),
            foregroundColor: GlobalVariable.backgroundColor),
      ),
      home: const SplashScreen(),
    );
  }
}
