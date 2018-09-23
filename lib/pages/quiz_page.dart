import 'package:flutter/material.dart';
import 'package:quiz/Uis/question_card_container.dart';

class QuizPage extends StatelessWidget {

  _answer(bool answer) {
    print(answer);
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
          child: new QuestionCardContainer())
    );
  }
}
