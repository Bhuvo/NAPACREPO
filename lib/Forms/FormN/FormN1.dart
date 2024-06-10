import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormI/Widget/YesNo.dart';
import 'package:npac/Forms/FormN/widget/MN1body.dart';
import 'package:npac/app/export.dart';

class FormN1 extends StatefulWidget {
  const FormN1({super.key});

  @override
  State<FormN1> createState() => _FormN1State();
}

class _FormN1State extends State<FormN1> {
  List<String> drugList = [];

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'N. DRUG PAGE-USE AND DOSAGE',),
      body: MFormBody(Childrens: [
     // MText(text: 'N1 PRE-PREGNANCY',),
     //    Space(),
     //     MrowTextOptionPickerwidget(initialSelectedValue: drugList,onSelectedList: (e){
     //     setState(() {
     //       drugList = e;
     //     });
     //     print('Selected drug list $e');},title: 'DRUG',options: ['Prophylactic Penicillin','Warfarin','Acenocoumarol','LMWH','UFH'],),
     //    ListView(
     //      shrinkWrap: true,
     //      children:drugList.map((e) {
     //        return MrowTextTextFieldWidget(title: '$e Dose',type: MInputType.numeric,onChanged: (val){},);
     //      }).toList(),
     //    ),
        MN1Body(title: 'N1 PRE-PREGNANCY',options: List_items.Drugs,drugMap: (e){
          print('Value from map $e');
        },),
        MN1Body(title: 'N2 I TRIMESTER',options: List_items.Drugs,drugMap: (e){
          print('Value from map $e');
        },),
        MN1Body(title: 'N3 II TRIMESTER',options: List_items.Drugs,drugMap: (e){
          print('Value from map $e');
        },),
        MN1Body(title: 'N4 III TRIMESTER',options: List_items.Drugs,drugMap: (e){
          print('Value from map $e');
        },),
        MN1Body(title: 'N5 PERIPARTUM',options: List_items.Drugs,drugMap: (e){
          print('Value from map $e');
        },),
        MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormN2);},)
      ],),

    );
  }
}
