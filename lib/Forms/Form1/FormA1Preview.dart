import 'package:flutter/material.dart';
import 'package:npac/app/export.dart';

class FormA1Preview extends StatefulWidget {
  const FormA1Preview({super.key});

  @override
  State<FormA1Preview> createState() => _FormA1PreviewState();
}

class _FormA1PreviewState extends State<FormA1Preview> {
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'INCLUSION CRITERIA CHECKLIST (FORM A)',),

      body: MFormBody(Childrens: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MText(),
            IconButton(onPressed: (){}, icon: Icon(Icons.edit))
          ],
        ),
      ],),
    );
  }
}
