import 'package:quiz_app_basic/view/controller_views/question_controller.dart';
import 'components/body_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizView extends StatelessWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              controller.nextQuestions();
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: const BodyWidget(),
    );
  }
}
