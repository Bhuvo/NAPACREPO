import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Forms/FormD/FormD5.dart';
import 'package:npac/Forms/FormD/FormD6.dart';
import 'package:npac/Forms/FormD/FormD7.dart';
import 'package:npac/Forms/FormD/Model/FormD3Model.dart';
import 'package:npac/Forms/FormE/FormE1.dart';
import 'package:npac/Forms/FormF/FormF1.dart';
import 'package:npac/Forms/FormL/FormL2.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextDropDown.dart';

class FormD2 extends StatefulWidget {
  final bool? enabled;
  final Rx<FormD3Model>? formD3Model;
 final Function(bool)? isPrimaryDiagnosisCongenital;
 final Function(bool)? isPrimaryDiagnosisAortopathies;
 final Function(bool)? isPrimaryDiagnosisCardiomyopathy;
 final Function(bool)? isPrimaryDiagnosisVenous;

  const FormD2({super.key, this.enabled,  this.isPrimaryDiagnosisCongenital,  this.isPrimaryDiagnosisAortopathies,  this.isPrimaryDiagnosisCardiomyopathy,  this.isPrimaryDiagnosisVenous, this.formD3Model});

  @override
  State<FormD2> createState() => _FormD2State();
}

class _FormD2State extends State<FormD2> {
  bool isMalformation = false;

  bool isPrimaryDiagnosisCongenital = false;
  bool isPrimaryDiagnosisAortopathies = false;
  bool isPrimaryDiagnosisCardiomyopathy = false;
  bool isPrimaryDiagnosisVenous = false;
  bool isLive = false;
  bool isOther1 = false;
  bool isOther2 = false;

  List<String> primarySelectedList = [];
  List<String> ADSelectedList = [];

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  void getData(){
    widget.formD3Model?.value.pEDCongenitalHeartDisease ?? false ? primarySelectedList.add('Congenital Heart disease') : null;
    widget.formD3Model?.value.pEDHeartDisease ?? false ? primarySelectedList.add('Heart disease (Other than congenital)') : null;
    widget.formD3Model?.value.pEDCardiomyopathy ?? false ? primarySelectedList.add('Cardiomyopathy') : null;
    widget.formD3Model?.value.pEDAortopathies ?? false ? primarySelectedList.add('Aortopathies') : null;
    widget.formD3Model?.value.pEDCardiacArrhythmia ?? false ? primarySelectedList.add('Cardiac Arrhythmia') : null;
    widget.formD3Model?.value.pEDCoronaryArteryDisease ?? false ? primarySelectedList.add('Coronary artery disease') : null;
    widget.formD3Model?.value.pEDPulmonaryEmbolism ?? false ? primarySelectedList.add('Pulmonary Embolism (Acute / chronic)') : null;
    widget.formD3Model?.value.pEDPrimaryPulmonaryHypertension ?? false ? primarySelectedList.add('Primary Pulmonary Hypertension') : null;
    widget.formD3Model?.value.pEDOthers ?? false ? primarySelectedList.add('Others (Miscellaneous)') : null;
  }

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
        MrowTextTextFieldWidget(enabled: widget.enabled,onChanged: (val){},title: 'Obstetric score:'),
        MRowTextDropDown(enabled: widget.enabled,initialValue: widget.formD3Model?.value.periodOfGestation.toString(),onChanged: (val){
          widget.formD3Model?.value.periodOfGestation = int.parse(val);
        },title: 'Period of gestation',),
        MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
          widget.formD3Model?.value.obstetricDiagnosisValue1 = val;
        },initialValue: widget.formD3Model?.value.obstetricDiagnosisValue1,options: List_items.Diagnosis, ),
        MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
          // val =='LIVE' ? isLive = true : isLive = false;
          widget.formD3Model?.value.obstetricDiagnosisValue2 = val;
          setState(() {});
        },initialValue: widget.formD3Model?.value.obstetricDiagnosisValue2,options: List_items.assessment,isneedDivider: false,),
      widget.formD3Model?.value.obstetricDiagnosisValue2 =='LIVE' ?MRowTextRadioWidget(title: 'If Live ,',onChanged: (val){
        widget.formD3Model?.value.obstetricDiagnosisValue3 = val;
      },initialValue: widget.formD3Model?.value.obstetricDiagnosisValue3,enabled: widget.enabled,options: ['AGA' ,'SGA'],isneedDivider: false,): Container(),
        MDivider(),
        MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){if(val =='Yes'){
          setState(() {
            isMalformation = true;
          });
        }else{
          setState(() {
            isMalformation = false;
          });
        }
         widget.formD3Model?.value.congMalformation = val;
        },initialValue: widget.formD3Model?.value.congMalformation,isneedDivider: isMalformation? false : true,title: 'Cong Malformation:',),
        isMalformation ? MTextField(enabled: widget.enabled,onChanged: (val){
          widget.formD3Model?.value.congMalformationSpecify = val;
        },initalValue: widget.formD3Model?.value.congMalformationSpecify,label: 'If yes, mention details of Cong Malformation:',) : Container(),
        MSmallText(text: 'D5.2 Cardiac Diagnosis/ Classification:',),
        Space(),
      // MSmallText(text: 'D5.2.1 PRIMARY ETIOLOGICAL DIAGNOSIS ',),
      // Space(),
      //   MRowTextRadioWidget(onChanged: (val){
      //     val == 'Congenital Heart disease' ? {isPrimaryDiagnosisCongenital =  true,
      //     context.showSnackBar('Kindly fill Form D8 CONGENITAL HEART DISEASE ECHO PAGE & FORM E-CONGENITAL HEART DISESASE FORM Below')
      //     } :isPrimaryDiagnosisCongenital= false;
      //     val == 'Aortopathies' ? {isPrimaryDiagnosisAortopathies = true,
      //     context.showSnackBar('Kindly Fill Form D9. AORTOPATHY ECHO PAGE Below')
      //     } :isPrimaryDiagnosisAortopathies= false;
      //     val == 'Cardiomyopathy' ? {isPrimaryDiagnosisCardiomyopathy = true,
      //      context.showSnackBar('Kindly Fill Form D10. CARDIOMYOPATHY/HEART FAILURE ECHO PAGE Below')
      //     } :isPrimaryDiagnosisCardiomyopathy = false;
      //     val == 'Venous thromboembolism/ Pulmonary EmbolismPrimary Pulmonary Hypertension' ? {isPrimaryDiagnosisVenous = true,
      //     context.showSnackBar('Kindly Fill Form G3. ANTICOAGULANT/ANTIPLATELET REGIMEN Below')
      //     } :isPrimaryDiagnosisVenous= false;
      //     widget.isPrimaryDiagnosisCongenital?.call(isPrimaryDiagnosisCongenital);
      //     widget.isPrimaryDiagnosisAortopathies?.call(isPrimaryDiagnosisAortopathies);
      //     widget.isPrimaryDiagnosisCardiomyopathy?.call(isPrimaryDiagnosisCardiomyopathy);
      //     widget.isPrimaryDiagnosisVenous?.call(isPrimaryDiagnosisVenous);
      //     setState(() {});
      //             },title: 'D5.2.1 PRIMARY ETIOLOGICAL DIAGNOSIS ',options: List_items.ETIOLOGICALDiagnosis,CheckBoxOptions: ['Dilated','Hypertrophic','Restrictive','Peripartum'],),
      // MSmallText(text: 'D.5.2.2 ASSOCIATED DIAGNOSIS ',),
      MRowTextCheckBox(title: 'D5.2.1 PRIMARY ETIOLOGICAL DIAGNOSIS ',selectedlist: primarySelectedList,enabled: widget.enabled,list: List_items.ETIOLOGICALDiagnosis, result: (val){
        val.contains('Congenital Heart disease') ? widget.formD3Model?.value.pEDCongenitalHeartDisease = true : widget.formD3Model?.value.pEDCongenitalHeartDisease = false;
        val.contains('Heart disease (Other than congenital)') ? widget.formD3Model?.value.pEDHeartDisease = true : widget.formD3Model?.value.pEDHeartDisease = false;
        val.contains('Cardiomyopathy') ?  widget.formD3Model?.value.pEDCardiomyopathy = true : widget.formD3Model?.value.pEDCardiomyopathy = false;
        val.contains('Aortopathies') ? widget.formD3Model?.value.pEDAortopathies = true : widget.formD3Model?.value.pEDAortopathies = false;
        val.contains('Cardiac Arrhythmia')? widget.formD3Model?.value.pEDCardiacArrhythmia = true : widget.formD3Model?.value.pEDCardiacArrhythmia = false;
        val.contains('Coronary artery disease') ? widget.formD3Model?.value.pEDCoronaryArteryDisease = true : widget.formD3Model?.value.pEDCoronaryArteryDisease = false;
        val.contains('Pulmonary Embolism (Acute / chronic)')? widget.formD3Model?.value.pEDPulmonaryEmbolism = true : widget.formD3Model?.value.pEDPulmonaryEmbolism = false;
        val.contains('Primary Pulmonary Hypertension') ? widget.formD3Model?.value.pEDPrimaryPulmonaryHypertension = true : widget.formD3Model?.value.pEDPrimaryPulmonaryHypertension = false;
        val.contains('Others (Miscellaneous)') ? widget.formD3Model?.value.pEDOthers = true : widget.formD3Model?.value.pEDOthers = false;

        val.contains('Congenital Heart disease') ? {isPrimaryDiagnosisCongenital =  true,
    context.showSnackBar('Kindly fill Form D8 CONGENITAL HEART DISEASE ECHO PAGE & FORM E-CONGENITAL HEART DISESASE FORM Below')
    }: isPrimaryDiagnosisCongenital = false;
        val.contains('Aortopathies') ? {isPrimaryDiagnosisAortopathies = true,
          context.showSnackBar('Kindly Fill Form D9. AORTOPATHY ECHO PAGE Below')
        } :isPrimaryDiagnosisAortopathies= false;
        val.contains('Cardiomyopathy') ? {isPrimaryDiagnosisCardiomyopathy = true,
          context.showSnackBar('Kindly Fill Form D10. CARDIOMYOPATHY/HEART FAILURE ECHO PAGE Below')
        } :isPrimaryDiagnosisCardiomyopathy = false;
        val.contains('Pulmonary Embolism (Acute / chronic)') || val.contains('Primary Pulmonary Hypertension') ? {isPrimaryDiagnosisVenous = true,
          context.showSnackBar('Kindly Fill Form G3. ANTICOAGULANT/ANTIPLATELET REGIMEN Below')
        } :isPrimaryDiagnosisVenous= false;
        widget.isPrimaryDiagnosisCongenital?.call(isPrimaryDiagnosisCongenital);
        widget.isPrimaryDiagnosisAortopathies?.call(isPrimaryDiagnosisAortopathies);
        widget.isPrimaryDiagnosisCardiomyopathy?.call(isPrimaryDiagnosisCardiomyopathy);
        widget.isPrimaryDiagnosisVenous?.call(isPrimaryDiagnosisVenous);
        setState(() {});
        },isneedDivider: false,),
      // Space(),
      isPrimaryDiagnosisCardiomyopathy ?  MRowTextRadioWidget(title: 'For Cardiomyopathy (Select the applicable)',isneedDivider: false,enabled: widget.enabled,options: ['Dilated','Hypertrophic','Restrictive','Peripartum' ,'Other'],onChanged: (val){
        val == 'Other' ? isOther1 = true : isOther1 = false;
        setState(() {});
      },): Container(),
      isOther1 ?MTextField(enabled: widget.enabled,onChanged: (val){
        widget.formD3Model?.value.cardiomyopathyOthersSpecify = val;
      },initalValue: widget.formD3Model?.value.cardiomyopathyOthersSpecify,label: 'If other, specify:',): Container(),
      isPrimaryDiagnosisAortopathies ? MRowTextRadioWidget(title: 'For Aortopathies (Select the applicable)',isneedDivider: false,enabled: widget.enabled,onChanged: (val){
        val == 'Other' ? isOther2 = true : isOther2 = false;
        setState(() {});
      },options: ['Marfan','Takayasu','HTAD','Other'],): Container(),
      isOther2 ?MTextField(enabled: widget.enabled,onChanged: (val){
        widget.formD3Model?.value.aortopathiesOthersSpecify = val;
      },initalValue: widget.formD3Model?.value.aortopathiesOthersSpecify,label: 'If other, specify:',): Container(),
        MDivider(),
        Space(),
        // MRowTextRadioWidget( title:'D.5.2.2 ASSOCIATED DIAGNOSIS ',onChanged: (val){
        //   val == 'Atrial fibrillation (other than lone AF)' ||isPrimaryDiagnosisVenous ? {
        //     isPrimaryDiagnosisVenous= true,
        //     context.showSnackBar('Kindly Fill Form G3. ANTICOAGULANT/ANTIPLATELET REGIMEN Below')
        //   } : isPrimaryDiagnosisVenous = false;
        //   widget.isPrimaryDiagnosisVenous?.call(isPrimaryDiagnosisVenous);
        //   setState(() {});
        // },options: List_items.ASSOCIATEDDiagnosis ,),
        MRowTextCheckBox(title: 'D.5.2.2 ASSOCIATED DIAGNOSIS ',selectedlist: ADSelectedList,enabled: widget.enabled,result: (val){
          val.contains('Pulmonary Hypertension (other than primary)') ? widget.formD3Model?.value.pulmonaryHypertension = true : widget.formD3Model?.value.pulmonaryHypertension = false;
          val.contains('Congestive Heart Failure') ? widget.formD3Model?.value.congestiveHeartFailure = true : widget.formD3Model?.value.congestiveHeartFailure = false;
          val.contains('Atrial fibrillation (other than lone AF)') ? widget.formD3Model?.value.atrialFibrillation = true : widget.formD3Model?.value.atrialFibrillation = false;
          val.contains('Infective endocarditis') ? widget.formD3Model?.value.infectiveEndocarditis = true : widget.formD3Model?.value.infectiveEndocarditis = false;

          val.contains('Atrial fibrillation (other than lone AF)') ? {isPrimaryDiagnosisVenous = true,
            context.showSnackBar('Kindly Fill Form G3. ANTICOAGULANT/ANTIPLATELET REGIMEN Below')
          } : isPrimaryDiagnosisVenous = false;
          widget.isPrimaryDiagnosisVenous?.call(isPrimaryDiagnosisVenous);
          setState(() {});
        }, list: List_items.ASSOCIATEDDiagnosis,),
        Space(),
        MrowTextTextFieldWidget(title: 'D5.2.3 Complete Cardiac Diagnosis',enabled: widget.enabled,initialValue: widget.formD3Model?.value.completeCardiacDiagnosis,onChanged: (val){
          widget.formD3Model?.value.completeCardiacDiagnosis = val;
        },)
        //Container( width: double.infinity,child: FilledButton(onPressed: (){context.push(Routes.FormD3);}, child: Text('Next'))),

      ],);
  }
}
