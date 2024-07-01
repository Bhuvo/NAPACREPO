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


  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'K. PERIPARTUM VISIT PAGE (FORM K)',),

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
        Space(),
        MrowTextDatePickerWidget(title: 'K1 Date of Admission:',onChanged: (val){},),
        MrowTextDatePickerWidget(title: 'K2 Date of Discharge:',onChanged: (val){},),
        MRowTextRadioWidget(title: 'K3 NYHA SYMPTOMS CLASS:',onChanged: (val){},options:List_items.NYHAClass),
        MRowTextRadioWidget(title: 'K4 RISK ASSESSMENT AND TRIAGE: mWHO risk:',onChanged: (val){},options:List_items.MWHORisk),
        MSmallText(text: 'K4 CLINICAL SIGNS & ECG',),
        Space(),
        MrowTextTextFieldWidget( title: 'K4.1 Weight (Kg):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget( title: 'K4.2 HR (/min):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget( title: 'K4.3 SPO2 (%):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget( title: 'K4.4 BP (mm Hg):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: 'K4.5 CCF:',isneedDivider: false,onChanged: (val){},),
        MRowTextRadioWidget(title: 'K4.6 Cyanosis:',isneedDivider: false,onChanged: (val){},),
        MRowTextRadioWidget(title: 'K4.7 Cardiac murmur:',onChanged: (val){},),
        MrowTextDatePickerWidget(title: 'K5 ECG Date:',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(options:List_items.NormalAbnormal ,onChanged: (val){},),
        MSmallText(text:'K6 ECHOCARDIOGRAPHIC ASSESSMENT'),
        Space(),
        MRowTextRadioWidget(title: 'Any significant change from previous echo',onChanged: (val){},),
        MText(text: 'Ventricular Function',),
        Space(),
        MRowTextRadioWidget(title: 'Wall Motion:',onChanged: (val){},isneedDivider: false,options: ['Normal','Hypo / akinesia'],),
        MRowTextCheckBox(list: ['Global','Regional'],result: (val){},),
        Space(),
        MSmallText(text: 'LV systolic function',),
        Space(),
        MrowTextTextFieldWidget(title: 'LVID Diastole(mm):',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'LVID Systole(mm):',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'EF%:',onChanged: (val){},type: MInputType.numeric),
        Space(),
        MSmallText(text: 'RV systolic function',),
        Space(),
        MRowTextRadioWidget(options: List_items.NormalAbnormal ,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'TAPSE (mm)',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'Sa’',onChanged: (val){},type: MInputType.numeric),
        MRowTextRadioWidget(title: 'Pericardial effusion',onChanged: (val){},options: ['Mild','Moderate','Massive','Tamponade'],),
        MRowTextCheckBox(title: 'Others ',list: ['Vegetations','Thrombus'],),
        MrowTextTextFieldWidget(title: 'Any other salient Echo Findings:',onChanged: (val){},),
        MText(text: 'Pulmonary Pressure',),
        Space(),
        // MrowTextTextFieldWidget(title: 'Tricuspid regurgitation ',onChanged: (val){},isneedDivider: false,),
        // MrowTextTextFieldWidget(title: 'Pulmonary regurgitation ',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'TRPG (mmHg):',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'Peak PR (mmHg):',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'PAT(msec)',onChanged: (val){},),
        MText(text: 'VALVE FUNCTION',),
        Space(),
        MRowTextRadioWidget(title: 'Mitral',onChanged: (val ){
          val =='Abnormal' ? isMitralAbNormal = true : isMitralAbNormal = false;
          setState(() {});
        },options:List_items.NormalAbnormal,isneedDivider: false,),
        isMitralAbNormal? Column(children: [
          MRowTextCheckBox(list: List_items.ValuFunction,
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
          isMitralStenotic ?  MRowTextRadioWidget(title: 'Tricuspid',onChanged: (val ){},options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
          isMitralStenotic ?  MrowTextTextFieldWidget(title: 'MVOA (cm2) ',onChanged: (val ){},isneedDivider: false,) : Container(),
          isMitralRegurgitant ?  MRowTextRadioWidget(title: 'Regurgitant',onChanged: (val ){},options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
          isMitralStenotic ||isMitralRegurgitant ? MDivider(): Container(),
        ],): Container(),
        Space(),
        ValueFunction(enabled: true,gradient:'AV Gradient (mm of Hg)',title: 'Aortic',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
        MDivider(),
        ValueFunction(title: 'Tricuspid',gradient:'TV Gradient (mm of Hg)',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
        MDivider(),
        ValueFunction(title: 'Pulmonary',gradient:'PV Gradient (mm of Hg)',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
        MDivider(),
        // MRowTextRadioWidget(title: 'G4. Any outcome identified in this visit:',onChanged: (val){},),
       // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH2);},)
        FormH2(enable: isEnabled,),
         FormH3(enabled: isEnabled,),
         FormH4(enabled: isEnabled,),
         FormH5(enabled: isEnabled),
         FormH6(enabled: isEnabled),
         FormH7(enabled: isEnabled),
        MFilledButton(text: 'submit',onPressed: (){context.push(Routes.Home);},)
      ],),
    );
  }
}
