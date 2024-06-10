import 'package:npac/Forms/FormF/widget/ValueFunction.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MSmallText.dart';

class FormG1 extends StatefulWidget {
  const FormG1({super.key});

  @override
  State<FormG1> createState() => _FormG1State();
}

class _FormG1State extends State<FormG1> {
  bool isMitralStenotic = false;
  bool isMitralRegurgitant = false;
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'G. THIRD VISIT PAGE (FORM G)',),

      body: MFormBody(Childrens: [
        MrowTextTextFieldWidget(title: 'Period of gestation (in completed weeks):',onChanged: (val){},type: MInputType.numeric,),
        MRowTextRadioWidget(title: 'Trimester:',onChanged: (val){},options: ['First','Second','Third']),
        MRowTextRadioWidget(title: 'G1 NYHA SYMPTOMS CLASS:',onChanged: (val){},options:List_items.NYHAClass),
        MSmallText(text: 'G2 CLINICAL SIGNS & ECG',),
        Space(),
        MrowTextTextFieldWidget( title: 'G2.1 Weight (Kg):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget( title: 'G2.2 HR (/min):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget( title: 'G2.3 SPO2 (%):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget( title: 'G2.4 BP (mm Hg):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: 'G2.5 CCF:',isneedDivider: false,onChanged: (val){},),
        MRowTextRadioWidget(title: 'G2.6 Cyanosis:',isneedDivider: false,onChanged: (val){},),
        MRowTextRadioWidget(title: 'G2.7 Cardiac murmur:',isneedDivider: false,onChanged: (val){},),
        MrowTextDatePickerWidget(title: 'G2.8 ECG Date:',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(options:List_items.NormalAbnormal ,onChanged: (val){},),
        MSmallText(text:'G3 ECHOCARDIOGRAPHIC ASSESSMENT'),
        Space(),
        MRowTextRadioWidget(title: 'Any significant change from previous echo',onChanged: (val){},),
        MText(text: 'Ventricular Function',),
        Space(),
        MRowTextRadioWidget(title: 'Wall Motion:',onChanged: (val){},isneedDivider: false,options: ['Normal','Hypo / akinesia'],),
        MRowTextCheckBox(list: ['Global','Regional'],result: (val){},),
        Space(),
        MSmallText(text: 'LV systolic function',),
        Space(),
        MrowTextTextFieldWidget(title: 'LVID Diastole(mm):',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'LVID Systole(mm):',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'EF%:',onChanged: (val){},type: MInputType.numeric),
        Space(),
        MSmallText(text: 'RV systolic function',),
        Space(),
        MRowTextRadioWidget(options: List_items.NormalAbnormal ,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'TAPSE (mm)',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'Sa’',onChanged: (val){},type: MInputType.numeric),
        MRowTextRadioWidget(title: 'Pericardial effusion',onChanged: (val){},options: ['Mild','Moderate','Massive','Tamponade'],),
        MRowTextCheckBox(title: 'Others ',list: ['Vegetations','Thrombus'],),
        MrowTextTextFieldWidget(title: 'Any other salient Echo Findings:',onChanged: (val){},),
        MText(text: 'Pulmonary Pressure',),
        Space(),
        MrowTextTextFieldWidget(title: 'Tricuspid regurgitation ',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'Pulmonary regurgitation ',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'TRPG (mmHg):',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'Peak PR (mmHg):',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'PAT(msec)',onChanged: (val){},),
        MText(text: 'VALVE FUNCTION',),
        Space(),
        MRowTextRadioWidget(title: 'Mitral',onChanged: (val ){},options: ['Normal'],isneedDivider: false,),
        MRowTextCheckBox(list: List_items.ValuFunction,
          result: (val){
            if(val.contains('Stenotic')){
              setState(() {
                isMitralStenotic = true;
              });
            }else{
              setState(() {
                isMitralStenotic = false;
              });
            }
            if(val.contains('Regurgitant')){
              setState(() {
                isMitralRegurgitant = true;
              });
            }else{
              setState(() {
                isMitralRegurgitant = false;
              });
            }
          },isneedDivider: isMitralStenotic ||isMitralRegurgitant ?false  : true,),
        isMitralStenotic ?  MRowTextRadioWidget(title: 'Tricuspid',onChanged: (val ){},options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
        isMitralStenotic ?  MrowTextTextFieldWidget(title: 'MVOA (cm2) ',onChanged: (val ){},isneedDivider: false,) : Container(),
        isMitralRegurgitant ?  MRowTextRadioWidget(title: 'Regurgitant',onChanged: (val ){},options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
        isMitralStenotic ||isMitralRegurgitant ? MDivider(): Container(),
        Space(),
        ValueFunction(title: 'Aortic',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
        ValueFunction(title: 'Tricuspid',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
        ValueFunction(title: 'Pulmonary',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
        MRowTextRadioWidget(title: 'G4. Any outcome identified in this visit:',onChanged: (val){},),
        MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},)
      ],),
    );
  }
}
