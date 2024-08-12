import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Forms/Form1/FormA1.dart';
import 'package:npac/Forms/Form3/FormThree2Page.dart';
import 'package:npac/Forms/Form3/FormThree3Page.dart';
import 'package:npac/Forms/Form3/FormThreePage.dart';
import 'package:npac/Forms/FormD/FormD1.dart';
import 'package:npac/Forms/FormD/FormD2.dart';
import 'package:npac/Forms/FormD/FormD3.dart';
import 'package:npac/Forms/FormD/FormD4.dart';
import 'package:npac/Forms/FormD/FormD5.dart';
import 'package:npac/Forms/FormD/FormD6.dart';
import 'package:npac/Forms/FormD/FormD7.dart';
import 'package:npac/Forms/FormD/FormD8.dart';
import 'package:npac/Forms/FormD/FormD9.dart';
import 'package:npac/Forms/FormE/FormE1.dart';
import 'package:npac/Forms/FormE/FormE2.dart';
import 'package:npac/Forms/FormF/FormF1.dart';
import 'package:npac/Forms/FormG/FormG1.dart';
import 'package:npac/Forms/FormH/FormH1.dart';
import 'package:npac/Forms/FormH/FormH2.dart';
import 'package:npac/Forms/FormH/FormH3.dart';
import 'package:npac/Forms/FormH/FormH4.dart';
import 'package:npac/Forms/FormH/FormH5.dart';
import 'package:npac/Forms/FormH/FormH6.dart';
import 'package:npac/Forms/FormH/FormH7.dart';
import 'package:npac/Forms/FormI/FormG.dart';
import 'package:npac/Forms/FormI/FormI1.dart';
import 'package:npac/Forms/FormI/FormI2.dart';
import 'package:npac/Forms/FormJ/FormE.dart';
import 'package:npac/Forms/FormJ/FormJ1.dart';
import 'package:npac/Forms/FormL/FormL1.dart';
import 'package:npac/Forms/FormL/FormL2.dart';
import 'package:npac/Forms/FormM/FormM1.dart';
import 'package:npac/Forms/FormM/FormM2.dart';
import 'package:npac/Forms/FormN/FormN1.dart';
import 'package:npac/Forms/FormN/FormN2.dart';
import 'package:npac/Forms/FormN/FormN3.dart';
import 'package:npac/Forms/Formk/FormF.dart';
import 'package:npac/Forms/Formk/FormK1.dart';
import 'package:npac/Forms/QuestionnaireForm/QuestionnaireForm.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/Views/Auth/login.dart';
import 'package:npac/Views/Auth/otp.dart';
import 'package:npac/Views/Auth/signUp.dart';
import 'package:npac/Views/Home/HomePage.dart';
import 'package:npac/Views/MotherDetails/MotherDetails.dart';
import 'package:npac/Views/MothersList/MothersList.dart';
import 'package:npac/Views/MyAccount/Profile.dart';
import 'package:npac/Views/NavBar/NavBar.dart';
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
        return pageRoute(FormA1(isFromPatientDetails: args?['isFromPatientDetails'],), settings);
      case Routes.Form2:
        return pageRoute(const FormTwoPage(), settings);
      case Routes.Form3One:
        return pageRoute( FormThreePage(data: args?['data'],isFromPatientDetails: args?['isFromPatientDetails'],), settings);
      case Routes.Form3Two:
        return pageRoute(const FormThree2Page(), settings);
      case Routes.Form3Three:
        return pageRoute(const FormThree3page(), settings);
      case Routes.FormD1:
        return pageRoute(FormD1(patientId: args?['patientId'] ?? '7965',), settings);
      case Routes.FormD2:
        return pageRoute(const FormD2(), settings);
      case Routes.FormD3:
        return pageRoute(const FormD3(), settings);
      case Routes.FormD4:
        return pageRoute(const FormD4(), settings);
      case Routes.FormD5:
        return pageRoute(const FormD5(), settings);
      case Routes.FormD6:
        return pageRoute(const FormD6(), settings);
      case Routes.FormD7:
        return pageRoute(const FormD7(), settings);
      case Routes.FormD8:
        return pageRoute(const FormD8(), settings);
      case Routes.FormD9:
        return pageRoute(const FormD9(), settings);
      case Routes.FormE1:
        return pageRoute( FormE1(isFromPatientDetails: args?['isFromPatientDetails'] ??false,data: args?['data'],), settings);
      case Routes.FormE2:
        return pageRoute( FormE2(formEData: args?['formEData'],), settings);
      case Routes.FormF1:
        return pageRoute( FormF1(patientId: args?['patientId'],), settings);
      case Routes.FormG1:
        return pageRoute(const FormG1(), settings);
      case Routes.FormH1:
        return pageRoute( FormH1(patientId: args?['patientId'],), settings);
      case Routes.FormH2:
        return pageRoute(const FormH2(), settings);
      case Routes.FormH3:
        return pageRoute(const FormH3(), settings);
      case Routes.FormH4:
        return pageRoute(const FormH4(), settings);
      case Routes.FormH5:
        return pageRoute(const FormH5(), settings);
      case Routes.FormH6:
        return pageRoute(const FormH6(), settings);
      case Routes.FormH7:
        return pageRoute(const FormH7(), settings);
      case Routes.FormI1:
        return pageRoute(const FormI1(), settings);
      case Routes.FormI2:
        return pageRoute(const FormI2(), settings);
      case Routes.FormJ1:
        return pageRoute(const FormJ1(), settings);
      case Routes.FormK1:
        return pageRoute(const FormK1(), settings);
      case Routes.FormL1:
        return pageRoute( FormL1(patientId: args?['patientId'],), settings);
      case Routes.FormL2:
        return pageRoute(const FormL2(), settings);
      case Routes.FormM1:
        return pageRoute( FormM1(patientId: args?['patientId'],), settings);
      case Routes.FormM2:
        return pageRoute(const FormM2(), settings);
      case Routes.FormN1:
        return pageRoute(const FormN1(), settings);
      case Routes.FormN2:
        return pageRoute(const FormN2(), settings);
      case Routes.FormN3:
        return pageRoute(const FormN3(), settings);
      case Routes.Quetionnarie:
        return pageRoute(const QuestionnaireForm(), settings);

      case Routes.login:
        return pageRoute(const LoginPage(), settings);
      case Routes.signUp:
        return pageRoute(const SignUp(), settings);
      case Routes.otpPage:
        return pageRoute(otpPage(phoneNumber: args?['phoneNumber'],), settings);
      case Routes.Home:
        return pageRoute(const NavBar(), settings);
      case Routes.EditProfile:
        return pageRoute( EditProfile(), settings);
      case Routes.MothersList:
        return pageRoute(const MothersList(), settings);
      case Routes.MothersDetails:
        return pageRoute( MotherDetails(data: args?['data'],), settings);

      case Routes.FormE:
        return pageRoute( FormE(), settings);
      case Routes.FormF:
        return pageRoute(const FormF(), settings);
      case Routes.FormG:
        return pageRoute(const FormG(), settings);

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