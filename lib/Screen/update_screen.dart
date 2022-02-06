import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

class UpdateScreen extends StatelessWidget {
  static const String id = '/UpdateScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Upgrade Page'),),
        body:
        // UpgradeCard(
        //   debugLogging: true,
        //   debugAlwaysUpgrade: true,
        // )
        UpgradeAlert(
        debugLogging: true,
        debugAlwaysUpgrade: true,
        showIgnore: false,
        showLater: false,
        child: Center(child: Text('Checking...'))),

    );
  }
}
