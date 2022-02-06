import 'package:auto_size_text/auto_size_text.dart';
import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:dse_physics_app/Brains/theme_provider.dart';
import 'package:dse_physics_app/Brains/url_launch_helper.dart';
import 'package:dse_physics_app/Components/square_icon_button.dart';
import 'package:dse_physics_app/Screen/formula_summary_screen.dart';
import 'package:dse_physics_app/Screen/my_formula_list_screen.dart';
import 'package:dse_physics_app/Screen/topic_selection_screen.dart';
import 'package:dse_physics_app/Version/enforced_version.dart';
import 'package:dse_physics_app/app_colors.dart';
import 'package:dse_physics_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';
import 'package:flutter/services.dart';



final List<bool> isFavouriteHeat = [];

class MainScreen extends StatelessWidget {
  static const String id = '/MainScreen';

  @override
  Widget build(BuildContext context) {
    print('width: ${MediaQuery.of(context).size.width}');
    print('height: ${MediaQuery.of(context).size.height}');


    double screenWidth = MediaQuery.of(context).size.width;
    double sidePadding = screenWidth / 13;
    print('parent built');
    // print('current user: ${FirebaseAuth.instance.currentUser!.displayName}');

    Provider.of<FormulaProvider>(
        context, listen: false).updateMyFormulaMap();

    final appcastURL =
        'https://raw.githubusercontent.com/MaccaCHAN/appcastForPhysicsAnywhere/main/phyAnywhereAppcast.xml';
    final cfg = AppcastConfiguration(url: appcastURL, supportedOS: ['android']);


    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: Provider.of<ThemeProvider>(context, listen: true).darkModeSwitchState ?
          SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
          child: SafeArea(
            bottom: false,
            child:
                // if need update, then wrap with UpgradeAlert
            isNeedsUpdate ?
            UpgradeAlert(
              appcastConfig: cfg,
              shouldPopScope: () => false,
              debugLogging: true,
              // debugAlwaysUpgrade: true,
              canDismissDialog: false,
              showIgnore: false,
              showLater: false,
              durationToAlertAgain: Duration(microseconds: 0),
              child: MainScreenUI(sidePadding: sidePadding) ,
            ) : MainScreenUI(sidePadding: sidePadding),
          ),
        ));
  }
}

class MainScreenUI extends StatelessWidget {

  final double sidePadding;

  MainScreenUI({required this.sidePadding});

  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery
        .of(context)
        .orientation == Orientation.portrait;

    return isPortrait ? PortraitLayout(sidePadding: this.sidePadding)
        : LandscapeLayout(sidePadding: this.sidePadding);
  }

}


class PortraitLayout extends StatelessWidget {

  final double sidePadding;

  PortraitLayout({required this.sidePadding});

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Expanded(
        flex: 1,
        child: Stack(
          children: [Center(
            child: Row(
              children: [
                Spacer(flex: 1),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                    child: Image(
                      image: AssetImage('images/phyanywhere_logo.png'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FittedBox(
                      child: Text(
                        'Study Physics\nAnywhere\nAnytime',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
          Align(alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                    context: context,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0))),
                      builder: (context) =>
                   FractionallySizedBox(
                     heightFactor: 0.75,

                     child: ListView(

                       children: ListTile.divideTiles(
                           context: context,
                           tiles: [
                         ListTile(title: SizedBox(height: 60.h,
                           child: Center(child: Text('Setting',
                               style: TextStyle(fontSize: 25.h, fontWeight: FontWeight.bold))),
                         ),),
                             ListTile(title: SizedBox(height: 40.h,
                               child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Expanded(flex: 3,
                                     child: Center(
                                       child: Text('Login Name :',
                                           style: TextStyle(fontSize: 20.h)),
                                     ),
                                   ),
                                   Expanded(flex: 4,
                                     child: AutoSizeText(
                                         FirebaseAuth.instance.currentUser == null ? '--' :
                                         FirebaseAuth.instance.currentUser!.isAnonymous ? 'Anonymous' :
                                         '${FirebaseAuth.instance.currentUser!.displayName}',
                                         textAlign: TextAlign.left,
                                         style: TextStyle(fontSize: 20.h, color: AppColors.lessDeepBlue)),
                                   ),
                                 ],
                               ),
                             ),),
                             //Login Name
                             ListTile(title: SizedBox(height: 40.h,
                               child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Expanded(flex: 3,
                                     child: Center(
                                       child: Text('Version :',
                                           style: TextStyle(fontSize: 20.h)),
                                     ),
                                   ),
                                   Expanded(flex: 4,
                                     child: AutoSizeText(
                                         '$currentAppVersion',
                                         textAlign: TextAlign.left,
                                         style: TextStyle(fontSize: 20.h, color: AppColors.lessDeepBlue)),
                                   ),
                                 ],
                               ),
                             ),),
                             //App Version
                             ListTile(title: SizedBox(height: 40.h,
                               child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Expanded(flex: 3,
                                     child: Center(
                                       child: Text('Dark Theme',
                                           style: TextStyle(fontSize: 20.h)),
                                     ),
                                   ),
                                   Expanded(flex: 4,
                                     child: Switch(onChanged: (bool value) {
                                       Provider.of<ThemeProvider>(context, listen: false).toggleDarkMode(value);
                                       print('switch state: ${Provider.of<ThemeProvider>(context, listen: false).darkModeSwitchState}');
                                       Navigator.pop(context);

                                     },
                                         value:  Provider.of<ThemeProvider>(context, listen: true).darkModeSwitchState),
                                   ),
                                 ],
                               ),
                             ),),
                             //Dark Theme
                             ListTile(title: GestureDetector(
                               onTap: ()async { try{
                                 await UrlLaunchHelper().launchInBrowser('https://docs.google.com/document/d/'
                                     '1Yc9EUPL8zX9tpgxdwHZwk9SSCxR1qOTN79JCkgLG8aM/edit');}
                               catch(e) {
                                 print('contact us error: ${e.toString()}');
                                 ScaffoldMessenger.of(context).showSnackBar
                                   (SnackBar(content:
                                 Text('Error: ${e.toString()}'),
                                   behavior: SnackBarBehavior.floating,
                                   duration: Duration(seconds: 2),
                                   backgroundColor: AppColors.greenBlue,
                                 ));
                               } },
                               child: SizedBox(height: 40.h, width: double.infinity,
                                 child: Center(child: Text('Privacy Policy',
                                     style: TextStyle(fontSize: 20.h))),
                               ),
                             ),),
                             //Privacy Policy
                             ListTile(title: GestureDetector(
                               onTap: ()async { try{
                                 await UrlLaunchHelper().launchInBrowser('mailto:chanandrex64@gmail.com');}
                               catch(e) {
                                 print('contact us error: ${e.toString()}');
                                ScaffoldMessenger.of(context).showSnackBar
                                (SnackBar(content:
                                Text('Error: ${e.toString()}'),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 2),
                                backgroundColor: AppColors.greenBlue,
                                ));
                                } },
                               child: SizedBox(height: 40.h, width: double.infinity,
                                 child: Center(child: Text('Contact us',
                                     style: TextStyle(fontSize: 20.h))),
                               ),
                             ),),
                           ] ).toList()
                     ),
                   ),

                  );
                  },
                child: Padding(
                  padding: EdgeInsets.all(0.02.sw),
                  child: Icon(Icons.menu, size: 30.h,),
                ),
              ))
          ]
        ),
      ),
      Expanded(
        flex: 3,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              // AppColors.lightMilk,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: this.sidePadding),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: SquareIconButton(
                                title: 'Formula Summary',
                                iconImage: Image(image: AssetImage('images/revision_logo.png')),
                                onPressed: () {
                                  Navigator.pushNamed(context, FormulaSummaryScreen.id);
                                }),
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: SquareIconButton(
                                title: 'Formula Quiz',
                                iconImage: Image(image: AssetImage('images/quiz_logo.png')),
                                onPressed: () {
                                  Navigator.pushNamed(context, TopicSelectionScreen.id);
                                },
                              )),
                        ),
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: SquareIconButton(
                                title: 'My Formula List',
                                iconImage: FittedBox(fit: BoxFit.fill,
                                    child: Center(child: FaIcon(FontAwesomeIcons.star))),
                                // Image(image: AssetImage('images/revision_logo.png')),
                                onPressed: () {
                                  Navigator.pushNamed(context, MyFormulaListScreen.id);
                                }),
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: SquareIconButton(
                                title: 'MC Exercise',
                                iconImage: Image(image: AssetImage('images/quiz_logo.png')),
                                onPressed: () {
                                  showDialog(context: context,
                                      builder: (_) => AlertDialog(title: Text('Coming Soon!')));
                                },
                              )),
                        ),
                      ),

                      Spacer(flex: 1),

                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
  }
}

class LandscapeLayout extends StatelessWidget {

  final double sidePadding;

  LandscapeLayout({required this.sidePadding});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Stack(
            children : [Center(
              child: Row(
                children: [
                  Spacer(flex: 5),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                      child: Image(
                        image: AssetImage('images/phyanywhere_logo.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FittedBox(
                        child: Text(
                          'Study Physics\nAnywhere\nAnytime',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 5),
                ],
              ),
            ),
              Align(alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: (){
                      showModalBottomSheet(context: context,
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0))),
                        builder: (context) =>
                          FractionallySizedBox(
                            heightFactor: 0.75,
                            child: ListView(
                                children: ListTile.divideTiles(
                                    context: context,
                                    tiles: [
                                      ListTile(title: SizedBox(height: 60.h,
                                        child: Center(child: Text('Setting',
                                            style: TextStyle(fontSize: 25.h, fontWeight: FontWeight.bold))),
                                      ),),
                                      ListTile(title: SizedBox(height: 40.h,
                                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(flex: 3,
                                              child: Center(
                                                child: Text('Login Name :',
                                                    style: TextStyle(fontSize: 20.h)),
                                              ),
                                            ),
                                            Expanded(flex: 4,
                                              child: AutoSizeText(
                                                  FirebaseAuth.instance.currentUser == null ? '--' :
                                                  FirebaseAuth.instance.currentUser!.isAnonymous ? 'Anonymous' :
                                                  '${FirebaseAuth.instance.currentUser!.displayName}',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 20.h, color: AppColors.lessDeepBlue)),
                                            ),
                                          ],
                                        ),
                                      ),),
                                      //Login Name
                                      ListTile(title: SizedBox(height: 40.h,
                                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(flex: 3,
                                              child: Center(
                                                child: Text('Version :',
                                                    style: TextStyle(fontSize: 20.h)),
                                              ),
                                            ),
                                            Expanded(flex: 4,
                                              child: AutoSizeText(
                                                  '$currentAppVersion',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(fontSize: 20.h, color: AppColors.lessDeepBlue)),
                                            ),
                                          ],
                                        ),
                                      ),),
                                      //App Version
                                      ListTile(title: SizedBox(height: 40.h,
                                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(flex: 3,
                                              child: Center(
                                                child: Text('Dark Theme',
                                                    style: TextStyle(fontSize: 20.h)),
                                              ),
                                            ),
                                            Expanded(flex: 4,
                                              child: Switch(onChanged: (bool value) {
                                                Provider.of<ThemeProvider>(context, listen: false).toggleDarkMode(value);
                                                Navigator.pop(context);
                                                print('switch state: ${Provider.of<ThemeProvider>(context, listen: false).darkModeSwitchState}');

                                              },
                                                  value:  Provider.of<ThemeProvider>(context, listen: true).darkModeSwitchState),
                                            ),
                                          ],
                                        ),
                                      ),),
                                      //Dark Theme
                                      ListTile(title: GestureDetector(
                                        onTap: ()async { try{
                                          await UrlLaunchHelper().launchInBrowser('https://docs.google.com/document/d/'
                                              '1Yc9EUPL8zX9tpgxdwHZwk9SSCxR1qOTN79JCkgLG8aM/edit');}
                                        catch(e) {
                                          print('contact us error: ${e.toString()}');
                                          ScaffoldMessenger.of(context).showSnackBar
                                            (SnackBar(content:
                                          Text('Error: ${e.toString()}'),
                                            behavior: SnackBarBehavior.floating,
                                            duration: Duration(seconds: 2),
                                            backgroundColor: AppColors.greenBlue,
                                          ));
                                        } },
                                        child: SizedBox(height: 40.h, width: double.infinity,
                                          child: Center(child: Text('Privacy Policy',
                                              style: TextStyle(fontSize: 20.h))),
                                        ),
                                      ),),
                                      //Privacy Policy
                                      ListTile(title: GestureDetector(
                                        onTap: ()async { try{
                                          await UrlLaunchHelper().launchInBrowser('mailto:chanandrex64@gmail.com');}
                                        catch(e) {
                                          print('contact us error: ${e.toString()}');
                                          ScaffoldMessenger.of(context).showSnackBar
                                            (SnackBar(content:
                                          Text('Error: ${e.toString()}'),
                                            behavior: SnackBarBehavior.floating,
                                            duration: Duration(seconds: 2),
                                            backgroundColor: AppColors.greenBlue,
                                          ));
                                        } },
                                        child: SizedBox(height: 40.h, width: double.infinity,
                                          child: Center(child: Text('Contact us',
                                              style: TextStyle(fontSize: 20.h))),
                                        ),
                                      ),),
                                    ] ).toList()
                            ),
                          ),

                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 0.02.sw),
                      child: Icon(Icons.menu, size: 40.h,),
                    ),
                  ))
            ]
          ),
        ),
        Expanded(
          flex: 5,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: SquareIconButton(
                                title: 'Formula Summary',
                                iconImage: Image(image: AssetImage('images/revision_logo.png')),
                                onPressed: () {
                                  Navigator.pushNamed(context, FormulaSummaryScreen.id);
                                }),
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: SquareIconButton(
                                title: 'My Formula List',
                                iconImage: FittedBox(fit: BoxFit.fill,
                                    child: Center(child: FaIcon(FontAwesomeIcons.star))),
                                // Image(image: AssetImage('images/revision_logo.png')),
                                onPressed: () {
                                  Navigator.pushNamed(context, MyFormulaListScreen.id);
                                }),
                          ),
                        ),
                      ),

                      Spacer(flex: 1),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: SquareIconButton(
                                title: 'Formula Quiz',
                                iconImage: Image(image: AssetImage('images/quiz_logo.png')),
                                onPressed: () {
                                  Navigator.pushNamed(context, TopicSelectionScreen.id);
                                },
                              )),
                        ),
                      ),
                      Spacer(flex: 1),
                      Expanded(
                        flex: 5,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: SquareIconButton(
                                title: 'MC Exercise',
                                iconImage: Image(image: AssetImage('images/quiz_logo.png')),
                                onPressed: () {
                                  showDialog(context: context,
                                      builder: (_) => AlertDialog(title: Text('Coming Soon!')));
                                  // Navigator.pushNamed(context, TestScreen.id);
                                  // Navigator.pushNamed(context, UpdateScreen.id);

                                  // Provider.of<FormulaQuizBrain>(
                                  //     context, listen: false).updateMyFormulaMap();

                                  // print('box isEmpty ${Hive.box<List>('myFormulaId').isEmpty}');
                                  // print( Provider.of<FormulaQuizBrain>(
                                  //     context, listen: false).completeFormulaMap);
                                  // print( Provider.of<FormulaQuizBrain>(
                                  //     context, listen: false).completeFormulaMap.length);
                                  // Navigator.pushNamed(context, MyFormulaListScreen.id);
                                },
                              )),
                        ),
                      ),

                      Spacer(flex: 1),

                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}