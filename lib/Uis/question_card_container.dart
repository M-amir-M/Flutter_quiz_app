import 'package:flutter/material.dart';
import 'package:quiz/pages/score_page.dart';
import 'package:quiz/utils/question.dart';
import 'package:quiz/utils/quiz.dart';
import 'package:quiz/Uis/status_answer.dart';
import 'package:quiz/Uis/question_card.dart';

class QuestionCardContainer extends StatefulWidget {
  @override
  QuestionCardContainerState createState() => new QuestionCardContainerState();
}

class QuestionCardContainerState extends State<QuestionCardContainer>
    with SingleTickerProviderStateMixin {
  _answer(bool answer) {
    print(answer);
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayVisible = true;
    });
  }

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question('من یک برنامه نویسم', true),
    new Question('توسعه با فلاتر لذت بخشه', true),
    new Question('برنامه نویسی خسته کنندست', false),
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(fit: StackFit.expand, children: <Widget>[
      new Container(
        padding: new EdgeInsets.all(30.0),
        child: new QuestionCard(currentQuestion, (bool answer) {
          _answer(answer);
        }),
      ),
      overlayVisible
          ? StatusAnswerOverlay(isCorrect, () {
              if (quiz.length == questionNumber) {
                Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new ScorePage(quiz.score, quiz.length)),
                    (Route route) => route == null);
                return;
              }
              currentQuestion = quiz.nextQuestion;
              this.setState(() {
                overlayVisible = false;
                questionText = currentQuestion.question;
                questionNumber = quiz.questionNumber;
              });
            })
          : new Container()
    ]);
  }
}
