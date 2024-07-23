import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:npac/Forms/CommonModelController/EchoAssignmentController.dart';
import 'package:npac/Forms/CommonModelController/EchoImage/EchoImageController.dart';
import 'package:npac/Forms/FormF/FormF1.dart';
import 'package:npac/Forms/FormF/widget/ValueFunction.dart';
import 'package:npac/Forms/FormG/Controller/AntenalFormJController.dart';
import 'package:npac/Forms/FormH/FormH3.dart';
import 'package:npac/Forms/FormH/FormH4.dart';
import 'package:npac/Forms/FormH/FormH5.dart';
import 'package:npac/Forms/FormH/FormH6.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextDropDown.dart';
import 'package:npac/common_widget/MSmallText.dart';

class FormG1 extends StatefulWidget {
  const FormG1({super.key});

  @override
  State<FormG1> createState() => _FormG1State();
}

class _FormG1State extends State<FormG1> {
  AntenalFormJController formGController = Get.put(AntenalFormJController());
  EchoAssignmentController echoAssignmentController = Get.put(EchoAssignmentController());
  EchoImageController echoImageController = Get.put(EchoImageController());



  RxList<String> MitralSelectedList = <String>[].obs;
  RxList<String> AorticSelectedList = <String>[].obs;
  List<String> TricuspidSelectedList = <String>[].obs;
  List<String> PulmonarySelectedList = <String>[].obs;
  List<String> PericardialOtherSelectedList = <String>[].obs;
  List<String> HypoSelectedList = <String>[].obs;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData()async{
    formGController.isLoading.value = true;
    await formGController.getFormFData(context,7964);
    await echoImageController.getEchoImage(7964 ,10);
    // await formGController.getEcho();
    // await formGController.getOutCome();
    await echoAssignmentController.getEcoAssignmentData(9);
    formGController.isLoading.value = true;
    formGController.FormJEchoAssignmentData.value = echoAssignmentController.EchoAssignmentData.value;
    formGController.FormJEchoAssignmentData.value.mitralStenotic ?? false ? isMitralStenotic = true :null;
    formGController.FormJEchoAssignmentData.value.mitralRegurgitant ?? false ? isMitralRegurgitant = true :null;
    formGController.FormJEchoAssignmentData.value.mitralStenotic ?? false ? MitralSelectedList.add('Stenotic') :null;
    formGController.FormJEchoAssignmentData.value.mitralRegurgitant ?? false ? MitralSelectedList.add('Regurgitant') :null;
    formGController.FormJEchoAssignmentData.value.aorticStenotic ?? false ? AorticSelectedList.add('Stenotic') :null;
    formGController.FormJEchoAssignmentData.value.aorticRegurgitant ?? false  ? AorticSelectedList.add('Regurgitant') :null;
    formGController.FormJEchoAssignmentData.value.tricuspidStenotic ?? false ? TricuspidSelectedList.add('Stenotic') :null;
    formGController.FormJEchoAssignmentData.value.tricuspidRegurgitant ?? false ? TricuspidSelectedList.add('Regurgitant') :null;
    formGController.FormJEchoAssignmentData.value.pulmonaryStenotic ?? false ? PulmonarySelectedList.add('Stenotic') :null;
    formGController.FormJEchoAssignmentData.value.pulmonaryRegurgitant ?? false ? PulmonarySelectedList.add('Regurgitant') :null;
    formGController.FormJEchoAssignmentData.value.othersVegetations ?? false ? PericardialOtherSelectedList.add('Vegetations') :null;
    formGController.FormJEchoAssignmentData.value.othersVegetations ?? false ? PericardialOtherSelectedList.add('Thrombus') :null;
    formGController.FormJEchoAssignmentData.value.wallMotionHypoGlobal ?? false ? PericardialOtherSelectedList.add('Global') :null;
    formGController.FormJEchoAssignmentData.value.wallMotionHypoRegional ?? false ? PericardialOtherSelectedList.add('Regional') :null;
    print('AorticSelectedList ${AorticSelectedList}');
    formGController.isLoading.value = false;
    setState(() {
    });

  }

  bool isMitralStenotic = false;
  bool isMitralRegurgitant = false;
  bool isAssignment = false;
  bool isEcgAbnormal = false;
  bool isEnabled = false;


  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'FORM J- ANTENATAL REVISIT-2 ',),

      body: Obx(()=>MFormBody(Childrens: [
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
          MRowTextDropDown(initialValue:'${formGController.FormJData.value.periodOfGestation??''}' ,enabled: isEnabled,title: 'J1 Period of gestation (in completed weeks):',onChanged: (val){
            formGController.FormJData.value.periodOfGestation = int.parse(val);
          },),
          MRowTextRadioWidget(enabled: isEnabled,title: 'J2 Trimester:',initialValue: formGController.FormJData.value.trimester,onChanged: (val){
            formGController.FormJData.value.trimester = val;
          },options: ['First','Second','Third']),
          MRowTextRadioWidget(enabled: isEnabled,title: 'J3 NYHA SYMPTOMS CLASS:',initialValue: formGController.FormJData.value.nyhaSymptomsClass,onChanged: (val){
            formGController.FormJData.value.nyhaSymptomsClass = val;
          },options:List_items.NYHAClass),
          MSmallText(text: 'J4 CLINICAL SIGNS & ECG',),
          Space(),
          MrowTextTextFieldWidget(enabled: isEnabled, title: 'J4.1 Weight (Kg):',initialValue: '${formGController.FormJData.value.clinicalSignWeight}',type: MInputType.numeric,onChanged: (val){
            formGController.FormJData.value.clinicalSignWeight = int.tryParse(val);
          },isneedDivider: false,),
          MrowTextTextFieldWidget(enabled: isEnabled, title: 'J4.2 HR (/min):',initialValue: '${formGController.FormJData.value.clinicalSignHR}',type: MInputType.numeric,onChanged: (val){
            formGController.FormJData.value.clinicalSignHR = int.tryParse(val);
          },isneedDivider: false,),
          MrowTextTextFieldWidget( enabled: isEnabled,title: 'J4.3 SPO2 (%):',initialValue: '${formGController.FormJData.value.clinicalSignSp}',type: MInputType.numeric,onChanged: (val){
            formGController.FormJData.value.clinicalSignSp = int.tryParse(val);
          },isneedDivider: false,),
          MrowTextTextFieldWidget( enabled: isEnabled,title: 'J4.4 BP (mm Hg):',initialValue: '${formGController.FormJData.value.clinicalSignBp}',type: MInputType.numeric,onChanged: (val){
            formGController.FormJData.value.clinicalSignBp = int.tryParse(val);
          },isneedDivider: false,),
          MRowTextRadioWidget(enabled: isEnabled,title: 'J4.5 Heart Failure:',initialValue: formGController.FormJData.value.clinicalSignCcf,isneedDivider: false,onChanged: (val){
            formGController.FormJData.value.clinicalSignCcf = val;
          },),
          MRowTextRadioWidget(enabled: isEnabled,title: 'J4.6 Cyanosis:',initialValue: formGController.FormJData.value.clinicalSignCyanosis,isneedDivider: false,onChanged: (val){
            formGController.FormJData.value.clinicalSignCyanosis = val;
          },),
          MRowTextRadioWidget(enabled: isEnabled,title: 'J4.7 Cardiac murmur:',initialValue: formGController.FormJData.value.clinicalSignCardiacMurmur,isneedDivider: false,onChanged: (val){
            formGController.FormJData.value.clinicalSignCardiacMurmur = val;
          },),
          MrowTextDatePickerWidget(enabled: isEnabled,title: 'J5 ECG Date:',initialDate: stringToDate(formGController.FormJData.value.ecgDate ?? ''),onChanged: (val){
            formGController.FormJData.value.ecgDate = dateToString(val);
          },isneedDivider: false,),
          MRowTextRadioWidget(enabled: isEnabled,options:List_items.NormalAbnormal,initialValue: formGController.FormJData.value.ecgNormalAbnormal ,onChanged: (val){
            // val =='Abnormal' ? isEcgAbnormal = true : isEcgAbnormal = false;
            setState(() {
              formGController.FormJData.value.ecgNormalAbnormal = val;
            });
          },),
          formGController.FormJData.value.ecgNormalAbnormal == 'Abnormal' ?Column(children: [
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: echoImageController.EchoImage.map((element) => Builder(
                  builder: (context) {
                    return InkWell(
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
            MFilledButton(text: 'Upload ECG',isLoading: formGController.isEcoLoading.value,onPressed: () async {
              // formGController.uploadEcho(context);
             await echoImageController.uploadEchoImage(7964, 10);
            },),
          ],): Container(),
          MSmallText(text:'J6 ECHOCARDIOGRAPHIC ASSESSMENT'),
          Space(),
          MRowTextRadioWidget(enabled: isEnabled,initialValue: formGController.FormJData.value.significantChanges,title: 'Any significant change from previous echo',onChanged: (val){
            // val =='Yes' ? isAssignment = true : isAssignment = false;
           setState(() {
             formGController.FormJData.value.significantChanges = val;
           });
          },),
          formGController.FormJData.value.significantChanges == 'Yes' ? Column(children: [
           MSmallText(text: 'Ventricular Function',),
           Space(),
           MRowTextRadioWidget(enabled: isEnabled,title: 'Wall Motion:',initialValue: formGController.FormJEchoAssignmentData.value.wallMotion,onChanged: (val){
             formGController.FormJEchoAssignmentData.value.wallMotion = val;
           },isneedDivider: false,options: ['Normal','Hypo / akinesia'],),
           MRowTextCheckBox(enabled: isEnabled,selectedlist: HypoSelectedList,list: ['Global','Regional'],result: (val){
             val.contains('Global') ?formGController.FormJEchoAssignmentData.value.wallMotionHypoGlobal = true : formGController.FormJEchoAssignmentData.value.wallMotionHypoGlobal = false;
             val.contains('Regional') ?formGController.FormJEchoAssignmentData.value.wallMotionHypoRegional = true : formGController.FormJEchoAssignmentData.value.wallMotionHypoRegional = false;
           },),
           Space(),
           MSmallText(text: 'LV systolic function',),
           Space(),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Diastole(mm):',initialValue: formGController.FormJEchoAssignmentData.value.lVIDDiastole,onChanged: (val){
             formGController.FormJEchoAssignmentData.value.lVIDDiastole = val;
           },type: MInputType.numeric,isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Systole(mm):',initialValue: formGController.FormJEchoAssignmentData.value.lVIDSystole,onChanged: (val){
             formGController.FormJEchoAssignmentData.value.lVIDSystole = val;
           },type: MInputType.numeric,isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'EF%:',initialValue: formGController.FormJEchoAssignmentData.value.lVEfPercent,onChanged: (val){
             formGController.FormJEchoAssignmentData.value.lVEfPercent = val;
           },type: MInputType.numeric),
           Space(),
           MSmallText(text: 'RV systolic function',),
           Space(),
           MRowTextRadioWidget(enabled: isEnabled,options: List_items.NormalAbnormal ,initialValue: formGController.FormJEchoAssignmentData.value.rvNormalAbnormal,onChanged: (val){
             formGController.FormJEchoAssignmentData.value.rvNormalAbnormal = val;
           },isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'TAPSE (mm)',initialValue: formGController.FormJEchoAssignmentData.value.rvTapse,onChanged: (val){
             formGController.FormJEchoAssignmentData.value.rvTapse = val;
           },type: MInputType.numeric,isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'Sa’',initialValue: formGController.FormJEchoAssignmentData.value.rvRvs,onChanged: (val){
             formGController.FormJEchoAssignmentData.value.rvRvs = val;
           },type: MInputType.numeric),

           MRowTextRadioWidget(enabled: isEnabled,title: 'Pericardial effusion',initialValue: formGController.FormJEchoAssignmentData.value.pericardialEffusion,onChanged: (val){
             formGController.FormJEchoAssignmentData.value.pericardialEffusion = val;
           },options: ['Mild','Moderate','Massive','Tamponade'],),
           MRowTextCheckBox(enabled: isEnabled,title: 'Others ',selectedlist: PericardialOtherSelectedList,list: ['Vegetations','Thrombus'],result: (val){
             val.contains('Vegetations') ? formGController.FormJEchoAssignmentData.value.othersVegetations = true :  formGController.FormJEchoAssignmentData.value.othersVegetations = false;
             val.contains('Thrombus') ?  formGController.FormJEchoAssignmentData.value.othersThrombus = true :  formGController.FormJEchoAssignmentData.value.othersThrombus = false;
           },),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'Any other salient Echo Findings:',initialValue: formGController.FormJEchoAssignmentData.value.otherEchoFindings,onChanged: (val){
             formGController.FormJEchoAssignmentData.value.otherEchoFindings = val;
           },),
           MText(text: 'Pulmonary Pressure',),
           Space(),
           // MrowTextTextFieldWidget(enabled: isEnabled,title: 'Tricuspid regurgitation ',initialValue: formGController.FormJData.value.pu,onChanged: (val){},isneedDivider: false,),
           // MrowTextTextFieldWidget(enabled: isEnabled,title: 'Pulmonary regurgitation ',onChanged: (val){},isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'TRPG (mmHg):',initialValue: '${formGController.FormJEchoAssignmentData.value.trpg}',onChanged: (val){
             formGController.FormJEchoAssignmentData.value.trpg = int.tryParse(val);
           },isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'Peak PR (mmHg):',initialValue: '${formGController.FormJEchoAssignmentData.value.peakPr}',onChanged: (val){
             formGController.FormJEchoAssignmentData.value.peakPr = int.tryParse(val);
           },isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'PAT(msec)',initialValue:'${formGController.FormJEchoAssignmentData.value.peakPr}',onChanged: (val){
             formGController.FormJEchoAssignmentData.value.pat = int.tryParse(val);
           },),
           // MText(text: 'VALVE FUNCTION',),
            MRowTextRadioWidget(title: ' Valvular Morphology',options: List_items.NormalAbnormal,initialValue: formGController.FormJEchoAssignmentData.value.valvularMorphology,enabled: isEnabled,onChanged: (val){
              formGController.FormJEchoAssignmentData.value.valvularMorphology = val;
              setState(() {});
            },),
           Space(),
            formGController.FormJEchoAssignmentData.value.valvularMorphology == 'Abnormal' ? Column(
              key: ValueKey(formGController.FormJEchoAssignmentData.value.valvularMorphology),
              children: [
             MRowTextRadioWidget(title: 'Mitral',options: ['Native','Prosthetic'],initialValue: formGController.FormJEchoAssignmentData.value.mitral,enabled: isEnabled,isneedDivider: false,onChanged: (val){
               formGController.FormJEchoAssignmentData.value.mitral = val;
               setState(() {});
             },),
             formGController.FormJEchoAssignmentData.value.mitral == 'Native' ?Column(children: [
               MRowTextRadioWidget(enabled: isEnabled,title: 'Mitral Function',initialValue: formGController.FormJEchoAssignmentData.value.mitralFunction ,onChanged: (val ){
                 formGController.FormJEchoAssignmentData.value.mitralFunction = val;
                 setState(() {});
               },options: ['Normal','Abnormal'],isneedDivider: false,),
               (formGController.FormJEchoAssignmentData.value.mitralFunction =='Abnormal')? MRowTextCheckBox( key : ValueKey('val ${MitralSelectedList}'),enabled: isEnabled,selectedlist: MitralSelectedList,list: List_items.ValuFunction,
                 result: (val){
                   if(val.contains('Stenotic')){
                     formGController.FormJEchoAssignmentData.value.mitralStenotic = true;
                     setState(() {
                       isMitralStenotic = true;
                     });
                   }else{
                     formGController.FormJEchoAssignmentData.value.mitralStenotic = false;
                     setState(() {
                       isMitralStenotic = false;
                     });
                   }
                   if(val.contains('Regurgitant')){
                     formGController.FormJEchoAssignmentData.value.mitralRegurgitant = true;
                     setState(() {
                       isMitralRegurgitant = true;
                     });
                   }else{
                     formGController.FormJEchoAssignmentData.value.mitralRegurgitant = false;
                     setState(() {
                       isMitralRegurgitant = false;
                     });
                   }
                 },isneedDivider: isMitralStenotic ||isMitralRegurgitant ?false  : true,):Container(),
               // isMitralStenotic ?  MRowTextRadioWidget(enabled: isEnabled,title: 'Tricuspid',initialValue: formGController.FormJEchoAssignmentData.value.mitralStenoticValue,onChanged: (val ){
               //   formGController.FormJEchoAssignmentData.value.mitralStenoticValue = val;
               // },options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
               isMitralStenotic ?  MrowTextTextFieldWidget(enabled: isEnabled,title: 'MVOA (cm2) ',initialValue: formGController.FormJEchoAssignmentData.value.mitralMVOA.toString(),onChanged: (val ){
                 formGController.FormJEchoAssignmentData.value.mitralMVOA = int.tryParse(val);
               },isneedDivider: false,) : Container(),
               isMitralStenotic ?Column(
                 children: [
                   Space(),
                   MSmallText(text: 'MVG :-',),
                   // Space(),
                   MrowTextTextFieldWidget(enabled:isEnabled,title: 'MG',initialValue: '${ formGController.FormJEchoAssignmentData.value.mitralMVGradientMean}',onChanged: (val ){
                     formGController.FormJEchoAssignmentData.value.mitralMVGradientMean= int.tryParse(val);
                   },isneedDivider: false,),
                   MrowTextTextFieldWidget(enabled:isEnabled,title: 'PG',initialValue: '${ formGController.FormJEchoAssignmentData.value.mitralMVGradientPeak}',onChanged: (val ){
                     formGController.FormJEchoAssignmentData.value.mitralMVGradientPeak= int.tryParse(val);
                   },isneedDivider: false,)
                 ],
               ): Container(),
               isMitralRegurgitant ?  MRowTextRadioWidget(enabled: isEnabled,title: 'Regurgitant',initialValue: formGController.FormJEchoAssignmentData.value.mitralRegurgitantValue,onChanged: (val ){
                 formGController.FormJEchoAssignmentData.value.mitralRegurgitantValue = val;
               },options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
             ],): Container(),
             // isMitralStenotic ||isMitralRegurgitant ? MDivider(): Container(),
             MDivider(),
             Space(),
             ValueFunction(key: Key('Aortic ${AorticSelectedList}'),enabled:isEnabled,title: 'Aortic',radioInitialValue: formGController.FormJEchoAssignmentData.value.aorticFunction
               ,MGInitialValue: '${formGController.FormJEchoAssignmentData.value.aorticStenosisGradientMean}',
               maininitialValue:formGController.FormJEchoAssignmentData.value.aortic ,
               PGInitialValue: '${formGController.FormJEchoAssignmentData.value.aorticStenosisGradientPeak}',
               StenoticInitialValue: formGController.FormJEchoAssignmentData.value.aorticStenoticValue
               ,regurgitantInitialValue: formGController.FormJEchoAssignmentData.value.aorticRegurgitantValue
               ,selectedlist: AorticSelectedList,
               checkboxValue: (val){
                 formGController.FormJEchoAssignmentData.value.aorticStenotic = val;
                 setState(() {
                 });
               },checkboxValueRegurgitant: (val){
                 formGController.FormJEchoAssignmentData.value.aorticRegurgitant = val;
                 setState(() {
                 });
               },MG: (val){
                 formGController.FormJEchoAssignmentData.value.aorticStenosisGradientMean = int.tryParse(val);
                 setState(() {
                 });
               },
               mainValue: (val){
                 formGController.FormJEchoAssignmentData.value.aortic = val;
                 setState(() {
                 });
               },
               PG: (val){
                 formGController.FormJEchoAssignmentData.value.aorticStenosisGradientPeak = int.tryParse(val);
                 setState(() {
                 });
               },RegurgitantradioOnchange: (val){
                 formGController.FormJEchoAssignmentData.value.aorticRegurgitantValue = val;
                 setState(() {
                 });
               },StenoticradioOnchange: (val){
                 formGController.FormJEchoAssignmentData.value.aorticStenoticValue = val;
                 setState(() {
                 });
               },radioValue: (val){
                 formGController.FormJEchoAssignmentData.value.aorticFunction = val;
                 setState(() {
                 });
               },),
             ValueFunction(key: Key('Tricuspid ${TricuspidSelectedList}'),enabled:isEnabled,title: 'Tricuspid',
               radioInitialValue: formGController.FormJEchoAssignmentData.value.tricuspidFunction
               ,MGInitialValue: '${formGController.FormJEchoAssignmentData.value.tricuspidGradientMean}',
               maininitialValue: formGController.FormJEchoAssignmentData.value.tricuspid ,
               PGInitialValue: '${formGController.FormJEchoAssignmentData.value.tricuspidGradientPeak}',
               StenoticInitialValue: formGController.FormJEchoAssignmentData.value.tricuspidStenoticValue
               ,regurgitantInitialValue: formGController.FormJEchoAssignmentData.value.tricuspidRegurgitantValue
               ,selectedlist: TricuspidSelectedList,
               mainValue: (val){
                 formGController.FormJEchoAssignmentData.value.tricuspid = val;
                 setState(() {
                 });
               },
               checkboxValue: (val){
                 formGController.FormJEchoAssignmentData.value.tricuspidStenotic = val;
                 setState(() {
                 });
               },checkboxValueRegurgitant: (val){
                 formGController.FormJEchoAssignmentData.value.tricuspidRegurgitant = val;
                 setState(() {
                 });
               },MG: (val){
                 formGController.FormJEchoAssignmentData.value.tricuspidGradientMean = int.tryParse(val);
                 setState(() {
                 });
               },PG: (val){
                 formGController.FormJEchoAssignmentData.value.tricuspidGradientPeak = int.tryParse(val);
                 setState(() {
                 });
               },RegurgitantradioOnchange: (val){
                 formGController.FormJEchoAssignmentData.value.tricuspidRegurgitantValue = val;
                 setState(() {
                 });
               },StenoticradioOnchange: (val){
                 formGController.FormJEchoAssignmentData.value.tricuspidStenoticValue = val;
                 setState(() {
                 });
               },radioValue: (val){
                 formGController.FormJEchoAssignmentData.value.tricuspidFunction = val;
                 setState(() {
                 });
               },),
             ValueFunction(key: Key('Pulmonary ${PulmonarySelectedList}'),enabled:isEnabled,title: 'Pulmonary',
               maininitialValue: formGController.FormJEchoAssignmentData.value.pulmonary ,
               radioInitialValue: formGController.FormJEchoAssignmentData.value.pulmonaryFunction,
               MGInitialValue: formGController.FormJEchoAssignmentData.value.rvotObstructionGradientMean.toString(),
               PGInitialValue: formGController.FormJEchoAssignmentData.value.rvotObstructionGradientPeak.toString(),
               StenoticInitialValue: formGController.FormJEchoAssignmentData.value.pulmonaryStenoticValue
               ,regurgitantInitialValue: formGController.FormJEchoAssignmentData.value.pulmonaryRegurgitantValue
               ,selectedlist: PulmonarySelectedList,
               mainValue: (val){
                 formGController.FormJEchoAssignmentData.value.pulmonary = val;
                 setState(() {
                 });
               },
               checkboxValue: (val){
                 formGController.FormJEchoAssignmentData.value.pulmonaryStenotic = val;
                 setState(() {
                 });
               },checkboxValueRegurgitant: (val){
                 formGController.FormJEchoAssignmentData.value.pulmonaryRegurgitant = val;
                 setState(() {
                 });
               },MG: (val){
                 formGController.FormJEchoAssignmentData.value.rvotObstructionGradientMean = int.tryParse(val);
                 setState(() {
                 });
               },PG: (val){
                 formGController.FormJEchoAssignmentData.value.rvotObstructionGradientPeak =int.tryParse(val) ;
                 setState(() {
                 });
               },RegurgitantradioOnchange: (val){
                 formGController.FormJEchoAssignmentData.value.pulmonaryRegurgitantValue = val;
                 setState(() {
                 });
               },StenoticradioOnchange: (val){
                 formGController.FormJEchoAssignmentData.value.pulmonaryStenoticValue = val;
                 setState(() {
                 });
               },radioValue: (val){
                 formGController.FormJEchoAssignmentData.value.pulmonaryFunction = val;
                 setState(() {
                 });
               },),
           ],): Container(),
          ],): Container(),
          MRowTextRadioWidget(key:ValueKey('J7 ${formGController.FormJData.value.outComeIdentified}'),enabled: isEnabled,isneedDivider: false,title: 'J7.  Did the patient develop any complication (study outcome) Ell this visit:',initialValue: formGController.FormJData.value.outComeIdentified ?? 'No',onChanged: (val){
                setState(() {
                  formGController.FormJData.value.outComeIdentified = val;
                });
          },),
        formGController.FormJData.value.outComeIdentified == 'Yes' ?  FormH3(enabled: isEnabled,) : Container(),
        formGController.FormJData.value.outComeIdentified == 'Yes' ?  FormH4(enabled: isEnabled,) : Container(),
        formGController.FormJData.value.outComeIdentified == 'Yes' ?  FormH5(enabled: isEnabled,) : Container(),
        formGController.FormJData.value.outComeIdentified == 'Yes' ?  FormH6(enabled: isEnabled,) : Container(),

        // Obx(
          //   ()=> formGController.FormJData.value.outComeIdentified == 'Yes' ? Column(children: [
          //     ListView(
          //       shrinkWrap: true,
          //       physics: NeverScrollableScrollPhysics(),
          //       children: formGController.outCome.map((element) => Builder(
          //           builder: (context) {
          //             return InkWell(
          //               onTap: (){
          //                 showModalBottomSheet(
          //                     constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.6,minWidth: MediaQuery.of(context).size.width),
          //                     context: context, builder: (context)=>SingleImage(
          //                   URL: element.filePath,
          //                 )
          //                 );
          //               },
          //               child: Container(
          //                   height: 30,
          //                   // padding:  EdgeInsets.all(4),
          //                   decoration: BoxDecoration(
          //                     color: Colors.grey,
          //                     borderRadius: BorderRadius.circular(7),
          //                   ),
          //                   margin: EdgeInsets.all(4),
          //                   child: Center(child: Text(element.name ?? ''))),
          //             );
          //           }
          //       )).toList(),
          //     ),
          //    MFilledButton(text: 'Upload study outcome',isLoading: formGController.isOutComeUploadLoading.value,onPressed: (){
          //         formGController.UploadOutCome(context);
          //       },),
          //
          //   ],): Container(),
          // ),
          Space(),
          // MDivider(),
          // Space(),
          // MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},)
          isEnabled? MFilledButton(text: 'Submit',onPressed: () async{
            if(await formGController.upLoadData()){
              if(await echoAssignmentController.uploadEchoAssignment(9, formGController.FormJEchoAssignmentData.value)){
                formGController.FormJEchoAssignmentData.value = echoAssignmentController.EchoAssignmentData.value;
                setState(() {
                  isEnabled = !isEnabled;});
              }else{
                context.showSnackBar('Error while uploading AntenatalVisitOne Echo Assignment data');
              }
            }else{
              context.showSnackBar('Error while uploading AntenatalVisitOne data');
            }

          },):MFilledButton(text: 'Edit',onPressed: (){
            setState(() {
              isEnabled = !isEnabled;});
          },),
        Space(),
        MFilledButton(text: 'Save & Continue',onPressed: () async {
          if(await formGController.upLoadData()){
            if(await echoAssignmentController.uploadEchoAssignment(9, formGController.FormJEchoAssignmentData.value)){
              formGController.FormJEchoAssignmentData.value = echoAssignmentController.EchoAssignmentData.value;
              setState(() {
                isEnabled = !isEnabled;});
              context.push(Routes.FormI1);
            }else{
              context.showSnackBar('Error while uploading AntenatalVisitOne Echo Assignment data');
            }
          }else{
            context.showSnackBar('Error while uploading AntenatalVisitOne data');
          }
        },),
        Space(),
        ],),
      ),
    );
  }
}
