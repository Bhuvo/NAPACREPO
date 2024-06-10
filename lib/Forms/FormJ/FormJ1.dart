import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class FormJ1 extends StatefulWidget {
  const FormJ1({super.key});

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
    return MScaffold(

      appBar: MAppBar(title: 'J. CONGENITAL HEART DISEASES (FORM J)',),

      body: MFormBody(Childrens: [
        MRowTextCheckBox(title: 'J1 Disease specific (tick the relevant)',list: List_items.Disease,result: (val){
          if(val.contains('Other')){
            setState(() {
              isOthers = true;
            });
          }else{
            setState(() {
              isOthers = false;
            });
          }
        },isneedDivider: false,),
        MRowTextRadioWidget(options: ['Post-surgical','Post-interventional'],isneedDivider: false,onChanged: (val){
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
        isSurgical ?MRowTextCheckBox(result: (val){
          if(val.contains('Other')){
            setState(() {
              isSurgicalOther = true;
            });
          }else{
            setState(() {
              isSurgicalOther = false;
            });
          }
        },list: ['ICR','Fontan','RV-PA Conduit','BDG shunt','BT Shunt','Arterial','Prosthetic Valve','Others'],): Container(),
        isSurgicalOther ? MTextField(label: 'If Others Specify',onChanged: (val){}): Container(),
        isInterventional ?MRowTextCheckBox(result: (val){
          if(val.contains('Other')){
            setState(() {
              isInterventionalOther = true;
            });
          }else{
            setState(() {
              isInterventionalOther = false;
            });
          }
        },list: ['ASD DC','VSD DC','PDA DC','BPV','BAV','Others'],): Container(),
        isInterventionalOther ? MTextField(label: 'If Others Specify',onChanged: (val){}): Container(),

        MSmallText(text: 'isInterventionalOther',),
        Space(),
        MRowTextCheckBox(title: 'J2.1 Symptoms',result: (val){},list: ['Headache','Visual disturbance','Dizziness','Altered mental status','CNS symptoms','Arthritis','Renal dysfunction','Cyanosis','Bleeding tendency'],),
        MRowTextRadioWidget(title: 'J2.2 Polycythemia',onChanged: (val){},),
        MRowTextRadioWidget(title: 'J2.3 Anemia',onChanged: (val){},),
        MSmallText(text: 'J2.4 SPo2 (%) all four limbs :',),
        Space(),
        MTextField(label: 'RUL: ',onChanged: (val){},type: MInputType.numeric,),
        MTextField(label: 'RLL: ',onChanged: (val){},type: MInputType.numeric,),
        MTextField(label: 'LUL: ',onChanged: (val){},type: MInputType.numeric,),
        MTextField(label: 'LLL: ',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(title: 'J2.5 HCT (%) ',type: MInputType.numeric,onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'J2.6 S. Ferritin: ',type: MInputType.numeric,onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'J3 Any other relevant information/ remarks: ',onChanged: (val){},),
        MFilledButton(text: 'Submit',onPressed: (){ context.push(Routes.Home);},)
      ],),
    );
  }
}
