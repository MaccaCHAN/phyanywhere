import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';


double _screenWidth = window.physicalSize.shortestSide;
double _screenHeight = window.physicalSize.longestSide;
double _deviceAspectRatio = _screenHeight / _screenWidth ;

bool isTabAspectRatio = _deviceAspectRatio < 1.8 ;

late final String currentAppVersion;



 TextStyle kEquationTextStyle = TextStyle(
  fontSize: 25.0.sp );

TextStyle kScoreTextStyle = TextStyle(fontSize: 45.0.sp,
    color: AppColors.deepBlue, fontWeight: FontWeight.bold
);

TextStyle kAppBarTextStyle = TextStyle(fontSize: 26.0.sp,
);

TextStyle kTabBarTextStyle = TextStyle(fontSize: 14.0.sp, color: AppColors.lightMilk
);

TextStyle kMoreInfoTextStyle = TextStyle(fontSize: 18.0.sp, color: Colors.blueGrey
    // darkModeThemeData().primaryColorLight
);

TextStyle kEquationAnsTextStyle = TextStyle(fontSize: 25.0.sp,
);

 TextStyle kMeaningTextStyle = TextStyle(fontSize: 20.0.sp,
);

 TextStyle kSelectAllTextStyle = TextStyle(fontSize: 20.0.sp,
);

 TextStyle kButtonTextStyle = TextStyle(fontSize: 23.sp,
    color: AppColors.veryLightMilk
);

