import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onPressed;
  final Widget? icon;

  LoginButton({required this.text, required this.color, required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: this.onPressed,
      child: Stack(
        children: [
          Positioned(left: 5, child: this.icon ?? SizedBox()),
          Container(width: 0.75.sw,
            child: Center(child: Text(this.text, style: TextStyle(fontSize: 18)))),]
      ),
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          primary: this.color
      ),
    );
  }
}