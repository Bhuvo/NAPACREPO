import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MrowTextTextfieldWidget.dart';

class FormE2 extends StatefulWidget {
  const FormE2({super.key});

  @override
  State<FormE2> createState() => _FormE2State();
}

class _FormE2State extends State<FormE2> {
   bool isObstetric = false;
   bool isNonObstetric = false;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MAppBar(title: 'E. ABORTION / MTP PAGE (FORM E)')),

      body: MFormBody(Childrens: [
        MText(text: 'E8. MATERNAL OUTCOME',),
        Space(),
        MText(text: 'E9.1 MATERNAL CARDIAC OUTCOME',),
        Space(),
        Text('E9.1.1 PRIMARY CARDIAC OUTCOME '),
        Space(),
        MDivider(),
        MRowTextRadioWidget(title: 'Maternal Death# < 42 days',onChanged: (val){},options: ['Cardiac','Non-Cardiac'],isneedDivider: false,),
        MRowTextRadioWidget(onChanged: (val){},isneedDivider: false,),
        MTextField(label: 'Gest Age',onChanged: (val){},),
        MDivider(),
        FromE2Common(title: 'Resuscitated cardiac arrest',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'New onset HF or worsening HF requiring Treatment escalation or hospitalization',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'New or sustained cardiac arrhythmia requiring treatment',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'CVA/ Stroke',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'Prosthetic valve thrombosis',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'Systemic Thromboembolism',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'Venous Thromboembolism (PTE/CVT & others)',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
       MRowTextRadioWidget(title: 'Bleeding: Major / Minor',onChanged: (val){
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
        FromE2Common(title: '',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'Infective Endocarditis',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'Aortic dissection',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'Acute coronary syndrome',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'Urgent Cardiac Intervention',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),

        MText(text: 'E9.1.2 SECONDARY CARDIAC OUTCOME',),
        Space(),
        Text('Components of Secondary Maternal Cardiac Outcome- '),
        FromE2Common(title: 'Maternal Death < 180 days',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'Urgent unplanned Cardiac hospitalization',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'Decline in NYHA Class ≥ 1 during pregnancy / 6 weeks',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'Elective Cardiac Interventions',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'Duration of Stay in ICU',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        FromE2Common(title: 'Other Complications/Outcome',radioiOnChanged: (val){},TextFieldOnChanged: (val){},),
        MrowTextTextFieldWidget(title: 'E9. Total duration of hospital stay: Number of days: ',type: MInputType.numeric,),
        MFilledButton(text: 'Submit',onPressed: (){}),




      ],),
    );
  }
}
