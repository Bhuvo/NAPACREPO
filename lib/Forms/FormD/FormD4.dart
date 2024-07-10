import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormD/widget/ValveD7.dart';
import 'package:npac/app/export.dart';

class FormD4 extends StatefulWidget {
  final bool? isEnabled;
  const FormD4({super.key, this.isEnabled});

  @override
  State<FormD4> createState() => _FormD4State();
}

class _FormD4State extends State<FormD4> {


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MText(text: 'D7 PROSTHETIC VALVE ECHO PAGE',),
      Space(),
      Row(
        children: [
          Flexible(child: MText(text: 'ECHOCARDIOGRAPHIC ASSESSMENT AND FOLLOW UP',)),
        ],
      ),
      MSmallText(text: 'Antenatal revisit 1',),
      Space(),
      valveD7(isEnabled:widget.isEnabled),
      MSmallText(text: 'Antenatal revisit 2',),
      Space(),
      valveD7(isEnabled:widget.isEnabled),

      // MSmallText(text: 'D7.1 Mean gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.2 Peak gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.3 Normal disc movement (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.4 Visible thrombus (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),

      MSmallText(text: 'Antenatal revisit 3',),
      Space(),
      valveD7(isEnabled:widget.isEnabled),

      // MSmallText(text: 'D7.1 Mean gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.2 Peak gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.3 Normal disc movement (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.4 Visible thrombus (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),

      MSmallText(text: 'Peripartum',),
      Space(),
      valveD7(isEnabled:widget.isEnabled),

      // MSmallText(text: 'D7.1 Mean gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.2 Peak gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.3 Normal disc movement (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.4 Visible thrombus (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),

      MSmallText(text: 'Post Natal',),
      Space(),
      valveD7(isEnabled:widget.isEnabled),

      // MSmallText(text: 'D7.1 Mean gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.2 Peak gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.3 Normal disc movement (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.4 Visible thrombus (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MrowTextTextFieldWidget(title: 'Other relevant echo findings:',onChanged: (val){},type: MInputType.text,),
     // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormD5);},)
    ],);
  }
}
