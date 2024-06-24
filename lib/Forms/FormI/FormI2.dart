import 'package:npac/Forms/FormI/Widget/ThreeTextField.dart';
import 'package:npac/Forms/FormI/Widget/YesNo.dart';
import 'package:npac/Forms/FormI/Widget/heading_wdiget.dart';
import 'package:npac/app/export.dart';

class FormI2 extends StatefulWidget {
  const FormI2({super.key});

  @override
  State<FormI2> createState() => _FormI2State();
}

class _FormI2State extends State<FormI2> {
  String option = '';

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
        MRowTextRadioWidget(title: 'Indication of AC: Pre-Pregnancy: ',onChanged: (val){},options: ['ACITROM','WARFARIN'],),
        MrowTextTextFieldWidget(title: 'Average INR',onChanged: (val){},),
        MRowTextRadioWidget(title: 'ASPIRIN',onChanged: (val){},),
        Heading_widget(title: '1st trimester 5-12 weeks',),
        MDivider(),
        Heading_widget(title: '2nd trimester 13-24 weeks',switchingWidget:MRowTextCheckBox(title: 'Time of swithcug',result: (val){},list: ['6th week','13th week','Before Delviery','Post Delviery'],) ,),
        MDivider(),
        Heading_widget(title: '3rd trimester 25- 36 weeks',switchingWidget: MRowTextRadioWidget(title: '6th week AC switch',onChanged: (val){},options: ['OAC to LMWH','OAC to UFH'],),),
          MDivider(),
          Heading_widget(title: 'Peripartum  >36 weeks',switchingWidget: MRowTextRadioWidget(title: '13th week AC switch',onChanged: (val){},options: ['LMWH to OAC','UFH to OAC'],),),
          MDivider(),
          Heading_widget(title: 'Intrapartum',switchingWidget: MRowTextRadioWidget(title: '36th week AC switch',onChanged: (val){},options: ['OAC to LMWH','OAC to LMWH'],),),
          MDivider(),
          Heading_widget(title: 'Postpartum',switchingWidget:MRowTextRadioWidget(title: 'Before Delviery (LMWH/ bolus UFH to UFH infusion)',onChanged: (val){},) ,),
          MDivider(),
          Heading_widget(title: 'Follow up',switchingWidget:MRowTextRadioWidget(title: 'Post Delviery (UFH to OAC)',onChanged: (val){},)  ,),
          MFilledButton(text: 'submit',onPressed: (){context.push(Routes.Home);},)
      ],);
  }
}
