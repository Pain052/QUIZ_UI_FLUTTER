import 'package:quiz_app_basic/models/questions_model.dart';

import 'package:flutter/material.dart';

class QuestionsWidget extends StatelessWidget {
  final QuestionModel dataQuestion;

  const QuestionsWidget({
    Key? key,
    required this.dataQuestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      dataQuestion.question ?? "",
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );
  }
}
