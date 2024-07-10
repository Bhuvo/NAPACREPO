
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/Forms/FormF/Controller/FromFController.dart';
import 'package:npac/Forms/FormF/FormF1.dart';
import 'package:npac/Forms/FormF/FormFModel/EchoImageModel.dart';
import 'package:npac/Forms/FormF/FormFModel/FormFModel.dart';
import 'package:npac/Forms/FormF/widget/ValueFunction.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextDropDown.dart';
import 'package:npac/common_widget/MText.dart';
import 'package:npac/widgets/loading_widget.dart';

class FormF1 extends StatefulWidget {
  const FormF1({super.key});

  @override
  State<FormF1> createState() => _FormF1State();
}

class _FormF1State extends State<FormF1> {
  bool isMitralStenotic = false;
  bool isMitralRegurgitant = false;
  RxList<String> MitralSelectedList = <String>[].obs;
  RxList<String> AorticSelectedList = <String>[].obs;
  List<String> TricuspidSelectedList = <String>[].obs;
  List<String> PulmonarySelectedList = <String>[].obs;
  List<String> PericardialOtherSelectedList = <String>[].obs;
  List<String> HypoSelectedList = <String>[].obs;


  bool isEnabled = false;


  FormFController formFController = Get.put(FormFController());
@override
  void initState() {
  getdatas();
  super.initState();
}

void getdatas()async{
  await formFController.getFormFData(context,7964);
  await formFController.getEcho();
  formFController.FormIData.value.valveMitralStenotic ?? false ? isMitralStenotic = true :null;
  formFController.FormIData.value.valveMitralRegurgitant ?? false ? isMitralRegurgitant = true :null;
  formFController.FormIData.value.valveMitralStenotic ?? false ? MitralSelectedList.add('Stenotic') :null;
  formFController.FormIData.value.valveMitralRegurgitant ?? false ? MitralSelectedList.add('Regurgitant') :null;
  formFController.FormIData.value.valveAorticStenotic ?? false ? AorticSelectedList.add('Stenotic') :null;
  formFController.FormIData.value.valveAorticRegurgitant ?? false ? AorticSelectedList.add('Regurgitant') :null;
  formFController.FormIData.value.valveTricuspidStenotic ?? false ? TricuspidSelectedList.add('Stenotic') :null;
  formFController.FormIData.value.valveTricuspidRegurgitant ?? false ? TricuspidSelectedList.add('Regurgitant') :null;
  formFController.FormIData.value.valvePulmonaryStenotic ?? false ? PulmonarySelectedList.add('Stenotic') :null;
  formFController.FormIData.value.valvePulmonaryRegurgitant ?? false ? PulmonarySelectedList.add('Regurgitant') :null;
  formFController.FormIData.value.othersVegetations ?? false ? PericardialOtherSelectedList.add('Vegetations') :null;
  formFController.FormIData.value.othersVegetations ?? false ? PericardialOtherSelectedList.add('Thrombus') :null;
  formFController.FormIData.value.wallMotionHypoGlobal ?? false ? PericardialOtherSelectedList.add('Global') :null;
  formFController.FormIData.value.wallMotionHypoRegional ?? false ? PericardialOtherSelectedList.add('Regional') :null;
  print('AorticSelectedList ${AorticSelectedList}');
  setState(() {
  });

}
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'FORM I-ANTENATAL REVISIT-1',),

      body: Obx(()=>formFController.isLoading.value ? Center(child: LoadingWidget(),) :MFormBody(Childrens: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton( 
                onPressed: () {
                  setState(() {
                    isEnabled = !isEnabled;
                  });
                },
                icon: isEnabled ? Icon(Icons.save) : Icon(Icons.edit))
          ],
        ),
         //Text('${formFController.FormIData.value.periodOfGestation}'),
        MRowTextDropDown(enabled: isEnabled,title: 'I1 Period of gestation (in completed weeks):',onChanged: (val){
          formFController.FormIData.value.periodOfGestation = int.parse(val);
        },),
          // MrowTextTextFieldWidget(enabled:isEnabled,title: 'I1 Period of gestation (in completed weeks):',initialValue:formFController.FormIData.value.periodOfGestation  !=null ? formFController.FormIData.value.periodOfGestation.toString() : '',onChanged: (val){
          //   formFController.FormIData.value.periodOfGestation = int.parse(val);
          // },type: MInputType.numeric,),
          MRowTextRadioWidget(enabled:isEnabled,title: 'I2 Trimester:',initialValue: formFController.FormIData.value.trimester,onChanged: (val){
            formFController.FormIData.value.trimester = val;
          },options: ['First','Second','Third']),
          MRowTextRadioWidget(enabled:isEnabled,title: 'I3 NYHA SYMPTOMS CLASS:',initialValue: formFController.FormIData.value.nyhaSymptomsClass,onChanged: (val){
            formFController.FormIData.value.nyhaSymptomsClass = val;
          },options:List_items.NYHAClass),
          Text('I4 CLINICAL SIGNS & ECG'),
          Space(),
          // MRowTextDropDown(enabled:isEnabled, title: 'I4.1 Weight (Kg):',items:List.generate(200 - 30 + 1, (index) => (index + 30).toString()),onChanged: (val){
          //   formFController.FormIData.value.clinicalSignWeight = val;
          // }),
          MrowTextTextFieldWidget(enabled:isEnabled, title: 'I4.1 Weight (Kg):',initialValue: formFController.FormIData.value.clinicalSignWeight,type: MInputType.numeric,onChanged: (val){
            if(int.parse(val) <=200 && int.parse(val) >= 30){
              formFController.FormIData.value.clinicalSignWeight = val;
            }else{}
          },isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:isEnabled, title: 'I4.2  Heart rate (/min):',type: MInputType.numeric,initialValue: formFController.FormIData.value.clinicalSignHR,onChanged: (val){
            formFController.FormIData.value.clinicalSignHR= val;
          },isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:isEnabled, title: 'I4.3 SPO2 (%):',type: MInputType.numeric,initialValue: formFController.FormIData.value.clinicalSignSp,onChanged: (val){
            formFController.FormIData.value.clinicalSignSp  = val;
          },isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:isEnabled, title: 'I4.4 BP (mm Hg):',type: MInputType.numeric,initialValue: formFController.FormIData.value.clinicalSignBp,onChanged: (val){
            formFController.FormIData.value.clinicalSignBp = val;
          },isneedDivider: false,),
          MRowTextRadioWidget(enabled:isEnabled,title: 'I4.5 Heart Failure :',initialValue: formFController.FormIData.value.clinicalSignCcf,isneedDivider: false,onChanged: (val){
            formFController.FormIData.value.clinicalSignCcf = val;
          },),
          MRowTextRadioWidget(enabled:isEnabled,title: 'I4.6 Cyanosis:',initialValue: formFController.FormIData.value.clinicalSignCyanosis,isneedDivider: false,onChanged: (val){
            formFController.FormIData.value.clinicalSignCyanosis = val;
          },),
          MRowTextRadioWidget(enabled:isEnabled,title: 'I4.7 Cardiac murmur:',initialValue: formFController.FormIData.value.clinicalSignCardiacMurmur,isneedDivider: false,onChanged: (val){
            formFController.FormIData.value.clinicalSignCardiacMurmur = val;
          },),
          MDivider(),
          Space(),
          MrowTextDatePickerWidget(enabled:isEnabled,title: 'I5 ECG Date:',initialDate: stringToDate(formFController.FormIData.value.ecgDate ??''),onChanged: (val){
            formFController.FormIData.value.ecgDate = dateToString(val);
          },isneedDivider: false,),
          MRowTextRadioWidget(enabled:isEnabled,options:List_items.NormalAbnormal ,onChanged: (val){
            setState(() {
              formFController.FormIData.value.ecgNormalAbnormal = val;
            });
          },initialValue: formFController.FormIData.value.ecgNormalAbnormal,isneedDivider: false,),
        formFController.FormIData.value.ecgNormalAbnormal =='Abnormal' ? Column(children: [
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: formFController.echoModel.map((element) => Builder(
                builder: (context) {
                  return InkWell(
                    // onTap:(){
                    //   showModalBottomSheet(
                    //       constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.6),
                    //       context: context, builder: (context)=>ImageViewer<EchoImageModel>(data: formFController.echoModel));
                    // },
                    onTap: (){
                      showModalBottomSheet(
                          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.6,minWidth: MediaQuery.of(context).size.width),
                          context: context, builder: (context)=>SingleImage(
                        URL: element.filePath,
                      )
                      );
                    },
                    child: Container(
                        height: 30,
                        // padding:  EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        margin: EdgeInsets.all(4),
                        child: Center(child: Text(element.name ?? ''))),
                  );
                }
            )).toList(),
          ),
          MFilledButton(text: 'Upload ECG',onPressed: (){
            formFController.uploadEcho();
          },),
        ],): Container(),
        Space(),
          MDivider(),
        Space(),
          MSmallText(text: 'I6 ECHOCARDIOGRAPHIC ASSESSMENT',),
          Space(),
          MRowTextRadioWidget(enabled:isEnabled,title: 'Any significant change from previous echo',initialValue: formFController.FormIData.value.significantChanges,onChanged: (val){
setState(() {
  formFController.FormIData.value.significantChanges = val;
});          },isneedDivider: false,),
        formFController.FormIData.value.significantChanges =='Yes' ? Column(children: [
           MText(text: 'Ventricular Function',),
           Space(),
           MRowTextRadioWidget(enabled:isEnabled,title: 'Wall Motion:',initialValue: formFController.FormIData.value.wallMotion,onChanged: (val){
             formFController.FormIData.value.wallMotion = val;
           },isneedDivider: false,options: ['Normal','Hypo / akinesia'],),
           MRowTextCheckBox(enabled:isEnabled,selectedlist: HypoSelectedList,list: ['Global','Regional'],result: (val){
             val.contains('Global') ?formFController.FormIData.value.wallMotionHypoGlobal = true : formFController.FormIData.value.wallMotionHypoGlobal = false;
             val.contains('Regional') ?formFController.FormIData.value.wallMotionHypoRegional = true : formFController.FormIData.value.wallMotionHypoRegional = false;
           },),
           Space(),
          MText(text: 'LV systolic function',),
           Space(),
           MrowTextTextFieldWidget(enabled:isEnabled,title: 'LVID Diastole(mm):',initialValue: formFController.FormIData.value.lVIDDiastole,onChanged: (val){
             formFController.FormIData.value.lVIDDiastole = val;
           },type: MInputType.numeric,isneedDivider: false,),
           MrowTextTextFieldWidget(enabled:isEnabled,title: 'LVID Systole(mm):',initialValue: formFController.FormIData.value.lVIDSystole,onChanged: (val){
             formFController.FormIData.value.lVIDSystole = val;
           },type: MInputType.numeric,isneedDivider: false,),
           MrowTextTextFieldWidget(enabled:isEnabled,title: 'EF%:',initialValue: formFController.FormIData.value.lVEfPercent,onChanged: (val){
             formFController.FormIData.value.lVEfPercent = val;
           },type: MInputType.numeric),
           Space(),
           MText(text: 'RV systolic function',),
           Space(),
           MRowTextRadioWidget(enabled:isEnabled,options: List_items.NormalAbnormal ,initialValue: formFController.FormIData.value.rvNormalAbnormal,onChanged: (val){
             formFController.FormIData.value.rvNormalAbnormal = val;
           },isneedDivider: false,),
           MrowTextTextFieldWidget(enabled:isEnabled,title: 'TAPSE (mm)',initialValue: formFController.FormIData.value.rvTapse,onChanged: (val){
             formFController.FormIData.value.rvTapse = val;
           },type: MInputType.numeric,isneedDivider: false,),
           MrowTextTextFieldWidget(enabled:isEnabled,title: 'Sa’',initialValue: formFController.FormIData.value.rvRvs,onChanged: (val){
             formFController.FormIData.value.rvRvs = val;
           },type: MInputType.numeric),
           MRowTextRadioWidget(enabled:isEnabled,title: 'Pericardial effusion',initialValue: formFController.FormIData.value.pericardialEffusion,onChanged: (val){
             formFController.FormIData.value.pericardialEffusion = val;
           },options: ['Mild','Moderate','Massive','Tamponade'],),
           MRowTextCheckBox(enabled:isEnabled,selectedlist: PericardialOtherSelectedList,title: 'Others ',list: ['Vegetations','Thrombus'],result: (val){
             val.contains('Vegetations') ? formFController.FormIData.value.othersVegetations = true : formFController.FormIData.value.othersVegetations = false;
             val.contains('Thrombus') ? formFController.FormIData.value.othersThrombus = true : formFController.FormIData.value.othersThrombus = false;
           },),
           MrowTextTextFieldWidget(enabled:isEnabled,initialValue: formFController.FormIData.value.otherEchoFindings,title: 'Any other salient Echo Findings:',onChanged: (val){
             formFController.FormIData.value.otherEchoFindings = val;
           },),
           MText(text: 'Pulmonary Pressure Assessment:',),
           Space(),
           // MrowTextTextFieldWidget(title: 'Tricuspid regurgitation ',initialValue: formFController.FormIData.value.valveTricuspidRegurgitant,onChanged: (val){
           //   formFController.FormIData.value.valveTricuspidRegurgitant = val;
           // },isneedDivider: false,),
           // MrowTextTextFieldWidget(title: 'Pulmonary regurgitation ',onChanged: (val){},isneedDivider: false,),
           MrowTextTextFieldWidget(enabled:isEnabled,title: 'TRPG (mmHg):',onChanged: (val){},isneedDivider: false,),
           MrowTextTextFieldWidget(enabled:isEnabled,title: 'Peak PR (mmHg):',onChanged: (val){},isneedDivider: false,),
           MrowTextTextFieldWidget(enabled:isEnabled,title: 'PAT(msec)',onChanged: (val){},),
           MText(text: 'VALVE FUNCTION',),
           Space(),
           MRowTextRadioWidget(enabled:isEnabled,title: 'Mitral',onChanged: (val ){
             setState(() {
               formFController.FormIData.value.valveMitralNormal = val=='Normal' ? true : false;
             });
           },options: List_items.NormalAbnormal,isneedDivider: false,),
           formFController.FormIData.value.valveMitralNormal?? false ? MRowTextCheckBox(enabled:isEnabled,selectedlist: MitralSelectedList,list: List_items.ValuFunction,
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
             },isneedDivider: isMitralStenotic ||isMitralRegurgitant ?false  : true,): Container(),
           isMitralStenotic ?  MRowTextRadioWidget(enabled:isEnabled,initialValue: formFController.FormIData.value.valveMitralRegurgitantMild?? false ? 'Mild' : 'Moderate',onChanged: (val ){
             formFController.FormIData.value.valveMitralStenoticMild = val=='Mild' ? true : false;
           },options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
           isMitralStenotic ?  MrowTextTextFieldWidget(enabled:isEnabled,title: 'MVOA (cm2) ',initialValue: formFController.FormIData.value.valveMitralMvoa,onChanged: (val ){
             formFController.FormIData.value.valveMitralMvoa = val;
           },isneedDivider: false,) : Container(),
           isMitralRegurgitant ?  MRowTextRadioWidget(enabled:isEnabled,title: 'Regurgitant',initialValue: formFController.FormIData.value.valveMitralRegurgitantMild?? false ? 'Mild' : 'Moderate',onChanged: (val ){
             formFController.FormIData.value.valveMitralRegurgitantMild = val =='Mild' ? true : false;
           },options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
           isMitralStenotic ||isMitralRegurgitant ? MDivider(): Container(),
           Space(),
           ValueFunction(key: Key('Aortic'),enabled:isEnabled,title: 'Aortic',radioInitialValue: formFController.FormIData.value.valveAorticNormal?? false ? 'Normal' : 'Abnormal'
             ,MGInitialValue: formFController.FormIData.value.avgMg,
             PGInitialValue: formFController.FormIData.value.avgPg,
             StenoticInitialValue: formFController.FormIData.value.valveAorticStenoticMild ?? false ? 'Mild' : 'Moderate'
             ,regurgitantInitialValue: formFController.FormIData.value.valveAorticRegurgitantMild?? false ? 'Mild' : 'Moderate'
             ,selectedlist: AorticSelectedList,
             checkboxValue: (val){
               formFController.FormIData.value.valveAorticStenotic = val;
             },checkboxValueRegurgitant: (val){
               formFController.FormIData.value.valveAorticRegurgitant = val;
             },MG: (val){
               formFController.FormIData.value.avgMg = val;
             },PG: (val){
               formFController.FormIData.value.avgPg = val;
             },RegurgitantradioOnchange: (val){
               formFController.FormIData.value.valveAorticRegurgitantMild = val =='Mild' ? true : false;
             },StenoticradioOnchange: (val){
               formFController.FormIData.value.valveAorticStenoticMild = val=='Mild' ? true : false;
             },radioValue: (val){
               formFController.FormIData.value.valveAorticNormal = val=='Normal' ? true : false;
             },),
           ValueFunction(enabled:isEnabled,title: 'Tricuspid',
             radioInitialValue: formFController.FormIData.value.valveTricuspidNormal?? false ? 'Normal' : 'Abnormal'
             ,MGInitialValue: formFController.FormIData.value.tvgMg,
             PGInitialValue: formFController.FormIData.value.tvgPg,
             StenoticInitialValue: formFController.FormIData.value.valveTricuspidStenoticMild ?? false ? 'Mild' : 'Moderate'
             ,regurgitantInitialValue: formFController.FormIData.value.valveTricuspidRegurgitantMild?? false ? 'Mild' : 'Moderate'
             ,selectedlist: TricuspidSelectedList,

             checkboxValue: (val){
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
           ValueFunction(enabled:isEnabled,title: 'Pulmonary',
             radioInitialValue: formFController.FormIData.value.valvePulmonaryNormal?? false ? 'Normal' : 'Abnormal'
             ,MGInitialValue: formFController.FormIData.value.pvgMg,
             PGInitialValue: formFController.FormIData.value.pvgPg,
             StenoticInitialValue: formFController.FormIData.value.valvePulmonaryStenoticMild ?? false ? 'Mild' : 'Moderate'
             ,regurgitantInitialValue: formFController.FormIData.value.valvePulmonaryRegurgitantMild?? false ? 'Mild' : 'Moderate'
             ,selectedlist: PulmonarySelectedList,

             checkboxValue: (val){
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
         ],): Container(),
          MDivider(),
          MRowTextRadioWidget(enabled:isEnabled,title: 'I7. Did the paEent develop any complicaEon (study outcome) Ell this visit: ',initialValue: formFController.FormIData.value.outComeIdentified,onChanged: (val){
            formFController.FormIData.value.outComeIdentified = val;
          },),
        isEnabled? MFilledButton(text: 'Submit',onPressed: () async{
          if(await formFController.upLoadData()){
            setState(() {
              isEnabled = !isEnabled;});
          }else{
            context.showSnackBar('Error while uploading AntenatalVisitOne data');
          }

          },):MFilledButton(text: 'Edit',onPressed: (){
            setState(() {
          isEnabled = !isEnabled;});
            },),
        ],),
      ),
    );
  }
}



class ImageViewer<T> extends StatelessWidget {
  final List<T>? data;
  final String? title;
  const ImageViewer({super.key, this.data, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(title ??'Echo Images'),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children:data!.map((e) => e.toString()).toList().obs.map((e) => Column(
                children: [
                  Text(e.split('/').last),
                  Space(),
                  Image.network(e),
                  Space(20),
                ],
              )).toList(),
            )
          ],
        ),
      ),
    );
  }
}
