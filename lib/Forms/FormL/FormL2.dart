import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormL/FormLModel.dart';
import 'package:npac/Forms/FormN/widget/MN1body.dart';
import 'package:npac/app/export.dart';

class FormL2 extends StatefulWidget {
  final bool? enabled;
  final Rx<FormLModel>? formLData;
  const FormL2({super.key, this.enabled, this.formLData});

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
        MSmallText(text: 'L4 Details of medications been used: (Kindly fill form N)',),
      Space(),
      MN1Body(title: 'POSTPARTUM 1',visitNo: 12,options: List_items.Drugs,drugMap: (e){
        print('Value from map $e');
      },),
        Space(),
        MRowTextRadioWidget(enabled: widget.enabled,title: 'L5 Hospitalisations after discharge:',initialValue: widget.formLData?.value.hospitalisationAfterDischarge,onChanged: (val){
          widget.formLData?.value.hospitalisationAfterDischarge = val;
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
        isHospitalisations ? MTextField(enabled: widget.enabled,label: 'If yes, specify:',initalValue: widget.formLData?.value.reasonForHospitalization,onChanged: (val){
          widget.formLData?.value.reasonForHospitalization = val;
        },): Container(),
        MRowTextRadioWidget(enabled: widget.enabled,title: 'L6 Mode of Contraception used: ',initialValue: widget.formLData?.value.postpartumContraception,options: ['Nil','IUCD','OCP','Barrier method','Tubectomy','Others'],onChanged: (val){
          widget.formLData?.value.postpartumContraception = val;
        },),
        MRowTextRadioWidget(enabled: widget.enabled,title: 'L7 Cardiac referral provided:',initialValue: widget.formLData?.value.cardiacReferral,onChanged: (val){
          widget.formLData?.value.cardiacReferral = val;
        },),
        MSmallText(text: 'L8 NEONATAL OUTCOME',),
        MRowTextRadioWidget(title: '8.1 Live',initialValue: widget.formLData?.value.neonatalOutcome,onChanged: (val){
          val =='Yes' ? isLive =true : isLive = false;
          widget.formLData?.value.neonatalOutcome = val;
          setState(() {});
        },),
      isLive ?MrowTextTextFieldWidget(enabled: widget.enabled,title: 'L8.1.1 Neonatal weight(Kg):',initialValue: widget.formLData?.value.neonatalWeight, onChanged: (val){
        widget.formLData?.value.neonatalWeight = val;
      },isneedDivider: false,) : Container(),
      MRowTextRadioWidget(title: '8.1 Dead',initialValue: widget.formLData?.value.neonatalOutcome,onChanged: (val){
        val =='Yes' ? isDead =true : isDead = false;
        widget.formLData?.value.neonatalOutcome = val;
        setState(() {

        });
      },),
        // MRowTextRadioWidget(enabled: widget.enabled,title:'L8 NEONATAL OUTCOME' ,options: ['Live' ,'Dead'],onChanged: (val){
        //   val == 'Live' ? isLive =true : isLive = false;
        //   val == 'Dead' ? isDead =true : isDead = false;
        //   setState(() {});
        // },isneedDivider: false,),
        // Space(),
      isDead ? MrowTextTextFieldWidget(enabled: widget.enabled,title: 'L8.1.2 Mention cause of death:',initialValue: widget.formLData?.value.causeOfDeath, onChanged: (val){
        widget.formLData?.value.causeOfDeath = val;
      },isneedDivider: false,) : Container(),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'L8.2 Echocardiographic evaluation (if any): ',initialValue: widget.formLData?.value.ecgEvaluation,onChanged: (val){
          if(val =='Yes'){
            setState(() {
              isYes = true;
            });
          }else{
            setState(() {
              isYes = false;
            });
          }
        widget.formLData?.value.ecgEvaluation = val;
        },isneedDivider: false,),
     isYes ? MRowTextRadioWidget(enabled: widget.enabled,title: 'If yes',initialValue: widget.formLData?.value.ecgEvaluationValue,options: ['Normal','Cong HD'],onChanged: (val){
       widget.formLData?.value.ecgEvaluationValue = val;
     },): Container(),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'L8.3 Adverse neonatal outcome:',initialValue: widget.formLData?.value.adverseNeonatalOutcome,onChanged: (val){
        widget.formLData?.value.adverseNeonatalOutcome = val;
      },options: ['Neonatal death','Cardiac lesion','Malnourishment'],),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'L9 Any other comments:',initialValue: widget.formLData?.value.otherComments,onChanged: (val){
          widget.formLData?.value.otherComments = val;
        },),
        MrowTextDatePickerWidget(enabled: widget.enabled,title: 'L10 Date of next follow up:',initialDate: stringToDate(widget.formLData?.value.nextFollowUpDate ?? ''),onChanged: (val){
          widget.formLData?.value.nextFollowUpDate = dateToString(val);
        },),

      ],);
  }
}
