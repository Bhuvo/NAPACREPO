import 'package:npac/Forms/FormH/widget/FormH3CommonEvents.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextCheckBox.dart';

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

  bool isDeathAn = false;
  bool isDeathIP = false;
  bool isDeathPA = false;

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
        MRowTextRadioWidget(enabled: widget.enabled,title: '8.1.1. Maternal Death# < 42 days',onChanged: (val){},options: ['Cardiac','Non-Cardiac'],isneedDivider: false,),
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
      isDeath ? MRowTextRadioWidget(enabled: widget.enabled,isneedDivider: false,title: 'If yes, specify',options: ['AN' , 'IP', 'PA'],onChanged: (val){
        val =='AN' ? isDeathAn= true : isDeathAn= false;
        val =='IP' ? isDeathIP= true : isDeathIP= false;
        val =='PA' ? isDeathPA= true : isDeathPA= false;
        setState(() {

        });
      },): Container(),
        isDeath && isDeathAn ? MTextField(enabled: widget.enabled,label: 'AN Time(in weeks)',onChanged: (val){},) : Container(),
        isDeath && isDeathIP ? MTextField(enabled: widget.enabled,label: 'IP',onChanged: (val){},) : Container(),
        isDeath && isDeathPA ? MTextField(enabled: widget.enabled,label: 'PA Time(in days)',onChanged: (val){},) : Container(),
        // isDeath ? MTextField(enabled: widget.enabled,label: 'Time',onChanged: (val){},): Container(),
        MDivider(),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.2. Resuscitated cardiac arrest',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.3. New onset HF or worsening HF requiringTreatment escalation or hospitalization',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.4. New or sustained cardiac arrhythmia requiring treatment',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.5. CVA/ Stroke',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.6. Prosthetic valve thrombosis',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.7. Systemic Thromboembolism',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.8. Venous Thromboembolism (PTE/CVT & others)',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
       
        MRowTextCheckBox(enabled: widget.enabled,title: '8.1.9. Bleeding: Major / Minor',result: (val){
          if(val.contains('Obstetric')){
            setState(() {
              isObstetric = true;
            });
          }else{
            setState(() {
              isObstetric = false;
            });
          }
          if(val.contains('Non-Obstetric')){
            setState(() {
              isNonObstetric = true;
            });
          }else{
            setState(() {
              isNonObstetric = false;
            });
          }
        },isneedDivider: false,list: ['Obstetric','Non-Obstetric'],),
        isObstetric? MTextField(enabled: widget.enabled,label: 'Obstetric Details',onChanged: (val){},): Container(),
        isNonObstetric? MTextField(enabled: widget.enabled,label: 'Non-Obstetric Details',onChanged: (val){},): Container(),
        FormH3Common(enabled: widget.enabled,radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '8.1.10. Infective Endocarditis',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '8.1.11. Aortic dissection',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '8.1.12. Acute coronary syndrome',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(enabled: widget.enabled,title: '8.1.13. Urgent Cardiac Intervention',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        // MrowTextTextFieldWidget(title: '14. Please provide details of recurrence of any of the above-mentioned outcome events 1-13: (if any)',onChanged: (val){},),
        //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH4);},)
      ],);
  }
}
