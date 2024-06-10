import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class FormK1 extends StatefulWidget {
  const FormK1({super.key});

  @override
  State<FormK1> createState() => _FormK1State();
}

class _FormK1State extends State<FormK1> {
  bool isOthers = false;
  bool isPostnatal = false;
  bool isAntenatal = false;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'K. CARDIAC FAILURE (FORM K)',),
      body: MFormBody(Childrens: [
        MRowTextCheckBox(title: 'K1 Etiology of Cardiac failure',list: List_items.CardiacFailure,result: (val){
          if(val.contains('Others')){
            setState(() {
              isOthers = true;
            });
          }else{
            setState(() {
              isOthers = true;
            });
          }
        },isneedDivider: false,),
        isOthers ? MTextField(label: 'If Other, Specify',onChanged: (val){},): Container(),
        MDivider(),
        MSmallText(text: 'K2 ADDITIONAL DATA FOR PERIPARTUM CARDIOMYOPATHY',),
        Space(),
        MRowTextRadioWidget(title: 'K2.1 Postpartum HTN',onChanged: (val){},),
        MRowTextRadioWidget(title: 'K2.2 H/O Substance abuse (Cocaine, etc.)',onChanged: (val){},),
        MRowTextRadioWidget(title: 'K2.3 Long-term (> 4 weeks) tocolytic therapy (e.g.: beta-adrenergic agonists such as terbutaline)',onChanged: (val){},),
        MRowTextRadioWidget(title: 'K2.4 H/o fever',onChanged: (val){},),
        MRowTextRadioWidget(title: 'K2.5 Family History',onChanged: (val){},),
        MRowTextRadioWidget(title: 'K2.6 Obesity',onChanged: (val){},),
        MRowTextRadioWidget(title: 'K2.7 Prior diagnosis of PPCM',onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'K2.8 Present Pregnancy: Symptoms at Presentation:',onChanged: (val){},),
        MrowTextDatePickerWidget(title: 'K2.9 Day when symptoms first noted:',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(options: ['Antenatal (Gestational age weeks)','Postnatal(day)'],onChanged: (val){
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
        isAntenatal ? MTextField(label: 'Gestational age',onChanged: (val){},type: MInputType.numeric,): Container(),
        isPostnatal ? MTextField(label: 'Postnatal day',onChanged: (val){},type: MInputType.numeric,): Container(),

        MrowTextTextFieldWidget(title: 'K2.10 ECG:',onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'K2.11 ECHOs: (kindly fill Section D10)',onChanged: (val){},),
        MSmallText(text: 'K2.12 LVEF',),
        Space(),
        MrowTextTextFieldWidget(title: 'During diagnosis ',onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'LVEF before Presentation/symptoms',onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'LVEF before the present pregnancy ',onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'K2.14 BNP /Pro BNP levels (if available with dates)',onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'K2.15 Treatment Given: ',onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'K3 Any other relevant information: ',onChanged: (val){},),
        MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},)

      ],),
    );
  }
}
