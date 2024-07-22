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
        MText(text: 'K8.3 Secondary outcome – Obstetric',),
        Space(),
        MRowTextRadioWidget(enabled : widget.enabled,title: 'Mode of delivery',onChanged: (val){},options: ['Normal VD','Assisted VD','Failed VD converted to LSCS ','LSCS'],),
        // MSmallText(text: 'Secondary outcome – Obstetric',),
        // Space(),
        FormH3Common(enabled : widget.enabled,title: '8.3.1. Gestational Diabetes Mellitus',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '8.3.2.a HDP - Gestational Hypertension',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '8.3.2.b HDP - Pre-eclampsia',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '8.3.2.c HDP - Eclampsia',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '8.3.2.d HDP - HELLP',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
      FormH3Common(enabled : widget.enabled,title: '8.3.3. Infection / Sepsis',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),

      FormH3Common(enabled : widget.enabled,title: '8.3.4.a Near Miss -  Cardiopulmonary Resuscitation',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
      FormH3Common(enabled : widget.enabled,title: '8.3.4.b Near Miss - Intubation',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
      FormH3Common(enabled : widget.enabled,title: '8.3.4.c Near Miss - Inotrope',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
      FormH3Common(enabled : widget.enabled,title: '8.3.4.d Near Miss - pH < 7',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
      FormH3Common(enabled : widget.enabled,title: '8.3.4.e Near Miss - Oliguria',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
      FormH3Common(enabled : widget.enabled,title: '8.3.4.f Near Miss - Lactate > 4 mmol/L',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),

      FormH3Common(enabled : widget.enabled,title: '8.3.5.a PROM - < 24 hours',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
        FormH3Common(enabled : widget.enabled,title: '8.3.5.b PROM - > 24 hours',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
      FormH3Common(enabled : widget.enabled,title: '8.3.6. Preterm delivery (PROM, Labor, CS) Labor < 37 weeks ',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
      FormH3Common(enabled : widget.enabled,title: '8.3.7. Abruptio Placenta',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),

      FormH3Common(enabled : widget.enabled,title: '8.3.8. Retained placenta',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),

      FormH3Common(enabled : widget.enabled,title: '8.3.9. PPH > 500 ml',radioiOnChanged: (val){},TextField1OnChanged:(val){} ,TextField2OnChanged: (val){},),
       // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH6);},)
      ],);
  }
}
