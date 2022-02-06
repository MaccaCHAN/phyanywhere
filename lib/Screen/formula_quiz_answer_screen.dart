import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:dse_physics_app/Components/equation_full_display.dart';
import 'package:dse_physics_app/Components/standard_elevated_button.dart';
import 'package:dse_physics_app/Screen/formula_quiz_question_screen.dart';
import 'package:dse_physics_app/Screen/formula_quiz_result_screen.dart';
import 'package:dse_physics_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../app_colors.dart';

class FormulaQuizAnswerScreen extends StatelessWidget {

  static const id = '/formulaQuizAnswerScreen';
  // late final String? result;
  //
  // FormulaQuizAnswerScreen(this.result);

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<FormulaProvider>(
    context);
    final providerNotListen = Provider.of<FormulaProvider>(
        context, listen: false);
    bool isPortrait = MediaQuery
        .of(context)
        .orientation == Orientation.portrait;

    String result = provider.checkAns() ? 'correct' : 'incorrect' ;

    return isPortrait ?
    PortraitLayout(providerNotListen: providerNotListen, result: result,
        provider: provider, isPortrait: isPortrait) :
    LandscapeLayout(providerNotListen: providerNotListen, result: result,
        provider: provider, isPortrait: isPortrait);
  }
}


class PortraitLayout extends StatelessWidget {
  const PortraitLayout({
    required this.providerNotListen,
    required this.result,
    required this.provider,
    required this.isPortrait,
  }) ;

  final FormulaProvider providerNotListen;
  final String result;
  final FormulaProvider provider;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.0.h),
                child: StandardElevatedButton(title: 'Next Question', isDisabled: false,
                  onPressed: ()  {
                    if (providerNotListen.quizEndCheck())
                    {  Navigator.popAndPushNamed(context, FormulaQuizResultScreen.id);}
                    else {
                        Navigator.popAndPushNamed(context, FormulaQuizQuestionScreen.id);
                       providerNotListen.upQuestionNumber();
                    }
                    providerNotListen.clearSelectedAnswer();

                  },),
              ),
            ),

            Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(alignment: Alignment.topRight,
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.popAndPushNamed(context, FormulaQuizResultScreen.id);
                        providerNotListen.clearSelectedAnswer();
                      }, style: ElevatedButton.styleFrom(primary: Colors.grey),
                      child: Text('End Quiz', style: TextStyle(fontSize: 18.h),))),
              // GestureDetector(onTap: () { Navigator.pop(context);},child: Icon(Icons.subdirectory_arrow_left_sharp)),
              SizedBox(height: 70.h),


              Center(child: Text('Your answer is $result !',
                style: kEquationTextStyle.copyWith(fontSize: 25.h),)),
              SizedBox(height: 40.h),

              FaIcon(
                result == 'correct' ? FontAwesomeIcons.smileWink : FontAwesomeIcons.sadTear,
                size: 70.h,
                color: result == 'correct' ? AppColors.grassGreen: Colors.redAccent),
              SizedBox(height: 40.h),

              EquationFullDisplay(questionSet: provider.questionSetGetter, isPortrait: isPortrait, context: context,),


            ],),]
        ),
      ),
    );
  }
}

class LandscapeLayout extends StatelessWidget {
  LandscapeLayout({
    required this.providerNotListen,
    required this.result,
    required this.provider,
    required this.isPortrait,
  }) ;

  final FormulaProvider providerNotListen;
  final FormulaProvider provider;
  final String result;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(alignment: Alignment.topRight,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.popAndPushNamed(context, FormulaQuizResultScreen.id);
                              providerNotListen.clearSelectedAnswer();
                            }, style: ElevatedButton.styleFrom(primary: Colors.grey),
                            child: Text('End Quiz', style: TextStyle(fontSize: 25.h),))),
                    // GestureDetector(onTap: () { Navigator.pop(context);},child: Icon(Icons.subdirectory_arrow_left_sharp)),
                    SizedBox(height: 0.05.sw,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                            result == 'correct' ? FontAwesomeIcons.smileWink : FontAwesomeIcons.sadTear,
                            size: 100.h,
                            color: result == 'correct' ? AppColors.grassGreen: Colors.redAccent),
                        SizedBox(width: 0.05.sw,),
                        Center(child: Text('Your answer is $result !', style: kEquationTextStyle,)),
                      ],
                    ),
                    SizedBox(height: 0.05.sh),

                    // SizedBox(height: 10.h),

                    EquationFullDisplay(questionSet: provider.questionSetGetter, isPortrait: isPortrait, context: context,),

                    SizedBox(height: 0.15.sh,),

                    Padding(
                      padding: EdgeInsets.only(bottom: 30.0.h),
                      child: StandardElevatedButton(title: 'Next Question', isDisabled: false,
                        onPressed: ()  {
                          if (providerNotListen.quizEndCheck())
                          {  Navigator.popAndPushNamed(context, FormulaQuizResultScreen.id);}
                          else {
                            Navigator.popAndPushNamed(context, FormulaQuizQuestionScreen.id);
                            providerNotListen.upQuestionNumber();
                          }
                          providerNotListen.clearSelectedAnswer();

                        },
                          isPortrait: isPortrait,
                      ),
                    ),


                  ],),
        )
        ),
      );

  }
}

