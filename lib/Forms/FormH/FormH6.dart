import 'package:npac/app/export.dart';

class FormH6 extends StatefulWidget {
  const FormH6({super.key});

  @override
  State<FormH6> createState() => _FormH6State();
}

class _FormH6State extends State<FormH6> {
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'H. PERIPARTUM VISIT PAGE (FORM H)',),
      body: MFormBody(Childrens: [
        MText(text: 'H6.3 FETAL OUTCOME',),
        Space(),
        MSmallText(text: 'Components of Secondary Outcome-Fetal',),
        Space(),
       FormH3Common(title: '1. Miscarriage (Fetal loss up to 20 weeks)',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        MRowTextRadioWidget(title: '2. Fetal loss after 20 weeks',options: ['Antepartum still birth','Intrapartum still birth'],onChanged: (val){},isneedDivider: false,),
        FormH3Common(TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(title: '3. Small for gestational age',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(title: '4. LBW (< 2.5 kg irrespective of gestational age)',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(title: '5. Admission to NICU',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(title: '6. Early Neonatal death (Up to 7 days)',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(title: '7. Late Neonatal Death (8-28 Deaths)',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        FormH3Common(title: '8. Congenital anomalies (including CHD) in the newborn',TextField1OnChanged:(val){},TextField2OnChanged: (val){},radioiOnChanged: (val){},),
        Space(),
        Text('Signature of PI / Chief investigator of Obstetrics'),
        MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH7);},)
      ],),

    );
  }
}
