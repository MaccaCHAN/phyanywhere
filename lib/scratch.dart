// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:dse_physics_app/Brains/formula_provider.dart';
// import 'package:dse_physics_app/Screen/formula_quiz_info_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'dart:math' as math;
//
// import '../app_colors.dart';
//
// void main()  {
//
//   // runApp(ExpandableContainer());
// }
//



  // final Widget content = ;
//   //
//   // ExpandableContainer({required this.content});
//
//   @override
//   _ExpandableContainerState createState() => _ExpandableContainerState();
// }
//
// class _ExpandableContainerState extends State<ExpandableContainer> with TickerProviderStateMixin {
//   late AnimationController controller; //for more info container
//   late Animation<double> animation;
//   late AnimationController controller2; //for more info arrow
//   late Animation<double> animation2;
//
//   @override
//   void initState() {
//
//     super.initState();
//     controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200), upperBound: 1);
//
//     animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
//     controller2 = AnimationController(vsync: this, duration: Duration(milliseconds: 200), upperBound: 1);
//     animation2 =
//         Tween<double>(begin: 0, end: 0.5).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
//
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     controller2.dispose();
//
//     super.dispose();
//
//     // controller3.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     // final providerNotListen = Provider.of<FormulaQuizBrain>(context, listen: false);
//
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//             children: [
//               // providerNotListen.questionSetGetter.moreInfoQ.isEmpty
//               //     ? SizedBox()
//               //     :
//               Align(
//                 alignment: Alignment(0.7, 0), //to be fixed
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       if (controller.isDismissed) {
//                         controller.forward();
//                       } else {
//                         controller.reverse();
//                       }
//                       if (controller2.isDismissed) {
//                         controller2.forward();
//                       } else {
//                         controller2.reverse();
//                       }
//                     });
//                   },
//                   child: Container(
//                     child: RotationTransition(
//                       turns: animation2,
//                       child: Transform.rotate(
//                           angle: -math.pi / 2,
//                           child: Icon(
//                             Icons.arrow_back_ios_new,
//                             size: 15,
//                           )),
//                     ),
//                   ),
//                 ),
//               ),
//               //info arrow button
//               Container(
//                 width: 0.9.sw,
//                 child: Column(children: [
//                   SizedBox(height: 4.h),
//                   SizeTransition(
//                     sizeFactor: animation,
//                     child: Container(
//                         decoration: BoxDecoration(
//                             color: AppColors.superLightMilk, borderRadius: BorderRadius.circular(15.r)),
//                         child: SizedBox(height: 50.h))
//                     // FormulaQuizInfoScreen()
//                     ,
//                   )
//                 ]),
//               ),
//
//             ]
//
//         ),
//       ),
//     );
//   }
// }
