import 'package:flutter/material.dart';
import 'dart:math';

class StatusAnswerOverlay extends StatefulWidget {
  final bool _answer;
  final VoidCallback _onTap;
  StatusAnswerOverlay(this._answer, this._onTap);

  @override
  StatusAnswerOverlayState createState() => new StatusAnswerOverlayState();
}

class StatusAnswerOverlayState extends State<StatusAnswerOverlay>
    with SingleTickerProviderStateMixin {
  Animation<double> _alertAnimation;
  AnimationController _alertAnimationController;

  @override
  void initState() {
    super.initState();
    _alertAnimationController = new AnimationController(
        duration: new Duration(milliseconds: 600), vsync: this);
    _alertAnimation = new CurvedAnimation(
        parent: _alertAnimationController, curve: Curves.easeInOut);
    _alertAnimation.addListener(() => this.setState(() {}));
    _alertAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black45,
      child: new InkWell(
          onTap: () => widget._onTap(),
          child: new Center(
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                new Container(
                    decoration: new BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: new Transform.rotate(
                      angle: _alertAnimation.value * 2 * pi,
                        child: new Icon(
                      widget._answer ? Icons.check : Icons.close,
                      color: widget._answer ? Colors.green : Colors.redAccent,
                      size: _alertAnimation.value*60.0,
                    ))),
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new Text(
                  widget._answer ? '!آفرین' : '!غلطه',
                  style: TextStyle(
                      fontFamily: 'is_light',
                      fontSize: 15.0,
                      color: Colors.white),
                ),
              ]))),
    );
  }
}
