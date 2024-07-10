import 'package:flutter/material.dart';
import 'package:npac/Forms/FormI/FormI1.dart';
import 'package:npac/Forms/FormI/FormI2.dart';
import 'package:npac/app/export.dart';

class FormG extends StatefulWidget {
  const FormG({super.key});

  @override
  State<FormG> createState() => _FormGState();
}

class _FormGState extends State<FormG> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar:MAppBar(title: 'FORM G-PROSTHETIC VALVE FORM',),

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
        FormI1(isEnabled: isEnabled,),
        FormI2(isEnabled:isEnabled ,),
      ],),
    );
  }
}
