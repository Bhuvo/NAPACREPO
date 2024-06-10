import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/app/export.dart';

class FormD2 extends StatefulWidget {
  const FormD2({super.key});

  @override
  State<FormD2> createState() => _FormD2State();
}

class _FormD2State extends State<FormD2> {
  bool isMalformation = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MScaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MAppBar(title: 'D. FIRST VISIT PAGE (FORM D)',)),

      body: MFormBody( Childrens: [
        Text('D5 COMPLETE DIAGNOSIS',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        Text('D5.1 Obstetric Diagnosis:'),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'Obstetric score:'),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'Period of gestation:'),
        MRowTextRadioWidget(onChanged: (val){},options: List_items.Diagnosis, ),
        MRowTextRadioWidget(onChanged: (val){},options: List_items.assessment,),
        MRowTextRadioWidget(onChanged: (val){if(val =='Yes'){
          setState(() {
            isMalformation = true;
          });
        }else{
          setState(() {
            isMalformation = false;
          });
        }},isneedDivider: isMalformation? false : true,title: 'Cong Malformation:',),
        isMalformation ? MTextField(onChanged: (val){},label: 'If yes, mention details of Cong Malformation:',) : Container(),
      Text('D5.2 Cardiac Diagnosis/ Classification:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        Space(),
        Text('D5.2.1 PRIMARY ETIOLOGICAL DIAGNOSIS ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        Space(),
        MRowTextRadioWidget(onChanged: (val){},options: List_items.ETIOLOGICALDiagnosis,CheckBoxOptions: ['Dilated','Hypertrophic','Restrictive','Peripartum'],),
        Text('D.5.2.2 ASSOCIATED DIAGNOSIS ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        Space(),
        MRowTextRadioWidget( onChanged: (val){},options: List_items.ASSOCIATEDDiagnosis ,),
        Space(),
        Container( width: double.infinity,child: FilledButton(onPressed: (){context.push(Routes.FormD3);}, child: Text('Next'))),

      ],),
    ));
  }
}
