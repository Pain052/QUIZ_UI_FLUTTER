import 'package:get/get.dart';
import 'package:quiz_app_basic/core/images.dart';

import 'package:flutter/material.dart';
import 'package:quiz_app_basic/view/controller_views/question_controller.dart';
import 'package:quiz_app_basic/view/welcome_view.dart';

class ScoreQuiz extends StatelessWidget {
  const ScoreQuiz({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                Images.backgroundImage,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    "Score".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${controller.numOfCorrectAns * 20} / ${controller.questions.length * 20}",
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
