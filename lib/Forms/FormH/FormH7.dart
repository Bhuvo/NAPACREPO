import 'package:npac/app/export.dart';

class FormH7 extends StatefulWidget {
  final bool? enabled;
  const FormH7({super.key, this.enabled});

  @override
  State<FormH7> createState() => _FormH7State();
}

class _FormH7State extends State<FormH7> {
  bool isDead = false;
  bool isDischarge = false;
  bool isOther = false;
  bool isEstablished = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MRowTextRadioWidget(enabled: widget.enabled,title: 'K9. FINAL OUTCOME',onChanged: (val){
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
        isDead? Column(
          children: [
            MrowTextDatePickerWidget(enabled: widget.enabled,title: 'K9.2.1 Date of death:',onChanged: (val){},),
            MrowTextTextFieldWidget(enabled: widget.enabled,title: 'K9.2.2 DEATH DETAILS: (Death Summary)',onChanged: (val){}),
          ],
        ):  Container(),
        isDischarge?Column(children: [
          MSmallText(text: 'K9.1. DISCHARGE DETAILS',),
          Space(),
          MSmallText(text: 'K9.1 Discharge Details',),
          Space(),
          MrowTextDatePickerWidget(enabled: widget.enabled,title: 'K9.1.1 Date of Discharge: ',onChanged: (val){},),
          MrowTextTextFieldWidget(enabled: widget.enabled,title: 'K9.1.2 Duration of stay:',onChanged: (val){},),
          MRowTextRadioWidget(enabled: widget.enabled,title: 'K9.1.3  NYHA Class at discharge',onChanged: (val){},options: List_items.NYHAClass,),
          MRowTextRadioWidget(enabled: widget.enabled,title: 'K9.1.4 Mode of Contraception advised / provided: ',onChanged: (val){
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
          isOther? MTextField(enabled: widget.enabled,label: 'If Other Specify',onChanged: (val){},): Container(),
          MRowTextRadioWidget(enabled: widget.enabled,title: 'K9.1.4 Breast feeding:',onChanged: (val){
            val =='Established'? isEstablished = true : isEstablished = false;
            setState(() {});
          },options: ['Established','Not established'],),
          isEstablished ? MTextField(label: 'Postnatal day at which established',onChanged: (val){},): Container(),
          MrowTextDatePickerWidget(enabled: widget.enabled,title: 'K9.1.5  Next follow up date advised',onChanged: (val){},),
          MrowTextTextFieldWidget(enabled: widget.enabled,title: 'K10 Any other relevant information/ remarks:',onChanged: (val){},),
         // MFilledButton(text: 'submit',onPressed: (){context.push(Routes.Home);},)
        ],):  Container(),
       // MFilledButton(text: 'submit',onPressed: (){context.push(Routes.Home);},)
      ],);
  }
}
