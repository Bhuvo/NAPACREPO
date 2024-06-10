
import 'package:flutter/material.dart';
import 'package:npac/Forms/FormN/widget/AntibioticsBody.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/theme_utils.dart';

class FormN3 extends StatefulWidget {
  const FormN3({super.key});

  @override
  State<FormN3> createState() => _FormN3State();
}

class _FormN3State extends State<FormN3> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'N. DRUG PAGE-USE AND DOSAGE',),
      floatingActionButton: IconButton(onPressed: () {setState(() {
        count++;
      });}, icon: Icon(Icons.add,size: 50,),color:context.primary,),
      body: MFormBody(Childrens: [
        Row(
          children: [
            MText(text: 'Antibiotics Used (incl IE prophylaxis)',),
          ],
        ),
        Space(),
        ListView(
          shrinkWrap: true,
          children: [
            for(int i = 1; i < count; i++)  AntibioticsBody(index: i,onChanged: (e){},onDelete: (){setState(() {
              count--;
            });},),
          ],
        ),
       // AntibioticsBody(index: 1,)
      MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},)
      ],),
    );
  }
}
