import 'package:flutter/cupertino.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextCheckBox.dart';
import 'package:npac/common_widget/MSmallText.dart';
import 'package:npac/utils/navigator_utils.dart';

class FormD5 extends StatefulWidget {
  final bool? isEnabled;
  const FormD5({super.key, this.isEnabled});

  @override
  State<FormD5> createState() => _FormD5State();
}

class _FormD5State extends State<FormD5> {
  bool isAbnormal = false;
  bool isCoarctation = false;
  String Defect = '';

  bool isASD = false;
  bool isVSD = false;
  bool isPDA = false;
  bool isAPW = false;
  bool isAVSD = false;

  String Mitral ='';
  String Tricuspid ='';
  String Pulmonary ='';
  String Aortic ='';

  bool isHypoplas = false;
  bool isRVOTO = false;
  bool isAnatomyAbnormal = false;

  bool isLVOT =false;
  bool isSub =false;


  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MText(text: 'D8 CONGENITAL HEART DISEASE ECHO PAGE',),
        Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){},options:['Solitus','Inversus','Ambiguous'],title: 'D8.1 Situs',),
        MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){},options:['Dextrocardia','Levocardia','Mesocardia'],title: 'D8.2 Position',),
        MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){},options:List_items.AVConnection,title: 'D8.3 AV connection',),
        MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){},options:List_items.AVConnection,title: 'D8.4 VA connection',),
        MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){},options:['Normal','Partial anomalous','Total anomalous'],title: 'D8.5 Pulmonary venous connections',),
        MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){if(val =='Abnormal'){
          setState(() {
            isAbnormal = true;
          });
        }else{
          setState(() {
            isAbnormal = false;
          });
        }
    },options:List_items.NormalAbnormal,title: 'D8.6 Systemic venous connections ',),
        isAbnormal ? MTextField(enabled: widget.isEnabled,onChanged: (val){},label: 'If abnormal, specify',):Container(),
      MRowTextCheckBox(enabled: widget.isEnabled, result: (val){setState(() {
        val.contains('ASD') ? isASD = true : isASD = false;
        val.contains('VSD') ? isVSD = true : isVSD = false;
        val.contains('PDA') ? isPDA = true : isPDA = false;
        val.contains('APW') ? isAPW = true : isAPW = false;
        val.contains('AVSD') ? isAVSD = true : isAVSD = false;
      });},list:['ASD','VSD','PDA','APW','AVSD'],title: 'D8.7 Defect',isneedDivider: false,),
      isASD ?  Column(
          children: [
            MSmallText(text: 'ASD Details',),
            MrowTextTextFieldWidget(enabled: widget.isEnabled,onChanged: (val){},title: 'Size(mm)',isneedDivider: false,type: MInputType.numeric,),
            MRowTextRadioWidget(enabled: widget.isEnabled,onChanged: (val){},options:['Secundum','Primum','Sinus Venosus','Others'],title: 'Location of the defect'),
          ],
        ): Container(),
      isVSD ?  Column(
          children: [
            MSmallText(text: 'VSD Details',),
            MrowTextTextFieldWidget(enabled: widget.isEnabled,onChanged: (val){},title: 'Size(mm)',isneedDivider: false,type: MInputType.numeric,),
            MRowTextRadioWidget(enabled: widget.isEnabled,onChanged: (val){},options:['Perimembranous','Outlet','Inlet','Muscular','Others'],title: 'Location of the defect'),
          ],
        ): Container(),
      isPDA ?  Column(
          children: [
            MSmallText(text: 'PDA Details',),
            MrowTextTextFieldWidget(enabled: widget.isEnabled,onChanged: (val){},title: 'Size(mm)',isneedDivider: false,type: MInputType.numeric,),
          ],
        ): Container(),
      isAPW ?  Column(
          children: [
            MSmallText(text: 'APW Details',),
            MrowTextTextFieldWidget(enabled: widget.isEnabled,onChanged: (val){},title: 'Size(mm)',isneedDivider: false,type: MInputType.numeric,),
          ],
        ): Container(),
      isAVSD ?  Column(
          children: [
            MSmallText(text: 'AVSD Details',),
            MrowTextTextFieldWidget(enabled: widget.isEnabled,onChanged: (val){},title: 'Size(mm)',isneedDivider: false,type: MInputType.numeric,),
          ],
        ): Container(),
        MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){},options:['Normal','Common Atria','Single Ventricle'],title: 'D8.8 Chamber Description: ',),
        MRowTextRadioWidget(enabled: widget.isEnabled,onChanged: (val){
          val =='Yes'?isHypoplas =true:isHypoplas =false;
          setState(() {});
        },isneedDivider: false,title: 'D8.9 Hypoplastic Chamber:',),
      isHypoplas? MRowTextCheckBox(enabled: widget.isEnabled,list: List_items.HypoplasticChamber,result: (val){},isneedDivider: false,):Container(),
        MDivider(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'D8.10 RVOT',onChanged: (val){
          if(val == 'RVOTO'){
            setState(() {
              isRVOTO = true;
            });
          }else{
            setState(() {
              isRVOTO = false;
            });
          }
        },options: ['Normal','RVOTO'],isneedDivider: false,),
        isRVOTO? MRowTextCheckBox(enabled: widget.isEnabled,list: ['Infundibular','Valvar','DCRV'],isneedDivider: false,): Container(),
        MDivider(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'D8.12 LVOT Obstruction:',onChanged: (val){
          val=='Yes' ?isLVOT= true : isLVOT = false;
        },),
      isLVOT ?MrowTextTextFieldWidget(enabled: widget.isEnabled,title: 'Peak Gradient(mm of Hg)',onChanged: (val){},isneedDivider: false,): Container(),
      isLVOT ?MrowTextTextFieldWidget(enabled: widget.isEnabled,title: 'Mean Gradient(mm of Hg)',onChanged: (val){},isneedDivider: false,):Container(),
      isLVOT ? MRowTextCheckBox(enabled: widget.isEnabled,title: 'Location',result: (val){
        val.contains('Sub Valvular')  ? isSub = true: isSub = false;
      },isneedDivider: false,list: ['Valvular','Supra Valvular','Sub Valvular'],): Container(),
      isSub ?MRowTextRadioWidget(enabled: widget.isEnabled,options: ['Fixed','Dynamic'],onChanged: (val){},): Container(),
        MSmallText(text: 'D8.13 Valve morphology',),
        Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){setState(() {
          Mitral = val;
        });},options:['Normal' ,'Parachute MV','Supra valvular fibrous ring','Others'],title: 'Mitral Valve',isneedDivider:(Mitral =='Others') ? false: true,),
       (Mitral =='Others') ? MTextField(enabled: widget.isEnabled,onChanged: (val){},label: 'others specify',):Container(),
        (Mitral =='Others') ? MDivider():Container(),

        MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){setState(() {
          Tricuspid = val;
        });},options:['Normal' ,'Ebstein','Atresia','Others'],title: 'Tricuspid Valve',isneedDivider:(Tricuspid =='Others') ? false: true,),
        (Tricuspid =='Others') ? MTextField(onChanged: (val){},label: 'others specify',):Container(),
        (Tricuspid =='Others') ? MDivider():Container(),

        MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){setState(() {
          Pulmonary = val;
        });},options:['Normal' ,'Hypoplasia','Atresia','Dooming','Absent','Others'],title: 'Pulmonary Valve',isneedDivider:(Pulmonary =='Others') ? false: true,),
        (Pulmonary =='Others') ? MTextField(enabled: widget.isEnabled,onChanged: (val){},label: 'others specify',):Container(),
        (Pulmonary =='Others') ? MDivider():Container(),

        MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){setState(() {
          Aortic = val;
        });},options:['Normal' ,'Unicuspid','Bicuspid','Quadricuspid','Others'],title: 'Aortic Valve',isneedDivider:(Aortic =='Others') ? false: true,),
        (Aortic =='Others') ? MTextField(enabled: widget.isEnabled,onChanged: (val){},label: 'others specify',):Container(),
        (Aortic =='Others') ? MDivider():Container(),

      MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){},options:['Normal','Dilated','Hypoplastic'],title: 'D8.14 Aortic root',),
      MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){},options:['Normal','Left sided','Right sided','Double'],title: 'D8.15 Aortic arch',),
      MRowTextRadioWidget(enabled: widget.isEnabled, onChanged: (val){if(val =='Yes'){setState(() {
        isCoarctation = true;
      });}else{
        setState(() {
          isCoarctation = false;
        });
      }},title: 'D8.16 Coarctation',isneedDivider: isCoarctation ? false: true,),
        isCoarctation? MrowTextTextFieldWidget(enabled: widget.isEnabled, onChanged: (val){},title: 'Peak Gradient (mmHg)'): Container(),
      MRowTextRadioWidget(enabled: widget.isEnabled,title: 'D8.17 Coronary anatomy',options: List_items.NormalAbnormal,isneedDivider: false,onChanged: (val){
        val =='Abnormal' ? isAnatomyAbnormal = true : isAnatomyAbnormal =false;
        setState(() {});
      },),
        isAnatomyAbnormal? MRowTextCheckBox(enabled: widget.isEnabled,list: ['Anomalous origin','Anomalous course'],): Container(),
        isAnatomyAbnormal? MTextField(enabled: widget.isEnabled,label: 'Details:',onChanged: (val){},): Container(),
      MrowTextTextFieldWidget(enabled: widget.isEnabled,title: 'D8.18 Any other salient features (please mention)',onChanged: (val){}, ),
        //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormD6);}),

      ],);
  }
}
