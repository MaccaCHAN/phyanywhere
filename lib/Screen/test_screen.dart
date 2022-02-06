
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TestScreen extends StatelessWidget {

  static const id = '/TestScreen';
  final bool isPortrait = ScreenUtil().orientation == Orientation.portrait;


  @override
  Widget build(BuildContext context) {
   // isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [StarButton(valueChanged: (x) {}, iconSize: isPortrait ? 30.h : 80.h,)
            ,Text('Test Words, I am handsome BOY', style: TextStyle(fontSize: isPortrait ? 20 : 50),)
            ],

            ),
          )

      ),
    );
  }
}