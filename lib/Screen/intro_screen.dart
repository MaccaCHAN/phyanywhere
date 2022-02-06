import 'package:dse_physics_app/Brains/check_aspect_ratio.dart';
import 'package:dse_physics_app/Screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  static const id = '/IntroScreen';

  @override
  Widget build(BuildContext context) {
    print('parent built');
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: listPageViewModel,
          done: Text("Next", style: isTabletSize() ?
          TextStyle(fontSize: 30.h, fontWeight: FontWeight.w600) : TextStyle(fontWeight: FontWeight.w600) ),
          showNextButton: false,
          next: Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () {
            _onIntroEnd(context);
          },
        ),
      ),
    );
  }
}

void _onIntroEnd(context) {
  print('onDone pressed');
  Navigator.of(context).pushNamed(LoginScreen.id);
}

List<PageViewModel> listPageViewModel = [
  PageViewModel(
    title: "",
    body: "Memorize physics formulae by doing quizzes.",
    image: Image(
      image: AssetImage('images/intro_image01.png'),
      height: 0.38.sh,
    ),
    reverse: true,
    decoration: myPageDecoration(),
  ),
  PageViewModel(
      title: "",
      body: "Revise physics formulae anywhere, anytime on your phone.",
      image: Image(image: AssetImage('images/intro_image02.png'),
        height: 0.38.sh,
      ),

      reverse: true,
      decoration: myPageDecoration()
      // decoration: pageDecoration,
      ),
  PageViewModel(
      title: "",
      body: "Create your customized formula list for revision.",
      image: Image(image: AssetImage('images/intro_image03.png'),
        height: 0.38.sh,),
      reverse: true,
      decoration: myPageDecoration()
      // decoration: pageDecoration,
      )
];

PageDecoration myPageDecoration() {
  return PageDecoration(
      bodyAlignment: Alignment.center,
      imageAlignment: Alignment.topCenter,
      bodyFlex: 2,
      imageFlex: 3,
      descriptionPadding: EdgeInsets.only(left: 0.1.sw , right: 0.1.sw),
      titlePadding: EdgeInsets.only(top: 0.1.sh, bottom: 0.03.sh),
      bodyTextStyle: TextStyle(fontSize: isTabletSize() ? 23.h : 18.h),
      titleTextStyle: TextStyle(fontSize: isTabletSize() ? 40.h : 23.h, fontWeight: FontWeight.bold )
      // imagePadding:
      );
}
