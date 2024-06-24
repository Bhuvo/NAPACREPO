import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'L. POST PARTUM VISIT PAGE FIRST POST PARTUM VISIT (6 WEEKS) (FORM L)',),

      body: MFormBody(Childrens: [
        MRowTextRadioWidget(title: 'L1. NYHA SYMPTOMS CLASS:',onChanged: (val){},options: List_items.NYHAClass,),
        MSmallText(text: 'L2. CLINICAL SIGNS & ECG',),
        Space(),
        MrowTextTextFieldWidget(title: 'L2.1 Weight (Kg):',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(title: 'L2.2 HR (/min): ',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(title: 'L2.3 SPO2 (%): ',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(title: 'L2.4 BP (mm Hg): ',onChanged: (val){},type: MInputType.numeric,),
        MRowTextRadioWidget(title: 'L2.5 CCF: ',onChanged: (val){},),
        MRowTextRadioWidget(title: 'L2.6 Cyanosis:  ',onChanged: (val){},),
        MRowTextRadioWidget(title: 'L2.7 Cardiac murmur:',onChanged: (val){},),
        MrowTextDatePickerWidget(title: 'L2.8 ECG Date:',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(options:List_items.NormalAbnormal ,onChanged: (val){},),
        MSmallText(text: 'L3 ECHOCARDIOGRAPHIC ASSESSMENT',),
        Space(),
        MSmallText(text: 'Ventricular function ',),
        Space(),
        MRowTextRadioWidget(title: 'Wall Motion', options: List_items.NormalAbnormal,isneedDivider: false,onChanged: (val){
          if(val == 'Abnormal'){
            setState(() {
              isWallAbnormal = true;
            });
          }else{
            setState(() {
              isWallAbnormal = false;
            });
          }
        },),
        isWallAbnormal?MRowTextCheckBox(list: ['Hypo / akinesia','Global','Regional'],): Container(),
        MDivider(),
        MSmallText(text: 'LV systolic function',),
        Space(),
        MrowTextTextFieldWidget(title: 'LVID Diastole(mm): ',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(title: 'LVID Systole(mm) ',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(title: 'EF% : ',onChanged: (val){},type: MInputType.numeric,),
        MSmallText(text: 'Pulmonary pressures',),
        Space(),
        MrowTextTextFieldWidget(title: 'Tricuspid regurgitation TRPG (mmHg):',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(title: 'Pulmonary regurgitation Peak PR (mmHg):',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(title: 'PAT(ms)',onChanged: (val){},type: MInputType.numeric,),
        MRowTextRadioWidget(title: 'RV systolic function ',options: List_items.NormalAbnormal,isneedDivider: false,),
        isRVAbnormal? MTextField(label: 'TAPSE (mm)',onChanged: (val){},): Container(),
        isRVAbnormal? MTextField(label: 'Sa’',onChanged: (val){},): Container(),

        MText(text: 'Valve function',),
        Space(),
        ValueFunction(title: 'Mitral',isMVOA: true,MVOA: (val){},radioValue: (val){},MG: (val){},PG: (val){},checkboxValue: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},),
        ValueFunction(title: 'Aortic',isMVOA: false,radioValue: (val){},MG: (val){},PG: (val){},checkboxValue: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},),
        ValueFunction(title: 'Tricuspid',isMVOA: false,radioValue: (val){},MG: (val){},PG: (val){},checkboxValue: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},),
        ValueFunction(title: 'Pulmonary',isMVOA: false,radioValue: (val){},MG: (val){},PG: (val){},checkboxValue: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},),
        MRowTextRadioWidget(title: 'Pericardial effusion ',onChanged: (val){},options: ['Mild','Moderate','Massive','Tamponade','Others'],isneedDivider: false,),
        isOthers? MRowTextCheckBox(title: 'Others',list: ['Vegetation','Thrombus'],isneedDivider: false): Container(),
        MDivider(),
        MrowTextTextFieldWidget(title: 'Other salient echo details (if any):',onChanged: (val){},),
        //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormL2);},)
        FormL2(),
      ],),
    );
  }
}
