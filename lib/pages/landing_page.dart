import 'package:flutter/material.dart';
import 'package:quiz/pages/quiz_page.dart';

class LandigPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.green[500],
      child: new InkWell(
        onTap: (){Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new QuizPage()));},
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('! بزن بریم',style: TextStyle(fontFamily: 'is_bold',fontSize: 50.0,color: Colors.white),),
            new Text('.با انگشت بر روی صفحه بزنید',style: TextStyle(fontFamily: 'is_light',fontSize: 15.0,color: Colors.white),)
          ]
        )
      ),
    );
  }
}