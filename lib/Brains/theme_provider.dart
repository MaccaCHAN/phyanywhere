import 'package:dse_physics_app/Brains/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeProvider extends ChangeNotifier {


  // bool _isDark = true;
// CurrentTheme currentTheme = CurrentTheme.light;

  var box = Hive.box<bool>('isDarkMode');



void checkHiveDarkMode () {

  if (box.values.isEmpty )
    {box.put('isDarkMode', false );} // if first time, put isDarkMode, true in the box
  print('Hive box isDarkMode: ${box.get('isDarkMode')}');
}

// CurrentTheme.dark;

// final bool isDark = true;
// = themeGetter == darkModeThemeData();

// Link it with local storage

  // void updateIsDarkMode () {
  //   var box = Hive.box<bool>('isDarkMode');
  //   box.put('darkMode', isDark);
  // }


ThemeData get themeGetter {
  if (box.get('isDarkMode')! ) {
    return darkModeThemeData();
  } else {
    return lightModeThemeData();
  }
}

  void toggleDarkMode (bool isDarkTheme) {
    box.put('isDarkMode', isDarkTheme);
    // currentTheme = isDarkTheme ? CurrentTheme.dark :
    // CurrentTheme.light;
    print('toggle dark mode : ${box.get('isDarkMode')}');

    notifyListeners();
  }

  // bool darkModeSwitchState = currentTheme == CurrentTheme.dark ;

  bool get darkModeSwitchState {
    return box.get('isDarkMode')!;

    //   currentTheme == CurrentTheme.dark ?
    // true : false;
  }







}