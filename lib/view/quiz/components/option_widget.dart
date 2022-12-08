import 'package:quiz_app_basic/core/colors_manager.dart';
import 'package:quiz_app_basic/core/padding_manager.dart';
import 'package:quiz_app_basic/view/controller_views/question_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionsWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final int index;

  const OptionsWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (controller) {
        return InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(top: PaddingManager.defaultPadding),
            padding: EdgeInsets.all(PaddingManager.defaultPadding),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: _buildSelectedAnsColor(controller, index),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${index + 1}. $title",
                  style: TextStyle(
                    fontSize: 16,
                    color: _buildSelectedAnsColor(controller, index),
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: _buildSelectedAnsColor(controller, index) ==
                            ColorsManager.greyColor
                        ? Colors.transparent
                        : _buildSelectedAnsColor(controller, index),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: _buildSelectedAnsColor(controller, index),
                    ),
                  ),
                  child: _buildSelectedAnsColor(controller, index) ==
                          ColorsManager.greyColor
                      ? null
                      : Icon(
                          _buildIconSelectedAns(controller, index),
                          size: 17.0,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _buildSelectedAnsColor(
      QuestionController questionController, int index) {
    if (questionController.isAnswered) {
      if (index == questionController.correctAns) {
        return ColorsManager.greenColor;
      } else if (index == questionController.selectedAns &&
          questionController.selectedAns != questionController.correctAns) {
        return ColorsManager.redColor;
      }
    }
    return ColorsManager.greyColor;
  }

  IconData _buildIconSelectedAns(
      QuestionController questionController, int index) {
    return _buildSelectedAnsColor(questionController, index) ==
            ColorsManager.greenColor
        ? Icons.done
        : Icons.close;
  }
}
