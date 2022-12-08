import 'package:quiz_app_basic/core/colors_manager.dart';
import 'package:quiz_app_basic/core/images.dart';
import 'package:quiz_app_basic/core/padding_manager.dart';
import 'package:quiz_app_basic/models/questions_model.dart';
import 'package:quiz_app_basic/view/controller_views/question_controller.dart';
import 'package:quiz_app_basic/view/quiz/components/option_widget.dart';
import 'package:quiz_app_basic/view/quiz/components/progress_bar.dart';
import 'package:quiz_app_basic/view/quiz/components/question_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Stack(
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
                const ProgressBar(),
                SizedBox(
                  height: PaddingManager.defaultPadding,
                ),
                Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${questionController.questionCountNumber.value}",
                      style: TextStyle(
                        color: ColorsManager.greyColor,
                        fontSize: 30,
                      ),
                      children: [
                        TextSpan(
                          text: "/${questionController.questions.length}",
                          style: TextStyle(
                            color: ColorsManager.greyColor,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2.5,
                ),
                SizedBox(
                  height: PaddingManager.defaultPadding,
                ),
                Expanded(
                  child: PageView.builder(
                    controller: questionController.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: questionController.updateCountNumberAns,
                    itemCount: questionController.questions.length,
                    itemBuilder: (context, index) => _buildItemQuestions(
                      questionController.questions[index],
                      questionController.questions[index].options.length,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItemQuestions(QuestionModel dataQuestion, int itemBuilder) {
    QuestionController questionController = Get.put(QuestionController());
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.all(PaddingManager.defaultPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              QuestionsWidget(
                dataQuestion: dataQuestion,
              ),
              SizedBox(
                height: PaddingManager.defaultPadding / 2,
              ),
              ...List.generate(
                itemBuilder,
                (index) => OptionsWidget(
                  title: dataQuestion.options[index],
                  onTap: () {
                    questionController.checkAnswer(dataQuestion, index);
                  },
                  index: index,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
