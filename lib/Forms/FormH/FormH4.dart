import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class FormH4 extends StatefulWidget {
  const FormH4({super.key});

  @override
  State<FormH4> createState() => _FormH4State();
}

class _FormH4State extends State<FormH4> {
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'H. PERIPARTUM VISIT PAGE (FORM H)',),
      body: MFormBody(Childrens: [
        MText(text: 'H6.1.2 SECONDARY CARDIAC OUTCOME',),
        Space(),
        MText(text: 'Components of Secondary Cardiac Outcome Cardiac',),
        Space(),
        FormH3Common(title: '1. Maternal Death < 180 days',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(title: '2. Urgent unplanned Cardiac hospitalization',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(title: '3. Decline in NYHA Class ≥ 1 during pregnancy / 6 weeks',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(title: '4. Elective Cardiac Interventions',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(title: '5. Duration of Stay in ICU',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        MSmallText(text: 'Signature of the PI / Chief Investigator of Cardiology: ',),
        Space(),
        MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH5);},)
      ],),
    );
  }
}
