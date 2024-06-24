import 'package:npac/app/export.dart';

class FormD4 extends StatefulWidget {
  const FormD4({super.key});

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
          MText(text: 'ECHOCARDIOGRAPHIC ASSESSMENT AND FOLLOW UP',),
        ],
      ),

      MSmallText(text: '1st Trimester',),
      Space(),
      MSmallText(text: 'Mean gradient (mmHg)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Peak gradient (mmHg)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Normal 2D movement of the Prosthetic valve (Y/N)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Any thrombus visible (Y/N)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),

      MSmallText(text: '2nd Trimester',),
      Space(),
      MSmallText(text: 'Mean gradient (mmHg)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Peak gradient (mmHg)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Normal 2D movement of the Prosthetic valve (Y/N)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Any thrombus visible (Y/N)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),

      MSmallText(text: '3rd Trimester',),
      Space(),
      MSmallText(text: 'Mean gradient (mmHg)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Peak gradient (mmHg)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Normal 2D movement of the Prosthetic valve (Y/N)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Any thrombus visible (Y/N)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),

      MSmallText(text: 'Peripartum',),
      Space(),
      MSmallText(text: 'Mean gradient (mmHg)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Peak gradient (mmHg)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Normal 2D movement of the Prosthetic valve (Y/N)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Any thrombus visible (Y/N)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),

      MSmallText(text: 'PN',),
      Space(),
      MSmallText(text: 'Mean gradient (mmHg)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Peak gradient (mmHg)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Normal 2D movement of the Prosthetic valve (Y/N)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MSmallText(text: 'Any thrombus visible (Y/N)',),
      Space(),
      TwoTextFields(type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MrowTextTextFieldWidget(title: 'Other relevant echo findings:',onChanged: (val){},type: MInputType.text,),
     // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormD5);},)
    ],);
  }
}
