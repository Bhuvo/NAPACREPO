import 'package:flutter/material.dart';
import 'package:foode/utils/navigator_utils.dart';

class MScaffold extends StatelessWidget {
  final Widget? body, floatingActionButton, bottomSheet, bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  const MScaffold({Key? key,this.backgroundColor, this.bottomSheet, this.body,
    this.bottomNavigationBar,
    this.appBar, this.floatingActionButtonLocation, this.floatingActionButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      body: body,
      backgroundColor: backgroundColor,
      appBar: appBar,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    ), onWillPop: () async {
      if(Navigator.of(context).canPop()) {
        context.pop();
      }
      return true;
    },);
  }
}
