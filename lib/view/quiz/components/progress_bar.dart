import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app_basic/core/colors_manager.dart';
import 'package:quiz_app_basic/core/padding_manager.dart';
import 'package:quiz_app_basic/view/controller_views/question_controller.dart';

import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsManager.greyColor,
          width: 3.0,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                // Create LayoutBuilder to provide us the available for container
                // constraints.maxWidth needed for animation
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * controller.animation.value,
                    decoration: BoxDecoration(
                      gradient: ColorsManager.primaryGradientColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: PaddingManager.defaultPadding / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${(controller.animation.value * 60).round()} Sec"),
                        const Icon(Icons.access_time),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
