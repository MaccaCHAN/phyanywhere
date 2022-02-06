import 'package:auto_size_text/auto_size_text.dart';
import 'package:dse_physics_app/Brains/theme_helper.dart';
import 'package:dse_physics_app/Brains/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:dse_physics_app/constants.dart';
import 'package:dse_physics_app/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StandardElevatedButton extends StatefulWidget {
  final bool isDisabled;
  final String title;
  final void Function()? onPressed;
  final bool isPortrait;

  StandardElevatedButton({required this.title, required this.isDisabled, this.onPressed, this.isPortrait = true});

  @override
  _StandardElevatedButtonState createState() => _StandardElevatedButtonState();
}

class _StandardElevatedButtonState extends State<StandardElevatedButton> with SingleTickerProviderStateMixin {
  late AnimationController controller; //for more blinking button text
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    animation = Tween<double>(begin: 0.1, end: 1).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
        print(status);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
        print(status);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.75.sw + 35.w,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Center(
        child: Container(
          width: 0.75.sw,
          height: widget.isPortrait ?  50.h : 70.h,
          child: ElevatedButton(
            onPressed: widget.onPressed,
            child: FadeTransition(
              opacity: animation,
              child: AutoSizeText(widget.title,
                  style: widget.isDisabled
                      ? kButtonTextStyle.copyWith(color: Colors.black45)
                      : kButtonTextStyle),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
              primary: widget.isDisabled ?
              Provider.of<ThemeProvider>(context, listen: true).themeGetter == lightModeThemeData() ? AppColors.veryLightMilk: darkModeThemeData().cardColor
               :
              AppColors.deepBlue,
              // minimumSize: Size(0.75.sw, 0)
            ),
          ),
        ),
      ),
    );
  }
}
