import 'package:npac/app/export.dart';

class FormH5 extends StatefulWidget {
  final bool? enabled;
  const FormH5({super.key, this.enabled});

  @override
  State<FormH5> createState() => _FormH5State();
}

class _FormH5State extends State<FormH5> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MText(text: 'K8.3 OBSTETRIC OUTCOME (To be signed by the PI Chief Investigator of OBG)',),
        Space(),
        MRowTextRadioWidget(enabled : widget.enabled,title: 'Mode of delivery ',onChanged: (val){},options: ['NVD','AVD','Failed VD converted to LSCS ','LSCS'],),
        MSmallText(text: 'Components of Secondary Outcome- Obstetric',),
        Space(),
        FormH3Common(enabled : widget.enabled,title: '1. Preterm delivery (PROM, Labor, CS) Labor < 37 weeks ',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '2. Gestational Diabetes Mellitus',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '3. HDP - Gestational Hypertension',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '3. HDP - Pre-eclampsia',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '3. HDP - Eclampsia',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '3. HDP - HELLP',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '4. PROM - < 24 hours',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '4. PROM - > 24 hours',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '5. PPH > 500 ml',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '6. Infection / Sepsis',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '7. Retained placenta',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '8. Abruptio Placenta',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '9. Near Miss - CPR',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '9. Near Miss - Intubation',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '9. Near Miss - Inotrope',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '9. Near Miss - PH < 7',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '9. Near Miss - Oliguria',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '9. Near Miss - Lactate > 4 mmol/L',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
       // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH6);},)
      ],);
  }
}
