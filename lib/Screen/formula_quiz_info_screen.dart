import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:dse_physics_app/Brains/theme_helper.dart';
import 'package:dse_physics_app/Brains/theme_provider.dart';
import 'package:dse_physics_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormulaQuizInfoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormulaProvider>(
        context);
    bool isPortrait = MediaQuery
        .of(context)
        .orientation == Orientation.portrait;

      return Padding(
        padding: isPortrait ? EdgeInsets.fromLTRB(10.0.w, 10.h,10.w, 10.h) :
        EdgeInsets.fromLTRB(10.0.w, 15.h,10.w, 15.h),
        child: ListView.builder(
          itemExtent: isPortrait ? 38.h : 50.h,
          shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final longEq = Math.tex(provider.questionSetGetter.moreInfoQ[index], mathStyle: MathStyle.text,
              textStyle:
              kMoreInfoTextStyle.copyWith(fontSize:isPortrait ? 18.h : 35.h,
                  color: Provider.of<ThemeProvider>(context, listen: true).themeGetter == lightModeThemeData() ?
                  Colors.blueGrey : darkModeThemeData().primaryColorLight
              )
          );
          final breakResult = longEq.texBreak();
          final breakableEquation = Wrap(
            children: breakResult.parts,
          );

        return  Align(alignment: Alignment.topCenter,
            child: Container(width: 0.7.sw,
              child: FittedBox(fit: BoxFit.scaleDown, child: breakableEquation
              ),
            ),
            // dense: true,
        );
    },
    itemCount: provider.questionSetGetter.moreInfoQ.length,
    ),
      )

    ;

    // remove ! later!!!!!!!!!!!!!
  }
}
