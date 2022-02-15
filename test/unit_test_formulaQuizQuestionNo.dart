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
  group ('Formula Quiz Question No', () {
    test ('question no. value should be incremented',
            (){ final provider = FormulaProvider();
        provider.upQuestionNumber();
        expect(provider.questionNumberGetter, 2);
        }
    );
    test ('question no. value should be cleared after Reset formulaQuiz',
            (){ final provider = FormulaProvider();
        for (int x=0; x<=5; x++){
          provider.upQuestionNumber();
        }
        provider.resetFormulaQuiz();
        expect(provider.questionNumberGetter, 1);
        }
    );




  }
  );



  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(MyApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
