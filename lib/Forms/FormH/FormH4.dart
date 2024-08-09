import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormH/Model/FormK4Model.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MSmallText.dart';

class FormH4 extends StatefulWidget {
  final bool? enabled;
  final Rx<FormK4Model>? formK4Data;
  const FormH4({super.key, this.enabled, this.formK4Data});

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
        FormH3Common(enabled: widget.enabled,title: '8.2.1. Maternal Death < 180 days',radioInitialValue:widget.formK4Data?.value.secondaryMaternalDeath,TypeInitialValue: widget.formK4Data?.value.secondaryMaternalDeathValues,TextField1InitialValue: widget.formK4Data?.value.secondaryMaternalDeathTime,TextField1OnChanged: (val){
          widget.formK4Data?.value.secondaryMaternalDeathTime = val;
        },TypeOnchanged: (val){
          widget.formK4Data?.value.secondaryMaternalDeathValues = val;
        },radioiOnChanged: (val){
          widget.formK4Data?.value.secondaryMaternalDeath = val;
        },),
        FormH3Common(enabled: widget.enabled,title: '8.2.2. Urgent unplanned Cardiac hospitalization',radioInitialValue: widget.formK4Data?.value.secCardiacHospitalization,TypeInitialValue: widget.formK4Data?.value.secCardiacHospitalizationValues,TextField1InitialValue: widget.formK4Data?.value.secCardiacHospitalizationTime,TextField1OnChanged: (val){
          widget.formK4Data?.value.secCardiacHospitalizationTime = val;
        },TypeOnchanged: (val){
          widget.formK4Data?.value.secCardiacHospitalizationValues = val;
        },radioiOnChanged: (val){
          widget.formK4Data?.value.secCardiacHospitalization = val;
        },),
        FormH3Common(enabled: widget.enabled,title: '8.2.3. Decline in NYHA Class ≥ 1 during pregnancy / 6 weeks',radioInitialValue: widget.formK4Data?.value.secNyhaClass,TypeInitialValue: widget.formK4Data?.value.secNyhaClassTime,TextField1InitialValue: widget.formK4Data?.value.secNyhaClassValues,TextField1OnChanged: (val){
          widget.formK4Data?.value.secNyhaClassTime = val;
        },TypeOnchanged: (val){
          widget.formK4Data?.value.secNyhaClassValues = val;
        },radioiOnChanged: (val){
          widget.formK4Data?.value.secNyhaClass = val;
        },),
        FormH3Common(enabled: widget.enabled,title: '8.2.4. Elective Cardiac Interventions',radioInitialValue: widget.formK4Data?.value.secEci,TypeInitialValue: widget.formK4Data?.value.secEciValues,TextField1InitialValue: widget.formK4Data?.value.secEciTime,TextField1OnChanged: (val){
          widget.formK4Data?.value.secEciTime = val;
        },TypeOnchanged: (val){
          widget.formK4Data?.value.secEciValues = val;
        },radioiOnChanged: (val){
          widget.formK4Data?.value.secEci = val;
        },),
        // FormH3Common(enabled: widget.enabled,title: '5. Duration of Stay in ICU (in days):',TextField1OnChanged: (val){},TypeOnchanged: (val){},radioiOnChanged: (val){},),
       // MSmallText(text: 'Signature of the PI / Chief Investigator of Cardiology: ',),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: '8.2.5 Duration of Stay in ICU (in days):',onChanged: (val){},type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: '8.2.6 Total number of ICU stay during hospitalization',onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'Verified by the PI cardiology',initialValue: widget.formK4Data?.value.verifiedBy,onChanged: (val){
          widget.formK4Data?.value.verifiedBy = val;
        },),
        Space(),
        //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH5);},)
      ],);
  }
}
