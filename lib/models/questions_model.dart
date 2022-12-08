class QuestionModel {
  int? id;
  int? answerIndex;
  String? question;
  List<String> options;

  QuestionModel({
    this.id,
    this.answerIndex,
    this.question,
    this.options = const [],
  });
}
