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
  bool isYes = false;

  @override
  Widget build(BuildContext context) {
    return MScaffold(appBar: MAppBar(title: 'M. POST PARTUM VISIT PAGE',),
    body: MFormBody(Childrens: [
      MRowTextRadioWidget(title: 'M1. NYHA SYMPTOMS CLASS:', options: List_items.NYHAClass,onChanged: (val){},),
      MRowTextRadioWidget(title: 'M2 Hospitalisations after discharge:',onChanged: (val){},),
      isHospitalisations ? MTextField(label: 'If Yes, Reason',onChanged: (val){},): Container(),
      MRowTextRadioWidget(title: 'M3 Follow up in Cardiology:',onChanged: (val){},),
      MRowTextRadioWidget(title: 'Specific treatment plans: :',onChanged: (val){},),
      MrowTextTextFieldWidget(title: 'M4 On Medications: (Kindly mention the drugs in the space provided below)',onChanged: (val){},),
      MRowTextRadioWidget(title: 'M5 Mode of Contraception used: ',onChanged: (val){
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
      isOther ? MTextField(label: 'If Others, Specify:',onChanged: (val){},): Container(),
      MText(text: 'M6 NEONATAL OUTCOME',),
      Space(),
      MrowTextTextFieldWidget(title: 'M6.1 Neonatal weight (kg):',onChanged: (val){},),
      MRowTextRadioWidget(title: 'M6.2 Echocardiographic evaluation (if any):',onChanged: (val){
        if(val == 'Yes'){
          setState(() {
            isYes = true;
          });
        }else{
          setState(() {
            isYes = true;
          });
        }
      }, isneedDivider: false,),
      isYes ? MRowTextRadioWidget(title: 'If Yes',onChanged: (val){}, options: ['Normal','Cong HD'],): Container(),
      MDivider(),
      MRowTextRadioWidget(title: 'M6.3 Adverse neonatal outcome:',options: ['Neonatal death','Cardiac lesion','Malnourishment'],onChanged: (val){},),
      MSmallText(text: 'M7 CLINICAL SIGNS & ECG',),
      Space(),
      MrowTextTextFieldWidget(title: 'M7.1 Weight (Kg):',onChanged: (val){},type: MInputType.numeric,),
      MrowTextTextFieldWidget(title: 'M7.2 HR (/min): ',onChanged: (val){},type: MInputType.numeric,),
      MrowTextTextFieldWidget(title: 'M7.3 SPO2 (%): ',onChanged: (val){},type: MInputType.numeric,),
      MrowTextTextFieldWidget(title: 'M7.4 BP (mm Hg): ',onChanged: (val){},type: MInputType.numeric,),
      MRowTextRadioWidget(title: 'M7.5 CCF: ',onChanged: (val){},),
      MRowTextRadioWidget(title: 'M7.6 Cyanosis:  ',onChanged: (val){},),
      MRowTextRadioWidget(title: 'M7.7 Cardiac murmur:',onChanged: (val){},),
      MrowTextDatePickerWidget(title: 'M7.8 ECG Date:',onChanged: (val){},isneedDivider: false,),
      MRowTextRadioWidget(options:List_items.NormalAbnormal ,onChanged: (val){},),
      //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormM2);},),
      FormM2()
    ],),
    );
  }
}
