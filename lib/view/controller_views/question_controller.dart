import 'package:quiz_app_basic/mock_data/mock_questions_data.dart';
import 'package:quiz_app_basic/models/questions_model.dart';
import 'package:quiz_app_basic/view/quiz/score/score_quiz.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => _animation;

  late PageController _pageController;

  PageController get pageController => _pageController;

  final List<QuestionModel> _question = MockQuestionData.mockDataQuestion
      .map(
        (questionResponse) => QuestionModel(
          id: questionResponse.id,
          answerIndex: questionResponse.answerIndex,
          question: questionResponse.question,
          options: questionResponse.options,
        ),
      )
      .toList();

  List<QuestionModel> get questions => _question;

  bool _isAnswered = false;

  bool get isAnswered => _isAnswered;

  int _correctAns = 0;

  int get correctAns => _correctAns;

  int _selectedAns = 0;

  int get selectedAns => _selectedAns;

  RxInt questionCountNumber = 1.obs;

  RxInt get questionNumber => questionCountNumber;

  int _numOfCorrectAns = 0;

  int get numOfCorrectAns => _numOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(
        () {
          update();
        },
      );

    _animationController.forward().whenComplete(nextQuestions);

    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAnswer(QuestionModel questionModel, int selectedIndex) {
    _isAnswered = true;
    _correctAns = questionModel.answerIndex!;
    _selectedAns = selectedIndex;
    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    // Stop progressbar counter score
    _animationController.stop();
    update();

    nextQuestions();
  }

  void nextQuestions() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (questionCountNumber.value != _question.length) {
          _isAnswered = false;
          _pageController.nextPage(
              duration: const Duration(microseconds: 300), curve: Curves.ease);
          _animationController.reset();
          _animationController.forward().whenComplete(nextQuestions);
        }
        if (questionCountNumber.value == questions.length) {
          Get.to(
            const ScoreQuiz(),
          );
        }
      },
    );
  }

  void updateCountNumberAns(int index) {
    questionCountNumber.value = index + 1;
  }
}
