import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormJ/FormEModel/FormEModel.dart';
import 'package:npac/Forms/FormJ/FormEcontroller.dart';
import 'package:npac/app/export.dart';

class FormJ1 extends StatefulWidget {
  final bool? enabled;
  final Rx<FormEModel>? formEModel;
  
  const FormJ1({super.key, this.enabled, this.formEModel});

  @override
  State<FormJ1> createState() => _FormJ1State();
}

class _FormJ1State extends State<FormJ1> {
bool isOthers = false;
bool isSurgical = false;
bool isInterventional = false;
bool isSurgicalOther = false;
bool isInterventionalOther = false;
List<String> diseaseSelectedList = [];
List<String> postPreSelectedList = [];
List<String> postSurgicalSelectedList = [];
List<String> deviceClosureSelectedList = [];
List<String> balloonSelectedList = [];
List<String> symptomsSelectedList = [];


  @override
  void initState() {

    widget.formEModel?.value.atrialSeptalDefect ?? false ? diseaseSelectedList.add('Atrial Septal Defect') : null;
    widget.formEModel?.value.ventricularSeptalDefect ?? false ? diseaseSelectedList.add('Ventricular Septal Defect') : null;
    widget.formEModel?.value.patentDuctusArteriosus ?? false ? diseaseSelectedList.add('Patent Ductus Arteriosus') : null;
    widget.formEModel?.value.aVCanalDefect ?? false ? diseaseSelectedList.add('AV Canal Defect') : null;
    widget.formEModel?.value.aPWindow ?? false ? diseaseSelectedList.add('AP Window') : null;
    widget.formEModel?.value.otherLRShunts ?? false ? diseaseSelectedList.add('Other L→R shunts') : null;
    widget.formEModel?.value.eisenmengerPhysiology ?? false ? diseaseSelectedList.add('Eisenmenger physiology') : null;
    widget.formEModel?.value.valvularPulmonaryStenosis ?? false ? diseaseSelectedList.add('Valvular Pulmonary Stenosis') : null;
    widget.formEModel?.value.subValvularPS ?? false ? diseaseSelectedList.add('Sub-Valvular Pulmonary Stenosis') : null;
    widget.formEModel?.value.tOF ?? false ? diseaseSelectedList.add('Tetralogy of Fallot') : null;
    widget.formEModel?.value.doubleOutletRightVentricle ?? false ? diseaseSelectedList.add('Double Outlet Right Ventricle') : null;
    widget.formEModel?.value.transpositionOfGreatArteries ?? false ? diseaseSelectedList.add('Transposition of Great Arteries') : null;
    widget.formEModel?.value.correctedTransposition ?? false ? diseaseSelectedList.add('Corrected Transposition of Great Arteries') : null;
    widget.formEModel?.value.ebsteinAnomaly ?? false ? diseaseSelectedList.add('Ebstein Anomaly') : null;
    widget.formEModel?.value.pulmonaryAtresia ?? false ? diseaseSelectedList.add('Pulmonary Atresia') : null;
    widget.formEModel?.value.truncusArteriosus ?? false ? diseaseSelectedList.add('Truncus Arteriosus') : null;
    widget.formEModel?.value.singleVentricle ?? false ? diseaseSelectedList.add('Single Ventricle') : null;
    widget.formEModel?.value.tricuspidAtresia ?? false ? diseaseSelectedList.add('Tricuspid Atresia') : null;
    widget.formEModel?.value.diseaseSpecificOthers ?? false ? diseaseSelectedList.add('Disease Specific Others') : null;


    widget.formEModel?.value.diseaseSpecificPostSurgical?? false ? postPreSelectedList.add('Post-surgical') : null;
    widget.formEModel?.value.diseaseSpecificPostCardiac ?? false ? postPreSelectedList.add('Post cardiac interventional') : null;

    widget.formEModel?.value.intracranialRepair?? false ? postSurgicalSelectedList.add('Intracardiac Repair') : null;
    widget.formEModel?.value.fontan?? false ? deviceClosureSelectedList.add('Fontan') : null;
    widget.formEModel?.value.bDGShunt?? false ? deviceClosureSelectedList.add('BDG Shunt') : null;
    widget.formEModel?.value.bTShunt?? false ? deviceClosureSelectedList.add('BT Shunt') : null;
    widget.formEModel?.value.rVPAConduit?? false ? deviceClosureSelectedList.add('RV-PA Conduit') : null;
    widget.formEModel?.value.arterialSwitch?? false ? deviceClosureSelectedList.add('Arterial Switch') : null;
    widget.formEModel?.value.prostheticValve ?? false ? deviceClosureSelectedList.add('Prosthetic Valve') : null;
    widget.formEModel?.value.postSurgicalOthers ?? false ? postSurgicalSelectedList.add('Others') : null;

    widget.formEModel?.value.deviceClosureASD?? false ? deviceClosureSelectedList.add('ASD') : null;
    widget.formEModel?.value.deviceClosureVSD ?? false ? deviceClosureSelectedList.add('VSD') : null;
    widget.formEModel?.value.deviceClosurePDA ?? false ? deviceClosureSelectedList.add('PDA') : null;

    widget.formEModel?.value.pulmonary ?? false ? postSurgicalSelectedList.add('Pulmonary') : null;
    widget.formEModel?.value.aortic ?? false ? postSurgicalSelectedList.add('Aortic') : null;
    widget.formEModel?.value.mitral ?? false ? postSurgicalSelectedList.add('Mitral') : null;

    widget.formEModel?.value.headache ?? false ? postSurgicalSelectedList.add('Headache') : null;
    widget.formEModel?.value.visualDisturbance ?? false ? postSurgicalSelectedList.add('Visual Disturbance') : null;
    widget.formEModel?.value.dizziness ?? false ? postSurgicalSelectedList.add('Dizziness') : null;
    widget.formEModel?.value.alteredMentalStatus ?? false ? postSurgicalSelectedList.add('Altered Mental Status') : null;
    widget.formEModel?.value.cNSSymptoms ?? false ? postSurgicalSelectedList.add('CNS Symptoms') : null;
    widget.formEModel?.value.arthritis ?? false ? postSurgicalSelectedList.add('Arthritis') : null;
    widget.formEModel?.value.renalDysfunction ?? false ? postSurgicalSelectedList.add('Renal Dysfunction') : null;
    widget.formEModel?.value.cyanosis ?? false ? postSurgicalSelectedList.add('Cyanosis') : null;
    widget.formEModel?.value.bleedingTendency ?? false ? postSurgicalSelectedList.add('Bleeding Tendency') : null;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MText(text: 'FORM E-CONGENITAL HEART DISESASE FORM',),
        Space(),
        MRowTextCheckBox(enabled:widget.enabled,title: 'E1 Disease specific (tick the relevant)',selectedlist: diseaseSelectedList,list: List_items.Disease,result: (val){
          // if(val.contains('Other')){
          //   setState(() {
          //     isOthers = true;
          //   });
          // }else{
          //   setState(() {
          //     isOthers = false;
          //   });
          // }
          val.contains('Atrial Septal Defect') ? widget.formEModel?.value.atrialSeptalDefect = true : widget.formEModel?.value.atrialSeptalDefect = false;
          val.contains('Ventricular Septal Defect') ? widget.formEModel?.value.ventricularSeptalDefect = true : widget.formEModel?.value.ventricularSeptalDefect = false;
          val.contains('Patent Ductus Arteriosus') ? widget.formEModel?.value.patentDuctusArteriosus = true : widget.formEModel?.value.patentDuctusArteriosus = false;
          val.contains('AV Canal Defect') ? widget.formEModel?.value.aVCanalDefect = true : widget.formEModel?.value.aVCanalDefect = false;
          val.contains('AP Window') ? widget.formEModel?.value.aPWindow = true : widget.formEModel?.value.aPWindow = false;
          val.contains('Other L→R shunts') ? widget.formEModel?.value.otherLRShunts = true : widget.formEModel?.value.otherLRShunts = false;
          val.contains('Eisenmenger physiology') ? widget.formEModel?.value.eisenmengerPhysiology = true : widget.formEModel?.value.eisenmengerPhysiology = false;
          val.contains('Valvular Pulmonary Stenosis') ? widget.formEModel?.value.valvularPulmonaryStenosis = true : widget.formEModel?.value.valvularPulmonaryStenosis = false;
          val.contains('Sub-Valvular Pulmonary Stenosis') ? widget.formEModel?.value.subValvularPS = true : widget.formEModel?.value.subValvularPS = false;
          val.contains('Tetralogy of Fallot') ? widget.formEModel?.value.tOF = true : widget.formEModel?.value.tOF = false;
          val.contains('Double Outlet Right Ventricle') ? widget.formEModel?.value.doubleOutletRightVentricle = true : widget.formEModel?.value.doubleOutletRightVentricle = false;
          val.contains('Transposition of Great Arteries') ? widget.formEModel?.value.transpositionOfGreatArteries = true : widget.formEModel?.value.transpositionOfGreatArteries = false;
          val.contains('Corrected Transposition of Great Arteries') ? widget.formEModel?.value.correctedTransposition = true : widget.formEModel?.value.correctedTransposition = false;
          val.contains('Ebstein’s anomaly') ? widget.formEModel?.value.ebsteinAnomaly = true : widget.formEModel?.value.ebsteinAnomaly = false;
          val.contains('Pulmonary Atresia') ? widget.formEModel?.value.pulmonaryAtresia = true : widget.formEModel?.value.pulmonaryAtresia = false;
          val.contains('Truncus Arteriosus')? widget.formEModel?.value.truncusArteriosus = true : widget.formEModel?.value.truncusArteriosus = false;
          val.contains('Single Ventricle')? widget.formEModel?.value.singleVentricle = true : widget.formEModel?.value.singleVentricle = false;
          val.contains('Tricuspid Atresia') ? widget.formEModel?.value.tricuspidAtresia = true : widget.formEModel?.value.tricuspidAtresia = false;
          val.contains('Other') ? widget.formEModel?.value.diseaseSpecificOthers = true : widget.formEModel?.value.diseaseSpecificOthers = false;
          setState(() {});
        }),
      widget.formEModel?.value.diseaseSpecificOthers ?? false ? MrowTextTextFieldWidget(enabled:widget.enabled,title: 'Other Heart Disease – Specify',initialValue: widget.formEModel?.value.diseaseSpecificOthersSpecify, onChanged: (val){
          widget.formEModel?.value.diseaseSpecificOthersSpecify = val;
        },isneedDivider: false): Container(),
      MRowTextCheckBox(enabled:widget.enabled,list: ['Post-surgical','Post cardiac interventional'],selectedlist: postPreSelectedList,isneedDivider: false,result: (val){
          // if(val =='Post-surgical'){
          //   setState(() {
          //     isSurgical = true;
          //     isInterventional = false;
          //   });
          // }else{
          //   setState(() {
          //     isSurgical = false;
          //     isInterventional = true;
          //   });
          // }
          val.contains('Post-surgical') ? widget.formEModel?.value.diseaseSpecificPostSurgical = true : widget.formEModel?.value.diseaseSpecificPostSurgical = false;
          val.contains('Post cardiac interventional') ? widget.formEModel?.value.diseaseSpecificPostCardiac = true : widget.formEModel?.value.diseaseSpecificPostCardiac = false;
          setState(() {});
          },),
      widget.formEModel?.value.diseaseSpecificPostSurgical?? false ?MRowTextCheckBox(title: 'Post-surgical',enabled:widget.enabled,selectedlist: postSurgicalSelectedList,result: (val){
          // if(val.contains('Others')){
          //   setState(() {
          //     isSurgicalOther = true;
          //   });
          // }else{
          //   setState(() {
          //     isSurgicalOther = false;
          //   });
          //
          val.contains('Intracardiac repair') ? widget.formEModel?.value.intracranialRepair = true : widget.formEModel?.value.intracranialRepair = false;
          val.contains('Fontan') ? widget.formEModel?.value.fontan = true : widget.formEModel?.value.fontan = false;
          val.contains('RV-PA Conduit') ? widget.formEModel?.value.rVPAConduit = true : widget.formEModel?.value.rVPAConduit = false;
          val.contains('BDG shunt') ? widget.formEModel?.value.bDGShunt = true : widget.formEModel?.value.bDGShunt = false;
          val.contains('BT Shunt') ? widget.formEModel?.value.bTShunt = true : widget.formEModel?.value.bTShunt = false;
          val.contains('Arterial Switch') ? widget.formEModel?.value.arterialSwitch = true : widget.formEModel?.value.arterialSwitch = false;
          val.contains('Prosthetic Valve') ? widget.formEModel?.value.prostheticValve = true : widget.formEModel?.value.prostheticValve = false;
          val.contains('Others') ? widget.formEModel?.value.postSurgicalOthers = true : widget.formEModel?.value.postSurgicalOthers = false;
        },list: ['Intracardiac repair','Fontan','RV-PA Conduit','BDG shunt','BT Shunt','Arterial Switch','Prosthetic Valve','Others'],): Container(),
      widget.formEModel?.value.postSurgicalOthers ?? false ? MTextField(enabled:widget.enabled,label: 'If Others Specify',initalValue: widget.formEModel?.value.postSurgicalOthersSpecify,onChanged: (val){
        widget.formEModel?.value.postSurgicalOthersSpecify = val;
      }): Container(),
        // isInterventional ?MRowTextCheckBox(enabled:widget.enabled,result: (val){
        //   if(val.contains('Others')){
        //     setState(() {
        //       isInterventionalOther = true;
        //     });
        //   }else{
        //     setState(() {
        //       isInterventionalOther = false;
        //     });
        //   }
        // },list: ['ASD DC','VSD DC','PDA DC','BPV','BAV','Others'],): Container(),
        // isInterventionalOther ? MTextField(enabled:widget.enabled,label: 'If Others Specify',onChanged: (val){}): Container(),
      widget.formEModel?.value.diseaseSpecificPostCardiac?? false ? Column(
        children: [
          MSmallText(text: 'Post cardiac interventional',),
          MRowTextCheckBox(title: 'Device closure ',isneedDivider: false,selectedlist: deviceClosureSelectedList, enabled:widget.enabled,result: (val){
            val.contains('ASD') ? widget.formEModel?.value.deviceClosureASD = true : widget.formEModel?.value.deviceClosureASD = false;
            val.contains('VSD') ? widget.formEModel?.value.deviceClosureVSD = true : widget.formEModel?.value.deviceClosureVSD = false;
            val.contains('PDA') ? widget.formEModel?.value.deviceClosurePDA = true : widget.formEModel?.value.deviceClosurePDA = false;
          },list: ['ASD','VSD','PDA'],),
          MRowTextCheckBox(title: 'Balloon Valvotomy:',isneedDivider: false,selectedlist: balloonSelectedList, enabled:widget.enabled,result: (val){
            val.contains('Pulmonary') ? widget.formEModel?.value.pulmonary = true : widget.formEModel?.value.pulmonary = false;
            val.contains('Aortic') ? widget.formEModel?.value.aortic = true : widget.formEModel?.value.aortic = false;
            val.contains('Mitral') ? widget.formEModel?.value.mitral = true : widget.formEModel?.value.mitral = false;
          },list: ['Pulmonary','Aortic','Mitral'],),
          MTextField(label: 'Others',initalValue: widget.formEModel?.value.postCardiacOthers,onChanged: (val){
            widget.formEModel?.value.postCardiacOthers = val;
          },enabled: widget.enabled,)
        ],
      ): Container(),
        MDivider(),
        Space(),
        MrowTextTextFieldWidget(title: 'Other Heart Disease – Specify:',enabled: widget.enabled,initialValue: widget.formEModel?.value.otherHeartDiseaseSpecify,onChanged: (val){
          widget.formEModel?.value.otherHeartDiseaseSpecify = val;
        },),
        MSmallText(text: 'E2 Clinical findings in the current pregnancy',),
        Space(),
        MRowTextCheckBox(enabled:widget.enabled,title: 'E2.1 Symptoms',selectedlist: symptomsSelectedList,result: (val){
          val.contains('Headache') ? widget.formEModel?.value.headache = true : widget.formEModel?.value.headache = false;
          val.contains('Visual disturbance') ? widget.formEModel?.value.visualDisturbance = true : widget.formEModel?.value.visualDisturbance = false;
          val.contains('Dizziness') ? widget.formEModel?.value.dizziness = true : widget.formEModel?.value.dizziness = false;
          val.contains('Altered mental status') ? widget.formEModel?.value.alteredMentalStatus = true : widget.formEModel?.value.alteredMentalStatus = false;
          val.contains('CNS symptoms') ? widget.formEModel?.value.cNSSymptoms = true : widget.formEModel?.value.cNSSymptoms = false;
          val.contains('Arthritis') ? widget.formEModel?.value.arthritis = true : widget.formEModel?.value.arthritis = false;
          val.contains('Renal dysfunction') ? widget.formEModel?.value.renalDysfunction = true : widget.formEModel?.value.renalDysfunction = false;
          val.contains('Cyanosis') ? widget.formEModel?.value.cyanosis = true : widget.formEModel?.value.cyanosis = false;
          val.contains('Bleeding tendency') ? widget.formEModel?.value.bleedingTendency = true : widget.formEModel?.value.bleedingTendency = false;

        },list: ['Headache','Visual disturbance','Dizziness','Altered mental status','CNS symptoms','Arthritis','Renal dysfunction','Cyanosis','Bleeding tendency'],),
        // MRowTextRadioWidget(enabled:widget.enabled,title: 'E2.2 Polycythemia',onChanged: (val){},),
        // MRowTextRadioWidget(enabled:widget.enabled,title: 'E2.3 Anemia',onChanged: (val){},),
        MSmallText(text: 'E2.2 SPo2 (%) all four limbs :',),
        Space(),
        MTextField(enabled:widget.enabled,label: 'RUL: ',initalValue: widget.formEModel?.value.spO2RUL.toString(),onChanged: (val){
          widget.formEModel?.value.spO2RUL = int.parse(val);
        },type: MInputType.numeric,),
      MTextField(enabled:widget.enabled,label: 'LUL: ',initalValue: widget.formEModel?.value.spO2LUL.toString(),onChanged: (val){
        widget.formEModel?.value.spO2LUL = int.parse(val);
      },type: MInputType.numeric,),
        MTextField(enabled:widget.enabled,label: 'RLL: ',initalValue: widget.formEModel?.value.fourLimbsRUL.toString(),onChanged: (val){
          widget.formEModel?.value.fourLimbsRUL = int.parse(val);
        },type: MInputType.numeric,),
        MTextField(enabled:widget.enabled,label: 'LLL: ',initalValue:   widget.formEModel?.value.fourLimbsLUL.toString(),onChanged: (val){
          widget.formEModel?.value.fourLimbsLUL = int.parse(val);
        },type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled:widget.enabled,title: 'E2.3 Hematocrit (%) ',initialValue: widget.formEModel?.value.hematocrit.toString(),type: MInputType.numeric,onChanged: (val){
          widget.formEModel?.value.hematocrit = int.parse(val);
        },),
        MrowTextTextFieldWidget(enabled:widget.enabled,title: 'E2.4  Serum Ferritin (ng/ml): ',initialValue: widget.formEModel?.value.serumFerritin.toString(),type: MInputType.numeric,onChanged: (val){
          widget.formEModel?.value.serumFerritin = int.parse(val);
        },),
        MrowTextTextFieldWidget(enabled:widget.enabled,title: 'E3 Any other relevant information/ remarks: ',initialValue: widget.formEModel?.value.anyOtherRelevantInformation,onChanged: (val){
          widget.formEModel?.value.anyOtherRelevantInformation = val;
        },),
       // MFilledButton(text: 'Submit',onPressed: (){ context.push(Routes.Home);},)
      ],);
  }
}
