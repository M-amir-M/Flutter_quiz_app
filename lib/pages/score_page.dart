import 'package:flutter/material.dart';
import 'package:quiz/pages/landing_page.dart';

class ScorePage extends StatelessWidget{

  final int _score;
  final int _totalQuestions;

  ScorePage(this._score,this._totalQuestions);

  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.green[500],
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(':امتیاز',style: TextStyle(fontFamily: 'is_light',fontSize: 30.0,color: Colors.white),),
            new Text(_score.toString()+'/'+_totalQuestions.toString(),style: TextStyle(fontFamily: 'is_bold',fontSize: 30.0,color: Colors.white),),
            new IconButton(
              icon: Icon(Icons.arrow_right ,size: 60.0,color: Colors.white,),
              color: Colors.blueAccent,
              onPressed:(){
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) =>new LandigPage()),(Route route) => route == null);

              }
            )
          ]
        )
    );
  }
}