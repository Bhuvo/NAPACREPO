import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class FormK1 extends StatefulWidget {
  final bool? isEnabled;
  final Function(bool)? isEcho;
  const FormK1({super.key, this.isEnabled, this.isEcho});

  @override
  State<FormK1> createState() => _FormK1State();
}

class _FormK1State extends State<FormK1> {
  bool isOthers = false;
  bool isPostnatal = false;
  bool isAntenatal = false;
  bool isEcho = false;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MRowTextCheckBox(enabled: widget.isEnabled,title: 'F1 Etiology of Cardiac failure',list: List_items.CardiacFailure,result: (val){
          if(val.contains('Others')){
            setState(() {
              isOthers = true;
            });
          }else{
            setState(() {
              isOthers = false;
            });
          }
        },isneedDivider: false,),
        isOthers ? MTextField(enabled: widget.isEnabled,label: 'If Other, Specify',onChanged: (val){},): Container(),
        MDivider(),
        MSmallText(text: 'F2 ADDITIONAL DATA FOR PERIPARTUM CARDIOMYOPATHY',),
        Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'F2.1 Postpartum HTN',onChanged: (val){},),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'F2.2 H/O Substance abuse (Cocaine, etc.)',onChanged: (val){},),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'F2.3 Long-term (> 4 weeks) tocolytic therapy (e.g.: beta-adrenergic agonists such as terbutaline)',onChanged: (val){},),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'F2.4 H/o fever',onChanged: (val){},),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'F2.5 Family History',onChanged: (val){},),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'F2.6 Obesity',onChanged: (val){},),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'F2.7 Prior diagnosis of PPCM',onChanged: (val){},),
        MrowTextTextFieldWidget(enabled: widget.isEnabled,title: 'F2.8 Present Pregnancy: Symptoms at Presentation:',onChanged: (val){},),
        MrowTextDatePickerWidget(enabled: widget.isEnabled,title: 'F2.9 Day when symptoms first noted:',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,options: ['Antenatal (Gestational age weeks)','Postnatal(day)'],onChanged: (val){
          if(val == 'Antenatal (Gestational age weeks)'){
            setState(() {
              isAntenatal = true;
              isPostnatal = false;
            });
          }else{
            setState(() {
              isAntenatal = false;
              isPostnatal = true;
            });
          }
        }, isneedDivider: false,),
        isAntenatal ? MTextField(enabled: widget.isEnabled,label: 'Gestational age weeks',onChanged: (val){},type: MInputType.numeric,): Container(),
        isPostnatal ? MTextField(enabled: widget.isEnabled,label: 'Postnatal days',onChanged: (val){},type: MInputType.numeric,): Container(),
        MDivider(),
        MrowTextTextFieldWidget(enabled: widget.isEnabled,title: 'F3 ECG:',onChanged: (val){},),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'F4 ECHOs:',onChanged: (val){
          val =='Yes'? isEcho =true : isEcho = false;
          widget.isEcho?.call(isEcho);
          setState(() {});
        },),
        MSmallText(text: 'F5 Serial Bio-Marker Value',),
        Space(),
        ListView.builder(
          shrinkWrap: true,
          itemCount: count,
          physics: const NeverScrollableScrollPhysics(),

          itemBuilder: (context, index) {
            return Column(children: [
              MSmallText(text: 'F5.${index+1}',),
              MrowTextTextFieldWidget(enabled: widget.isEnabled,title: 'Date',onChanged: (val){},isneedDivider: false,),
              MrowTextTextFieldWidget(enabled: widget.isEnabled,title: 'BNP',onChanged: (val){},isneedDivider: false),
              MrowTextTextFieldWidget(enabled: widget.isEnabled,title: 'Pro BNP level',onChanged: (val){},),
            ],);
          },),
      MFilledButton(text: 'ADD',onPressed: (){
        setState(() {
          count++;
        });
      },),
      MRowTextCheckBox(enabled: widget.isEnabled,title: 'F6 Treatment Given',list: ['ACEI','ARNI','ARB','Beta- Blockers' ,'Digoxin','Nitrates','MRAs','Anticoagulants','Diuretic','Other Diuretics'],result: (val){},),
      MrowTextTextFieldWidget(enabled: widget.isEnabled,title: 'F7 Any other relevant information: ',onChanged: (val){},),
        //MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},)

      ],);
  }
}
