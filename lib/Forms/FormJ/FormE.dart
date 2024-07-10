import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Forms/FormJ/FormJ1.dart';
import 'package:npac/app/export.dart';

class FormE extends StatefulWidget {
   FormE({super.key});

  @override
  State<FormE> createState() => _FormEState();
}

class _FormEState extends State<FormE> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar:MAppBar(title: 'FORM E-CONGENITAL HEART DISESASE FORM',),

    body: MFormBody(Childrens: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('For all patients (Tick theapplicable)'),
          IconButton(
              onPressed: () {
                setState(() {
                  isEnabled = !isEnabled;
                });
              },
              icon: isEnabled ? Icon(Icons.save) : Icon(Icons.edit))
        ],
      ),
      FormJ1(enabled: isEnabled,),
    ],),
    );
  }
}
