import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Forms/FormD/widget/valueFunctioin.dart';
import 'package:npac/app/export.dart';

class FormD3 extends StatefulWidget {
  const FormD3({super.key});

  @override
  State<FormD3> createState() => _FormD3State();
}

class _FormD3State extends State<FormD3> {

  bool isEffusion = false;
  bool isMitralStenotic = false;
  bool isMitralRegurgitant = false;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MAppBar(title: 'D. FIRST VISIT PAGE (FORM D)',)),

      body: MFormBody(
        Childrens: [
          MRowTextRadioWidget(onChanged: (val){},options: List_items.NormalAbnormal,title: 'D6 ECHOCARDIOGRAPHIC ASSESSMENT',),
          Text('D6.1 Chamber description'),
          Space(),
          MRowTextRadioWidget(onChanged: (val){},title: 'LA',options:List_items.NormalDilated,isneedDivider: false,),
          MRowTextRadioWidget(onChanged: (val){},title: 'RA',options:List_items.NormalDilated,isneedDivider: false,),
          MRowTextRadioWidget(onChanged: (val){},title: 'LV',options:List_items.NormalDilatedHypertrophic,isneedDivider: false,),
          MRowTextRadioWidget(onChanged: (val){},title: 'RV',options:List_items.NormalDilatedHypertrophic,isneedDivider: false,),
          MDivider(),
          MRowTextRadioWidget(onChanged: (val){},title: 'LV wall motion ',options: ['Normal','Global Hypokinesia','RWMA'],),
          Text('LV systolic function'),
          Space(),
          MrowTextTextFieldWidget( onChanged: (val){},title: 'Systole (mm): ',isneedDivider: false,type: MInputType.numeric,),
          MrowTextTextFieldWidget( onChanged: (val){},title: 'Diastole(mm):',isneedDivider: false,type: MInputType.numeric,),
          MrowTextTextFieldWidget( onChanged: (val){},title: '^EF (%):' ,isneedDivider: false,type: MInputType.numeric,),
          MRowTextRadioWidget(onChanged: (val){},options: ['Normal','Reduced ^'],title: '',),
          Text('RV systolic function'),
          Space(),
          MRowTextRadioWidget(onChanged: (val){},options:['Normal','Reduced'],title: '',isneedDivider: false,),
          MrowTextTextFieldWidget( onChanged: (val){},title: 'TAPSE (mm)',type: MInputType.numeric,),
          Space(),
          MRowTextRadioWidget(title: 'Mitral',onChanged: (val ){},options: ['Native','Prosthetic'] ,isneedDivider: false,),
          MRowTextRadioWidget(onChanged: (val ){},options: List_items.NormalAbnormal ,isneedDivider: false,),
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
            },isneedDivider:false,),
          isMitralStenotic ?  MRowTextRadioWidget(onChanged: (val ){},options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
          isMitralStenotic ?  MrowTextTextFieldWidget(title: 'MVOA (cm2) ',onChanged: (val ){},isneedDivider: false,) : Container(),
          isMitralStenotic ? MSmallText(text: 'MV Gradient:',):Container(),
          isMitralStenotic ? Space():Container(),
          isMitralStenotic ?  MrowTextTextFieldWidget(title: 'MG',onChanged: (val ){},isneedDivider: false,) : Container(),
          isMitralStenotic ?  MrowTextTextFieldWidget(title: 'PG',onChanged: (val ){},isneedDivider: false,) : Container(),
          isMitralRegurgitant ?  MRowTextRadioWidget(title: 'Regurgitant',onChanged: (val ){},options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),

          ValueFunction(title: 'Aortic',isVelocity: true,checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
          ValueFunction(title: 'Tricuspid',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
          ValueFunction(title: 'Pulmonary',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
          MDivider(),
          Space(),
          Text('D6.4 Pulmonary pressures/ Pulmonary hypotension:'),
          Space(),
          MrowTextTextFieldWidget( onChanged: (val){},title: 'Tricuspid regurgitation-TRPG (mmHg):',type: MInputType.numeric,),
          MrowTextTextFieldWidget( onChanged: (val){},title: 'PAT in msec:',type: MInputType.numeric,),
          MrowTextTextFieldWidget( onChanged: (val){},title: 'Estimated RA Pressure(mmHg):',type: MInputType.numeric,),
          MrowTextTextFieldWidget( onChanged: (val){},title: 'Pulmonary regutgitation-Peak PR (mmHg):',type: MInputType.numeric,),
          MRowTextRadioWidget(onChanged: (val){},title: 'Pulmonary Hypertension:',options: ['Nil', 'Mild','Moderate','Severe','Could not be estimated'],),
          MRowTextRadioWidget(onChanged: (val){if(val =='Effusion') { setState(() { isEffusion = true; }); }else{ setState(() { isEffusion = false; });}},title: 'D6.5 Pericardium',options: ['Normal', 'Thickened','Effusion'],),
          isEffusion ?MRowTextRadioWidget(onChanged: (val){},title: 'Effusion',options: ['Mild', 'Moderate','Severe'],): Container(),
          MRowTextRadioWidget(onChanged: (val){},title: 'D6.6 Aorta',options: List_items.NormalAbnormal,),
          MRowTextRadioWidget(onChanged: (val){},title: 'l D6.7 Others: ',options: ['Normal', 'Slight','Moderate','Severe'],),
          MrowTextTextFieldWidget( onChanged: (val){},title: 'D6.8 Any other salient features (please mention below):',),
          MFilledButton(text: 'Next', onPressed: (){context.push(Routes.FormD4);},),
        ],) ,
    );
  }
}
