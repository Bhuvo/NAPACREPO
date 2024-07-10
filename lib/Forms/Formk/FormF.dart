import 'package:flutter/material.dart';
import 'package:npac/Forms/Formk/FormK1.dart';
import 'package:npac/app/export.dart';

class FormF extends StatefulWidget {
  const FormF({super.key});

  @override
  State<FormF> createState() => _FormFState();
}

class _FormFState extends State<FormF> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar:MAppBar(title: 'FORM F- CARDIOMYOPATHY FORM',),

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
        FormK1(isEnabled: isEnabled,),
      ],),
    );
  }
}
