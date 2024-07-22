import 'package:npac/Forms/FormE/FormEModel/FormEModel.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MrowTextTextfieldWidget.dart';

class FormE2 extends StatefulWidget {
  final Rx<FormEModel>? formEData;
  final bool? enabled;
  const FormE2({super.key, required this.formEData, this.enabled});

  @override
  State<FormE2> createState() => _FormE2State();
}

class _FormE2State extends State<FormE2> {
   bool isObstetric = false;
   bool isNonObstetric = false;
   bool isAge = false;

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
        // MText(text: 'E8. MATERNAL OUTCOME ${widget.formEData?.value.abortType}',),
        // Space(),
        // MText(text: 'E9.1 MATERNAL CARDIAC OUTCOME',),
        // Space(),
        Text('H10.2 Cardiac outcome up to MTP'),
        Space(),
       // MDivider(),
        MRowTextRadioWidget(enabled : widget.enabled,initialValue: widget.formEData?.value.maternalDeathFourTwo,title: '10.2.1 Maternal Death# < 42 days',onChanged: (val){
          widget.formEData?.value.maternalDeathFourTwo = val;
        },options: ['Cardiac','Non-Cardiac'],isneedDivider: false,),
        MRowTextRadioWidget(enabled : widget.enabled,initialValue: widget.formEData?.value.maternalDeathFourTwoValue,onChanged: (val){
          val == 'Yes'? isAge = true : isAge = false;
          widget.formEData?.value.maternalDeathFourTwoValue = val;
          setState(() {});
        },isneedDivider: false,),
      isAge ? MTextField(label: 'Gestational age',initalValue: widget.formEData?.value.maternalDeathFourTwoDetails,onChanged: (val){
          widget.formEData?.value.maternalDeathFourTwoDetails = val;
        },): Container(),
        MDivider(),
        FromE2Common(enabled : widget.enabled ,radioInitialValue: widget.formEData?.value.resuscitatedCardiacArrest,TextInitialValue: widget.formEData?.value.resuscitatedCardiacArrestDetails,title: '10.2.2 Resuscitated cardiac arrest',radioiOnChanged: (val){
          widget.formEData?.value.resuscitatedCardiacArrest = val;
        },TextFieldOnChanged: (val){
           widget.formEData?.value.resuscitatedCardiacArrestDetails = val;
        },),
        FromE2Common(enabled : widget.enabled,radioInitialValue: widget.formEData?.value.newOnsetHF,TextInitialValue: widget.formEData?.value.newOnsetHFDetails,title: '10.2.3 New onset HF or worsening HF requiring Treatment escalation or hospitalization',radioiOnChanged: (val){
          widget.formEData?.value.newOnsetHF = val;
        },TextFieldOnChanged: (val){
           widget.formEData?.value.newOnsetHFDetails = val;
        },),
        FromE2Common(enabled : widget.enabled,  radioInitialValue: widget.formEData?.value.newSustainedCardiacArrhythmia,TextInitialValue: widget.formEData?.value.newSustainedCardiacArrhythmiaDetails,title: '10.2.4 New or sustained cardiac arrhythmia requiring treatment',radioiOnChanged: (val){
          widget.formEData?.value.newSustainedCardiacArrhythmia = val;
        },TextFieldOnChanged: (val){
           widget.formEData?.value.newSustainedCardiacArrhythmiaDetails = val;
        },),
        FromE2Common(enabled : widget.enabled,radioInitialValue: widget.formEData?.value.cVAStroke,TextInitialValue: widget.formEData?.value.cVAStrokeDetails,title: '10.2.5 CVA/ Stroke',radioiOnChanged: (val){
          widget.formEData?.value.cVAStroke = val;
        },TextFieldOnChanged: (val){
           widget.formEData?.value.cVAStrokeDetails = val;
        },),
        FromE2Common(enabled : widget.enabled, radioInitialValue: widget.formEData?.value.prostheticValveThrombosis,TextInitialValue: widget.formEData?.value.prostheticValveThrombosisDetails,title: '10.2.6 Prosthetic valve thrombosis',radioiOnChanged: (val){
          widget.formEData?.value.prostheticValveThrombosis = val;
        },TextFieldOnChanged: (val){
           widget.formEData?.value.prostheticValveThrombosisDetails = val;
        },),
        FromE2Common(enabled : widget.enabled, radioInitialValue: widget.formEData?.value.systemicThromboembolism,TextInitialValue: widget.formEData?.value.systemicThromboembolismDetails,title: '10.2.7 Systemic Thromboembolism',radioiOnChanged: (val){
          widget.formEData?.value.systemicThromboembolism = val;
        },TextFieldOnChanged: (val){
           widget.formEData?.value.systemicThromboembolismDetails = val;
        },),
        FromE2Common(enabled : widget.enabled,radioInitialValue: widget.formEData?.value.venousThromboembolism,TextInitialValue: widget.formEData?.value.venousThromboembolismDetails,title: '10.2.8 Venous Thromboembolism (PTE/CVT & others)',radioiOnChanged: (val){
          widget.formEData?.value.venousThromboembolism = val;
        },TextFieldOnChanged: (val){
           widget.formEData?.value.venousThromboembolismDetails = val;
        },),
       MRowTextRadioWidget(enabled : widget.enabled,initialValue: widget.formEData?.value.bleedingMajorMinor,title: '10.2.9 Bleeding: Major / Minor',onChanged: (val){
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
         widget.formEData?.value.bleedingMajorMinor = val;
       },isneedDivider: false,options: ['Obstetric','Non-Obstetric'],),
        isObstetric? MTextField(enabled : widget.enabled, initalValue: widget.formEData?.value.bleedingMajorMinorObestric,label: 'Obstetric Details',onChanged: (val){
          widget.formEData?.value.bleedingMajorMinorObestric;
        },): Container(),
        isNonObstetric? MTextField(enabled : widget.enabled,initalValue: widget.formEData?.value.bleedingMajorMinorNonObestric,label: 'Non-Obstetric Details',onChanged: (val){
          widget.formEData?.value.bleedingMajorMinorNonObestric;
        },): Container(),
        FromE2Common(enabled : widget.enabled,radioInitialValue: widget.formEData?.value.bleedingMajorMinorValue, TextInitialValue: widget.formEData?.value.bleedingMajorMinorDetails,title: '',radioiOnChanged: (val){
          widget.formEData?.value.bleedingMajorMinorValue = val;
        },TextFieldOnChanged: (val){
          widget.formEData?.value.bleedingMajorMinorDetails = val;
        },),
        FromE2Common(enabled : widget.enabled,radioInitialValue: widget.formEData?.value.infectiveEndocarditis,TextInitialValue: widget.formEData?.value.infectiveEndocarditisDetails,title: '10.2.10 Infective Endocarditis',radioiOnChanged: (val){
          widget.formEData?.value.infectiveEndocarditis = val;
        },TextFieldOnChanged: (val){
          widget.formEData?.value.infectiveEndocarditisDetails = val;
        },),
        FromE2Common(enabled : widget.enabled,radioInitialValue: widget.formEData?.value.aorticDissection,TextInitialValue: widget.formEData?.value.aorticDissectionDetails,title: '10.2.11 Aortic dissection',radioiOnChanged: (val){
          widget.formEData?.value.aorticDissection = val;
        },TextFieldOnChanged: (val){
          widget.formEData?.value.aorticDissectionDetails = val;
        },),
        FromE2Common(enabled : widget.enabled,radioInitialValue: widget.formEData?.value.acuteCoronarySyndrome,TextInitialValue: widget.formEData?.value.acuteCoronarySyndromeDetails,title: '10.2.12 Acute coronary syndrome',radioiOnChanged: (val){
          widget.formEData?.value.acuteCoronarySyndrome = val;
        },TextFieldOnChanged: (val){
          widget.formEData?.value.acuteCoronarySyndromeDetails = val;
        },),
        FromE2Common(enabled : widget.enabled,  radioInitialValue: widget.formEData?.value.urgentCardiacIntervention,TextInitialValue: widget.formEData?.value.urgentCardiacInterventionDetails,title: '10.2.13 Urgent Cardiac Intervention',radioiOnChanged: (val){
          widget.formEData?.value.urgentCardiacIntervention = val;
        },TextFieldOnChanged: (val){
          widget.formEData?.value.urgentCardiacInterventionDetails = val;
        },),

        MText(text: '10.3 SECONDARY CARDIAC OUTCOME',),
        Space(),
        //Text('Components of Secondary Maternal Cardiac Outcome- '),
        FromE2Common(enabled : widget.enabled, radioInitialValue: widget.formEData?.value.maternalDeathOneEightZero,TextInitialValue: widget.formEData?.value.maternalDeathOneEightZeroDetails,title: '10.3.1 Maternal Death < 180 days',radioiOnChanged: (val){
          widget.formEData?.value.maternalDeathOneEightZero = val;
        },TextFieldOnChanged: (val){
          widget.formEData?.value.maternalDeathOneEightZeroDetails = val;
        },),
        FromE2Common(enabled : widget.enabled,  radioInitialValue: widget.formEData?.value.urgentUnplannedCardiacHospitalization,TextInitialValue: widget.formEData?.value.urgentUnplannedCardiacHospitalizationDetails,title: '10.3.2 Urgent unplanned Cardiac hospitalization',radioiOnChanged: (val){
          widget.formEData?.value.urgentUnplannedCardiacHospitalization = val;
        },TextFieldOnChanged: (val){
          widget.formEData?.value.urgentUnplannedCardiacHospitalizationDetails = val;
        },),
        FromE2Common(enabled : widget.enabled, radioInitialValue: widget.formEData?.value.declineInNyhaClass,TextInitialValue: widget.formEData?.value.declineInNyhaClassDetails,title: '10.3.3 Decline in NYHA Class ≥ 1 during pregnancy / 6 weeks',radioiOnChanged: (val){
          widget.formEData?.value.declineInNyhaClass = val;
        },TextFieldOnChanged: (val){
          widget.formEData?.value.declineInNyhaClassDetails = val;
        },),
        FromE2Common(enabled : widget.enabled, radioInitialValue: widget.formEData?.value.electiveCardiacIntervention,TextInitialValue: widget.formEData?.value.electiveCardiacInterventionDetails,title: '10.3.4 Elective Cardiac Interventions',radioiOnChanged: (val){
          widget.formEData?.value.electiveCardiacIntervention = val;
        },TextFieldOnChanged: (val){
          widget.formEData?.value.electiveCardiacInterventionDetails = val;
        },),
        FromE2Common(enabled : widget.enabled, radioInitialValue: widget.formEData?.value.iCUStayDuration,TextInitialValue: widget.formEData?.value.iCUStayDurationDetails,title: '10.3.5 Duration of Stay in ICU',radioiOnChanged: (val){
          print('val $val');
          widget.formEData?.value.iCUStayDuration = val;
        },TextFieldOnChanged: (val){
          widget.formEData?.value.iCUStayDurationDetails = val;
        },),
      MrowTextTextFieldWidget(enabled : widget.enabled,initialValue: widget.formEData?.value.otherComplications,title: '10.3.6 Other Complications/Outcome',onChanged: (val){
        widget.formEData?.value.otherComplications = val;
      },),
        MrowTextTextFieldWidget(title: 'Signature of Site PI/ I - Cardiology',enabled : widget.enabled,initialValue: widget.formEData?.value.cardiologyVerifiedBy,onChanged: (val){
          widget.formEData?.value.cardiologyVerifiedBy = val;
        },),
        MrowTextTextFieldWidget(enabled : widget.enabled, initialValue: widget.formEData?.value.totalHospitalStayDuration,title: 'H11 Total duration of hospital stay: Number of days: ',onChanged: (val){
          widget.formEData?.value.totalHospitalStayDuration = val;
        },type: MInputType.numeric,),
      MrowTextTextFieldWidget(enabled : widget.enabled,initialValue: widget.formEData?.value.additionalDetails,title: 'H12 Men:on if any additional details: ',onChanged: (val){
        widget.formEData?.value.additionalDetails = val;
      },),

      ],);
  }
}
