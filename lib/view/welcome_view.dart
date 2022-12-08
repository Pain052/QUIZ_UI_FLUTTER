import 'package:quiz_app_basic/core/colors_manager.dart';
import 'package:quiz_app_basic/core/images.dart';
import 'package:quiz_app_basic/core/padding_manager.dart';
import 'package:quiz_app_basic/view/quiz/quiz_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            Images.backgroundImage,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: PaddingManager.defaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 2, // Take 2/6 current view
                  ),
                  const Text(
                    "Let's Play Quiz",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                  const Text(
                    "Enter your information to play quiz",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Spacer(), // Take 1/6 current view
                  TextField(
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      hintText: "Full Name...",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: ColorsManager.blueLightColor,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: ColorsManager.greyColor,
                      filled: true,
                    ),
                  ),
                  const Spacer(), // Take 1/6 current view
                  InkWell(
                    onTap: () {
                      Get.to(const QuizView());
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(
                        PaddingManager.defaultPadding * 0.75, // padding 15dp
                      ),
                      decoration: BoxDecoration(
                        gradient: ColorsManager.primaryGradientColor,
                        borderRadius: const BorderRadius.all(Radius.circular(
                          5.0,
                        )),
                      ),
                      child: Text(
                        "Let's start quiz".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2, // Take 2/6 current view
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
