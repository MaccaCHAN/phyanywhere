import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';

final Color defaultLightTextColor = AppColors.deepBlue;


ThemeData lightModeThemeData() {
  return ThemeData(
      primaryColor: AppColors.grassGreen,
      primarySwatch: Colors.blueGrey,
      scaffoldBackgroundColor: AppColors.lightMilk,
      backgroundColor: AppColors.veryLightMilk,
      fontFamily: GoogleFonts
          .nunito()
          .fontFamily,
      textTheme: TextTheme(
        headline1: TextStyle(color: defaultLightTextColor),
        headline2: TextStyle(color: defaultLightTextColor),
        headline3: TextStyle(color: defaultLightTextColor),
        headline4: TextStyle(color: defaultLightTextColor),
        headline5: TextStyle(color: defaultLightTextColor),
        headline6: TextStyle(color: defaultLightTextColor),
        subtitle1: TextStyle(color: defaultLightTextColor),
        subtitle2: TextStyle(color: defaultLightTextColor),
        caption: TextStyle(color: defaultLightTextColor),
        button: TextStyle(color: defaultLightTextColor),
        overline: TextStyle(color: defaultLightTextColor),
        bodyText1: TextStyle(color: defaultLightTextColor),
        bodyText2: TextStyle(color: defaultLightTextColor),
      ),
      appBarTheme: AppBarTheme(titleTextStyle: TextStyle(
          fontFamily: GoogleFonts
              .nunito()
              .fontFamily, fontSize: 26.h,
          fontWeight: FontWeight.bold,
          color: AppColors.superLightMilk),
          centerTitle: false,
          color: AppColors.greenBlue
      )

    // textTheme: TextTheme(bodyText2: TextStyle(fontFamily: 'AcuminVariableConcept', fontWeight: FontWeight.bold))
    // brightness: Brightness.light
  );
}

ThemeData darkModeThemeData() {
  return ThemeData.dark().copyWith(
      backgroundColor: Color(0xFF1a1a1a),
      scaffoldBackgroundColor: Color(0xFF212121),
      cardColor: Color(0xFF262626)


  );}