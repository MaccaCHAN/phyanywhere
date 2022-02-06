import 'dart:io';

import 'package:dse_physics_app/Brains/auth_provider.dart';
import 'package:dse_physics_app/Screen/main_screen.dart';
import 'package:dse_physics_app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


class LoginScreen extends StatefulWidget {
  static const String id = '/loginScreen';


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool spinner = false;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double sidePadding = screenWidth / 13;

    return Scaffold(
        backgroundColor: AppColors.veryLightMilk,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Spacer(flex: 1),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                        child: Image(
                          image: AssetImage('images/phyanywhere_logo.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: FittedBox(
                          child: Text(
                            'Study Physics\nAnywhere\nAnytime',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.lightMilk,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: sidePadding),
                      child: Column(children: [
                        SignInButton(Buttons.Google, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                            onPressed: () async{ try {
                              // Try google sign in
                              await Provider.of<AuthProvider>(context, listen: false).signWithGoogle();

                            }
                            // Catch error & show with snackbar
                            catch (e) {
                              print(e);
                              ScaffoldMessenger.of(context).showSnackBar
                                (SnackBar(content:
                              Text('Error: ${e.toString()}'),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 2),
                                backgroundColor: AppColors.greenBlue,
                              ));  }
                            // if user not null, proceed to mainscreen
                            if (Provider.of<AuthProvider>(context, listen: false).authCurrentUserIsNull() == false)
                            {
                              print('user is null: ${Provider.of<AuthProvider>(context, listen: false).authCurrentUserIsNull()}');
                              Navigator.popAndPushNamed(context, MainScreen.id);

                            }
                            }),
                        SizedBox(height: 10.h),
                        SignInButton(Buttons.FacebookNew, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                            onPressed: () async{ try {
                              // Try google sign in
                              await Provider.of<AuthProvider>(context, listen: false).signWithFacebook(); }
                            // Catch error & show with snackbar
                            catch (e) {
                              print(e);
                              ScaffoldMessenger.of(context).showSnackBar
                                (SnackBar(content:
                              Text('Error: ${e.toString()}'),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 2),
                                backgroundColor: AppColors.greenBlue,
                              ));  }
                            // if user not null, proceed to mainscreen
                            if (Provider.of<AuthProvider>(context, listen: false).authCurrentUserIsNull() == false)
                            {
                              print('user is null: ${Provider.of<AuthProvider>(context, listen: false).authCurrentUserIsNull()}');
                              Navigator.popAndPushNamed(context, MainScreen.id); }
                            }),
                        SizedBox(height: 10.h),
                        Platform.isIOS ? SignInButton(Buttons.AppleDark, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                            onPressed: ()async{ try {
                              // Try google sign in
                              await Provider.of<AuthProvider>(context, listen: false).signWithApple(); }
                            // Catch error & show with snackbar
                            catch (e) {
                              print(e);
                              ScaffoldMessenger.of(context).showSnackBar
                                (SnackBar(content:
                              Text('Error: ${e.toString()}'),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 2),
                                backgroundColor: AppColors.greenBlue,
                              ));  }
                            // if user not null, proceed to mainscreen
                            if (Provider.of<AuthProvider>(context, listen: false).authCurrentUserIsNull() == false)
                            {
                              print('user is null: ${Provider.of<AuthProvider>(context, listen: false).authCurrentUserIsNull()}');
                              Navigator.popAndPushNamed(context, MainScreen.id); }
                            })
                            : SizedBox(),
                        SizedBox(height: 100.h),
                        // ElevatedButton(child: Text('Print user'),
                        //     onPressed: (){
                        //       print('user is null: ${Provider.of<AuthProvider>(context, listen: false).authCurrentUserIsNull()}');
                        //       String? user = Provider.of<AuthProvider>(context, listen: false).currentUser;
                        //       print('CurrentUser is: $user');
                        //     }),



                      ],),
                    ),
                  ),
                ),
              ),



            ],
          ),
        ));
  }
}




