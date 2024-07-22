import 'package:flutter/material.dart';
import 'package:npac/Forms/FormF/widget/ValueFunction.dart';
import 'package:npac/Forms/FormH/FormH2.dart';
import 'package:npac/Forms/FormH/FormH3.dart';
import 'package:npac/Forms/FormH/FormH4.dart';
import 'package:npac/Forms/FormH/FormH5.dart';
import 'package:npac/Forms/FormH/FormH6.dart';
import 'package:npac/Forms/FormH/FormH7.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/navigator_utils.dart';

class FormH1 extends StatefulWidget {
  const FormH1({super.key});

  @override
  State<FormH1> createState() => _FormH1State();
}

class _FormH1State extends State<FormH1> {

  bool isEnabled = false;

  bool isMitralStenotic = false;
  bool isMitralRegurgitant = false;
  bool isMitralAbNormal = false;
  bool ecgAbnormal = false;
  bool isAssignment = false;


  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'Hospitalization for Delivery (Intrapartum and Immediate Postpartum Details)',),

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
        FormH3(enabled: isEnabled,),
        Space(),
        MrowTextDatePickerWidget(enabled: isEnabled,title: 'K1 Date of Admission:',onChanged: (val){},),
        MrowTextDatePickerWidget(enabled: isEnabled,title: 'K2 Date of Discharge:',onChanged: (val){},),
        MRowTextRadioWidget(enabled: isEnabled,title: 'K3.1 NYHA SYMPTOMS CLASS:',onChanged: (val){},options:List_items.NYHAClass),
        MRowTextRadioWidget(enabled: isEnabled,title: 'K3.2 RISK ASSESSMENT AND TRIAGE: mWHO risk:',onChanged: (val){},options:List_items.MWHORisk),
        MSmallText(text: 'K4 CLINICAL SIGNS & ECG',),
        Space(),
        MrowTextTextFieldWidget(enabled: isEnabled, title: 'K4.1 Weight (Kg):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget( enabled: isEnabled,title: 'K4.2 HR (/min):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget( enabled: isEnabled,title: 'K4.3 SPO2 (%):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget( enabled: isEnabled,title: 'K4.4 BP (mm Hg):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: isEnabled,title: 'K4.5 CCF:',isneedDivider: false,onChanged: (val){},),
        MRowTextRadioWidget(enabled: isEnabled,title: 'K4.6 Cyanosis:',isneedDivider: false,onChanged: (val){},),
        MRowTextRadioWidget(enabled: isEnabled,title: 'K4.7 Cardiac murmur:',onChanged: (val){},),
        MrowTextDatePickerWidget(enabled: isEnabled,title: 'K5 ECG Date:',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: isEnabled,options:List_items.NormalAbnormal ,onChanged: (val){
          val =='Abnormal' ? ecgAbnormal = true : ecgAbnormal = false;
          setState(() {});
        },isneedDivider: false,),
        ecgAbnormal ? MFilledButton(text: 'Upload ECG',onPressed: (){},) : Container(),
        Space(),
        MDivider(),
        Space(),
        MSmallText(text:'K6 ECHOCARDIOGRAPHIC ASSESSMENT'),
        // Space(),
        MRowTextRadioWidget(enabled: isEnabled,title: 'Any significant change from previous echo',onChanged: (val){
          val =='Yes' ? isAssignment = true : isAssignment  = false;
          setState(() {});
        },),
        MText(text: 'Ventricular Function',),
        Space(),
        MRowTextRadioWidget(enabled: isEnabled,title: 'Wall Motion:',onChanged: (val){},isneedDivider: false,options: ['Normal','Hypo / akinesia'],),
        MRowTextCheckBox(enabled: isEnabled,list: ['Global','Regional'],result: (val){},),
        Space(),
        MSmallText(text: 'LV systolic function',),
        Space(),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Diastole(mm):',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Systole(mm):',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'EF%:',onChanged: (val){},type: MInputType.numeric),
        Space(),
        MSmallText(text: 'RV systolic function',),
        Space(),
        MRowTextRadioWidget(enabled: isEnabled,options: List_items.NormalAbnormal ,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'TAPSE (mm)',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'Sa’',onChanged: (val){},type: MInputType.numeric),
        MRowTextRadioWidget(enabled: isEnabled,title: 'Pericardial effusion',onChanged: (val){},options: ['Mild','Moderate','Massive','Tamponade'],),
        MRowTextCheckBox(enabled: isEnabled,title: 'Others ',list: ['Vegetations','Thrombus'],),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'Any other salient Echo Findings:',onChanged: (val){},),
        MText(text: 'Pulmonary Pressure',),
        Space(),
        // MrowTextTextFieldWidget(title: 'Tricuspid regurgitation ',onChanged: (val){},isneedDivider: false,),
        // MrowTextTextFieldWidget(title: 'Pulmonary regurgitation ',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'TRPG (mmHg):',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'Peak PR (mmHg):',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'PAT(msec)',onChanged: (val){},),
        MText(text: 'VALVE FUNCTION',),
        Space(),
        MRowTextRadioWidget(enabled: isEnabled,title: 'Mitral',onChanged: (val ){
          val =='Abnormal' ? isMitralAbNormal = true : isMitralAbNormal = false;
          setState(() {});
        },options:List_items.NormalAbnormal,isneedDivider: false,),
        isMitralAbNormal? Column(children: [
          MRowTextCheckBox(enabled: isEnabled,list: List_items.ValuFunction,
            result: (val){
              if(val.contains('Stenotic')){
                setState(() {
                  isMitralStenotic = true;
                });
              }else{
                setState(() {
                  isMitralStenotic = false;
                });
              }
              if(val.contains('Regurgitant')){
                setState(() {
                  isMitralRegurgitant = true;
                });
              }else{
                setState(() {
                  isMitralRegurgitant = false;
                });
              }
            },isneedDivider: isMitralStenotic ||isMitralRegurgitant ?false  : true,),
          isMitralStenotic ? MSmallText(text: 'MV Gradient (mm of Hg):',): Container(),
          isMitralStenotic ?  MRowTextRadioWidget(enabled: isEnabled,title: 'Tricuspid',onChanged: (val ){},options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
          isMitralStenotic ?  MrowTextTextFieldWidget(enabled: isEnabled,title: 'MVOA (cm2) ',onChanged: (val ){},isneedDivider: false,) : Container(),
          isMitralRegurgitant ?  MRowTextRadioWidget(enabled: isEnabled,title: 'Regurgitant',onChanged: (val ){},options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
          isMitralStenotic ||isMitralRegurgitant ? MDivider(): Container(),
        ],): Container(),
        Space(),
        ValueFunction(enabled: isEnabled,gradient:'AV Gradient (mm of Hg)',title: 'Aortic',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
        MDivider(),
        ValueFunction(enabled: isEnabled,title: 'Tricuspid',gradient:'TV Gradient (mm of Hg)',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
        MDivider(),
        ValueFunction(enabled: isEnabled,title: 'Pulmonary',gradient:'PV Gradient (mm of Hg)',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
        MDivider(),
        // MRowTextRadioWidget(title: 'G4. Any outcome identified in this visit:',onChanged: (val){},),
       // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH2);},)
        FormH2(enable: isEnabled,),
         FormH3(enabled: isEnabled,),
         FormH4(enabled: isEnabled,),
         FormH5(enabled: isEnabled),
         FormH6(enabled: isEnabled),
         FormH7(enabled: isEnabled),
        MFilledButton(key:ValueKey('value $isEnabled}'),text:isEnabled ? 'Save' : 'Edit',onPressed: (){
          setState(() {
            isEnabled = !isEnabled;
          });
        },),
        Space(),
        MFilledButton(text: 'Save & Continue',onPressed: ()  {
          setState(() {
            isEnabled = !isEnabled;
          });
          context.push(Routes.FormL1);
        },),
        Space(),

      ],),
    );
  }
}
