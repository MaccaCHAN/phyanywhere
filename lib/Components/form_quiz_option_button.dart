import 'package:dse_physics_app/Brains/theme_helper.dart';
import 'package:dse_physics_app/Brains/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:dse_physics_app/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:dse_physics_app/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';

class FormQuizOptionButton extends StatelessWidget {
  final void Function()? onPressed;
  final String option;
  final String? optionMeaning;
  final bool isPortrait;

  FormQuizOptionButton({required this.option, this.optionMeaning,
    required this.onPressed, this.isPortrait = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.isPortrait ? EdgeInsets.only(top: 4.0.h, bottom: 4.0.h) :
      EdgeInsets.only(top: 0.008.sh, bottom: 0.008.sh),
      child: Container(
        height: this.isPortrait ? 50.h: 0.07.sh,
        width: 0.75.sw,
        decoration: BoxDecoration(
          color: Provider.of<ThemeProvider>(context, listen: true).themeGetter == lightModeThemeData() ? AppColors.veryLightMilk : darkModeThemeData().cardColor ,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 4))],
        ), // Shadow position
        child: Material(
          color: Colors.white.withOpacity(0.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15.r),
            highlightColor: AppColors.deepBlue.withOpacity(0.3),
            splashColor: AppColors.grassGreen.withOpacity(0.5),
            onTap: this.onPressed,
            child: Container(
                child: Padding(
              padding: this.isPortrait ? EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.h) :
              EdgeInsets.only(left: 8.w, right: 8.w, top: 0.015.sh, bottom: 0.015.sh),
              child: this.optionMeaning == null
                  ? FittedBox(
                      alignment: Alignment.center,
                      fit: BoxFit.scaleDown,
                      child: Math.tex(
                        this.option,
                        // providerNotListen.randomOptionSetGetter[0].option,
                        textStyle: kEquationTextStyle.copyWith(fontSize: this.isPortrait ? 25.sp : 45.h),
                      ),
                    )
                  : Row(children: [
                      Expanded(
                        flex: 4,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Math.tex(
                            this.option,
                            // providerNotListen.randomOptionSetGetter[0].option,
                            textStyle: kEquationTextStyle.copyWith(fontSize: this.isPortrait ? 25.sp : 45.h),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(
                            ':',
                            style: kMeaningTextStyle.copyWith(fontSize: this.isPortrait ? 20.sp : 30.h ),
                          )),
                      Expanded(
                        flex: 14,
                        child: AutoSizeText(
                          // '  ${providerNotListen.randomOptionSetGetter[0]
                          //     .optionMeaning}'
                          this.optionMeaning!,
                          style: kMeaningTextStyle.copyWith(fontSize: this.isPortrait ? 20.sp : 45.h),
                          maxLines: 2,
                        ),
                      )
                    ]),
            )),
          ),
        ),
      ),
    );
  }
}
