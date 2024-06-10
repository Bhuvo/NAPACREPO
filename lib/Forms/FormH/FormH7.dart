import 'package:npac/app/export.dart';

class FormH7 extends StatefulWidget {
  const FormH7({super.key});

  @override
  State<FormH7> createState() => _FormH7State();
}

class _FormH7State extends State<FormH7> {
  bool isDead = false;
  bool isDischarge = false;
  bool isOther = false;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title:  'H. PERIPARTUM VISIT PAGE (FORM H)',),
      body: MFormBody(Childrens: [
        MRowTextRadioWidget(title: 'H7. FINAL OUTCOME ',onChanged: (val){
          if(val =='Death'){
            setState(() {
              isDead = true;
            });
          }else{
            setState(() {
              isDead = false;
            });
          }
          if(val =='Discharge'){
            setState(() {
              isDischarge = true;
            });
          }else{
            setState(() {
              isDischarge = false;
            });
          }
        },options: ['Death', 'Discharge'],isneedDivider: false,),
        isDead? MrowTextTextFieldWidget(title: 'H8. DEATH DETAILS: (Death Summary)',onChanged: (val){}):  Container(),
        isDischarge?Column(children: [
          MSmallText(text: 'H9. DISCHARGE DETAILS',),
          Space(),
          MrowTextTextFieldWidget(title: 'H9. DISCHARGE DETAILS',onChanged: (val){},type: MInputType.numeric,),
          MRowTextRadioWidget(title: 'H9.2 Functional Class at discharge',onChanged: (val){},options: List_items.NYHAClass,),
          MRowTextRadioWidget(title: 'H9.3 Mode of Contraception advised / provided: ',onChanged: (val){
            if(val =='Others'){
              setState(() {
                isOther = true;
              });
            }else{
              setState(() {
                isOther = false;
              });
            }
          },options:['Nil','IUCD','OCP','Barrier method','Tubectomy','Others'],),
          isOther? MTextField(label: 'If Other Specify',onChanged: (val){},): Container(),
          MrowTextDatePickerWidget(title: 'H9.4 Follow up date:',onChanged: (val){},),
          MRowTextRadioWidget(title: 'H9.5 Breast feeding:',onChanged: (val){},options: ['Established (duration)','Not established'],),
          MrowTextTextFieldWidget(title: 'H10 Any other relevant information/ remarks:',onChanged: (val){},),
          MFilledButton(text: 'submit',onPressed: (){},)
        ],):  Container(),
        MFilledButton(text: 'Next',onPressed: (){context.push(Routes.Home);},)
      ],),
    );
  }
}
