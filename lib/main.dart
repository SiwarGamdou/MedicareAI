import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:medic/app_routes.dart';
import 'package:medic/consts.dart';
import 'package:medic/starting_page.dart';

void main() {
  Gemini.init(apiKey: geminiApiKey);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "medicare",
      getPages: appRoutes,
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const StartingPage(),
    );
  }
}
