import 'package:flutter/cupertino.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/navigator_utils.dart';

class FormD5 extends StatefulWidget {
  const FormD5({super.key});

  @override
  State<FormD5> createState() => _FormD5State();
}

class _FormD5State extends State<FormD5> {
  bool isAbnormal = false;
  bool isCoarctation = false;
  String Defect = '';

  String Mitral ='';
  String Tricuspid ='';
  String Pulmonary ='';
  String Aortic ='';

  bool isRVOTO = false;
  bool isAnatomyAbnormal = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MText(text: 'D8 CONGENITAL HEART DISEASE ECHO PAGE',),
        Space(),
        MRowTextRadioWidget( onChanged: (val){},options:['Solitus','Inversus','Ambiguous'],title: 'D8.1 Situs',),
        MRowTextRadioWidget( onChanged: (val){},options:['Dextrocardia','Levocardia','Mesocardia'],title: 'D8.2 Position',),
        MRowTextRadioWidget( onChanged: (val){},options:List_items.AVConnection,title: 'D8.3 AV connection',),
        MRowTextRadioWidget( onChanged: (val){},options:List_items.AVConnection,title: 'D8.4 VA connection',),
        MRowTextRadioWidget( onChanged: (val){},options:['Normal','Partial anomalous','Total anomalous'],title: 'D8.5 Pulmonary venous connections',),
        MRowTextRadioWidget( onChanged: (val){if(val =='Abnormal'){
          setState(() {
            isAbnormal = true;
          });
        }else{
          setState(() {
            isAbnormal = false;
          });
        }
    },options:List_items.NormalAbnormal,title: 'D8.6 Systemic venous connections ',),
        isAbnormal ? MTextField(onChanged: (val){},label: 'If abnormal, specify',):Container(),
      MRowTextRadioWidget( onChanged: (val){setState(() {
        Defect=val;
      });},options:['ASD','VSD','PDA','APW','AVSD'],title: 'D8.7 Defect',isneedDivider: false,),
        (Defect == 'ASD') ?  Column(
          children: [
            MrowTextTextFieldWidget(onChanged: (val){},title: 'Size',isneedDivider: false,type: MInputType.numeric,),
            MRowTextRadioWidget(onChanged: (val){},options:['Secundum','Primum','Sinus Venosus','Others'],title: 'Location of the defect'),
          ],
        ): Container(),
        (Defect == 'VSD') ?  Column(
          children: [
            MrowTextTextFieldWidget(onChanged: (val){},title: 'Size',isneedDivider: false,type: MInputType.numeric,),
            MRowTextRadioWidget(onChanged: (val){},options:['Perimembranous','Outlet','Inlet','Muscular','Others'],title: 'Location of the defect'),
          ],
        ): Container(),
        (Defect == 'PDA'||Defect == 'APW'||Defect == 'AVSD') ?  Column(
          children: [
            MrowTextTextFieldWidget(onChanged: (val){},title: 'Size',isneedDivider: false,type: MInputType.numeric,),
            MrowTextTextFieldWidget(onChanged: (val){},title: 'Other echo description:'),
          ],
        ): Container(),
        MRowTextRadioWidget( onChanged: (val){},options:['Normal','Common Atria','Single Ventricle'],title: 'D8.8 Chamber Description: ',),
        MRowTextRadioWidget( onChanged: (val){},options:List_items.HypoplasticChamber,title: 'D8.9 Hypoplastic Chamber:',),
        MRowTextRadioWidget(title: 'D8.10 RVOT',onChanged: (val){
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
        isRVOTO? MRowTextCheckBox(list: ['IPS','VPS','DCRV'],isneedDivider: false,): Container(),
        MDivider(),
        MRowTextRadioWidget( onChanged: (val){},options:['Normal','Hypoplastic','Confluent'],title: 'D8.11 MPA and Branch PA’s'),
        MRowTextCheckBox(title: 'D8.12 LVOT Obstruction',result: (val){},isneedDivider: false,list: ['Valvular','Supra Valvular','Sub Valvular'],),
        MRowTextRadioWidget(options: ['Fixed','Dynamic'],onChanged: (val){},),
        Text('D8.13 Valve morphology'),
        Space(),
        MRowTextRadioWidget( onChanged: (val){setState(() {
          Mitral = val;
        });},options:['Normal' ,'Parachute MV','Supra valvular fibrous ring','Others'],title: 'Mitral Valve',isneedDivider:(Mitral =='Others') ? false: true,),
       (Mitral =='Others') ? MTextField(onChanged: (val){},label: 'others specify',):Container(),
        (Mitral =='Others') ? MDivider():Container(),

        MRowTextRadioWidget( onChanged: (val){setState(() {
          Tricuspid = val;
        });},options:['Normal' ,'Ebstein','Atresia','Others'],title: 'Tricuspid Valve',isneedDivider:(Tricuspid =='Others') ? false: true,),
        (Tricuspid =='Others') ? MTextField(onChanged: (val){},label: 'others specify',):Container(),
        (Tricuspid =='Others') ? MDivider():Container(),

        MRowTextRadioWidget( onChanged: (val){setState(() {
          Pulmonary = val;
        });},options:['Normal' ,'Hypoplasia','Atresia','Dooming','Absent','Others'],title: 'Pulmonary Valve',isneedDivider:(Pulmonary =='Others') ? false: true,),
        (Pulmonary =='Others') ? MTextField(onChanged: (val){},label: 'others specify',):Container(),
        (Pulmonary =='Others') ? MDivider():Container(),

        MRowTextRadioWidget( onChanged: (val){setState(() {
          Aortic = val;
        });},options:['Normal' ,'Unicuspid','Bicuspid','Quadricuspid','Others'],title: 'Aortic Valve',isneedDivider:(Aortic =='Others') ? false: true,),
        (Aortic =='Others') ? MTextField(onChanged: (val){},label: 'others specify',):Container(),
        (Aortic =='Others') ? MDivider():Container(),

      MRowTextRadioWidget( onChanged: (val){},options:['Normal','Dilated','Hypoplastic'],title: 'D8.14 Aortic root',),
      MRowTextRadioWidget( onChanged: (val){},options:['Normal','Left sided','Right sided'],title: 'D8.15 Aortic arch',),
      MRowTextRadioWidget( onChanged: (val){if(val =='Yes'){setState(() {
        isCoarctation = true;
      });}else{
        setState(() {
          isCoarctation = false;
        });
      }},title: 'D8.16 Coarctation',isneedDivider: isCoarctation ? false: true,),
        isCoarctation? MrowTextTextFieldWidget( onChanged: (val){},title: 'Peak Gradient (mmHg)'): Container(),
      MRowTextRadioWidget(title: 'D8.17 Coronary anatomy',options: List_items.NormalAbnormal,isneedDivider: false,onChanged: (val){},),
        isAnatomyAbnormal? MRowTextCheckBox(list: ['Anomalous origin','Anomalous course'],): Container(),
        isAnatomyAbnormal? MTextField(label: 'Details:',onChanged: (val){},): Container(),
      MrowTextTextFieldWidget(title: 'D8.18 Any other salient features (please mention)',onChanged: (val){}, ),
        //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormD6);}),

      ],);
  }
}
