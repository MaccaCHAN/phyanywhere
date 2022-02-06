import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import '../app_colors.dart';

class ExpandableContainer extends StatefulWidget {
  final Widget content;
  final Color backgroundColor;
  final bool isPortrait;

  ExpandableContainer({required this.content, this.backgroundColor = AppColors.superLightMilk,
    this.isPortrait = true});

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> with TickerProviderStateMixin {
  late AnimationController controller; //for more info container
  late Animation<double> animation;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200), upperBound: 1);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation2 =
        Tween<double>(begin: 0, end: 0.5).animate
          (
            CurvedAnimation(parent: controller,
            curve: Curves.easeIn
        ))
    ;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

    // controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: widget.isPortrait ? Alignment(0.7, 0) : Alignment(0.75, 0), //to be fixed
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (controller.isDismissed) {
                controller.forward();
              } else {
                controller.reverse();
              }
              // if (controller2.isDismissed) {
              //   controller2.forward();
              // } else {
              //   controller2.reverse();
              // }
            });
          },
          child: Container(
            color: Colors.transparent,
            height: widget.isPortrait ? 35.h : 70.h,
            width: widget.isPortrait ? 45.w : 30.w,
            child: RotationTransition(
              turns: animation2,
              child: Transform.rotate(
                  angle: -math.pi / 2,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: widget.isPortrait ? 15.h : 40.h,
                  )),
            ),
          ),
        ),
      ),
      //info arrow button
      Container(
        width: 0.9.sw,
        child: Column(children: [
          SizedBox(height: 4.h),
          SizeTransition(
            sizeFactor: animation,
            child: Container(
                decoration:
                    BoxDecoration(color: widget.backgroundColor, borderRadius: BorderRadius.circular(15.r)),
                child: widget.content),
          )
        ]),
      ),
    ]);
  }
}
