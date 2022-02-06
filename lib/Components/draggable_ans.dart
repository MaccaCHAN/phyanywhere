
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class DraggableAns extends StatelessWidget {

  final String answerText;

  DraggableAns({required this.answerText});



  @override
  Widget build(BuildContext context) {

    // Uint8List dragImage = Base64Decoder().convert(Math.tex(answerText, textStyle: TextStyle(fontSize: 30.0)));
    // ;

    return Draggable(
      data: answerText,
      child: Card(child: Container(alignment: Alignment.center,margin: EdgeInsets.all(10), child: Math.tex(answerText, textStyle: TextStyle(fontSize: 35.0))),
        elevation: 0, color: Colors.transparent,
      ),
      feedback: Material(
          child: Card(child: Container(alignment: Alignment.center, margin: EdgeInsets.all(10), child: Math.tex(answerText, textStyle: TextStyle(fontSize: 35.0))),
            elevation: 0, color: Colors.transparent,
          ),),
      childWhenDragging: Material(
          child: Center(
            child: Card(child: Container(alignment: Alignment.center, margin: EdgeInsets.all(10), child: Math.tex(answerText, textStyle: TextStyle(fontSize: 35.0))),
    elevation: 0, color: Colors.transparent,
    ),
          ),)
    );
  }
}