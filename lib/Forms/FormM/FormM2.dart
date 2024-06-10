import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormL/widget/ValueFunction.dart';
import 'package:npac/app/export.dart';

class FormM2 extends StatefulWidget {
  const FormM2({super.key});

  @override
  State<FormM2> createState() => _FormM2State();
}

class _FormM2State extends State<FormM2> {
  bool isWallAbnormal = false;
  bool isRVAbnormal = false;
  bool isOthers = false;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'M. POST PARTUM VISIT PAGE',),
      body: MFormBody(Childrens: [
        MText(text: 'M8 ECHOCARDIOGRAPHIC ASSESSMENT',),
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
        isOthers? MRowTextCheckBox(title: 'Others',list: ['Vegetation','Thrombus'],isneedDivider: false,): Container(),
        MDivider(),
        MrowTextTextFieldWidget(title: 'Other salient echo details (if any):',onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'M9. Any other comments:',onChanged: (val){},),
        MFilledButton(text: 'Submit',onPressed: (){ context.push(Routes.Home);},)
      ],),
    );
  }
}
