import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:dse_physics_app/Components/standard_elevated_button.dart';
import 'package:dse_physics_app/Components/stuff_in_tiles.dart';
import 'package:dse_physics_app/Screen/formula_quiz_question_screen.dart';
import 'package:dse_physics_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopicSelectionScreen extends StatelessWidget {
  static const String id = '/TopicSelectionScreen';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormulaProvider>(context);
    final providerNotListen = Provider.of<FormulaProvider>(context, listen: false);
    // Provider.of<FormulaQuizBrain>(context, listen: false).createInterstitialAd();
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    bool isTablet = MediaQuery.of(context).size.longestSide / MediaQuery.of(context).size.shortestSide < 1.8;
    print('isTablet : $isTablet');

    AppBar myAppBar = AppBar(
      automaticallyImplyLeading: true,
      title: Text('Select Topics', style: kAppBarTextStyle.copyWith(fontSize: isPortrait ? 26.h : 43.h)),
    );

    return Scaffold(
        appBar: myAppBar,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 1.sh - myAppBar.preferredSize.height,
                width: 1.sw,
              ),
              Container(
                height: isPortrait
                    ? (1.sh - myAppBar.preferredSize.height) * 0.8
                    : (1.sh - myAppBar.preferredSize.height) * 0.8,
                width: isTablet ? 0.75.sw : null,
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return StuffInTiles(
                          isPortrait: isPortrait,
                          myTiles: provider.topicTileGetter[index],
                          onCheck: (checkState, tile) {
                            providerNotListen.addOrRemoveTopic(checkState, tile);
                          });
                    },
                    itemCount: provider.topicTileGetter.length,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30.0.h),
                  child: StandardElevatedButton(
                      title: 'Start the Quiz',
                      isDisabled: provider.checkQuestionListNull(),
                      onPressed: () {
                        if (providerNotListen.checkQuestionListNull()) {
                          return;
                        }
                        print('not return');
                        Navigator.pushNamedAndRemoveUntil(
                            context, FormulaQuizQuestionScreen.id, ModalRoute.withName('/'));
                      },
                      isPortrait: isPortrait),
                ),
              ),
            ],
          ),
        ));
  }
}
