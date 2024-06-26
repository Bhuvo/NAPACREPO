import 'package:flutter/material.dart';
import 'package:npac/Forms/FormM/FormM2.dart';
import 'package:npac/app/export.dart';

class FormM1 extends StatefulWidget {
  const FormM1({super.key});

  @override
  State<FormM1> createState() => _FormM1State();
}

class _FormM1State extends State<FormM1> {
  bool isHospitalisations = false;
  bool isOther = false;
  bool isWallAbnormal = false;
  bool isEnabled = false;


  @override
  Widget build(BuildContext context) {
    return MScaffold(appBar: MAppBar(title: 'SECOND POST PARTUM VISIT FORM',),
    body: MFormBody(Childrens: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('For all patients (Tick theapplicable)'),
          IconButton(
              onPressed: () {
                setState(() {
                  isEnabled = !isEnabled;
                });
              },
              icon: isEnabled ? Icon(Icons.save) : Icon(Icons.edit))
        ],
      ),
      MRowTextRadioWidget( enabled: isEnabled,title: 'M1. NYHA SYMPTOMS CLASS:', options: List_items.NYHAClass,onChanged: (val){},),
      MSmallText(text: 'M2 CLINICAL SIGNS & ECG',),
      Space(),
      MrowTextTextFieldWidget(enabled: isEnabled,title: 'M2.1 Weight (Kg):',onChanged: (val){},type: MInputType.numeric,),
      MrowTextTextFieldWidget(enabled: isEnabled,title: 'M2.2 HR (/min): ',onChanged: (val){},type: MInputType.numeric,),
      MrowTextTextFieldWidget(enabled: isEnabled,title: 'M2.3 SPO2 (%): ',onChanged: (val){},type: MInputType.numeric,),
      MrowTextTextFieldWidget(enabled: isEnabled,title: 'M2.4 BP (mm Hg): ',onChanged: (val){},type: MInputType.numeric,),
      MRowTextRadioWidget(enabled: isEnabled,title: 'M2.5 CCF: ',onChanged: (val){},),
      MRowTextRadioWidget(enabled: isEnabled,title: 'M2.6 Cyanosis:  ',onChanged: (val){},),
      MRowTextRadioWidget(enabled: isEnabled,title: 'M2.7 Cardiac murmur:',onChanged: (val){},),
      MrowTextDatePickerWidget(enabled: isEnabled,title: 'M2.8 ECG Date:',onChanged: (val){},isneedDivider: false,),
      MRowTextRadioWidget(enabled: isEnabled,options:List_items.NormalAbnormal ,onChanged: (val){},),
      MSmallText(text: 'M3 ECHOCARDIOGRAPHIC ASSESSMENT',),
      Space(),
      MSmallText(text: 'Ventricular function ',),
      Space(),
      MRowTextRadioWidget(enabled: isEnabled,title: 'Wall Motion', options: ['Normal','Hypokinesia','Akinesia'],isneedDivider: false,onChanged: (val){
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
      isWallAbnormal?MRowTextCheckBox(enabled: isEnabled,list: ['Global','Regional'],): Container(),
      MDivider(),
      // MRowTextRadioWidget(title: 'M6.3 Adverse neonatal outcome:',options: ['Neonatal death','Cardiac lesion','Malnourishment'],onChanged: (val){},),

      //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormM2);},),
      FormM2(enabled: isEnabled,)
    ],),
    );
  }
}
