import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormN/widget/MN1body.dart';
import 'package:npac/app/export.dart';

class FormN2 extends StatefulWidget {
  const FormN2({super.key});

  @override
  State<FormN2> createState() => _FormN2State();
}

class _FormN2State extends State<FormN2> {
  @override
  Widget build(BuildContext context) {
    return MScaffold(appBar: MAppBar(title: 'N. DRUG PAGE-USE AND DOSAGE',),
    body: MFormBody(Childrens: [
      Row(
        children: [
          MText(text: 'NON-CARDIAC MEDICATIONS: (C2.6)',),
        ],
      ),
      Space(),
      MN1Body(title: 'N1 PRE-PREGNANCY',textTitle: 'NON-CARDIAC MEDICATIONS',options: List_items.MEDICATIONS,drugMap: (e){
        print('Value from map $e');
      },),
      MN1Body(title: 'N2 I TRIMESTER',options: List_items.MEDICATIONS,drugMap: (e){
        print('Value from map $e');
      },),
      MN1Body(title: 'N3 II TRIMESTER',options: List_items.MEDICATIONS,drugMap: (e){
        print('Value from map $e');
      },),
      MN1Body(title: 'N4 III TRIMESTER',options: List_items.MEDICATIONS,drugMap: (e){
        print('Value from map $e');
      },),
      MN1Body(title: 'N5 PERIPARTUM',options: List_items.MEDICATIONS,drugMap: (e){
        print('Value from map $e');
      },),
      MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormN3);},)
    ],),
    );
  }
}
