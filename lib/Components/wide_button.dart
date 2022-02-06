import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {

  final MaterialColor? color;
  final String buttonText;
  final void Function()? onPressed;

  WideButton ({required this.buttonText, this.onPressed, this.color});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 30.0, right: 30.0),
      child: ElevatedButton(
        style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(double.infinity, double.minPositive)

        ),padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
            backgroundColor: MaterialStateProperty.all(color == null ? Colors.brown : color),

        ),
        onPressed: onPressed == null ? (){} : onPressed,
        child: Text(buttonText,
          style: TextStyle(fontSize: 20.0),),),
    );
  }
}