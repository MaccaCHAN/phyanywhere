import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:dse_physics_app/Components/equation_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormulaQuizWrongAnsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormulaProvider>(context);
    bool isPortrait = MediaQuery
        .of(context)
        .orientation == Orientation.portrait;
    return SafeArea(
      child:
      // StuffInEquationListViewBuilder(qList: provider.wrongQuestionSetList),
      EquationListViewBuilder(qSetList: provider.wrongQuestionSetList,
      isPortrait: isPortrait,
      ),
    );
  }
}
