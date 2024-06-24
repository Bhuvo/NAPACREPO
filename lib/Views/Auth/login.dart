import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/Views/Auth/controller/AuthController.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/navigator_utils.dart';
import 'package:npac/utils/theme_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phone = "";
  String password = "";
   GlobalKey<FormState> formKey = GlobalKey<FormState>();

   AuthController loginController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      backgroundColor: context.primary,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              padding: EdgeInsets.all(20),
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage("Assets/logo.png"),
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
            Material(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
              elevation: 20,
              child: Container(
                //color: Colors.white60,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Space(28),
                        Container(
                          height: 90,
                          child: Image(
                            image: AssetImage("Assets/logo.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Space(28),
                        MTextField(
                          label: 'Phone Number',
                          onChanged: (val) {
                            setState(() {
                              phone = val;
                            });
                          },
                          type: MInputType.phone,
                          autoFocus: false,
                        ),
                        Space(),
                        MTextField(
                          maxLines: 1,
                          label: 'Password ',
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          type: MInputType.password,
                          autoFocus: false,
                        ),
                        Space(28),
                        Container(width :double.infinity,child: FilledButton(onPressed: () async {
                          if(formKey.currentState!.validate()){
                            await loginController.login(context,phone, password);
                            context.showSnackBar('Validated');
                          }else{
                            context.showSnackBar('Not Validated');
                          }
                         // context.push(Routes.otpPage,{'phoneNumber': '1234567890'});
                          }, child: Text('Login'))),
                        Space(),
                        Text.rich(TextSpan(children: [
                          TextSpan(text: "Don't have an account? "),
                          WidgetSpan(child: InkWell(onTap: () { context.push(Routes.signUp);}, child: Text('Register', style: TextStyle(color: Colors.blue),)))
                        ])),
                        Space(80),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

