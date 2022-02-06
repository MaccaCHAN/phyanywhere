import 'package:dse_physics_app/Brains/ad_helper.dart';
import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:dse_physics_app/Brains/theme_helper.dart';
import 'package:dse_physics_app/Brains/theme_provider.dart';
import 'package:dse_physics_app/Components/expandable_container.dart';
import 'package:dse_physics_app/Components/form_quiz_option_button.dart';
import 'package:dse_physics_app/Components/standard_elevated_button.dart';
import 'package:dse_physics_app/Screen/formula_quiz_answer_screen.dart';
import 'package:flutter/material.dart';
import 'package:dse_physics_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:dse_physics_app/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'formula_quiz_info_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';

class FormulaQuizQuestionScreen extends StatelessWidget {
  static const String id = '/formulaQuizQuestionScreen';


  @override
  Widget build(BuildContext context) {

    if (Provider.of<FormulaProvider>(context, listen: false).questionNumberNoClearGetter % 5 == 0){
    AdHelper().showInterstitialAd();}
    Provider.of<FormulaProvider>(context, listen: false).randomQuestionSet();
    Provider.of<FormulaProvider>(context, listen: false).randomOptionSet();
    Provider.of<FormulaProvider>(context, listen: false).setInitialAnswerBoxFocus();
    // Provider.of<FormulaQuizBrain>(context, listen: false).clearSelectedAnswer();

    print('Parent Rebuild');

    final providerNotListen = Provider.of<FormulaProvider>(context, listen: false);

    return Consumer<FormulaProvider>(
      builder: (context, formulaQuizBrain, child) {
        print('page consumer rebuild');
        bool isPortrait = MediaQuery
            .of(context)
            .orientation == Orientation.portrait;

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: Provider.of<ThemeProvider>(context, listen: true).darkModeSwitchState ?
          SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
          child: Scaffold(
          body: SafeArea(
            child: Stack(children: [
              Positioned(
                bottom: isPortrait ? 150.h : 0.2.sh, left: 0, right: 0,
              // (1.sw - 0.72.sw) / 2, //4 Option buttons
                child: SizedBox(
                  child: Column(children: [
                    FormQuizOptionButton(
                      option: formulaQuizBrain.randomOptionSetGetter[0].option,
                      optionMeaning: formulaQuizBrain.randomOptionSetGetter[0].optionMeaning,
                      onPressed: () {
                        if (formulaQuizBrain.answerBoxFocusGetter == answerBoxFocus.RightBox) {
                          formulaQuizBrain
                              .changeSelectedAnswer1(formulaQuizBrain.randomOptionSetGetter[0].option);
                        } else {
                          formulaQuizBrain
                              .changeSelectedAnswer2(formulaQuizBrain.randomOptionSetGetter[0].option);
                        }
                      },
                      isPortrait: isPortrait,
                    ),
                    FormQuizOptionButton(
                      option: formulaQuizBrain.randomOptionSetGetter[1].option,
                      optionMeaning: formulaQuizBrain.randomOptionSetGetter[1].optionMeaning,
                      onPressed: () {
                        if (formulaQuizBrain.answerBoxFocusGetter == answerBoxFocus.RightBox) {
                          formulaQuizBrain
                              .changeSelectedAnswer1(formulaQuizBrain.randomOptionSetGetter[1].option);
                        } else {
                          formulaQuizBrain
                              .changeSelectedAnswer2(formulaQuizBrain.randomOptionSetGetter[1].option);
                        }
                      },
                      isPortrait: isPortrait,
                    ),
                    FormQuizOptionButton(
                      option: formulaQuizBrain.randomOptionSetGetter[2].option,
                      optionMeaning: formulaQuizBrain.randomOptionSetGetter[2].optionMeaning,
                      onPressed: () {
                        if (formulaQuizBrain.answerBoxFocusGetter == answerBoxFocus.RightBox) {
                          formulaQuizBrain
                              .changeSelectedAnswer1(formulaQuizBrain.randomOptionSetGetter[2].option);
                        } else {
                          formulaQuizBrain
                              .changeSelectedAnswer2(formulaQuizBrain.randomOptionSetGetter[2].option);
                        }
                      },
                      isPortrait: isPortrait,
                    ),
                    FormQuizOptionButton(
                      option: formulaQuizBrain.randomOptionSetGetter[3].option,
                      optionMeaning: formulaQuizBrain.randomOptionSetGetter[3].optionMeaning,
                      onPressed: () {
                        if (formulaQuizBrain.answerBoxFocusGetter == answerBoxFocus.RightBox) {
                          formulaQuizBrain
                              .changeSelectedAnswer1(formulaQuizBrain.randomOptionSetGetter[3].option);
                        } else {
                          formulaQuizBrain
                              .changeSelectedAnswer2(formulaQuizBrain.randomOptionSetGetter[3].option);
                        }
                      },
                      isPortrait: isPortrait,
                    )
                  ]),
                ),
              ), //option buttons

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h, width: 1.sw),
                  Container(
                    height: isPortrait ? 50.h : 70.h,
                    width: 0.9.sw,
                    child: Align(
                      alignment: Alignment(-1, 0),
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.grassGreen,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.r),
                                  topRight: Radius.circular(15.r),
                                  bottomLeft: Radius.circular(15.r))),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(6.0.w, 6.h, 6.w, 6.h),
                              child: Text(
                                // 'Q3',
                                'Q${formulaQuizBrain.questionNumberGetter}',
                                style: kEquationTextStyle.copyWith(color: AppColors.lightMilk),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //question no. box
                  SizedBox(height: isPortrait ? 40.h : 20.h),
                  Container(
                    decoration:
                    BoxDecoration(color:
                    Provider.of<ThemeProvider>(context, listen: true).themeGetter == lightModeThemeData() ? AppColors.superLightMilk : darkModeThemeData().cardColor,
                    // AppColors.superLightMilk,
                        borderRadius: BorderRadius.circular(15.r)),
                    width: isPortrait ? 0.9.sw : 0.75.sw,
                    // height: 200,
                    child: Column(
                      children: [
                        SizedBox(height: isPortrait ? 10.h : 15.h),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0,0, 5),
                          child: Container(
                            width: 0.8.sw,
                            height: isPortrait ? 50.h : 0.05.sh,
                            child: AutoSizeText(formulaQuizBrain.questionSetGetter.description,
                                style: kMeaningTextStyle.copyWith(fontSize: isPortrait ? 20.sp : 40.h),
                                maxLines: 2,
                                textAlign: TextAlign.center),
                          ),
                        ),
                        // description
                        // SizedBox(height: 10.h),

                        Container(height: isPortrait ? 120.h : 0.13.sh, child: formulaQuizBrain.questionSetGetter.equationQ
                          // ReusableEquation(textLT1: 'M', boxLT: true, boxRT: true,
                          // boxRB: true, boxLB: false, lineRight: true, lineLeft: true,
                          //   textLT2: '\\pi', textRT1: 'E', textRT2: 'Em',
                          //   textLB1: 'Q',
                          //   textRB1: 'R',
                          //   textLB2: 'E', textRB2: 'Aer',
                          // )
                        ),
                        // equation question

                        formulaQuizBrain.questionSetGetter.moreInfoQ.isEmpty
                            ? SizedBox(
                          height: 35.h,
                          width: 45.w,)
                            : ExpandableContainer(content: FormulaQuizInfoScreen(), isPortrait: isPortrait,
                        backgroundColor: Provider.of<ThemeProvider>(context, listen: true).themeGetter == lightModeThemeData() ? AppColors.superLightMilk : darkModeThemeData().cardColor,
                        )
                        //more info expandable container
                      ],
                    ),
                  ),
                  //question equation sheet
                  SizedBox(height: 70.h),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:  EdgeInsets.only(bottom: 30.0.h),
                  child: StandardElevatedButton(
                    isPortrait: isPortrait ,
                    title: 'Submit Answer',
                    isDisabled: Provider.of<FormulaProvider>(context, listen: true).nullAnsBox(),
                    onPressed: () {
                      // final providerNotListen = Provider.of<FormulaQuizBrain>(context, listen: false);
                      print('nullAnsBox: ${providerNotListen.nullAnsBox()}');
                      if (providerNotListen.nullAnsBox()) {
                        return;
                      }
                      providerNotListen.addWrongQuestion(providerNotListen.questionSetGetter);
                      providerNotListen.resultCalculator();
                      providerNotListen.resetAnswerBoxFocus();

                      Navigator.popAndPushNamed(context, FormulaQuizAnswerScreen.id);
                    },
                  ),
                ),
              ),
            ]),
          ),
      ),
        ); },
    );
  }
}
