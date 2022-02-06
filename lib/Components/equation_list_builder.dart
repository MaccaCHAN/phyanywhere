import 'package:dse_physics_app/Components/equation_full_display.dart';
import 'package:flutter/material.dart';
import 'formula_quiz_question_set.dart';

class EquationListViewBuilder extends StatelessWidget {

  final List<FormulaQuizQuestionSet> qSetList;
  final bool isPortrait;

  EquationListViewBuilder({required this.qSetList, this.isPortrait = true});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      FormulaQuizQuestionSet questionSet = this.qSetList[index] ;

      return EquationFullDisplay(questionSet: questionSet, isPortrait: this.isPortrait, context: context,);
    },
      itemCount: this.qSetList.length,
      shrinkWrap: true,
    );
  }
}
