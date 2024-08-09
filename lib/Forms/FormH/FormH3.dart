import 'package:npac/Forms/FormH/Model/FormK3Model.dart';
import 'package:npac/Forms/FormH/widget/FormH3CommonEvents.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextCheckBox.dart';

class FormH3 extends StatefulWidget {
  final bool? enabled;
  final Rx<FormK3Model>? formK3Data;
  const FormH3({super.key, this.enabled, this.formK3Data});

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
  List<String> ONSelectedLit = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData()async{
    widget.formK3Data?.value.primaryBleedingObs ?? false ? ONSelectedLit.add('Obstetric') :null;
    widget.formK3Data?.value.primaryBleedingObs ?? false ? isObstetric = true : isObstetric = false;
    widget.formK3Data?.value.primaryBleedingNonObs ?? false ? ONSelectedLit.add('Non-Obstetric') :null;
    widget.formK3Data?.value.primaryBleedingNonObs ?? false ? isNonObstetric = true : isNonObstetric = false;
  }

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
        MRowTextRadioWidget(enabled: widget.enabled,title: '8.1.1. Maternal Death# < 42 days',onChanged: (val){
        },options: ['Cardiac','Non-Cardiac'],isneedDivider: false,),
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
        isDeath && isDeathAn ? MTextField(enabled: widget.enabled,label: 'Antinaval Time(in weeks)',onChanged: (val){},) : Container(),
        isDeath && isDeathIP ? MTextField(enabled: widget.enabled,label: 'Intra partum',onChanged: (val){},) : Container(),
        isDeath && isDeathPA ? MTextField(enabled: widget.enabled,label: 'Postanatal Time(in days)',onChanged: (val){},) : Container(),
        // isDeath ? MTextField(enabled: widget.enabled,label: 'Time',onChanged: (val){},): Container(),
        MDivider(),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.2. Resuscitated cardiac arrest',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.3. New onset HF or worsening HF requiringTreatment escalation or hospitalization',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.4. New or sustained cardiac arrhythmia requiring treatment',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.5. CVA/ Stroke',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.6. Prosthetic valve thrombosis',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.7. Systemic Thromboembolism',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
      FormH3CommonEvents(enabled: widget.enabled,title: '8.1.8. Venous Thromboembolism (PTE/CVT & others)',radioiOnChanged: (val){},TextField1OnChanged: (val){},TextField2OnChanged: (val){},),
       
        MRowTextCheckBox(enabled: widget.enabled,title: '8.1.9. Bleeding: Major / Minor',selectedlist: ONSelectedLit,result: (val){
          if(val.contains('Obstetric')){
            setState(() {
              isObstetric = true;
            });
            widget.formK3Data?.value.primaryBleedingObs = true;
          }else{
            widget.formK3Data?.value.primaryBleedingObs = false;
            setState(() {
              isObstetric = false;
            });
          }
          if(val.contains('Non-Obstetric')){
            widget.formK3Data?.value.primaryBleedingNonObs = true;
            setState(() {
              isNonObstetric = true;
            });
          }else{
            widget.formK3Data?.value.primaryBleedingNonObs = false;
            setState(() {
              isNonObstetric = false;
            });
          }
        },isneedDivider: false,list: ['Obstetric','Non-Obstetric'],),
        isObstetric? MTextField(enabled: widget.enabled,label: 'Obstetric Details',initalValue: widget.formK3Data?.value.primaryBleedingTypeObestric,onChanged: (val){
          widget.formK3Data?.value.primaryBleedingTypeObestric = val;
        },): Container(),
        isNonObstetric? MTextField(enabled: widget.enabled,label: 'Non-Obstetric Details',initalValue: widget.formK3Data?.value.primaryBleedingTypeNonObestric,onChanged: (val){
          widget.formK3Data?.value.primaryBleedingTypeNonObestric = val;
        },): Container(),
        FormH3Common(enabled: widget.enabled,radioInitialValue: widget.formK3Data?.value.primaryBleeding,TextField1InitialValue: widget.formK3Data?.value.primaryBleedingTime,
          TypeInitialValue:  widget.formK3Data?.value.primaryBleedingValues,
          radioiOnChanged: (val){
          widget.formK3Data?.value.primaryBleeding = val;
        },TextField1OnChanged: (val){
        widget.formK3Data?.value.primaryBleedingTime = val;
        },TypeOnchanged: (val){
          widget.formK3Data?.value.primaryBleedingValues = val;
        },),
        FormH3Common(enabled: widget.enabled,title: '8.1.10. Infective Endocarditis',radioInitialValue: widget.formK3Data?.value.primaryInfEnd,TextField1InitialValue: widget.formK3Data?.value.primaryInfEndTime,TypeInitialValue: widget.formK3Data?.value.primaryInfEndValues
          ,radioiOnChanged: (val){
            widget.formK3Data?.value.primaryInfEnd = val;
          },TextField1OnChanged: (val){
            widget.formK3Data?.value.primaryInfEndTime = val;
          },TypeOnchanged: (val){
            widget.formK3Data?.value.primaryInfEndValues = val;
          },),
        FormH3Common(enabled: widget.enabled,title: '8.1.11. Aortic dissection',radioInitialValue: widget.formK3Data?.value.primaryAorticDisc,TextField1InitialValue: widget.formK3Data?.value.primaryAorticDiscTime,TypeInitialValue: widget.formK3Data?.value.primaryAorticDiscValues,radioiOnChanged: (val){
          widget.formK3Data?.value.primaryAorticDisc = val;
        },TextField1OnChanged: (val){
          widget.formK3Data?.value.primaryAorticDiscTime = val;
        },TypeOnchanged: (val){
          widget.formK3Data?.value.primaryAorticDiscValues = val;
        },),
        FormH3Common(enabled: widget.enabled,title: '8.1.12. Acute coronary syndrome',radioInitialValue: widget.formK3Data?.value.primaryAcs,TextField1InitialValue: widget.formK3Data?.value.primaryAcsTime,TypeInitialValue: widget.formK3Data?.value.primaryAcsValues,radioiOnChanged: (val){
          widget.formK3Data?.value.primaryAcs = val;
        },TextField1OnChanged: (val){
          widget.formK3Data?.value.primaryAcsTime = val;
        },TypeOnchanged: (val){
          widget.formK3Data?.value.primaryAcsValues = val;
        },),
        FormH3Common(enabled: widget.enabled,title: '8.1.13. Urgent Cardiac Intervention',radioInitialValue: widget.formK3Data?.value.primaryUci,TextField1InitialValue: widget.formK3Data?.value.primaryUciTime,TypeInitialValue: widget.formK3Data?.value.primaryUciValues,radioiOnChanged: (val){
          widget.formK3Data?.value.primaryUci = val;
        },TextField1OnChanged: (val){
          widget.formK3Data?.value.primaryUciTime = val;
        },TypeOnchanged: (val){
          widget.formK3Data?.value.primaryUciValues = val;
        },),
        // MrowTextTextFieldWidget(title: '14. Please provide details of recurrence of any of the above-mentioned outcome events 1-13: (if any)',onChanged: (val){},),
        //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH4);},)
      ],);
  }
}
