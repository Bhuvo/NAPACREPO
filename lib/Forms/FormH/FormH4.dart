import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MSmallText.dart';

class FormH4 extends StatefulWidget {
  final bool? enabled;
  const FormH4({super.key, this.enabled});

  @override
  State<FormH4> createState() => _FormH4State();
}

class _FormH4State extends State<FormH4> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MText(text: 'K8.2 SECONDARY CARDIAC OUTCOME',),
        Space(),
        MSmallText(text: 'Components of Secondary Cardiac Outcome Cardiac',),
        Space(),
        FormH3Common(enabled: widget.enabled,title: '1. Maternal Death < 180 days',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '2. Urgent unplanned Cardiac hospitalization',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '3. Decline in NYHA Class ≥ 1 during pregnancy / 6 weeks',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '4. Elective Cardiac Interventions',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '5. Duration of Stay in ICU',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
       // MSmallText(text: 'Signature of the PI / Chief Investigator of Cardiology: ',),
        Space(),
        //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH5);},)
      ],);
  }
}
