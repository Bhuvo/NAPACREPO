import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormL/widget/ValueFunction.dart';
import 'package:npac/app/export.dart';

class FormM2 extends StatefulWidget {
  final bool? enabled;
  const FormM2({super.key, this.enabled});

  @override
  State<FormM2> createState() => _FormM2State();
}

class _FormM2State extends State<FormM2> {
  bool isWallAbnormal = false;
  bool isRVAbnormal = false;
  bool isOthers = false;
  bool isHospitalisations = false;
  bool isOther = false;
  bool isfollowup = false;

  bool isYes = false;
  bool hasHD = false;
  bool isAssignment = false;


  @override
  Widget build(BuildContext context) {
    return Column(children: [
        // MText(text: 'M8 ECHOCARDIOGRAPHIC ASSESSMENT',),
        // Space(),
        // MSmallText(text: 'Ventricular function ',),
        // Space(),
        // MRowTextRadioWidget(title: 'Wall Motion', options: List_items.NormalAbnormal,isneedDivider: false,onChanged: (val){
        //   if(val == 'Abnormal'){
        //     setState(() {
        //       isWallAbnormal = true;
        //     });
        //   }else{
        //     setState(() {
        //       isWallAbnormal = false;
        //     });
        //   }
        // },),
        // isWallAbnormal?MRowTextCheckBox(list: ['Hypo / akinesia','Global','Regional'],): Container(),
        // MDivider(),
      // MSmallText(text: 'M3 ECHOCARDIOGRAPHIC ASSESSMENT',),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'M3 ECHOCARDIOGRAPHIC ASSESSMENT',onChanged: (val){
        val =='Yes' ? isAssignment = true : isAssignment = false;
        setState(() {});
      },isneedDivider: false,),
      Space(),
      isAssignment ? Column(children: [
        MSmallText(text: 'Ventricular function ',),
        Space(),
        MRowTextRadioWidget(enabled: widget.enabled,title: 'Wall Motion', options: ['Normal','Hypokinesia','Akinesia'],isneedDivider: false,onChanged: (val){
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
        isWallAbnormal?MRowTextCheckBox(enabled: widget.enabled,list: ['Global','Regional'],): Container(),
        MDivider(),
        MSmallText(text: 'LV systolic function',),
        Space(),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'LVID Diastole(mm): ',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'LVID Systole(mm) ',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'EF% : ',onChanged: (val){},type: MInputType.numeric,),
        MSmallText(text: 'Pulmonary pressures',),
        Space(),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'Tricuspid regurgitation TRPG (mmHg):',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'Pulmonary regurgitation Peak PR (mmHg):',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'PAT(ms)',onChanged: (val){},type: MInputType.numeric,),
        MRowTextRadioWidget(enabled: widget.enabled,title: 'RV systolic function ',options: List_items.NormalAbnormal,isneedDivider: false,),
        isRVAbnormal? MTextField(enabled: widget.enabled,label: 'TAPSE (mm)',onChanged: (val){},): Container(),
        isRVAbnormal? MTextField(enabled: widget.enabled,label: 'Sa’',onChanged: (val){},): Container(),

        MText(text: 'Valve function',),
        Space(),
        ValueFunction(enabled: widget.enabled,title: 'Mitral',isMVOA: true,MVOA: (val){},radioValue: (val){},MG: (val){},PG: (val){},checkboxValue: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},),
        ValueFunction(enabled: widget.enabled,title: 'Aortic',isMVOA: false,radioValue: (val){},MG: (val){},PG: (val){},checkboxValue: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},),
        ValueFunction(enabled: widget.enabled,title: 'Tricuspid',isMVOA: false,radioValue: (val){},MG: (val){},PG: (val){},checkboxValue: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},),
        ValueFunction(enabled: widget.enabled,title: 'Pulmonary',isMVOA: false,radioValue: (val){},MG: (val){},PG: (val){},checkboxValue: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},),
        MRowTextRadioWidget(enabled: widget.enabled,title: 'Pericardial effusion ',onChanged: (val){},options: ['Mild','Moderate','Massive','Tamponade','Others'],isneedDivider: false,),
        isOthers? MRowTextCheckBox(enabled: widget.enabled,title: 'Others',list: ['Vegetation','Thrombus'],isneedDivider: false,): Container(),
        MDivider(),

        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'Other salient echo details (if any):',onChanged: (val){},),

      ],): Container(),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'M4 Hospitalisations after discharge:',onChanged: (val){},),
      isHospitalisations ? MTextField(enabled: widget.enabled,label: 'If Yes, Reason',onChanged: (val){},): Container(),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'M5 Mode of Contraception used: ',onChanged: (val){
        if(val == 'Others'){
          setState(() {
            isOther = true;
          });
        }else{
          setState(() {
            isOther = true;
          });
        }
      },options: ['Nil','IUCD','OCP','Barrier method','Tubectomy','Others'],),
      isOther ? MTextField(enabled: widget.enabled,label: 'If Others, Specify:',onChanged: (val){},): Container(),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'M6 Follow up in Cardiology:',onChanged: (val){
        val =='Yes' ? isfollowup = true : isfollowup = false;
        setState(() {});
      },),
      isfollowup ?MRowTextRadioWidget(enabled: widget.enabled,title: 'Specific treatment plans: :',onChanged: (val){},): Container(),
      // MrowTextTextFieldWidget(title: 'M4 On Medications: (Kindly mention the drugs in the space provided below)',onChanged: (val){},),
      MSmallText(text: 'M7 NEONATAL OUTCOME',),
      // Space(),
      MrowTextTextFieldWidget(enabled: widget.enabled,title: 'M7.1 Neonatal weight (kg):',onChanged: (val){},),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'M7.2 Neonatal Echocardiography',options: ['Available','Not Available'],onChanged: (val){
        if(val == 'Available'){
          setState(() {
            isYes = true;
          });
        }else{
          setState(() {
            isYes = false;
          });
        }
      }, isneedDivider: false,),
      isYes ? MRowTextRadioWidget(enabled: widget.enabled,title: 'If Yes',onChanged: (val){
        val == 'Congestive Heart Failure' ? hasHD = true : hasHD = false;
        setState(() {});
      }, options: ['Normal','Congestive Heart Failure'],isneedDivider: false,): Container(),
      isYes && hasHD ? MTextField(enabled: widget.enabled,label:'If Congestive Heart Failure, specify',onChanged: (val){},): Container(),
      MDivider(),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'M7.3 Adverse neonatal outcome: ',options: ['Neonatal death','Cardiac lesion','Nil'], onChanged: (val){},),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'M8. Any other comments:',onChanged: (val){},),
        MFilledButton(text: 'Submit',onPressed: (){ context.push(Routes.Home);},)
      ],);
  }
}
