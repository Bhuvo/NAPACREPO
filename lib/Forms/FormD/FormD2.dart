import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Forms/FormD/FormD5.dart';
import 'package:npac/Forms/FormD/FormD6.dart';
import 'package:npac/Forms/FormD/FormD7.dart';
import 'package:npac/Forms/FormE/FormE1.dart';
import 'package:npac/Forms/FormF/FormF1.dart';
import 'package:npac/Forms/FormL/FormL2.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextDropDown.dart';

class FormD2 extends StatefulWidget {
  final bool? enabled;
 final Function(bool)? isPrimaryDiagnosisCongenital;
 final Function(bool)? isPrimaryDiagnosisAortopathies;
 final Function(bool)? isPrimaryDiagnosisCardiomyopathy;
 final Function(bool)? isPrimaryDiagnosisVenous;

  const FormD2({super.key, this.enabled,  this.isPrimaryDiagnosisCongenital,  this.isPrimaryDiagnosisAortopathies,  this.isPrimaryDiagnosisCardiomyopathy,  this.isPrimaryDiagnosisVenous});

  @override
  State<FormD2> createState() => _FormD2State();
}

class _FormD2State extends State<FormD2> {
  bool isMalformation = false;

  bool isPrimaryDiagnosisCongenital = false;
  bool isPrimaryDiagnosisAortopathies = false;
  bool isPrimaryDiagnosisCardiomyopathy = false;
  bool isPrimaryDiagnosisVenous = false;

  @override
  Widget build(BuildContext context) {
    return Column( children: [
        Row(
          children: [
            Text('D5 COMPLETE DIAGNOSIS',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
          ],
        ),
        Row(
          children: [
            Text('D5.1 Obstetric Diagnosis:'),
          ],
        ),
        MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){},title: 'Obstetric score:'),
        MRowTextDropDown(enabled: widget.enabled,onChanged: (val){},title: 'Period of gestation',),
        MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},options: List_items.Diagnosis, ),
        MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},options: List_items.assessment,),
        MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){if(val =='Yes'){
          setState(() {
            isMalformation = true;
          });
        }else{
          setState(() {
            isMalformation = false;
          });
        }},isneedDivider: isMalformation? false : true,title: 'Cong Malformation:',),
        isMalformation ? MTextField(enabled: widget.enabled,onChanged: (val){},label: 'If yes, mention details of Cong Malformation:',) : Container(),
        MSmallText(text: 'D5.2 Cardiac Diagnosis/ Classification:',),
        Space(),
      // MSmallText(text: 'D5.2.1 PRIMARY ETIOLOGICAL DIAGNOSIS ',),
      // Space(),
        MRowTextRadioWidget(onChanged: (val){
          val == 'Congenital Heart disease' ? isPrimaryDiagnosisCongenital =  true : false;
          val == 'Aortopathies' ? isPrimaryDiagnosisAortopathies = true : false;
          val == 'Cardiomyopathy' ? isPrimaryDiagnosisCardiomyopathy =  true : false;
          val == 'Venous thromboembolism/ Pulmonary EmbolismPrimary Pulmonary Hypertension' ?isPrimaryDiagnosisVenous =  true : false;
          widget.isPrimaryDiagnosisCongenital?.call(isPrimaryDiagnosisCongenital);
          widget.isPrimaryDiagnosisAortopathies?.call(isPrimaryDiagnosisAortopathies);
          widget.isPrimaryDiagnosisCardiomyopathy?.call(isPrimaryDiagnosisCardiomyopathy);
          widget.isPrimaryDiagnosisVenous?.call(isPrimaryDiagnosisVenous);
          setState(() {});
                  },title: 'D5.2.1 PRIMARY ETIOLOGICAL DIAGNOSIS ',options: List_items.ETIOLOGICALDiagnosis,CheckBoxOptions: ['Dilated','Hypertrophic','Restrictive','Peripartum'],),
      // MSmallText(text: 'D.5.2.2 ASSOCIATED DIAGNOSIS ',),
      // Space(),
        MRowTextRadioWidget( title:'D.5.2.2 ASSOCIATED DIAGNOSIS ',onChanged: (val){},options: List_items.ASSOCIATEDDiagnosis ,),

        //Container( width: double.infinity,child: FilledButton(onPressed: (){context.push(Routes.FormD3);}, child: Text('Next'))),

      ],);
  }
}
