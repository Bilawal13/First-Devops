class modal {
  const modal(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> get shuffledAnswers {
    final shuffledQuestions = List.of(answer);
    shuffledQuestions.shuffle();
    return shuffledQuestions;
  }
}
