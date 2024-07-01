import 'package:npac/app/export.dart';

class FormH3 extends StatefulWidget {
  final bool? enabled;
  const FormH3({super.key, this.enabled});

  @override
  State<FormH3> createState() => _FormH3State();
}

class _FormH3State extends State<FormH3> {
  bool isDeath = false;

  bool isObstetric = false;
  bool isNonObstetric = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MText(text: 'K8 OUTCOME AND COMPLICATIONS (Include Follow-up outcome details too)',),
        Space(),
        Row(
          children: [
            MText(text: 'K8.1 PRIMARY CARDIAC OUTCOME ',),
          ],
        ),
        Space(),
        MDivider(),
        MRowTextRadioWidget(enabled: widget.enabled,title: '1. Maternal Death# < 42 days',onChanged: (val){},options: ['Cardiac','Non-Cardiac'],isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
          if(val == 'Yes'){
            setState(() {
              isDeath= true;
            });
          }else{
            setState(() {
              isDeath= false;
            });
          }
        },isneedDivider: false,),
        isDeath ? MTextField(enabled: widget.enabled,label: 'AN / IP/ PA',onChanged: (val){},) : Container(),
        isDeath ? MTextField(enabled: widget.enabled,label: 'Gest Age',onChanged: (val){},): Container(),
        MDivider(),
        FormH3Common(enabled: widget.enabled,title: '2. Resuscitated cardiac arrest',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '3. New onset HF or worsening HF requiringTreatment escalation or hospitalization',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '4. New or sustained cardiac arrhythmia requiring treatment',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '5. CVA/ Stroke',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '6. Prosthetic valve thrombosis',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '7. Systemic Thromboembolism',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '8. Venous Thromboembolism (PTE/CVT & others)',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        MRowTextRadioWidget(enabled: widget.enabled,title: '9. Bleeding: Major / Minor',onChanged: (val){
          if(val =='Obstetric'){
            setState(() {
              isObstetric = true;
            });
          }else{
            setState(() {
              isObstetric = false;
            });
          }
          if(val =='Non-Obstetric'){
            setState(() {
              isNonObstetric = true;
            });
          }else{
            setState(() {
              isNonObstetric = false;
            });
          }
        },isneedDivider: false,options: ['Obstetric','Non-Obstetric'],),
        isObstetric? MTextField(enabled: widget.enabled,label: 'Obstetric Details',onChanged: (val){},): Container(),
        isNonObstetric? MTextField(enabled: widget.enabled,label: 'Non-Obstetric Details',onChanged: (val){},): Container(),
        FormH3Common(enabled: widget.enabled,radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '10. Infective Endocarditis',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '11. Aortic dissection',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '12. Acute coronary syndrome',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '13. Urgent Cardiac Intervention',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        // MrowTextTextFieldWidget(title: '14. Please provide details of recurrence of any of the above-mentioned outcome events 1-13: (if any)',onChanged: (val){},),
        //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH4);},)
      ],);
  }
}
