import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:dse_physics_app/Brains/theme_helper.dart';
import 'package:dse_physics_app/Brains/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:dse_physics_app/constants.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:provider/provider.dart';
import 'package:dse_physics_app/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableEquation extends StatefulWidget {
  final String? textLT1;
  final String? textLT2;
  final String? textLB1;
  final String? textLB2;
  final String? textRT1;
  final String? textRT2;
  final String? textRB1;
  final String? textRB2;
  final bool lineLeft;
  final bool lineRight;
  final bool boxLT;
  final bool boxLB;
  final bool boxRT;
  final bool boxRB;

  ReusableEquation({
    this.textLT1,
    this.textLT2,
    this.textLB1,
    this.textLB2,
    this.textRT1,
    this.textRT2,
    this.textRB1,
    this.textRB2,
    this.lineLeft = false,
    this.lineRight = false,
    this.boxLT = false,
    this.boxLB = false,
    this.boxRB = false,
    this.boxRT = false,
  });

  @override
  _ReusableEquationState createState() => _ReusableEquationState();
}

class _ReusableEquationState extends State<ReusableEquation> {
  // String? _selectedAnswer;

  @override
  Widget build(BuildContext context) {
  bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Consumer<FormulaProvider>(
      builder: (BuildContext context, consumer, Widget? child) {
        print('question equation rebuild');
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            EquationSideColumn(
              consumer: consumer,
              fractionLine: widget.lineLeft,
              ansBoxFilled: consumer.leftAnsBoxFilled(),
              boxTop: widget.boxLT,
              boxBottom: widget.boxLB,
              textT1: widget.textLT1,
              textT2: widget.textLT2,
              textB1: widget.textLB1,
              textB2: widget.textLB2,
              onTap: () {
                consumer.setAnswerBoxFocusLeft();
              },
              selectedAnswer: consumer.leftBoxSelectedAnswerGetter,
              boxFocus: answerBoxFocus.LeftBox,
            ),
            SizedBox(width: 5.0.w, height: 5.0.h),
            Text('=', style: isPortrait? kEquationTextStyle : kEquationTextStyle.copyWith(fontSize: 30.h)),
            SizedBox(width: 5.0.w, height: 5.0.h),
            EquationSideColumn(
                consumer: consumer,
                fractionLine: widget.lineRight,
                ansBoxFilled: consumer.rightAnsBoxFilled(),
                boxTop: widget.boxRT,
                boxBottom: widget.boxRB,
                textT1: widget.textRT1,
                textT2: widget.textRT2,
                textB1: widget.textRB1,
                textB2: widget.textRB2,
                onTap: () {
                  consumer.setAnswerBoxFocusRight();
                },
                selectedAnswer: consumer.selectedAnswer1Getter,
                boxFocus: answerBoxFocus.RightBox),
          ],
        );
      },
    );
  }
}

class EquationSideColumn extends StatelessWidget {
  final String? textT1;
  final String? textT2;
  final String? textB1;
  final String? textB2;
  final bool boxTop;
  final bool boxBottom;
  final bool fractionLine;
  final void Function() onTap;
  final bool ansBoxFilled;
  final consumer;
  final String? selectedAnswer;
  final answerBoxFocus boxFocus;

  EquationSideColumn(
      {required this.textT1,
      required this.textT2,
      required this.textB1,
      required this.textB2,
      required this.boxTop,
      required this.boxBottom,
      required this.onTap,
      required this.fractionLine,
      required this.consumer,
      required this.ansBoxFilled,
      required this.selectedAnswer,
      required this.boxFocus});

  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    bool isTablet = MediaQuery.of(context).size.longestSide / MediaQuery.of(context).size.shortestSide < 1.8;

    return Column(
        mainAxisAlignment: fractionLine ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: fractionLine
            ? [
                Flexible(
                  flex: 10,
                  fit: FlexFit.tight,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      textT1 == null ? SizedBox() : Math.tex(textT1!, textStyle: isPortrait ?
                      isTablet ? kEquationTextStyle.copyWith(fontSize: 40.h) : kEquationTextStyle.copyWith(fontSize: 30.h) :
                      kEquationTextStyle.copyWith(fontSize: 40.h)),
                      // Text('TextLT1'),
                      Padding(
                        padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
                        child: GestureDetector(
                          onTap: onTap,
                          child: boxTop == true
                              ? Container(
                                child: ansBoxFilled
                                    ? Math.tex(
                                        selectedAnswer!,
                                        textStyle:  kEquationTextStyle.copyWith(fontSize:
                                        isPortrait ?
                                        isTablet? 40.h : 30.h : 40.h)
                                      )
                                    : null,
                                padding: EdgeInsets.fromLTRB(5.0.w, 8.h, 5.w, 8.h),
                                alignment: Alignment.center,
                                // constraints: BoxConstraints(minHeight: 40.h, minWidth: 40.h),
                                height: ansBoxFilled ? null : isPortrait ? isTablet ? 45.h : 40.h : isTablet ? 60.h :55.h,
                                width: ansBoxFilled ? null : isPortrait ? isTablet ? 45.h : 40.h : isTablet ? 60.h :55.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: consumer.answerBoxFocusGetter == boxFocus
                                            ? AppColors.shineGreen
                                            : AppColors.deepBlue),
                                    color: Provider.of<ThemeProvider>(context, listen: true).themeGetter == lightModeThemeData() ? Colors.white70 :
                                    darkModeThemeData().cardColor,
                                    borderRadius: BorderRadius.circular(6.r)),
                              )
                              : SizedBox(),
                        ),
                      ),
                      textT2 == null ? SizedBox() : Math.tex(textT2!,
                          textStyle: kEquationTextStyle.copyWith(fontSize: isPortrait ?
                      isTablet? 40.h : 30.h : 40.h) ),
                    ],
                  ),
                ),
                Flexible(
                  flex: fractionLine ? 3 : 0,
                  child: fractionLine
                      ? Padding(
                          padding: EdgeInsets.only(top: 4.0.h, bottom: 4.0.h),
                          child: Align(child: Container(color:
                          Provider.of<ThemeProvider>(context, listen: true).themeGetter == lightModeThemeData() ? Colors.black :
                          darkModeThemeData().textTheme.bodyText2!.color


                              , width: 130.0.w, height: 1.5.h)),
                        )
                      : SizedBox(),
                ),
                Flexible(
                  flex: fractionLine ? 10 : 0,
                  child: Row(
                    children: [
                      textB1 == null ? SizedBox() : Math.tex(textB1!, textStyle:
                              kEquationTextStyle.copyWith(fontSize:isPortrait ?
                                                           isTablet? 40.h : 30.h : 40.h) ),
                      Padding(
                        padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
                        child: GestureDetector(
                          onTap: onTap
                          //     () {
                          //   // providerNotListen.setAnswerBoxFocusLeft();
                          // }
                          ,
                          child: boxBottom == true
                              ? Container(
                                  child: ansBoxFilled
                                      ? Math.tex(
                                          selectedAnswer!,
                                          textStyle:
                                          kEquationTextStyle.copyWith(fontSize: isPortrait ?
                                          isTablet? 40.h : 30.h : 40.h),
                                        )
                                      : null,
                                  padding: EdgeInsets.fromLTRB(10.0.w, 10.h, 10.w, 10.h),
                                  height: ansBoxFilled ? null : isPortrait ? isTablet ? 45.h : 40.h : isTablet ? 60.h :55.h,
                                  width: ansBoxFilled ? null : isPortrait ? isTablet ? 45.h : 40.h : isTablet ? 60.h :55.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: consumer.answerBoxFocusGetter == boxFocus
                                              ? AppColors.shineGreen
                                              : AppColors.deepBlue),
                                      color:
                                      Provider.of<ThemeProvider>(context, listen: true).themeGetter == lightModeThemeData() ? Colors.white70 : darkModeThemeData().cardColor
                                      ,
                                      borderRadius: BorderRadius.circular(6.r)),
                                )
                              : SizedBox(),
                        ),
                      ),
                      textB2 == null ? SizedBox() : Math.tex(textB2!, textStyle:
                      kEquationTextStyle.copyWith(fontSize: isPortrait ?
                      isTablet? 40.h : 30.h : 40.h) ,)
                    ],
                  ),
                )
              ]
            : //if has fractionLine, render a column of 3 rows
            [
                // if no fractionLine, just render a row
                Row(
                  children: <Widget>[
                    textT1 == null ? SizedBox() : Math.tex(textT1!, textStyle:
                    kEquationTextStyle.copyWith(fontSize:isPortrait ?
                    isTablet? 40.h : 30.h : 40.h)),
                    // Text('TextLT1'),
                    Padding(
                      padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
                      child: GestureDetector(
                        onTap: onTap,
                        child: boxTop == true
                            ? Container(
                                child: ansBoxFilled
                                    ? Math.tex(
                                        selectedAnswer!,
                                        textStyle: kEquationTextStyle.copyWith(
                                            fontSize: isPortrait ?
                                        isTablet? 40.h : 30.h : 40.h) ,
                                      )
                                    : null,
                                padding: EdgeInsets.fromLTRB(5.0.w, 8.h, 5.w, 8.h),
                                alignment: Alignment.center,
                                constraints: BoxConstraints(minHeight: 40.h, minWidth: 40.h),
                                height: ansBoxFilled ? null : isPortrait ? isTablet ? 45.h : 40.h : isTablet ? 60.h :55.h,
                                width: ansBoxFilled ? null : isPortrait ? isTablet ? 45.h : 40.h : isTablet ? 60.h :55.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: consumer.answerBoxFocusGetter == boxFocus
                                            ? AppColors.shineGreen
                                            : AppColors.deepBlue),
                                    color: Provider.of<ThemeProvider>(context, listen: true).themeGetter == lightModeThemeData() ? Colors.white70 :
                                    darkModeThemeData().cardColor,

                          borderRadius: BorderRadius.circular(6.r)),
                              )
                            : SizedBox(),
                      ),
                    ),
                    textT2 == null ? SizedBox() : Math.tex(textT2!, textStyle:
                              kEquationTextStyle.copyWith(fontSize: isPortrait ?
                              isTablet? 40.h : 30.h : 40.h) ),
                  ],

                )
              ]);
  }
}
