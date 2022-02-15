import 'package:dse_physics_app/Components/formula_quiz_question_set.dart';

class QSetListWithCheckState {
  String title;
  List <QSetListWithCheckState> children;
  bool isChecked;
  bool checkAll;
  List <FormulaQuizQuestionSet> questionSetList;
  String? selectAll;
  QSetListWithCheckState({this.title = '', this.questionSetList = const <FormulaQuizQuestionSet> [],
    this.children = const <QSetListWithCheckState>[], this.isChecked = false,
    this.checkAll=false, this.selectAll});

  // factory QSetListWithCheckState.clone(QSetListWithCheckState source){
  //   return QSetListWithCheckState(title: source.title,
  //       questionSetList: source.questionSetList,
  //     children: source.children, isChecked: source.isChecked,
  //       checkAll: source.checkAll, selectAll: source.selectAll );
  // }

  void toggleIsChecked () {
    isChecked = !isChecked;
  }

}