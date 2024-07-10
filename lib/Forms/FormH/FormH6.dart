import 'package:npac/Forms/FormH/widget/FormH6Common.dart';
import 'package:npac/app/export.dart';

class FormH6 extends StatefulWidget {
  final bool? enabled;
  const FormH6({super.key, this.enabled});

  @override
  State<FormH6> createState() => _FormH6State();
}

class _FormH6State extends State<FormH6> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MText(text: 'K8.4 Secondary outcome – Fetal',),
        Space(),
        // MSmallText(text: 'SECONDARY OUTCOME - Fetal',),
        // Space(),
      FormH6Common(enabled:widget.enabled,title: '8.4.1. Miscarriage (Fetal loss up to 20 weeks)',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        MRowTextRadioWidget(enabled:widget.enabled,title: '8.4.2. Fetal loss after 20 weeks',options: ['Antepartum still birth','Intrapartum still birth'],onChanged: (val){},isneedDivider: false,),
      FormH6Common(enabled:widget.enabled,TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
      FormH6Common(enabled:widget.enabled,title: '8.4.3. Small for gestational age',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
      FormH6Common(enabled:widget.enabled,title: '8.4.4. LBW (< 2.5 kg irrespective of gestational age)',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
      FormH6Common(enabled:widget.enabled,title: '8.4.5. Admission to NICU',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
      FormH6Common(enabled:widget.enabled,title: '8.4.6. Early Neonatal death (Up to 7 days)',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
      FormH6Common(enabled:widget.enabled,title: '8.4.7. Late Neonatal Death (8-28 Deaths)',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
      FormH6Common(enabled:widget.enabled,title: '8.4.8. Congenital anomalies (including CHD) in the newborn',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        Space(),
       // Text('Signature of PI / Chief investigator of Obstetrics'),
       // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH7);},)
      ],);
  }
}
