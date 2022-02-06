import 'package:dse_physics_app/Brains/ad_helper.dart';
import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:dse_physics_app/Components/formula_quiz_result.dart';
import 'package:dse_physics_app/Components/standard_elevated_button.dart';
import 'package:dse_physics_app/Screen/main_screen.dart';
import 'package:dse_physics_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../app_colors.dart';
import 'fomula_quiz_wrong_ans_screen.dart';


class FormulaQuizResultScreen extends StatelessWidget {

  static const String id = '/FormulaQuizResultScreen';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormulaProvider>(
        context);
    // final providerNotListen = Provider.of<FormulaProvider>(
    //     context, listen: false);
    final FormulaQuizResult result = provider.resultGetter;
    bool isPortrait = MediaQuery
        .of(context)
        .orientation == Orientation.portrait;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50.h, width: double.infinity),

              Text('Your result is:', style: kEquationTextStyle,),

              SizedBox(height: isPortrait ? 50.h : 20.h, width: double.infinity),


              Text('${result.correctPercent}%', style: kScoreTextStyle.copyWith(
                  color:  AppColors.deepBlue )),

              SizedBox(height: isPortrait ? 70.h : 20.h),

              SizedBox(height: 250.h, width: double.infinity,
                child: PieChart(PieChartData(
                    centerSpaceRadius: 30,
                    sections: [
                      PieChartSectionData(title: 'Incorrect\n${result.wrongPercent}% (${result.wrongNum})',
                          titleStyle: TextStyle(
                              color: Colors.white, fontSize: 19.h, fontWeight: FontWeight.bold,
                              shadows: [ Shadow(
                            color: AppColors.deepBlue.withOpacity(1),
                            offset: Offset(1, 1),
                            blurRadius: 2.r,
                          ),
                          ])
                          ,
                          value: result.wrongPercent.toDouble(),
                          radius: 100.h,
                          color: AppColors.paleRed),
                      PieChartSectionData(title: 'Correct\n${result.correctPercent}% (${result.correctNum})',
                          titleStyle: TextStyle(
                              color: Colors.white, fontSize: 19.h, fontWeight: FontWeight.bold, shadows: [ Shadow(
                            color: Colors.blue.shade900.withOpacity(1),
                            offset: Offset(1, 1),
                            blurRadius: 2.r,
                          ),
                          ],
                          ),
                          value: result.correctPercent.toDouble(),
                          radius: 100.h,
                          color: AppColors.grassGreen)
                    ])),
              ),
              //pie chart
              SizedBox(height: isPortrait ? 50.h : 0.h),


              // Container(child: Math.tex(provider.formulaQuizResultGetter, textStyle: kEquationTextStyle,)),


              Expanded(
                child: Column( mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    provider.wrongQuestionSetList.isNotEmpty ?
                    StandardElevatedButton(title: "See what's wrong",
                      isDisabled: false,
                      isPortrait: isPortrait,
                      onPressed: () {
                      //show ad
                      AdHelper().showInterstitialAd();

                      showModalBottomSheet(context: context,
                          builder: (context) => isPortrait ? FormulaQuizWrongAnsScreen() :
                          FractionallySizedBox(
                              heightFactor: 0.9,
                              child: FormulaQuizWrongAnsScreen()),
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          isScrollControlled: isPortrait ? false : true,
                          // barrierColor: AppColors.lightMilk,
                          shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0)))
                      );
                    },) : SizedBox(),
                    SizedBox(height: isPortrait ? 0 :20.h),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 30.0.h),
                      child: StandardElevatedButton(title: 'Return to Menu', isDisabled: false,
                        onPressed: () {
                        provider.resetFormulaQuiz();
                        Navigator.popAndPushNamed(context, MainScreen.id);
                      },
                      isPortrait: isPortrait,
                      ),
                    ),
                  ],
                ),
              ),
            ],),
        ),
      ),

    );
  }
}
