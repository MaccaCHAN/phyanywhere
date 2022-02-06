import 'package:flutter/material.dart';
import 'package:dse_physics_app/app_colors.dart';

class SquareIconButton extends StatelessWidget {

  final String title;
  final iconImage;
  // final Icon? icon;
  final void Function()? onPressed;

  SquareIconButton({required this.title,this.iconImage, this.onPressed});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.greenBlue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0),
            )),
        elevation: MaterialStateProperty.all(0),
      ),
      onPressed: this.onPressed,
      child: Column(
        children: [Spacer(flex: 10),
          Expanded(flex: 55, child: this.iconImage),
          Spacer(flex:5),
          Expanded(flex: 10, child: FittedBox(child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(this.title, style: TextStyle(color: AppColors.lightGrey)),
          ), fit: BoxFit.fitHeight)),
          Spacer(flex: 10)
        ],
      ),);
  }
}
