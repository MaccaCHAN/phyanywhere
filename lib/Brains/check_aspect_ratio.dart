import 'package:flutter/services.dart';
import 'dart:ui';



void checkAspectRatioAndLockPortrait () {
  double screenWidth = window.physicalSize.shortestSide;
  double screenHeight = window.physicalSize.longestSide;
  double deviceAspectRatio = screenHeight / screenWidth ;
  print('window.physicalSize.shortestSide : ${window.physicalSize.shortestSide}');
  print('window.physicalSize.longestSide : ${window.physicalSize.longestSide}');
  print('window.deviceAspectRatio : $deviceAspectRatio');
  if (deviceAspectRatio > 1.8) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);}
}

bool isTabletSize() {
  double screenHeight = window.physicalSize.longestSide;

  // print('window.deviceAspectRatio : $deviceAspectRatio');
  bool isTab;
  if (screenHeight > 2000) {
    isTab = true;} else {
    isTab = false;
  }
  return isTab;
}