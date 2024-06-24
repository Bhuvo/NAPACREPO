import 'package:npac/app/export.dart';

class FormH5 extends StatefulWidget {
  const FormH5({super.key});

  @override
  State<FormH5> createState() => _FormH5State();
}

class _FormH5State extends State<FormH5> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MText(text: 'H6.2 OBSTETRIC OUTCOME (To be signed by the PI Chief Investigator of OBG)',),
        Space(),
        MRowTextRadioWidget(title: 'Mode of delivery ',onChanged: (val){},options: ['NVD','AVD','Failed VD converted to LSCS ','LSCS'],),
        FormH3Common(title: '1. Preterm delivery (PROM, Labor, CS) Labor < 37 weeks ',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '2. Gestational Diabetes Mellitus',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '3. HDP - Gestational Hypertension',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '3. HDP - Pre-eclampsia',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '3. HDP - Eclampsia',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '3. HDP - HELLP',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '4. PROM - < 24 hours',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '4. PROM - > 24 hours',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '5. PPH > 500 ml',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '6. Infection / Sepsis',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '7. Retained placenta',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '8. Abruptio Placenta',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '9. Near Miss - CPR',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '9. Near Miss - Intubation',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '9. Near Miss - Inotrope',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '9. Near Miss - PH < 7',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '9. Near Miss - Oliguria',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(title: '9. Near Miss - Lactate > 4 mmol/L',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
       // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH6);},)
      ],);
  }
}
