import 'package:dse_physics_app/Components/formula_quiz_question_set.dart';
import 'package:dse_physics_app/Components/formula_quiz_result.dart';
import 'package:dse_physics_app/Components/option_set.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:dse_physics_app/QuestionBank/formulaQuestionBank.dart';
import 'package:dse_physics_app/Components/my_checkbox_tile.dart';
import 'package:hive/hive.dart';

enum answerBoxFocus { RightBox, LeftBox }

class FormulaProvider extends ChangeNotifier {
  String? _selectedAnswer1;
  String? _selectedAnswer2;
  late FormulaQuizQuestionSet _selectedQuestionSet;
  List<FormulaQuizQuestionSet> formulaQuizQuestionSetList = [];
  List<FormulaQuizQuestionSet> wrongQuestionSetList = [];
  List<OptionSet> _randomOptionSetList = [];
  bool selectAllisChecked = false;
  bool selectAllMechisChecked = false;
  bool selectAllEAndMisChecked = false;
  int _questionNumber = 1;
  int _correctNumber = 0;
  late FormulaQuizResult result;
  answerBoxFocus selectedAnswerBoxFocus = answerBoxFocus.LeftBox;

  // List<FormulaQuizQuestionSet> myFormulaList = [];
  Map<String, FormulaQuizQuestionSet> myFormulaMap = {};
  List<String> myFormulaIdList = [];
  Map<String, FormulaQuizQuestionSet> completeFormulaMap =
  {for (var x in heat) x.id : x ,
    for (var x in gases) x.id : x,
    for (var x in motionAndForce) x.id : x,
    for (var x in energy) x.id : x,
    for (var x in momentum) x.id : x,
    for (var x in circularMotion) x.id : x,
    for (var x in gravitation) x.id : x,
    for (var x in optics) x.id : x,
    for (var x in wave) x.id : x,
    for (var x in electrostatics) x.id : x,
    for (var x in circuit) x.id : x,
    for (var x in electromagnetism) x.id : x,
    for (var x in electInduction) x.id : x,
    for (var x in radioactivity) x.id : x,
  };


  // TOPIC SELECTION START ///////////////////////////////////

  List<QSetListWithCheckState> _topicsInMyTiles = [
    QSetListWithCheckState(title: 'Heat', questionSetList: heat),
    QSetListWithCheckState(title: 'Gases', questionSetList: gases),
    QSetListWithCheckState(title: 'Mechanics', children: <QSetListWithCheckState>[
      QSetListWithCheckState(title: 'Motion & Force', questionSetList: motionAndForce),
      QSetListWithCheckState(title: 'Energy', questionSetList: energy),
      QSetListWithCheckState(title: 'Momentum', questionSetList: momentum),
      QSetListWithCheckState(title: 'Uniform Circular Motion', questionSetList: circularMotion),
      QSetListWithCheckState(title: 'Gravitation', questionSetList: gravitation),
      QSetListWithCheckState(title: 'All of the above', selectAll: 'allMech')
    ]),
    QSetListWithCheckState(title: 'Optics', questionSetList: optics),
    QSetListWithCheckState(title: 'Wave', questionSetList: wave),
    QSetListWithCheckState(title: 'Electricity & Magnetism', children: <QSetListWithCheckState>[
      QSetListWithCheckState(title: 'Electrostatics', questionSetList: electrostatics),
      QSetListWithCheckState(title: 'Circuit', questionSetList: circuit),
      QSetListWithCheckState(title: 'Electromagnetism', questionSetList: electromagnetism),
      QSetListWithCheckState(title: 'Electromagnetic Induction', questionSetList: electInduction),
      QSetListWithCheckState(title: 'All of the above', selectAll: 'allE&M')
    ]),
    QSetListWithCheckState(title: 'Radioactivity', questionSetList: radioactivity),
    QSetListWithCheckState(title: 'Select All', selectAll: 'all')
  ];

  void checkAll() {
    for (QSetListWithCheckState x in _topicsInMyTiles) {
      if (x.children.isEmpty) {
        x.isChecked = true;
      } else {
        for (int y = 0; y < x.children.length; y++) x.children[y].isChecked = true;
      }
    } // check all boxes (turning all isChecked to true)
    for (QSetListWithCheckState x in _topicsInMyTiles) {
      if (x.children.isEmpty) {
        addTopic(x);
      } else {
        for (int y = 0; y < x.children.length; y++) {
          addTopic(x.children[y]);
        }
      }
    } // add all topics
    formulaQuizQuestionSetList = formulaQuizQuestionSetList.toSet().toList();
    notifyListeners();
    print(formulaQuizQuestionSetList.length);
  }

  void uncheckAll() {
    for (QSetListWithCheckState x in _topicsInMyTiles) {
      if (x.children.isEmpty) {
        x.isChecked = false;
      } else {
        for (int y = 0; y < x.children.length; y++) x.children[y].isChecked = false;
      } // uncheck all boxes (turning all isChecked to false)
    }
    for (QSetListWithCheckState x in _topicsInMyTiles) {
      if (x.children.isEmpty) {
        removeTopic(x);
      } else {
        for (int y = 0; y < x.children.length; y++) {
          removeTopic(x.children[y]);
        }
      }
    } // remove all topics (turning all isChecked to false)
    notifyListeners();
    print(formulaQuizQuestionSetList.length);
  }

  void checkAllMech() {
    QSetListWithCheckState? qSetListWithCheckState;
    for (QSetListWithCheckState x in _topicsInMyTiles){
      if (x.title == 'Mechanics'){
        qSetListWithCheckState = x;
      }
    }
    if(qSetListWithCheckState == null)
      return;
    for (QSetListWithCheckState x in qSetListWithCheckState.children) {
      x.isChecked = true;
    }
    for (QSetListWithCheckState x in qSetListWithCheckState.children) {
      addTopic(x);
    }
    formulaQuizQuestionSetList = formulaQuizQuestionSetList.toSet().toList();
    // formulaQuizQuestionSetList.remove(value)
    notifyListeners();
  }

  void uncheckAllMech() {
    QSetListWithCheckState? qSetListWithCheckState;
    for (QSetListWithCheckState x in _topicsInMyTiles){
      if (x.title == 'Mechanics'){
        qSetListWithCheckState = x;
      }
    }
    if(qSetListWithCheckState == null)
      return;
    for (QSetListWithCheckState x in qSetListWithCheckState.children) {
      x.isChecked = false;
    }
    for (QSetListWithCheckState x in qSetListWithCheckState.children) {
      removeTopic(x);
    }
    notifyListeners();
  }

  void checkAllEAndM() {
    QSetListWithCheckState? qSetListWithCheckState;
    for (QSetListWithCheckState x in _topicsInMyTiles){
      if (x.title == 'Electricity & Magnetism'){
        qSetListWithCheckState = x;
      }
    }
    if(qSetListWithCheckState == null)
      return;
    for (QSetListWithCheckState x in qSetListWithCheckState.children) {
      x.isChecked = true;
    }
    for (QSetListWithCheckState x in qSetListWithCheckState.children) {
      addTopic(x);
    }
    formulaQuizQuestionSetList = formulaQuizQuestionSetList.toSet().toList();
    // formulaQuizQuestionSetList.remove(value)
    notifyListeners();
  }

  void uncheckAllEAndM() {
    QSetListWithCheckState? qSetListWithCheckState;
    for (QSetListWithCheckState x in _topicsInMyTiles){
      if (x.title == 'Electricity & Magnetism'){
        qSetListWithCheckState = x;
      }
    }
    if(qSetListWithCheckState == null)
      return;
    for (QSetListWithCheckState x in qSetListWithCheckState.children) {
      x.isChecked = false;
    }
    for (QSetListWithCheckState x in qSetListWithCheckState.children) {
      removeTopic(x);
    }
    formulaQuizQuestionSetList = formulaQuizQuestionSetList.toSet().toList();
    // formulaQuizQuestionSetList.remove(value)
    notifyListeners();
  }

  void selectAllButtonsCheck() {
    List<bool> allButtonState = [];
    for (QSetListWithCheckState x in _topicsInMyTiles) {
      if (x.children.isEmpty) {
        allButtonState.add(x.isChecked);
      } else {
        for (int y = 0; y < x.children.length - 1; y++) {
          allButtonState.add(x.children[y].isChecked);
        }
      }
    }
    allButtonState.remove(_topicsInMyTiles.last.isChecked);
    if (allButtonState.every((x) => x == true)) {
      selectAllisChecked = true;
    } else {
      selectAllisChecked = false;
    } // check select all button

    List<bool> allMechButtonState = [];
    for (int y = 0; y < _topicsInMyTiles[2].children.length - 1; y++) {
      allMechButtonState.add(_topicsInMyTiles[2].children[y].isChecked);
    }
    if (allMechButtonState.every((x) => x == true)) {
      selectAllMechisChecked = true;
    } else {
      selectAllMechisChecked = false;
    } // check select all MECH button

    List<bool> allEAndMButtonState = [];
    for (int y = 0; y < _topicsInMyTiles[5].children.length - 1; y++) {
      allEAndMButtonState.add(_topicsInMyTiles[5].children[y].isChecked);
    }
    if (allEAndMButtonState.every((x) => x == true)) {
      selectAllEAndMisChecked = true;
    } else {
      selectAllEAndMisChecked = false;
    } // check select all E&M button

    print(
        'select all is $selectAllisChecked \n _topicsInMyTiles.last.isChecked = ${_topicsInMyTiles.last.isChecked}');
    notifyListeners();
  }

  get topicTileGetter {
    return _topicsInMyTiles;
  }

  void addTopic(QSetListWithCheckState thisTile) {
    formulaQuizQuestionSetList.addAll(thisTile.questionSetList);
    selectAllButtonsCheck();
    notifyListeners();
  }

  void removeTopic(QSetListWithCheckState thisTile) {
    for (FormulaQuizQuestionSet x in thisTile.questionSetList) formulaQuizQuestionSetList.remove(x);
    selectAllButtonsCheck();
    notifyListeners();
  }

  void addOrRemoveTopic(bool checkState, QSetListWithCheckState tile) {
    if (tile.selectAll == null) {
      // for non-selectALL button
      if (checkState) {
        addTopic(tile);
        printSelectedQuestionSet();
      } else {
        removeTopic(tile);
        printSelectedQuestionSet();
      }
    } else if (tile.selectAll == 'all') {
      // for selectAll button
      if (checkState) {
        checkAll();
        printSelectedQuestionSet();
      } else {
        uncheckAll();
      }
    } else if (tile.selectAll == 'allMech') {
      // for selectAll mechanics button
      if (checkState) {
        checkAllMech();
        printSelectedQuestionSet();
      } else {
        uncheckAllMech();
        printSelectedQuestionSet();
      }
    } else if (tile.selectAll == 'allE&M') {
      // for selectAll e&m button
      if (checkState) {
        checkAllEAndM();
        printSelectedQuestionSet();
      } else {
        uncheckAllEAndM();
        printSelectedQuestionSet();
      }
    }
  }

  // TOPIC SELECTION END ///////////////////////////////////

  // FORMULA QUIZ START //////

  void printSelectedQuestionSet() {
    print(formulaQuizQuestionSetList.length);
  }

  void inOrderQuestionSet() {
    _selectedQuestionSet = formulaQuizQuestionSetList[_questionNumber - 1];
  } // for testing

  void randomQuestionSet() {
    print('randomQuestionSet executed');
    _selectedQuestionSet =
        formulaQuizQuestionSetList[Random().nextInt(formulaQuizQuestionSetList.length)];
    formulaQuizQuestionSetList.remove(_selectedQuestionSet);
    print('no. of questions left: ${formulaQuizQuestionSetList.length}');
  }

  void changeSelectedAnswer1(String data) {
    _selectedAnswer1 = data;
    print('selected answer 1 is $_selectedAnswer1');
    notifyListeners();
  }

  void changeSelectedAnswer2(String data) {
    _selectedAnswer2 = data;
    print('selected answer 2 is $_selectedAnswer2');
    notifyListeners();
  }

  void setInitialAnswerBoxFocus() {
    if (_selectedQuestionSet.equationQ.boxLB || _selectedQuestionSet.equationQ.boxLT) {
      selectedAnswerBoxFocus = answerBoxFocus.LeftBox;
    } else {
      selectedAnswerBoxFocus = answerBoxFocus.RightBox;
    }
  }

  answerBoxFocus get answerBoxFocusGetter {
    return selectedAnswerBoxFocus;
  }

  void resetAnswerBoxFocus() {
    selectedAnswerBoxFocus = answerBoxFocus.RightBox;
    notifyListeners();
  }

  void setAnswerBoxFocusLeft() {
    selectedAnswerBoxFocus = answerBoxFocus.LeftBox;
    notifyListeners();
  }

  void setAnswerBoxFocusRight() {
    selectedAnswerBoxFocus = answerBoxFocus.RightBox;
    notifyListeners();
  }

  FormulaQuizQuestionSet get questionSetGetter {
    return _selectedQuestionSet;
  }

  String? get selectedAnswer1Getter {
    return _selectedAnswer1;
  }

  String? get selectedAnswer2Getter {
    return _selectedAnswer2;
  }

  String? get leftBoxSelectedAnswerGetter {
    if (hasAnswer2()) {
      return _selectedAnswer2;
    } else { return _selectedAnswer1; }
  }

  void clearSelectedAnswer() {
    _selectedAnswer1 = null;
    _selectedAnswer2 = null;
    // notifyListeners();
  }

  FormulaQuizResult get resultGetter {
    return result;
  }

  String get correctEquationGetter {
    return _selectedQuestionSet.correctEquation;
  }

  bool hasAnswer2() {
    if (_selectedQuestionSet.correctAnswer2 != null) {
      return true;
    } else {
      return false;
    }
  }

  bool nullAnsBox() {
    if (hasAnswer2() == false) {
      if (selectedAnswer1Getter == null) {
        return true;
      } else {
        return false;
      }
    } else {
      if (selectedAnswer1Getter == null || selectedAnswer2Getter == null) {
        return true;
      } else {
        return false;
      }
    }
  }

  bool leftAnsBoxFilled() {
     if (hasAnswer2()){
       if (selectedAnswer2Getter == null) {
         return false;
       } else {return true; }
     } else {
       if (selectedAnswer1Getter == null){
       return false;
     }  else {return true; }
     }
  }

  bool rightAnsBoxFilled() {
    if (selectedAnswer1Getter == null){
      return false;
    }  else {return true; }
  }

  bool checkAns() {
    bool result;
    // final provider = Provider.of<FormulaQuizBrain>(context, listen: false);
    if (hasAnswer2()) {
      if (!_selectedQuestionSet.twoWayAns) {
        selectedAnswer1Getter == _selectedQuestionSet.correctAnswer1 &&
                selectedAnswer2Getter == _selectedQuestionSet.correctAnswer2
            ? result = true
            : result = false;
      } else {
        (selectedAnswer1Getter == _selectedQuestionSet.correctAnswer1 &&
                    selectedAnswer2Getter == _selectedQuestionSet.correctAnswer2) ||
                (selectedAnswer1Getter == _selectedQuestionSet.correctAnswer2 &&
                    selectedAnswer2Getter == _selectedQuestionSet.correctAnswer1)
            ? result = true
            : result = false;
      }
    } else {
      selectedAnswer1Getter == _selectedQuestionSet.correctAnswer1 ? result = true : result = false;
    }
    return result;
  }

  bool checkQuestionListNull() {
    if (formulaQuizQuestionSetList.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void upQuestionNumber() {
    _questionNumber++;
    _questionNumberNoClear++;
    // notifyListeners();
  }

  void resultCalculator() {
    if (checkAns()) {
      _correctNumber++;
    }
    print('correct ans: $_correctNumber');
    // increase correct Number

    var correctPercent = (_correctNumber / _questionNumber) * 100;
    int correctPercentToInt = correctPercent.round();
    int wrongPercentToInt = 100 - correctPercentToInt;

    result = FormulaQuizResult(
        correctNum: _questionNumber - wrongQuestionSetList.length,
        wrongNum: wrongQuestionSetList.length,
        questionNum: _questionNumber,
        correctPercent: correctPercentToInt,
        wrongPercent: wrongPercentToInt); //Initialize/update FormulaQuizResult result
    print(
        'correctNum: ${result.correctNum}, wrongNum: ${result.wrongNum}, questionNum: ${result.questionNum},'
        'correctPercent: ${result.correctPercent}, wrongPercent: ${result.wrongPercent}');
    notifyListeners();
  }

  get questionNumberGetter {
    return _questionNumber;
  }

  int _questionNumberNoClear = 1;

  get questionNumberNoClearGetter {
    return _questionNumberNoClear;
  }

  bool quizEndCheck() {
    if (formulaQuizQuestionSetList.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  get formulaQuizResultGetter {
    String result = '\\frac {$_correctNumber}{$_questionNumber}';
    return result;
  }

  void resetFormulaQuiz() {
    _questionNumber = 1;
    _correctNumber = 0;
    formulaQuizQuestionSetList = [];
    wrongQuestionSetList = [];
    uncheckAll();
    print(
        'SUPER CLEAR: $_questionNumber, $_correctNumber, ${formulaQuizQuestionSetList.length}, ${wrongQuestionSetList.length}');
  }

  void addWrongQuestion(FormulaQuizQuestionSet wrongQSet) {
    if (!checkAns()) {
      wrongQuestionSetList.add(wrongQSet);
    }
    print('wrongQSet: ${wrongQuestionSetList.length}');
  }

  void randomOptionSet() {
    print('randomOptionSet executed');
    _randomOptionSetList = [
      OptionSet(
          option: _selectedQuestionSet.option1, optionMeaning: _selectedQuestionSet.option1Meaning),
      OptionSet(
          option: _selectedQuestionSet.option2, optionMeaning: _selectedQuestionSet.option2Meaning),
      OptionSet(
          option: _selectedQuestionSet.option3, optionMeaning: _selectedQuestionSet.option3Meaning),
      OptionSet(
          option: _selectedQuestionSet.option4, optionMeaning: _selectedQuestionSet.option4Meaning),
    ];
    _randomOptionSetList.shuffle();
  }

  get randomOptionSetGetter {
    return _randomOptionSetList;
  }

// FORMULA QUIZ END //////


 // MyFormulaList //
  void updateMyFormulaMap() {
    List list = Hive.box<String>('myFormulaId').values.toList();
    print('IDlist is empty? ${list.isEmpty}');
    print('box is empty? ${Hive.box<String>('myFormulaId').isEmpty}');
     if (list.isEmpty )
      return;
    for (String y in list) {
    var x = completeFormulaMap.entries.firstWhere((entry) => entry.key == y);
    myFormulaMap.addEntries([x]);}
    print('myFormulaMap is: $myFormulaMap');
  }
  void updateInMyFormulaIdListFromMap () async {
    myFormulaIdList = myFormulaMap.entries.map<String>((x) => x.key).toList();
    myFormulaIdList = myFormulaIdList.toSet().toList();
    await Hive.box<String>('myFormulaId').clear();
    print('After CLEAR, box is: ${Hive.box<String>('myFormulaId').values}');
    for (String x in myFormulaIdList) {
    Hive.box<String>('myFormulaId').add(x);}
    print('After ADD, box is: ${Hive.box<String>('myFormulaId').values}');
    print('myFormulaMap is: $myFormulaMap');
    print('box is: ${Hive.box<String>('myFormulaId').values}');
  }

  // MyFormulaList //


}

