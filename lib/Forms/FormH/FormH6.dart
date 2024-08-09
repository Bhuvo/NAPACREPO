import 'package:npac/Forms/FormH/Model/FormK6Model.dart';
import 'package:npac/Forms/FormH/widget/FormH6Common.dart';
import 'package:npac/app/export.dart';

class FormH6 extends StatefulWidget {
  final bool? enabled;
  final Rx<FormK6Model>? formK6Data;
  const FormH6({super.key, this.enabled, this.formK6Data});

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
      FormH6Common(enabled:widget.enabled,title: '8.4.1. Miscarriage (Fetal loss up to 20 weeks)',radioInitialValue: widget.formK6Data?.value.fetalMiscarriage,TextField1InitialValue: widget.formK6Data?.value.fetalMiscarriageTime,TextFieldOnChanged:(val){
        widget.formK6Data?.value.fetalMiscarriageTime = val;
      },radioiOnChanged: (val){
        widget.formK6Data?.value.fetalMiscarriage = val;
      },),
        MRowTextRadioWidget(enabled:widget.enabled,title: '8.4.2. Fetal loss after 20 weeks',initialValue: widget.formK6Data?.value.fetalLossAnteIntra,options: ['Antepartum still birth','Intrapartum still birth'],onChanged: (val){
          widget.formK6Data?.value.fetalLossAnteIntra = val;
        },isneedDivider: false,),
      FormH6Common(enabled:widget.enabled,radioInitialValue: widget.formK6Data?.value.fetalLoss,TextField1InitialValue: widget.formK6Data?.value.fetalLossTime,TextFieldOnChanged:(val){
        widget.formK6Data?.value.fetalLossTime = val;
      },radioiOnChanged: (val){
        widget.formK6Data?.value.fetalLoss = val;
      },),
      FormH6Common(enabled:widget.enabled,title: '8.4.3. Small for gestational age',radioInitialValue: widget.formK6Data?.value.fetalGestAge,TextField1InitialValue: widget.formK6Data?.value.fetalGestAgeTime,TextFieldOnChanged: (val){
        widget.formK6Data?.value.fetalGestAgeTime = val;
      },radioiOnChanged: (val){
        widget.formK6Data?.value.fetalGestAge = val;
      },),
      FormH6Common(enabled:widget.enabled,title: '8.4.4. LBW (< 2.5 kg irrespective of gestational age)',radioInitialValue: widget.formK6Data?.value.fetalLowBirthWeight,TextField1InitialValue: widget.formK6Data?.value.lowBirthWeightTime,TextFieldOnChanged: (val){
        widget.formK6Data?.value.lowBirthWeightTime = val;
      },radioiOnChanged: (val){
        widget.formK6Data?.value.fetalLowBirthWeight = val;
      },),
      FormH6Common(enabled:widget.enabled,title: '8.4.5. Admission to NICU',radioInitialValue: widget.formK6Data?.value.neonatalIcuAdmit,TextField1InitialValue: widget.formK6Data?.value.neonatalIcuAdmitTime,TextFieldOnChanged: (val){
        widget.formK6Data?.value.neonatalIcuAdmitTime = val;
      },radioiOnChanged: (val){
        widget.formK6Data?.value.neonatalIcuAdmit = val;
      },),
      FormH6Common(enabled:widget.enabled,title: '8.4.6. Early Neonatal death (Up to 7 days)',radioInitialValue: widget.formK6Data?.value.earlyNeonatalDeath,TextField1InitialValue: widget.formK6Data?.value.earlyNeonatalDeathTime,TextFieldOnChanged: (val){
        widget.formK6Data?.value.earlyNeonatalDeathTime = val;
      },radioiOnChanged: (val){
        widget.formK6Data?.value.earlyNeonatalDeath = val;
      },),
      FormH6Common(enabled:widget.enabled,title: '8.4.7. Late Neonatal Death (8-28 Deaths)',radioInitialValue: widget.formK6Data?.value.lateNeonatalDeath,TextField1InitialValue: widget.formK6Data?.value.lateNeonatalDeathTime,TextFieldOnChanged: (val){
        widget.formK6Data?.value.lateNeonatalDeathTime = val;
      },radioiOnChanged: (val){
        widget.formK6Data?.value.lateNeonatalDeath = val;
      },),
      FormH6Common(enabled:widget.enabled,title: '8.4.8. Congenital anomalies (including CHD) in the newborn',radioInitialValue: widget.formK6Data?.value.congAnomalies,TextField1InitialValue: widget.formK6Data?.value.congAnomaliesTime,TextFieldOnChanged: (val){
        widget.formK6Data?.value.congAnomaliesTime = val;
      },radioiOnChanged: (val){
        widget.formK6Data?.value.congAnomalies = val;
      },),
    MrowTextTextFieldWidget(enabled : widget.enabled,title: 'Verifyed by PI Obstetrics',onChanged: (val){
      widget.formK6Data?.value.verifiedBy = val;
    },),
        Space(),
       // Text('Signature of PI / Chief investigator of Obstetrics'),
       // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH7);},)
      ],);
  }
}
