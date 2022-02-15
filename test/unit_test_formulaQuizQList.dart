// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dse_physics_app/main.dart';

void main() {
  group('Formula Quiz Question List', () {
    test('question list should be empty initially', () {
      final provider = FormulaProvider();

      expect(provider.formulaQuizQuestionSetList.isEmpty, true);
    });
    test('question list should have 84 questions after check all', () {
      final provider = FormulaProvider();

      provider.checkAll(); // check all topics

      expect(provider.formulaQuizQuestionSetList.length, 82);
    });
    test('question list should be decremented after one question done', () {
      final provider = FormulaProvider();

      provider.checkAll(); // check all topics
      provider.randomQuestionSet(); //random select questionset and remove questionset from list

      expect(provider.formulaQuizQuestionSetList.length, 82 - 1);
    });
    test('question list should be empty after clear', () {
      final provider = FormulaProvider();

      provider.checkAll(); // check all topics
      provider.randomQuestionSet(); //random select questionset and remove questionset from list
      provider.resetFormulaQuiz(); // reset formula Quiz

      expect(provider.formulaQuizQuestionSetList.isEmpty, true);
    });
    
  });

}
