import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Forms/FormD/FormD4.dart';
import 'package:npac/Forms/FormD/FormD6.dart';
import 'package:npac/Forms/FormD/FormD7.dart';
import 'package:npac/Forms/FormD/widget/valueFunctioin.dart';
import 'package:npac/Forms/FormL/FormL1.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MSmallText.dart';

class FormD3 extends StatefulWidget {
  final bool? enabled;
  final Function(bool)? isMitralProsthetic;
  final Function(bool)? isAorticProsthetic;
  final Function(bool)? isTricuspidProsthetic;
  final Function(bool)? isPulmonaryProsthetic;
  final Function(bool)? isAortaAbnormal;
  const FormD3({super.key, this.enabled, this.isMitralProsthetic, this.isAorticProsthetic, this.isTricuspidProsthetic, this.isPulmonaryProsthetic, this.isAortaAbnormal});

  @override
  State<FormD3> createState() => _FormD3State();
}

class _FormD3State extends State<FormD3> {


  bool isOthers = false;
  bool isEffusion = false;
  bool isMitralStenotic = false;
  bool isMitralRegurgitant = false;
  bool isValueFunctionNormal = true;
  bool isNative = false;
  bool isabnormal = false;

  bool isMitralProsthetic = false;
  bool isAorticProsthetic = false;
  bool isTricuspidProsthetic = false;
  bool isPulmonaryProsthetic = false;
  bool isAortaAbnormal = false;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},options: List_items.NormalAbnormal,title: 'D6 ECHOCARDIOGRAPHIC ASSESSMENT',),
          MSmallText(text: 'D6.1 Chamber description'),
          Space(),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},title: 'LA',options:List_items.NormalDilated,isneedDivider: false,),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},title: 'RA',options:List_items.NormalDilated,isneedDivider: false,),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},title: 'LV',options:List_items.NormalDilatedHypertrophic,isneedDivider: false,),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},title: 'RV',options:List_items.NormalDilatedHypertrophic,isneedDivider: false,),
          MDivider(),
          MSmallText(text: 'D6.2 Ventricular function',),
        Space(),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},title: 'LV wall motion ',options: ['Normal','Global Hypokinesia','RWMA'],),
          MSmallText(text: 'LV systolic function',),
          Space(),
        MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},options: ['Normal','Reduced'],title: '',isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){},title: 'Systole (mm): ',isneedDivider: false,type: MInputType.numeric,),
          MrowTextTextFieldWidget( enabled: widget.enabled,onChanged: (val){},title: 'Diastole(mm):',isneedDivider: false,type: MInputType.numeric,),
          MrowTextTextFieldWidget( enabled: widget.enabled,onChanged: (val){},title: 'EF (%):' ,type: MInputType.numeric,),
          MSmallText(text: 'RV systolic function',),
          Space(),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},options:['Normal','Reduced'],title: '',isneedDivider: false,),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){},title: 'TAPSE (mm)',type: MInputType.numeric,isneedDivider: false,),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){},title: 'RV S (cm/sec)',type: MInputType.numeric,isneedDivider: false,),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){},title: 'RV FAC (%)',type: MInputType.numeric,),
          Space(),
          MRowTextRadioWidget(enabled: widget.enabled,title: 'D6.3 Valve: Morphology and Function ',isneedDivider: false,onChanged: (val){
            setState(() {
              val == 'Normal' ? isValueFunctionNormal = true : isValueFunctionNormal = false;
            });
          },options: List_items.NormalAbnormal,),
        !isValueFunctionNormal ?Column(children: [
           MRowTextRadioWidget(enabled: widget.enabled,title: 'Mitral',onChanged: (val ){
             val == 'Native' ? isNative = true : isNative = false;
             val == 'Prosthetic' ? isMitralProsthetic = true : isMitralProsthetic = false;
             widget.isMitralProsthetic?.call(isMitralProsthetic);
             setState(() {});
           },options: ['Native','Prosthetic'] ,isneedDivider: false,),
          isNative ? MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val ){
            val == 'Abnormal' ? isabnormal = true : isabnormal = false;
            setState(() {});
          },options: List_items.NormalAbnormal ,isneedDivider: false,) : Container(),
          isabnormal? MRowTextCheckBox(enabled: widget.enabled,list: List_items.ValuFunction,
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
             },isneedDivider:false,): Container(),
           isMitralStenotic ?  MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val ){},options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
           isMitralStenotic ?  MrowTextTextFieldWidget(enabled: widget.enabled,title: 'MVOA (cm2) ',onChanged: (val ){},isneedDivider: false,) : Container(),
           isMitralStenotic ? MSmallText(text: 'MV Gradient (mm of Hg):',):Container(),
           isMitralStenotic ? Space():Container(),
           isMitralStenotic ?  MrowTextTextFieldWidget(enabled: widget.enabled,title: 'MG',onChanged: (val ){},isneedDivider: false,) : Container(),
           isMitralStenotic ?  MrowTextTextFieldWidget(enabled: widget.enabled,title: 'PG',onChanged: (val ){},isneedDivider: false,) : Container(),
           isMitralRegurgitant ?  MRowTextRadioWidget(enabled: widget.enabled,title: 'Regurgitant',onChanged: (val ){},options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
           MDivider(),
           ValueFunction(enabled: widget.enabled,title: 'Aortic',gradient: 'AV Gradient (mm of Hg):',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){
             val =='Prosthetic'?isAorticProsthetic = true:isAorticProsthetic = false;
             widget.isAorticProsthetic?.call(isAorticProsthetic);
             setState(() {});
           },),
          MDivider(),
          ValueFunction(enabled: widget.enabled,title: 'Tricuspid',gradient: 'TV Gradient:',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){
            val =='Prosthetic'?isTricuspidProsthetic = true:isTricuspidProsthetic = false;
            widget.isTricuspidProsthetic?.call(isTricuspidProsthetic);
            setState(() {});
          },),
          MDivider(),
           ValueFunction(enabled: widget.enabled,title: 'Pulmonary',gradient: 'PV Gradient:',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){
             val =='Prosthetic'? isPulmonaryProsthetic = true:isPulmonaryProsthetic = false;
             widget.isPulmonaryProsthetic?.call(isPulmonaryProsthetic);
             setState(() {});
           },),
          MRowTextRadioWidget(enabled: widget.enabled,title: 'Valvar pathology:',onChanged: (val){
            val =='Others' ? setState(() {
              isOthers = true;
            }) : setState(() {
              isOthers = false;
            });
          },isneedDivider: false,options: ['Rheumatic','Myxomatous','Bicuspid','Degenerative','Prolapse-flail','Dysplastic','Others'],)
         ],) : Container(),
          isOthers ?MTextField(enabled: widget.enabled,label: 'If Others Specify',onChanged: (val){},) : Container(),
          Space(),
          MSmallText(text: 'D6.4 Pulmonary pressures/ Pulmonary hypotension:'),
          Space(),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){},title: 'Tricuspid regurgitation-TRPG (mmHg):',maxLength: 3,type: MInputType.numeric,),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){},title: 'PAT in msec:',maxLength: 3,type: MInputType.numeric,),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){},title: 'Estimated RA Pressure(mmHg):',maxLength: 3,type: MInputType.numeric,),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){},title: 'Peak Pulmonary regurgitation (mmHg):',maxLength: 3,type: MInputType.numeric,),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},title: 'Pulmonary Hypertension:',options: ['Nil', 'Mild','Moderate','Severe','Could not be estimated'],),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){if(val =='Effusion') { setState(() { isEffusion = true; }); }else{ setState(() { isEffusion = false; });}},title: 'D6.5 Pericardium',options: ['Normal', 'Thickened','Effusion'],),
          isEffusion ?MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},title: 'Effusion',options: ['Mild', 'Moderate','Severe'],): Container(),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){

            val =='Abnormal' ? isAortaAbnormal = true : isAortaAbnormal= false;
            widget.isAortaAbnormal?.call(isAortaAbnormal);
            setState(() {});
          },title: 'D6.6 Aorta',options: List_items.NormalAbnormal,),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},title: 'l D6.7 Others: ',options: ['Normal', 'Slight','Moderate','Severe'],),
          MrowTextTextFieldWidget( enabled: widget.enabled,onChanged: (val){},title: 'D6.8 Any other salient features (please mention below):',),
          //MFilledButton(text: 'Next', onPressed: (){context.push(Routes.FormD4);},),
        // isMitralProsthetic || isAorticProsthetic || isTricuspidProsthetic || isPulmonaryProsthetic ?Column(
        //   children: [
        //     FormD4(),
        //     FormL1(),
        //   ],
        // ) : Container(),
        // isAortaAbnormal ? FormD6(): Container(),
        ],);
  }
}
