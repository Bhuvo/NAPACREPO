import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/navigator_utils.dart';
import 'package:npac/utils/theme_utils.dart';
import 'package:shimmer/shimmer.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      backgroundColor: context.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Add this
            children: [
              Flexible(
                fit: FlexFit.loose, // Add this
                child: Container(
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
                elevation: 5,
                child: Container(
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
                          label: 'Name',
                          onChanged: (val) {},
                          type: MInputType.text,
                          autoFocus: false,
                        ),
                        Space(),
                        MTextField(
                          label: 'Mobile Number',
                          onChanged: (val) {},
                          type: MInputType.phone,
                          autoFocus: false,
                        ),
                        Space(),
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
                        Space(),
                        MTextField(
                          maxLines: 1,
                          label: 'Confirm Password ',
                          onChanged: (val) {},
                          type: MInputType.password,
                          autoFocus: false,
                        ),
                        Space(28),
                        Container(width :double.infinity,child: FilledButton(onPressed: () {context.push(Routes.otpPage);}, child: Text('SignUp'))),
                        Space(),
                        Text.rich(TextSpan(children: [
                          TextSpan(text: "Already have an account? "),
                          WidgetSpan(child: InkWell(onTap: () {context.push(Routes.login);}, child: Text('Login', style: TextStyle(color: Colors.blue),)))
                        ])),
                        Space(80),                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

