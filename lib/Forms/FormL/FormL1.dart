import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Forms/FormL/FormL2.dart';
import 'package:npac/Forms/FormL/widget/ValueFunction.dart';
import 'package:npac/app/export.dart';

class FormL1 extends StatefulWidget {
  const FormL1({super.key});

  @override
  State<FormL1> createState() => _FormL1State();
}

class _FormL1State extends State<FormL1> {
  bool isWallAbnormal = false;
  bool isRVAbnormal = false;
  bool isOthers = false;
  bool isEnabled = false;
  bool ecgAbnormal = false;
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'L. POST PARTUM VISIT PAGE FIRST POST PARTUM VISIT (6 WEEKS) (FORM L)',),

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
        MrowTextDatePickerWidget(enabled: isEnabled,title: 'Date of visit',onChanged: (val){},),
        MRowTextRadioWidget(enabled: isEnabled,title: 'L1. NYHA SYMPTOMS CLASS:',onChanged: (val){},options: List_items.NYHAClass,),
        MSmallText(text: 'L2. CLINICAL SIGNS & ECG',),
        Space(),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'L2.1 Weight (Kg):',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'L2.2 HR (/min): ',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'L2.3 SPO2 (%): ',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'L2.4 BP (mm Hg): ',onChanged: (val){},type: MInputType.numeric,),
        MRowTextRadioWidget(enabled: isEnabled,title: 'L2.5 Heart failure: ',onChanged: (val){},),
        MRowTextRadioWidget(enabled: isEnabled,title: 'L2.6 Cyanosis:  ',onChanged: (val){},),
        MRowTextRadioWidget(enabled: isEnabled,title: 'L2.7 Cardiac murmur:',onChanged: (val){},),
        MrowTextDatePickerWidget(enabled: isEnabled,title: 'L2.8 ECG Date:',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: isEnabled,options:List_items.NormalAbnormal ,onChanged: (val){
          val == 'Abnormal' ? ecgAbnormal = true : ecgAbnormal =false;
          setState(() {});
        },),
        ecgAbnormal?  MFilledButton(text: 'Upload ECG',onPressed: (){},): Container(),
        MSmallText(text: 'L3 ECHOCARDIOGRAPHIC ASSESSMENT',),
        Space(),
        MSmallText(text: 'Ventricular function ',),
        Space(),
        MRowTextRadioWidget(enabled: isEnabled,title: 'Wall Motion', options: ['Normal','Hypokinesia','Akinesia'],isneedDivider: false,onChanged: (val){
          if(val != 'Normal'){
            setState(() {
              isWallAbnormal = true;
            });
          }else{
            setState(() {
              isWallAbnormal = false;
            });
          }
        },),
        isWallAbnormal?MRowTextCheckBox(enabled: isEnabled,list: ['Global','Regional'],): Container(),
        MDivider(),
        MSmallText(text: 'LV systolic function',),
        Space(),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Diastole(mm): ',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Systole(mm) ',onChanged: (val){},type: MInputType.numeric,isneedDivider: false),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'EF% : ',onChanged: (val){},type: MInputType.numeric,),
        MSmallText(text: 'Pulmonary pressures',),
        Space(),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'Tricuspid regurgitation TRPG (mmHg):',onChanged: (val){},isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'Pulmonary regurgitation Peak PR (mmHg):',onChanged: (val){},isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'PAT(ms)',onChanged: (val){},type: MInputType.numeric,),
        MRowTextRadioWidget(enabled: isEnabled,title: 'RV systolic function ',options: List_items.NormalAbnormal,isneedDivider: false,),
        isRVAbnormal? MTextField(enabled: isEnabled,label: 'TAPSE (mm)',onChanged: (val){},): Container(),
        isRVAbnormal? MTextField(enabled: isEnabled,label: 'Sa’',onChanged: (val){},): Container(),

        MText(text: 'Valve function',),
        Space(),
        ValueFunction(enabled: isEnabled,title: 'Mitral',isMVOA: true,MVOA: (val){},radioValue: (val){},MG: (val){},PG: (val){},checkboxValue: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},),
        ValueFunction(enabled: isEnabled,title: 'Aortic',isMVOA: false,radioValue: (val){},MG: (val){},PG: (val){},checkboxValue: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},),
        ValueFunction(enabled: isEnabled,title: 'Tricuspid',isMVOA: false,radioValue: (val){},MG: (val){},PG: (val){},checkboxValue: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},),
        ValueFunction(enabled: isEnabled,title: 'Pulmonary',isMVOA: false,radioValue: (val){},MG: (val){},PG: (val){},checkboxValue: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},),
        MRowTextRadioWidget(enabled: isEnabled,title: 'Pericardial effusion ',onChanged: (val){},options: ['Mild','Moderate','Massive','Tamponade','Others'],isneedDivider: false,),
        isOthers? MRowTextCheckBox(enabled: isEnabled,title: 'Others',list: ['Vegetation','Thrombus'],isneedDivider: false): Container(),
        MDivider(),
        MrowTextTextFieldWidget(enabled: isEnabled,title: 'Other salient echo details (if any):',onChanged: (val){},),
        //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormL2);},)
        FormL2(enabled: isEnabled,),
        MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},)

      ],),
    );
  }
}
