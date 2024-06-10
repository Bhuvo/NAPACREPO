import 'package:npac/app/export.dart';

class FormH3 extends StatefulWidget {
  const FormH3({super.key});

  @override
  State<FormH3> createState() => _FormH3State();
}

class _FormH3State extends State<FormH3> {
  bool isDeath = false;

  bool isObstetric = false;
  bool isNonObstetric = false;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'H. PERIPARTUM VISIT PAGE (FORM H)',),
      body: MFormBody(Childrens: [
        MText(text: 'OUTCOME AND COMPLICATIONS (Include Follow-up outcome details too)',),
        Row(
          children: [
            MText(text: 'H6.1.1 PRIMARY CARDIAC OUTCOME ',),
          ],
        ),
        Space(),
        Text('H6.1.1 PRIMARY CARDIAC OUTCOME '),
        Space(),
        MDivider(),
        MRowTextRadioWidget(title: 'Maternal Death# < 42 days',onChanged: (val){},options: ['Cardiac','Non-Cardiac'],isneedDivider: false,),
        MRowTextRadioWidget(onChanged: (val){
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
        isDeath ? MTextField(label: 'AN / IP/ PA',onChanged: (val){},) : Container(),
        isDeath ? MTextField(label: 'Gest Age',onChanged: (val){},): Container(),
        MDivider(),
        FormH3Common(title: '2. Resuscitated cardiac arrest',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(title: '3. New onset HF or worsening HF requiringTreatment escalation or hospitalization',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(title: '4. New or sustained cardiac arrhythmia requiring treatment',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(title: '5. CVA/ Stroke',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(title: '6. Prosthetic valve thrombosis',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(title: '7. Systemic Thromboembolism',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(title: '8. Venous Thromboembolism (PTE/CVT & others)',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        MRowTextRadioWidget(title: '9. Bleeding: Major / Minor',onChanged: (val){
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
        isObstetric? MTextField(label: 'Obstetric Details',onChanged: (val){},): Container(),
        isNonObstetric? MTextField(label: 'Non-Obstetric Details',onChanged: (val){},): Container(),
        FormH3Common(radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(title: '10. Infective Endocarditis',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(title: '11. Aortic dissection',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(title: '12. Acute coronary syndrome',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        FormH3Common(title: '13. Urgent Cardiac Intervention',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
        MrowTextTextFieldWidget(title: '14. Please provide details of recurrence of any of the above-mentioned outcome events 1-13: (if any)',onChanged: (val){},),
        MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH4);},)
      ],),
    );
  }
}
