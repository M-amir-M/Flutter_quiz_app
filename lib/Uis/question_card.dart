import 'package:flutter/material.dart';
import 'dart:math';
import 'package:quiz/utils/question.dart';

typedef Int2VoidFunc = void Function(bool);

class QuestionCard extends StatefulWidget {
  final Question _question;
  final Int2VoidFunc _onPressed;
  QuestionCard(this._question,this._onPressed);

  @override
  QuestionCardState createState() => new QuestionCardState();
}

class QuestionCardState extends State<QuestionCard>
    with SingleTickerProviderStateMixin {

  Animation<double> _animateCard;
  AnimationController _animateCardController;

  @override
  void initState() {
    super.initState();
    _animateCardController = new AnimationController(
        duration: new Duration(milliseconds: 500), vsync: this);
    _animateCard = new CurvedAnimation(
        parent: _animateCardController, curve: Curves.bounceInOut);
    _animateCard.addListener(() => this.setState(() {}));
    _animateCardController.forward();
  }

  @override
  void didUpdateWidget(QuestionCard oldWidget){

    super.didUpdateWidget(oldWidget);
    if(oldWidget._question != widget._question){
      _animateCardController.reset();
      _animateCardController.forward();
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Transform.rotate(
          angle: _animateCard.value * 2 * pi,
          child: new Card(
              color: Colors.lightBlue,
              child: new Column(children: <Widget>[
                new Expanded(
                    child: Center(
                        child: Text(
                  widget._question.question,
                  style: TextStyle(
                      fontFamily: 'is_light',
                      fontSize: _animateCard.value * 20,
                      color: Colors.white),
                ))),
                new Expanded(
                    child: new Center(
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                            padding: EdgeInsets.all(20.0),
                            color: Colors.greenAccent,
                            child: Text(
                              'درسته',
                              style: TextStyle(
                                  fontFamily: 'is_light',
                                  fontSize: 20.0,
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              widget._onPressed(true);
                            }),
                        new Padding(
                          padding: EdgeInsets.all(32.0),
                        ),
                        new RaisedButton(
                            padding: EdgeInsets.all(20.0),
                            color: Colors.redAccent,
                            child: Text(
                              'غلطه',
                              style: TextStyle(
                                  fontFamily: 'is_light',
                                  fontSize: 20.0,
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              widget._onPressed(false);
                            }),
                      ]),
                ))
              ])));
  }
}
