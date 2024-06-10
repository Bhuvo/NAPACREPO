import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/navigator_utils.dart';
import 'package:npac/utils/theme_utils.dart';
import 'package:npac/widgets/m_pin_field.dart';

class otpPage extends StatefulWidget {
  final String? phoneNumber;
  const otpPage({super.key,  this.phoneNumber});

  @override
  State<otpPage> createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      backgroundColor: context.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                elevation: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
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
                      Row(
                        children: [
                          Text('Verification', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Space(28),
                      Text('We sent the verification code to ${widget.phoneNumber ?? ''}', style: TextStyle(fontSize: 17 ),),
                      Space(28),
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Verification code', style: TextStyle(fontSize: 16 ),),
                          Text('Resend code', style: TextStyle(fontSize: 16, color: Colors.blue ),),
                        ],
                      ),
                      Space(),
                      MPinField(onChanged: (val){},),
                      Space(28),
                      Container(width :double.infinity,child: FilledButton(onPressed: () {context.push(Routes.Home);}, child: Text('Verify OTP'))),
                      Space(),
                    ],
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

