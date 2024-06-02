import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Forms/Form3/FormThree2Page.dart';
import 'package:npac/Forms/Form3/FormThree3Page.dart';
import 'package:npac/Forms/Form3/FormThreePage.dart';
import 'package:npac/Forms/FormD/FormD1.dart';
import 'package:npac/Forms/FormD/FormD2.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/Views/Auth/login.dart';
import 'package:npac/Views/Auth/otp.dart';
import 'package:npac/Views/Auth/signUp.dart';
import 'package:npac/main.dart';
import 'package:npac/Forms/Form1/FormOnePage.dart';
import 'package:npac/Forms/Form2/FormtwoPage.dart';
import 'package:npac/widgets/m_scaffold.dart';

class MRouter{
  static BuildContext? context;
  static Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments as Map?;
    switch (settings.name) {
      case Routes.splash:
        return pageRoute(const spalshScreen(), settings);
      case Routes.Form1:
        return pageRoute(const FormOneUi(), settings);
      case Routes.Form2:
        return pageRoute(const FormTwoPage(), settings);
      case Routes.Form3One:
        return pageRoute(const FormThreePage(), settings);
      case Routes.Form3Two:
        return pageRoute(const FormThree2Page(), settings);
      case Routes.Form3Three:
        return pageRoute(const FormThree3page(), settings);
      case Routes.FormD1:
        return pageRoute(const FormD1(), settings);
      case Routes.FormD2:
        return pageRoute(const FormD2(), settings);
      case Routes.login:
        return pageRoute(const LoginPage(), settings);
      case Routes.signUp:
        return pageRoute(const SignUp(), settings);
      case Routes.otpPage:
        return pageRoute( otpPage(phoneNumber: args?['phoneNumber'],), settings);
      default:
        return pageRoute(MScaffold(
          body: Center(
            child: Text('Page not found: ${settings.name}'),
          ),
        ), settings);
    }
  }
  static Route pageRoute(Widget page, settings) => MaterialPageRoute(builder: (c){
    context = c;
    return page;
  }, settings: settings);
  static Route sheetRoute(Widget page, settings) => ModalBottomSheetRoute(builder: (c){
    context = c;
    return BottomSheet(
      builder: (_) => page, onClosing: () {  },
    );
  }, settings: settings, isScrollControlled: false);
  static Route dialogRoute(Widget dialog, settings) => RawDialogRoute(
    barrierColor: Colors.black12,
    //builder: (_) => dialog, settings: settings, context: context!,
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return dialog;
    }, transitionBuilder: (c, a, _, child) {
    var curve = Curves.easeInOut.transform(a.value);
    return Transform.scale(
      origin: Offset(0, MediaQuery.of(c).size.height * 0.35),
      scale: curve,
      child: child,
    );
  },
    transitionDuration: const Duration(milliseconds: 300),);
}