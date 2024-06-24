
import 'package:npac/Forms/FormF/Controller/FromFController.dart';
import 'package:npac/Forms/FormF/FormFModel/FormFModel.dart';
import 'package:npac/Forms/FormF/widget/ValueFunction.dart';
import 'package:npac/app/export.dart';
import 'package:npac/widgets/loading_widget.dart';

class FormF1 extends StatefulWidget {
  const FormF1({super.key});

  @override
  State<FormF1> createState() => _FormF1State();
}

class _FormF1State extends State<FormF1> {
  bool isMitralStenotic = false;
  bool isMitralRegurgitant = false;

  FormFController formFController = Get.put(FormFController());
@override
  void initState() {
    super.initState();
    formFController.getFormFData(context,7964);

}

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'FORM I-ANTENATAL REVISIT-1',),

      body: Obx(()=>formFController.isLoading.value ? Center(child: LoadingWidget(),) :MFormBody(Childrens: [
         Text('${formFController.FormIData.value.periodOfGestation}'),
          MrowTextTextFieldWidget(title: 'I1 Period of gestation (in completed weeks):',initialValue:formFController.FormIData.value.periodOfGestation,onChanged: (val){
            formFController.FormIData.value.periodOfGestation = val;
          },type: MInputType.numeric,),
          MRowTextRadioWidget(title: 'I2 Trimester:',initialValue: formFController.FormIData.value.trimester,onChanged: (val){
            formFController.FormIData.value.trimester = val;
          },options: ['First','Second','Third']),
          MRowTextRadioWidget(title: 'I3 NYHA SYMPTOMS CLASS:',initialValue: formFController.FormIData.value.nyhaSymptomsClass,onChanged: (val){
            formFController.FormIData.value.nyhaSymptomsClass = val;
          },options:List_items.NYHAClass),
          Text('I4 CLINICAL SIGNS & ECG'),
          Space(),
          MrowTextTextFieldWidget( title: 'I4.1 Weight (Kg):',initialValue: formFController.FormIData.value.clinicalSignWeight,type: MInputType.numeric,onChanged: (val){
            formFController.FormIData.value.clinicalSignWeight = val;
          },isneedDivider: false,),
          MrowTextTextFieldWidget( title: 'I4.2 HR (/min):',type: MInputType.numeric,initialValue: formFController.FormIData.value.clinicalSignHR,onChanged: (val){
            formFController.FormIData.value.clinicalSignHR= val;
          },isneedDivider: false,),
          MrowTextTextFieldWidget( title: 'I4.3 SPO2 (%):',type: MInputType.numeric,initialValue: formFController.FormIData.value.clinicalSignSp,onChanged: (val){
            formFController.FormIData.value.clinicalSignSp  = val;
          },isneedDivider: false,),
          MrowTextTextFieldWidget( title: 'I4.4 BP (mm Hg):',type: MInputType.numeric,initialValue: formFController.FormIData.value.clinicalSignBp,onChanged: (val){
            formFController.FormIData.value.clinicalSignBp = val;
          },isneedDivider: false,),
          MRowTextRadioWidget(title: 'I4.5 CCF:',initialValue: formFController.FormIData.value.clinicalSignCcf,isneedDivider: false,onChanged: (val){
            formFController.FormIData.value.clinicalSignCcf = val;
          },),
          MRowTextRadioWidget(title: 'I4.6 Cyanosis:',initialValue: formFController.FormIData.value.clinicalSignCyanosis,isneedDivider: false,onChanged: (val){
            formFController.FormIData.value.clinicalSignCyanosis = val;
          },),
          MRowTextRadioWidget(title: 'I4.7 Cardiac murmur:',initialValue: formFController.FormIData.value.clinicalSignCardiacMurmur,isneedDivider: false,onChanged: (val){
            formFController.FormIData.value.clinicalSignCardiacMurmur = val;
          },),
          MrowTextDatePickerWidget(title: 'I5 ECG Date:',initialDate: stringToDate(formFController.FormIData.value.ecgDate ??''),onChanged: (val){
            formFController.FormIData.value.ecgDate = dateToString(val);
          },isneedDivider: false,),
          MRowTextRadioWidget(options:List_items.NormalAbnormal ,onChanged: (val){
            formFController.FormIData.value.ecgNormalAbnormal = val;
          },initialValue: formFController.FormIData.value.ecgNormalAbnormal,),
          Text('I6 ECHOCARDIOGRAPHIC ASSESSMENT'),
          Space(),
          MRowTextRadioWidget(title: 'Any significant change from previous echo',initialValue: formFController.FormIData.value.significantChanges,onChanged: (val){
            formFController.FormIData.value.significantChanges = val;
          },),
          MText(text: 'Ventricular Function',),
          Space(),
          MRowTextRadioWidget(title: 'Wall Motion:',initialValue: formFController.FormIData.value.wallMotion,onChanged: (val){
            formFController.FormIData.value.wallMotion = val;
          },isneedDivider: false,options: ['Normal','Hypo / akinesia'],),
          MRowTextCheckBox(list: ['Global','Regional'],result: (val){},),
          Space(),
          Text('LV systolic function'),
          Space(),
          MrowTextTextFieldWidget(title: 'LVID Diastole(mm):',initialValue: formFController.FormIData.value.lVIDDiastole,onChanged: (val){
            formFController.FormIData.value.lVIDDiastole = val;
          },type: MInputType.numeric,isneedDivider: false,),
          MrowTextTextFieldWidget(title: 'LVID Systole(mm):',initialValue: formFController.FormIData.value.lVIDSystole,onChanged: (val){
            formFController.FormIData.value.lVIDSystole = val;
          },type: MInputType.numeric,isneedDivider: false,),
          MrowTextTextFieldWidget(title: 'EF%:',initialValue: formFController.FormIData.value.lVEfPercent,onChanged: (val){
            formFController.FormIData.value.lVEfPercent = val;
          },type: MInputType.numeric),
          Space(),
          Text('RV systolic function'),
          Space(),
          MRowTextRadioWidget(options: List_items.NormalAbnormal ,initialValue: formFController.FormIData.value.rvNormalAbnormal,onChanged: (val){
            formFController.FormIData.value.rvNormalAbnormal = val;
          },isneedDivider: false,),
          MrowTextTextFieldWidget(title: 'TAPSE (mm)',initialValue: formFController.FormIData.value.rvTapse,onChanged: (val){
            formFController.FormIData.value.rvTapse = val;
          },type: MInputType.numeric,isneedDivider: false,),
          MrowTextTextFieldWidget(title: 'Sa’',initialValue: formFController.FormIData.value.rvRvs,onChanged: (val){
            formFController.FormIData.value.rvRvs = val;
          },type: MInputType.numeric),
          MRowTextRadioWidget(title: 'Pericardial effusion',initialValue: formFController.FormIData.value.pericardialEffusion,onChanged: (val){
            formFController.FormIData.value.pericardialEffusion = val;
          },options: ['Mild','Moderate','Massive','Tamponade'],),
          MRowTextCheckBox(title: 'Others ',list: ['Vegetations','Thrombus'],),
          MrowTextTextFieldWidget(title: 'Any other salient Echo Findings:',onChanged: (val){},),
          MText(text: 'Pulmonary Pressure Assessment:',),
          Space(),
          // MrowTextTextFieldWidget(title: 'Tricuspid regurgitation ',initialValue: formFController.FormIData.value.valveTricuspidRegurgitant,onChanged: (val){
          //   formFController.FormIData.value.valveTricuspidRegurgitant = val;
          // },isneedDivider: false,),
          // MrowTextTextFieldWidget(title: 'Pulmonary regurgitation ',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(title: 'TRPG (mmHg):',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(title: 'Peak PR (mmHg):',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(title: 'PAT(msec)',onChanged: (val){},),
          MText(text: 'VALVE FUNCTION',),
          Space(),
          MRowTextRadioWidget(title: 'Mitral',onChanged: (val ){
            formFController.FormIData.value.valveMitralNormal = val=='Normal' ? true : false;
          },options: List_items.NormalAbnormal,isneedDivider: false,),
          MRowTextCheckBox(list: List_items.ValuFunction,
            result: (val){
            if(val.contains('Stenotic')){
              formFController.FormIData.value.valveMitralStenotic = true;
              setState(() {
                isMitralStenotic = true;
              });
            }else{
              formFController.FormIData.value.valveMitralStenotic = false;
              setState(() {
                isMitralStenotic = false;
              });
            }
            if(val.contains('Regurgitant')){
              formFController.FormIData.value.valveMitralRegurgitant = true;
              setState(() {
                isMitralRegurgitant = true;
              });
            }else{
              formFController.FormIData.value.valveMitralRegurgitant = false;
              setState(() {
                isMitralRegurgitant = false;
              });
            }
          },isneedDivider: isMitralStenotic ||isMitralRegurgitant ?false  : true,),
          isMitralStenotic ?  MRowTextRadioWidget(initialValue: formFController.FormIData.value.valveMitralRegurgitantMild?? false ? 'Mild' : 'Moderate',onChanged: (val ){
            formFController.FormIData.value.valveMitralStenoticMild = val=='Mild' ? true : false;
          },options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
          isMitralStenotic ?  MrowTextTextFieldWidget(title: 'MVOA (cm2) ',initialValue: formFController.FormIData.value.valveMitralMvoa,onChanged: (val ){
            formFController.FormIData.value.valveMitralMvoa = val;
          },isneedDivider: false,) : Container(),
          isMitralRegurgitant ?  MRowTextRadioWidget(title: 'Regurgitant',initialValue: formFController.FormIData.value.valveMitralRegurgitantMild?? false ? 'Mild' : 'Moderate',onChanged: (val ){
            formFController.FormIData.value.valveMitralRegurgitantMild = val =='Mild' ? true : false;
          },options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
          isMitralStenotic ||isMitralRegurgitant ? MDivider(): Container(),
          Space(),
          ValueFunction(title: 'Aortic',checkboxValue: (val){
            formFController.FormIData.value.valveAorticStenotic = val;
          },checkboxValueRegurgitant: (val){
            formFController.FormIData.value.valveAorticRegurgitant = val;
          },MG: (val){
            formFController.FormIData.value.avgMg = val;
          },PG: (val){
            formFController.FormIData.value.avgPg = val;
          },RegurgitantradioOnchange: (val){
            formFController.FormIData.value.valveAorticRegurgitantMild = val;
          },StenoticradioOnchange: (val){
            formFController.FormIData.value.valveAorticStenoticMild = val;
          },radioValue: (val){
            formFController.FormIData.value.valveAorticNormal = val=='Normal' ? true : false;
          },),
          ValueFunction(title: 'Tricuspid',checkboxValue: (val){
            formFController.FormIData.value.valveTricuspidStenotic = val;
          },checkboxValueRegurgitant: (val){
            formFController.FormIData.value.valveTricuspidRegurgitant = val;
          },MG: (val){
            formFController.FormIData.value.tvgMg = val;
          },PG: (val){
            formFController.FormIData.value.tvgPg = val;
          },RegurgitantradioOnchange: (val){
            formFController.FormIData.value.valveTricuspidRegurgitantMild = val=='Mild' ? true : false;
          },StenoticradioOnchange: (val){
            formFController.FormIData.value.valveTricuspidStenoticMild = val=='Mild' ? true : false;
          },radioValue: (val){
            formFController.FormIData.value.valveTricuspidNormal = val=='Normal' ? true : false;
          },),
          ValueFunction(title: 'Pulmonary',checkboxValue: (val){
            formFController.FormIData.value.valvePulmonaryStenotic = val;
          },checkboxValueRegurgitant: (val){
            formFController.FormIData.value.valvePulmonaryRegurgitant = val;
          },MG: (val){
            formFController.FormIData.value.pvgMg = val;
          },PG: (val){
            formFController.FormIData.value.pvgPg = val;
          },RegurgitantradioOnchange: (val){
            formFController.FormIData.value.valvePulmonaryRegurgitantMild = val=='Mild' ? true : false;
          },StenoticradioOnchange: (val){
            formFController.FormIData.value.valvePulmonaryStenoticMild = val=='Mild' ? true : false;
          },radioValue: (val){
            formFController.FormIData.value.valvePulmonaryNormal = val=='Normal' ? true : false;
          },),
          MRowTextRadioWidget(title: 'I7. Any outcome identified in this visit:',onChanged: (val){},),
          MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},)
        ],),
      ),



    );
  }
}
