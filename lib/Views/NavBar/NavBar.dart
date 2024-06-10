import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:npac/Views/Auth/login.dart';
import 'package:npac/Views/Auth/signUp.dart';
import 'package:npac/Views/Home/HomePage.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/theme_utils.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        navSwitch(index),
        CircleNavBar(
          onTap: (val){
            setState(() {
              index = val;
            });
          },
          activeIcons:  [
            Icon(Icons.person, color: context.primary),
            Icon(Icons.home, color: context.primary),
            Icon(Icons.favorite, color: context.primary),
          ],
          inactiveIcons: [
            Icon(Icons.person, color:  Colors.red.shade100.withOpacity(1)),
            Icon(Icons.home, color:  Colors.red.shade100.withOpacity(1)),
            Icon(Icons.favorite, color:  Colors.red.shade100.withOpacity(1)),
          ],
          color: Colors.white,
          circleColor: Colors.red.shade100.withOpacity(1),
          height: 60,
          circleWidth: 60,
          // tabCurve: ,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
          shadowColor: context.primary,
          circleShadowColor: context.primary,
          elevation: 10,
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [ Colors.blue, Colors.red ],
          // ),
          // circleGradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [ Colors.blue, Colors.red ],
          // ),
          activeIndex: index,tabDurationMillSec:  1000,
        )
      ],
    );
  }
}

Widget navSwitch(int value){
  switch(value){
    case 0:
      return LoginPage();
    case 1:
      return HomePage();
    case 2:
      return SignUp();
    default:
      return HomePage();
  }


}