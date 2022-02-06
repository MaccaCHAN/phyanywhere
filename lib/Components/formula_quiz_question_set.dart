import 'package:dse_physics_app/Components/reusable_equation.dart';

class FormulaQuizQuestionSet {

  ReusableEquation equationQ;
  String correctAnswer1;
  String? correctAnswer2;
  String option1;
  String? option1Meaning;
  String option2;
  String? option2Meaning;
  String option3;
  String? option3Meaning;
  String option4;
  String? option4Meaning;
  String correctEquation;
  String description;
  List<String> moreInfoQ = [];
  List<String> moreInfoCorrectEq = [];
  bool twoWayAns;
  String id;
  // bool isFavourite;


  FormulaQuizQuestionSet(
      {required this.description,
        required this.equationQ,
        required this.correctEquation,
        required this.moreInfoCorrectEq,
        required this.correctAnswer1,
        this.correctAnswer2,
        required this.option1, this.option1Meaning,
        required this.option2, this.option2Meaning,
        required this.option3, this.option3Meaning,
        required this.option4, this.option4Meaning,
       required this.moreInfoQ, this.twoWayAns = false,
        required this.id
      // this.isFavourite = false
      });

}