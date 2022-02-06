import 'package:auto_size_text/auto_size_text.dart';
import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:dse_physics_app/Brains/theme_helper.dart';
import 'package:dse_physics_app/Brains/theme_provider.dart';
import 'package:dse_physics_app/Components/equation_list_builder.dart';
import 'package:dse_physics_app/Components/formula_quiz_question_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class MyFormulaListScreen extends StatefulWidget {

  static const id = '/MyFormulatListScreen';


  @override
  _MyFormulaListScreenState createState() => _MyFormulaListScreenState();
}

class _MyFormulaListScreenState extends State<MyFormulaListScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormulaProvider>(context, listen: false);
    // print('myFormulaList = ${provider.myFormulaList}');
    print('myFormulaMap = ${provider.myFormulaMap}');
    final bool isPortrait = ScreenUtil().orientation == Orientation.portrait;

    List<FormulaQuizQuestionSet> myList =
    provider.myFormulaMap.entries.map<FormulaQuizQuestionSet>((e) => e.value).toList();

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              child: Icon(Icons.arrow_back_ios),
              onTap: () {
                Navigator.pop(context);
                // provider.showInterstitialAd();
              }),
          title:
          Text('My Formula List', style: kAppBarTextStyle.copyWith(fontSize: isPortrait ? 26.h : 40.h)),
          actions: <Widget>[IconButton(icon: Icon(Icons.refresh), onPressed: () {
            setState(() {});
          },)],
        ),
        body: SafeArea(
          child: myList.isEmpty
              ? Padding(
            padding: EdgeInsets.fromLTRB(15.0.h, 15.0.h, 15.0.h, 0),
            child: Text(
              'No formula has been added yet. \n'
                  'You can click on the star '
                  "beside the formula in 'Formula Summary' to add it to your customized 'My Formula List' "
                  "for revision.",
              style: kMoreInfoTextStyle.copyWith(
                  fontSize: isPortrait ? 20.h : 30.h,
                  color: Provider.of<ThemeProvider>(context, listen: true).themeGetter ==
                      lightModeThemeData()
                      ? Colors.blueGrey
                      : darkModeThemeData().primaryColorLight),
              textAlign: TextAlign.justify,
            ),
          )
              : Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0.h, 15.0.h, 15.0.h, 10.0.h),
                    child: AutoSizeText(
                      "You can make your customized 'My Formula List' for revision.",
                      style: kMoreInfoTextStyle.copyWith(
                          fontSize: isPortrait ? 20.h : 30.h,
                          color: Provider.of<ThemeProvider>(context, listen: true).themeGetter ==
                              lightModeThemeData()
                              ? Colors.blueGrey
                              : darkModeThemeData().primaryColorLight),
                      textAlign: TextAlign.justify,
                    ),
                  )),
              Expanded(
                  flex: 10,
                  child: EquationListViewBuilder(
                    qSetList: myList,
                    isPortrait: isPortrait,
                  )),
              Expanded(flex: 1, child: SizedBox())
            ],
          ),
        ));
  }
}


//
// class MyFormulaListScreen extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<FormulaQuizBrain>(context, listen: false);
//     // print('myFormulaList = ${provider.myFormulaList}');
//     print('myFormulaMap = ${provider.myFormulaMap}');
//     final bool isPortrait = ScreenUtil().orientation == Orientation.portrait;
//
//     List<FormulaQuizQuestionSet> myList =
//         provider.myFormulaMap.entries.map<FormulaQuizQuestionSet>((e) => e.value).toList();
//
//     return Scaffold(
//         appBar: AppBar(
//           leading: GestureDetector(
//               child: Icon(Icons.arrow_back_ios),
//               onTap: () {
//                 Navigator.pop(context);
//                 // provider.showInterstitialAd();
//               }),
//           title:
//               Text('My Formula List', style: kAppBarTextStyle.copyWith(fontSize: isPortrait ? 26.h : 40.h)),
//           actions: <Widget>[IconButton(icon: Icon(Icons.refresh), onPressed: () {  },)],
//         ),
//         body: SafeArea(
//           child: myList.isEmpty
//               ? Padding(
//                   padding: EdgeInsets.fromLTRB(15.0.h, 15.0.h, 15.0.h, 0),
//                   child: Text(
//                     'No formula has been added yet. \n'
//                     'You can click on the star '
//                     "beside the formula in 'Formula Summary' to add it to your customized 'My Formula List' "
//                     "for revision.",
//                     style: kMoreInfoTextStyle.copyWith(
//                         fontSize: isPortrait ? 20.h : 30.h,
//                         color: Provider.of<ThemeProvider>(context, listen: true).themeGetter ==
//                                 lightModeThemeData()
//                             ? Colors.blueGrey
//                             : darkModeThemeData().primaryColorLight),
//                     textAlign: TextAlign.justify,
//                   ),
//                 )
//               : Column(
//                   children: [
//                     Expanded(
//                         flex: 1,
//                         child: Padding(
//                           padding: EdgeInsets.fromLTRB(10.0.h, 15.0.h, 15.0.h, 10.0.h),
//                           child: AutoSizeText(
//                             "You can make your customized 'My Formula List' for revision.",
//                             style: kMoreInfoTextStyle.copyWith(
//                                 fontSize: isPortrait ? 20.h : 30.h,
//                                 color: Provider.of<ThemeProvider>(context, listen: true).themeGetter ==
//                                         lightModeThemeData()
//                                     ? Colors.blueGrey
//                                     : darkModeThemeData().primaryColorLight),
//                             textAlign: TextAlign.justify,
//                           ),
//                         )),
//                     Expanded(
//                         flex: 10,
//                         child: EquationListViewBuilder(
//                           qSetList: myList,
//                           isPortrait: isPortrait,
//                         )),
//                     Expanded(flex: 1, child: SizedBox())
//                   ],
//                 ),
//         ));
//   }
// }
