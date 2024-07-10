import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormN/widget/MN1body.dart';
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
  bool isLive = false;
  bool isDead = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MSmallText(text: 'L4 On Medications: (Kindly fill form N)',),
      Space(),
      MN1Body(title: 'POSTPARTUM 1',options: List_items.Drugs,drugMap: (e){
        print('Value from map $e');
      },),
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
        MRowTextRadioWidget(title: '8.1 Live',onChanged: (val){
          val =='Yes' ? isLive =true : isLive = false;
          setState(() {

          });
        },),
      isLive ?MrowTextTextFieldWidget(enabled: widget.enabled,title: 'L8.1.1 Neonatal weight(Kg):', onChanged: (val){},isneedDivider: false,) : Container(),
      MRowTextRadioWidget(title: '8.1 Dead',onChanged: (val){
        val =='Yes' ? isDead =true : isDead = false;
        setState(() {

        });
      },),
        // MRowTextRadioWidget(enabled: widget.enabled,title:'L8 NEONATAL OUTCOME' ,options: ['Live' ,'Dead'],onChanged: (val){
        //   val == 'Live' ? isLive =true : isLive = false;
        //   val == 'Dead' ? isDead =true : isDead = false;
        //   setState(() {});
        // },isneedDivider: false,),
        // Space(),
      isDead ? MrowTextTextFieldWidget(enabled: widget.enabled,title: 'L8.1.2 Mention cause of death:', onChanged: (val){},isneedDivider: false,) : Container(),
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
        },isneedDivider: false,),
     isYes ? MRowTextRadioWidget(enabled: widget.enabled,title: 'If yes',options: ['Normal','Cong HD'],onChanged: (val){},): Container(),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'L8.3 Adverse neonatal outcome:',onChanged: (val){},options: ['Neonatal death','Cardiac lesion','Malnourishment'],),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'L9 Any other comments:',onChanged: (val){},),
        MrowTextDatePickerWidget(enabled: widget.enabled,title: 'L10 Date of next follow up:',onChanged: (val){},),

      ],);
  }
}
