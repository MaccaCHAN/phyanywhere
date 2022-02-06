import 'package:dse_physics_app/Brains/theme_helper.dart';
import 'package:dse_physics_app/Brains/theme_provider.dart';
import 'package:dse_physics_app/Components/my_checkbox_tile.dart';
import 'package:dse_physics_app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'equation_full_display.dart';
import 'formula_quiz_question_set.dart';

class StuffInEquationListViewBuilder extends StatelessWidget {
  final QSetListWithCheckState qList;
  final bool isPortrait;
  final BuildContext context;

  StuffInEquationListViewBuilder({required this.qList, required this.isPortrait, required this.context});

  @override
  Widget build(BuildContext context) {
    return _buildEquationList(qList);
  }

  Widget _buildEquationList(QSetListWithCheckState qSetList) {
    if (qSetList.children.isEmpty) {
      print('isEmpty');
      return Column(children: [
        Expanded(
          flex: 10,
          child: ListView.builder(
            itemCount: qSetList.questionSetList.length,
            itemBuilder: (BuildContext context, int index) {
              FormulaQuizQuestionSet questionSet = qSetList.questionSetList[index];

              return EquationFullDisplay(
                questionSet: questionSet,
                isPortrait: this.isPortrait,
                context: this.context,
              );
            },
          ),
        ),
        Expanded(flex: 1, child: SizedBox())
      ]);
    } else {
      // print('new subTabBar');

      List<QSetListWithCheckState> newQSetList = [];
      for (QSetListWithCheckState x in qSetList.children) {
        if (x.selectAll != null) {
        } else {
          newQSetList.add(x);
        }
      }

      return DefaultTabController(
          length: newQSetList.length,
          child: Scaffold(
              appBar: AppBar(
                  backgroundColor:
                      Provider.of<ThemeProvider>(context, listen: true).themeGetter == lightModeThemeData()
                          ? AppColors.lessDeepBlue
                          : Theme.of(this.context).appBarTheme.foregroundColor,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 10.h,
                  bottom: PreferredSize(
                    preferredSize: this.isPortrait ? Size.fromHeight(35.0.h) : Size.fromHeight(45.0.h),
                    child: TabBar(
                      tabs: newQSetList
                          .map((x) => Text(x.title,
                              style: kTabBarTextStyle.copyWith(fontSize: this.isPortrait ? 16.h : 30.h)))
                          .toList(),
                      isScrollable: true,
                    ),
                  )),
              body: TabBarView(children: newQSetList.map(_buildEquationList).toList())));
    }
  }
}
