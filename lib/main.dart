import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_basic/view/welcome_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Quiz App Basic For Beginner",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const WelcomeView(),
    );
  }
}
