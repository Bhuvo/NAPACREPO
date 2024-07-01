import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class FormL2 extends StatefulWidget {
  final bool? enabled;
  const FormL2({super.key, this.enabled});

  @override
  State<FormL2> createState() => _FormL2State();
}

class _FormL2State extends State<FormL2> {
  bool isHospitalisations = false;
  bool isYes = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MSmallText(text: 'L4 On Medications: (Kindly fill form O)',),
        Space(),
        MRowTextRadioWidget(enabled: widget.enabled,title: 'L5 Hospitalisations after discharge:',onChanged: (val){
          if(val =='Yes'){
            setState(() {
              isHospitalisations = true;
            });
          }else{
            setState(() {
              isHospitalisations = false;
            });
          }
        },) ,
        isHospitalisations ? MTextField(enabled: widget.enabled,label: 'If yes, specify:',onChanged: (val){},): Container(),
        MRowTextRadioWidget(enabled: widget.enabled,title: 'L6 Post-partum plan contraception provided:',onChanged: (val){},),
        MRowTextRadioWidget(enabled: widget.enabled,title: 'L7 Cardiac referral provided:',onChanged: (val){},),
        MSmallText(text: 'L8 NEONATAL OUTCOME',),
        Space(),
MrowTextTextFieldWidget(enabled: widget.enabled,title: 'L8.1 Neonatal weight(Kg):', onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.enabled,title: 'L8.2 Echocardiographic evaluation (if any): ',onChanged: (val){
          if(val =='Yes'){
            setState(() {
              isYes = true;
            });
          }else{
            setState(() {
              isYes = false;
            });
          }
        },),
        isYes  ? MRowTextRadioWidget(enabled: widget.enabled,title: 'If yes',options: ['Normal','Cong HD'],onChanged: (val){},): Container(),
        MRowTextRadioWidget(enabled: widget.enabled,title: 'L8.3 Adverse neonatal outcome:',onChanged: (val){},options: ['Neonatal death','Cardiac lesion','Malnourishment'],),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'L9 Any other comments:',onChanged: (val){},),
        MrowTextDatePickerWidget(enabled: widget.enabled,title: 'L10 Date of next follow up:',onChanged: (val){},),

      ],);
  }
}
