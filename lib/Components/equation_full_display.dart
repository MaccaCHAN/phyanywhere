import 'package:auto_size_text/auto_size_text.dart';
import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:dse_physics_app/Brains/theme_helper.dart';
import 'package:dse_physics_app/Brains/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_colors.dart';
import '../constants.dart';
import 'expandable_container.dart';
import 'formula_quiz_question_set.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:provider/provider.dart';

class EquationFullDisplay extends StatelessWidget {
  final FormulaQuizQuestionSet questionSet;
  final bool isPortrait;
  final BuildContext context;

  EquationFullDisplay({required this.questionSet, required this.isPortrait, required this.context});

  @override
  Widget build(BuildContext context) {
     final formulaProviderNotListen = Provider.of<FormulaProvider>(context, listen: false);
     // final formulaProvider = Provider.of<FormulaProvider>(context, listen: true);

     print('equation full display rebuilt');
    return Padding(
      padding: EdgeInsets.only(top: this.isPortrait ? 10.h : 30.h),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 0.9.sw,
          decoration:
          BoxDecoration(color: Provider.of<ThemeProvider>(context, listen: true).themeGetter == lightModeThemeData() ? AppColors.veryLightMilk :
          Theme.of(this.context).cardColor
              , borderRadius: BorderRadius.circular(15.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(this.isPortrait? 10.0.h : 30.h ),
                child: SizedBox(
                  width: 0.8.sw,
                  child: AutoSizeText(questionSet.description,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: this.isPortrait ? kMeaningTextStyle.copyWith(fontSize: 16.h)
                          : kMeaningTextStyle.copyWith(fontSize: 30.h)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: this.isPortrait ? 5.0.h: 15.h,
                    bottom: this.isPortrait ? 10.h: 30.h),
                child: Math.tex(
                  questionSet.correctEquation,
                  textStyle: kEquationTextStyle.copyWith(fontSize:this.isPortrait ?  30.h: 50.h)
                ),
              ),
               Stack(fit: StackFit.loose,
                    clipBehavior: Clip.antiAlias,
                    children:  [
                      Positioned(
                        right: 13.w,
                        child:
                        // Icon(Icons.access_alarm, size: this.isPortrait ? 30.h: 100.h)
                        StarButton(
                          key: UniqueKey(),
                          iconSize:  this.isPortrait ? isTabAspectRatio ?  60 :  35.h: 70,
                          isStarred: formulaProviderNotListen.myFormulaMap.containsKey(questionSet.id),
                          valueChanged: (_isFavorite) {
                            _isFavorite ? formulaProviderNotListen.myFormulaMap[questionSet.id]=questionSet: //add Qset into MyFormulaMap if Starred
                            formulaProviderNotListen.myFormulaMap.remove(questionSet.id); //remove Qset from MyFormulaMap if Unstarred
                            formulaProviderNotListen.updateInMyFormulaIdListFromMap(); //update myFormulatIDList
                            print('MyFormulaMap = ${formulaProviderNotListen.myFormulaMap}');
                            ScaffoldMessenger.of(context).showSnackBar
                              (SnackBar(content: _isFavorite ?
                                  Text('Formula is added to <My Formula List>')
                                : Text('Formula is removed from <My Formula List>'),
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(seconds: 1),
                              backgroundColor: AppColors.greenBlue,
                            ));
                            // print('MyFormulaMap contains  ${Provider.of<FormulaQuizBrain>(
                            //     context, listen: false).myFormulaMap.containsKey(questionSet.id)}');

                          },)
                      ),
                      questionSet.moreInfoCorrectEq.isEmpty
                          ? SizedBox(height: this.isPortrait ? 40.h : 90.h, width: MediaQuery.of(context).size.width)
                          : ExpandableContainer(
                        isPortrait: this.isPortrait,
                      backgroundColor: Colors.transparent,
                      content: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(top: this.isPortrait ? 10.0.h : 18.h,
                                bottom: this.isPortrait ? 10.0.h : 18.h),
                            child: Align(
                                alignment: Alignment.center,
                                child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Math.tex(questionSet.moreInfoCorrectEq[index],
                                        textStyle: kMoreInfoTextStyle.copyWith(fontSize:this.isPortrait ? 20.h : 28.h,
                                            color: Provider.of<ThemeProvider>(context, listen: true).themeGetter == lightModeThemeData() ?
                                            Colors.blueGrey : darkModeThemeData().primaryColorLight
                                        )
                                    )
                                )
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: questionSet.moreInfoCorrectEq.length,
                      ),
                    ),]
                  )
            ],
          ),
        ),
      ),
    );
  }
}