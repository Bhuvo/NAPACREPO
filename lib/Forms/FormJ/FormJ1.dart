import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class FormJ1 extends StatefulWidget {
  final bool? enabled;
  const FormJ1({super.key, this.enabled});

  @override
  State<FormJ1> createState() => _FormJ1State();
}

class _FormJ1State extends State<FormJ1> {
bool isOthers = false;
bool isSurgical = false;
bool isInterventional = false;
bool isSurgicalOther = false;
bool isInterventionalOther = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MText(text: 'FORM E-CONGENITAL HEART DISESASE FORM',),
        Space(),
        MRowTextCheckBox(enabled:widget.enabled,title: 'E1 Disease specific (tick the relevant)',list: List_items.Disease,result: (val){
          if(val.contains('Other')){
            setState(() {
              isOthers = true;
            });
          }else{
            setState(() {
              isOthers = false;
            });
          }
        }),
        MrowTextTextFieldWidget(enabled:widget.enabled,title: 'Other Heart Disease – Specify', onChanged: (val){},isneedDivider: false),
        MRowTextRadioWidget(enabled:widget.enabled,options: ['Post-surgical','Post-interventional'],isneedDivider: false,onChanged: (val){
          if(val =='Post-surgical'){
            setState(() {
              isSurgical = true;
              isInterventional = false;
            });
          }else{
            setState(() {
              isSurgical = false;
              isInterventional = true;
            });
          }
        },),
        isSurgical ?MRowTextCheckBox(enabled:widget.enabled,result: (val){
          if(val.contains('Others')){
            setState(() {
              isSurgicalOther = true;
            });
          }else{
            setState(() {
              isSurgicalOther = false;
            });
          }
        },list: ['Intracardiac repair','Fontan','RV-PA Conduit','BDG shunt','BT Shunt','Arterial','Prosthetic Valve','Others'],): Container(),
        isSurgicalOther ? MTextField(enabled:widget.enabled,label: 'If Others Specify',onChanged: (val){}): Container(),
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
      isInterventionalOther ? Column(
        children: [
          MSmallText(text: 'Post cardiac interventional',),
          MRowTextCheckBox(title: 'Device closure ',isneedDivider: false, enabled:widget.enabled,result: (val){},list: ['ASD','VSD','PDA'],),
          MRowTextCheckBox(title: 'Balloon Valvotomy:',isneedDivider: false, enabled:widget.enabled,result: (val){},list: ['Pulmonary','Aortic','Mitral'],),
          MTextField(label: 'Others',onChanged: (val){},enabled: widget.enabled,)
        ],
      ): Container(),
        MDivider(),
        Space(),
        MrowTextTextFieldWidget(title: 'Other Heart Disease – Specify:',enabled: widget.enabled,onChanged: (val){},),
        MSmallText(text: 'E2 Clinical findings in the current pregnancy',),
        Space(),
        MRowTextCheckBox(enabled:widget.enabled,title: 'E2.1 Symptoms',result: (val){},list: ['Headache','Visual disturbance','Dizziness','Polycythemia','Anemia','Altered mental status','CNS symptoms','Arthritis','Renal dysfunction','Cyanosis','Bleeding tendency'],),
        // MRowTextRadioWidget(enabled:widget.enabled,title: 'E2.2 Polycythemia',onChanged: (val){},),
        // MRowTextRadioWidget(enabled:widget.enabled,title: 'E2.3 Anemia',onChanged: (val){},),
        MSmallText(text: 'E2.2 SPo2 (%) all four limbs :',),
        Space(),
        MTextField(enabled:widget.enabled,label: 'RUL: ',onChanged: (val){},type: MInputType.numeric,),
        MTextField(enabled:widget.enabled,label: 'RLL: ',onChanged: (val){},type: MInputType.numeric,),
        MTextField(enabled:widget.enabled,label: 'LUL: ',onChanged: (val){},type: MInputType.numeric,),
        MTextField(enabled:widget.enabled,label: 'LLL: ',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled:widget.enabled,title: 'E2.3 Hematocrit (%) ',type: MInputType.numeric,onChanged: (val){},),
        MrowTextTextFieldWidget(enabled:widget.enabled,title: 'E2.4 S. Ferritin: ',type: MInputType.numeric,onChanged: (val){},),
        MrowTextTextFieldWidget(enabled:widget.enabled,title: 'E3 Any other relevant information/ remarks: ',onChanged: (val){},),
       // MFilledButton(text: 'Submit',onPressed: (){ context.push(Routes.Home);},)
      ],);
  }
}
