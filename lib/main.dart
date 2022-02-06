import 'package:dse_physics_app/Brains/auth_provider.dart';
import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:dse_physics_app/Screen/formula_quiz_answer_screen.dart';
import 'package:dse_physics_app/Screen/formula_quiz_result_screen.dart';
import 'package:dse_physics_app/Screen/formula_summary_screen.dart';
import 'package:dse_physics_app/Screen/intro_screen.dart';
import 'package:dse_physics_app/Screen/login_screen.dart';
import 'package:dse_physics_app/Screen/my_formula_list_screen.dart';
import 'package:dse_physics_app/Screen/topic_selection_screen.dart';
import 'package:dse_physics_app/Screen/update_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dse_physics_app/Screen/main_screen.dart';
import 'package:dse_physics_app/Screen/formula_quiz_question_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'Brains/ad_helper.dart';
import 'Brains/check_aspect_ratio.dart';
import 'Brains/enforced_update.dart';
import 'Brains/hive_helper.dart';
import 'Brains/notification_helper.dart';
import 'Brains/theme_provider.dart';
import 'Screen/test_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initNotification(); //init notification
  await scheduledNotification(); //start notification daily

  checkAspectRatioAndLockPortrait(); // check device aspect ratio, lock portrait for phones
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  print('CurrentUser is: ${FirebaseAuth.instance.currentUser}');
  // Compare currentVersion and enforcedVersion from firebase
  await checkAppVersion();
  await initHive();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FormulaProvider>(create: (context) => FormulaProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
        ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider()),
      ],
      child: ScreenUtilInit(
        designSize: Size(428, 926),
        builder: () => Consumer(
          builder: (BuildContext context, value, Widget? child) {
            Provider.of<ThemeProvider>(context, listen: false).checkHiveDarkMode();
            AdHelper().createInterstitialAd();

            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: Provider.of<ThemeProvider>(context, listen: true).themeGetter,
                initialRoute: FirebaseAuth.instance.currentUser == null ? IntroScreen.id : MainScreen.id,
                routes: {
                  MainScreen.id: (context) => MainScreen(),
                  TopicSelectionScreen.id: (context) => TopicSelectionScreen(),
                  FormulaQuizQuestionScreen.id: (context) => FormulaQuizQuestionScreen(),
                  FormulaQuizAnswerScreen.id: (context) => FormulaQuizAnswerScreen(),
                  FormulaQuizResultScreen.id: (context) => FormulaQuizResultScreen(),
                  FormulaSummaryScreen.id: (context) => FormulaSummaryScreen(),
                  TestScreen.id: (context) => TestScreen(),
                  MyFormulaListScreen.id: (context) => MyFormulaListScreen(),
                  LoginScreen.id: (context) => LoginScreen(),
                  UpdateScreen.id: (context) => UpdateScreen(),
                  IntroScreen.id: (context) => IntroScreen(),
                });
          },
        ),
      ),
    );
  }
}
