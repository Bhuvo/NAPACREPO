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
        MText(text: 'K8.2 Secondary outcome – Maternal',),
        Space(),
        // MSmallText(text: 'Components of Secondary Cardiac Outcome Cardiac',),
        // Space(),
        FormH3Common(enabled: widget.enabled,title: '8.2.1. Maternal Death < 180 days',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '8.2.2. Urgent unplanned Cardiac hospitalization',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '8.2.3. Decline in NYHA Class ≥ 1 during pregnancy / 6 weeks',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '8.2.4. Elective Cardiac Interventions',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        // FormH3Common(enabled: widget.enabled,title: '5. Duration of Stay in ICU (in days):',TextField1OnChanged: (val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
       // MSmallText(text: 'Signature of the PI / Chief Investigator of Cardiology: ',),
      MrowTextTextFieldWidget(enabled: widget.enabled,title: '8.2.5 Duration of Stay in ICU (in days):',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: '8.2.6 Total number of ICU stay during hospitalization',onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'Verified by:',onChanged: (val){},),
        Space(),
        //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH5);},)
      ],);
  }
}
