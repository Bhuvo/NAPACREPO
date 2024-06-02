import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/navigator_utils.dart';
import 'package:npac/utils/theme_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      backgroundColor: context.primary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
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
                        label: 'Email ',
                        onChanged: (val) {},
                        type: MInputType.email,
                        autoFocus: false,
                      ),
                      Space(),
                      MTextField(
                        maxLines: 1,
                        label: 'Password ',
                        onChanged: (val) {},
                        type: MInputType.password,
                        autoFocus: false,
                      ),
                      Space(28),
                      Container(width :double.infinity,child: FilledButton(onPressed: () {context.push(Routes.otpPage,{'phoneNumber': '7092339477'});}, child: Text('Login'))),
                      Space(),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "Don't have an account? "),
                        WidgetSpan(child: InkWell(onTap: () { context.push(Routes.signUp);}, child: Text('Register', style: TextStyle(color: Colors.blue),)))
                      ])),
                      Space(),
                    ],
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

