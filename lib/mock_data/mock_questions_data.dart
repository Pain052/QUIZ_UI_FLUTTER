import 'package:quiz_app_basic/models/questions_model.dart';

class MockQuestionData {
  static List<QuestionModel> mockDataQuestion = [
    QuestionModel(
      id: 1,
      answerIndex: 1,
      question:
          "Flutter is an open-source UI software development kit create by_____",
      options: ["Microsoft", "Google", "Apple", "FaceBook"],
    ),
    QuestionModel(
      id: 2,
      answerIndex: 2,
      question: "When Google release Flutter?",
      options: ["Jun 2017", "Jun 2018", "May 2017", "May 2018"],
    ),
    QuestionModel(
      id: 3,
      answerIndex: 2,
      question: "A memory location the holds a single letter or number",
      options: ["Double", "Int", "Char", "Word"],
    ),
    QuestionModel(
      id: 4,
      answerIndex: 2,
      question: "Do you like me?",
      options: ["Yes", "Yeb", "Res", "Yes"],
    ),
  ];
}
