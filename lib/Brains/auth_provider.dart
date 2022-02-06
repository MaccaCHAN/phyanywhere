import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';


class AuthProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  String? get currentUser {
    String? user = _auth.currentUser?.displayName;
    return  user;
  }


  Future signWithGoogle() async {
    GoogleSignInAccount? _currentUser;
    _currentUser = await GoogleSignIn().signIn();
    if (_currentUser == null) return;


    final googleAuth = await _currentUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
    if (_auth.currentUser != null) {
      print('_auth.currentUser not null');
    }
  }

  Future signWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if(result.status == LoginStatus.success) {
      final AccessToken? _accessToken = result.accessToken;

      final credential = FacebookAuthProvider.credential(_accessToken!.token);

      await _auth.signInWithCredential(credential);
      if (_auth.currentUser != null) {
        print('_auth.currentUser not null');
      }
    }
  }

  Future signWithApple() async {
    // final appleSignIn = SignInWithApple();

    // if (!await SignInWithApple.isAvailable()) {
    //   String errorMessage = 'This device is not eligible for Apple Sign in';
    //   return;
    // }

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    print(credential.authorizationCode);
    print(credential);

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: credential.identityToken);

      await _auth.signInWithCredential(oauthCredential);
      if (_auth.currentUser != null) {
        print('_auth.currentUser not null');
      }
    }

  bool authCurrentUserIsNull (){
    bool authCurrentUserIsNull;
    _auth.currentUser == null ? authCurrentUserIsNull = true : authCurrentUserIsNull = false;
    return authCurrentUserIsNull;
  }



}