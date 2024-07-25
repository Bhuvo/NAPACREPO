
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:npac/Forms/CommonModelController/EchoAssignmentController.dart';
import 'package:npac/Forms/CommonModelController/EchoImage/EchoImageController.dart';
import 'package:npac/Forms/FormF/Controller/FromFController.dart';
import 'package:npac/Forms/FormF/FormF1.dart';
import 'package:npac/Forms/FormF/FormFModel/EchoImageModel.dart';
import 'package:npac/Forms/FormF/FormFModel/FormFModel.dart';
import 'package:npac/Forms/FormF/widget/ValueFunction.dart';
import 'package:npac/Forms/FormH/FormH3.dart';
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

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
  EchoAssignmentController echoAssignmentController = Get.put(EchoAssignmentController());
  EchoImageController echoImageController = Get.put(EchoImageController());

@override
  void initState() {
  getdatas();
  super.initState();
}

void getdatas()async{
  formFController.isLoading.value = true;
  await formFController.getFormFData(context,7964);
  await echoImageController.getEchoImage(7964 ,9);
  // await formFController.getEcho();
  // await formFController.getOutCome();
  await echoAssignmentController.getEcoAssignmentData(9);
  formFController.isLoading.value = true;
  formFController.FormIEchoAssignmentData.value = echoAssignmentController.EchoAssignmentData.value;
  formFController.FormIEchoAssignmentData.value.mitralStenotic ?? false ? isMitralStenotic = true :null;
  formFController.FormIEchoAssignmentData.value.mitralRegurgitant ?? false ? isMitralRegurgitant = true :null;
  formFController.FormIEchoAssignmentData.value.mitralStenotic ?? false ? MitralSelectedList.add('Stenotic') :null;
  formFController.FormIEchoAssignmentData.value.mitralRegurgitant ?? false ? MitralSelectedList.add('Regurgitant') :null;
  formFController.FormIEchoAssignmentData.value.aorticStenotic ?? false ? AorticSelectedList.add('Stenotic') :null;
  formFController.FormIEchoAssignmentData.value.aorticRegurgitant ?? false  ? AorticSelectedList.add('Regurgitant') :null;
  formFController.FormIEchoAssignmentData.value.tricuspidStenotic ?? false ? TricuspidSelectedList.add('Stenotic') :null;
  formFController.FormIEchoAssignmentData.value.tricuspidRegurgitant ?? false ? TricuspidSelectedList.add('Regurgitant') :null;
  formFController.FormIEchoAssignmentData.value.pulmonaryStenotic ?? false ? PulmonarySelectedList.add('Stenotic') :null;
  formFController.FormIEchoAssignmentData.value.pulmonaryRegurgitant ?? false ? PulmonarySelectedList.add('Regurgitant') :null;
  formFController.FormIEchoAssignmentData.value.othersVegetations ?? false ? PericardialOtherSelectedList.add('Vegetations') :null;
  formFController.FormIEchoAssignmentData.value.othersVegetations ?? false ? PericardialOtherSelectedList.add('Thrombus') :null;
  formFController.FormIEchoAssignmentData.value.wallMotionHypoGlobal ?? false ? PericardialOtherSelectedList.add('Global') :null;
  formFController.FormIEchoAssignmentData.value.wallMotionHypoRegional ?? false ? PericardialOtherSelectedList.add('Regional') :null;
  print('AorticSelectedList ${AorticSelectedList}');
  formFController.isLoading.value = false;
  setState(() {
  });

}
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'FORM I-ANTENATAL REVISIT-1',),

      body: Obx(()=>formFController.isLoading.value ? Center(child: LoadingWidget(),) :Form(
        key: formKey,
        child: MFormBody(Childrens: [
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
            MrowTextTextFieldWidget(enabled:isEnabled, title: 'I4.1 Weight (Kg):',initialValue: '${formFController.FormIData.value.clinicalSignWeight}',type: MInputType.numeric,onChanged: (val){
              if(int.parse(val) <=200 && int.parse(val) >= 30){
                formFController.FormIData.value.clinicalSignWeight = int.tryParse(val);
              }else{}
            },isneedDivider: false,),
            MrowTextTextFieldWidget(enabled:isEnabled, title: 'I4.2  Heart rate (/min):',type: MInputType.numeric,initialValue: '${formFController.FormIData.value.clinicalSignHR}',onChanged: (val){
              formFController.FormIData.value.clinicalSignHR= int.tryParse(val);
            },isneedDivider: false,),
            MrowTextTextFieldWidget(enabled:isEnabled, title: 'I4.3 SPO2 (%):',type: MInputType.numeric,initialValue: '${formFController.FormIData.value.clinicalSignSp}',onChanged: (val){
              formFController.FormIData.value.clinicalSignSp  = int.tryParse(val);
            },isneedDivider: false,),
            MrowTextTextFieldWidget(enabled:isEnabled, title: 'I4.4 BP (mm Hg):',type: MInputType.numeric,initialValue: '${formFController.FormIData.value.clinicalSignBp}',onChanged: (val){
              formFController.FormIData.value.clinicalSignBp = int.tryParse(val);
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
            MFilledButton(text: 'Upload ECG',isLoading: formFController.isEcoLoading.value,onPressed: (){
              // formFController.uploadEcho();
              echoImageController.uploadEchoImage(7964 ,9);
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
             MRowTextRadioWidget(enabled:isEnabled,title: 'Wall Motion:',initialValue: formFController.FormIEchoAssignmentData.value.wallMotion,onChanged: (val){
               formFController.FormIEchoAssignmentData.value.wallMotion = val;
             },isneedDivider: false,options: ['Normal','Hypo / akinesia'],),
             MRowTextCheckBox(enabled:isEnabled,selectedlist: HypoSelectedList,list: ['Global','Regional'],result: (val){
               val.contains('Global') ?formFController.FormIEchoAssignmentData.value.wallMotionHypoGlobal = true : formFController.FormIEchoAssignmentData.value.wallMotionHypoGlobal = false;
               val.contains('Regional') ?formFController.FormIEchoAssignmentData.value.wallMotionHypoRegional = true : formFController.FormIEchoAssignmentData.value.wallMotionHypoRegional = false;
             },),
             Space(),
            MText(text: 'LV systolic function',),
             Space(),
             MrowTextTextFieldWidget(enabled:isEnabled,title: 'LVID Diastole(mm):',initialValue: formFController.FormIEchoAssignmentData.value.lVIDDiastole,onChanged: (val){
               formFController.FormIEchoAssignmentData.value.lVIDDiastole = val;
             },type: MInputType.numeric,isneedDivider: false,),
             MrowTextTextFieldWidget(enabled:isEnabled,title: 'LVID Systole(mm):',initialValue: formFController.FormIEchoAssignmentData.value.lVIDSystole,onChanged: (val){
               formFController.FormIEchoAssignmentData.value.lVIDSystole = val;
             },type: MInputType.numeric,isneedDivider: false,),
             MrowTextTextFieldWidget(enabled:isEnabled,title: 'EF%:',initialValue: formFController.FormIEchoAssignmentData.value.lVEfPercent,onChanged: (val){
               formFController.FormIEchoAssignmentData.value.lVEfPercent = val;
             },type: MInputType.numeric),
             Space(),
             MText(text: 'RV systolic function',),
             Space(),
             MRowTextRadioWidget(enabled:isEnabled,options: List_items.NormalAbnormal ,initialValue: formFController.FormIEchoAssignmentData.value.rvNormalAbnormal,onChanged: (val){
               formFController.FormIEchoAssignmentData.value.rvNormalAbnormal = val;
             },isneedDivider: false,),
             MrowTextTextFieldWidget(enabled:isEnabled,title: 'TAPSE (mm)',initialValue: formFController.FormIEchoAssignmentData.value.rvTapse,onChanged: (val){
               formFController.FormIEchoAssignmentData.value.rvTapse = val;
             },type: MInputType.numeric,isneedDivider: false,),
             MrowTextTextFieldWidget(enabled:isEnabled,title: 'RV S’ (cm/sec)',initialValue: formFController.FormIEchoAssignmentData.value.rvRvs,onChanged: (val){
               formFController.FormIEchoAssignmentData.value.rvRvs = val;
             },type: MInputType.numeric),

             MRowTextRadioWidget(enabled:isEnabled,title: 'Pericardial effusion',initialValue: formFController.FormIEchoAssignmentData.value.pericardialEffusion,onChanged: (val){
               formFController.FormIEchoAssignmentData.value.pericardialEffusion = val;
             },options: ['Mild','Moderate','Massive','Tamponade'],),
             MRowTextCheckBox(enabled:isEnabled,selectedlist: PericardialOtherSelectedList,title: 'Others ',list: ['Vegetations','Thrombus'],result: (val){
               val.contains('Vegetations') ? formFController.FormIEchoAssignmentData.value.othersVegetations = true : formFController.FormIEchoAssignmentData.value.othersVegetations = false;
               val.contains('Thrombus') ? formFController.FormIEchoAssignmentData.value.othersThrombus = true : formFController.FormIEchoAssignmentData.value.othersThrombus = false;
             },),
             MrowTextTextFieldWidget(enabled:isEnabled,initialValue: formFController.FormIEchoAssignmentData.value.otherEchoFindings,title: 'Any other salient Echo Findings:',onChanged: (val){
               formFController.FormIEchoAssignmentData.value.otherEchoFindings = val;
             },),
             MText(text: 'Pulmonary Pressure Assessment:',),
             Space(),
             // MrowTextTextFieldWidget(title: 'Tricuspid regurgitation ',initialValue: formFController.FormIData.value.valveTricuspidRegurgitant,onChanged: (val){
             //   formFController.FormIData.value.valveTricuspidRegurgitant = val;
             // },isneedDivider: false,),
             // MrowTextTextFieldWidget(title: 'Pulmonary regurgitation ',onChanged: (val){},isneedDivider: false,),
             MrowTextTextFieldWidget(enabled:isEnabled,title: 'TRPG (mmHg):',initialValue: '${formFController.FormIEchoAssignmentData.value.trpg}',onChanged: (val){
               formFController.FormIEchoAssignmentData.value.trpg = int.tryParse(val);
             },isneedDivider: false,),
             MrowTextTextFieldWidget(enabled:isEnabled,title: 'Peak PR (mmHg):',initialValue:'${formFController.FormIEchoAssignmentData.value.peakPr}',onChanged: (val){
               formFController.FormIEchoAssignmentData.value.peakPr = int.tryParse(val);
             },isneedDivider: false,),
             MrowTextTextFieldWidget(enabled:isEnabled,title: 'PAT(msec)',initialValue: '${formFController.FormIEchoAssignmentData.value.pat}',onChanged: (val){
               formFController.FormIEchoAssignmentData.value.pat = int.tryParse(val);
             },),
             // MText(text: 'VALVE FUNCTION',),
            Space(),
            MRowTextRadioWidget(title: ' Valvular Morphology',options: List_items.NormalAbnormal,initialValue: formFController.FormIEchoAssignmentData.value.valvularMorphology,enabled: isEnabled,onChanged: (val){
              formFController.FormIEchoAssignmentData.value.valvularMorphology = val;
              setState(() {});
            },isneedDivider:false ,),
             Space(),
             if(formFController.FormIEchoAssignmentData.value.valvularMorphology == 'Abnormal')...[
               MRowTextRadioWidget(title: 'Mitral',options: ['Native','Prosthetic'],initialValue: formFController.FormIEchoAssignmentData.value.mitral,onChanged: (val){
                 setState(() {
                   formFController.FormIEchoAssignmentData.value.mitral = val;
                 });
               },isneedDivider: false,),
               formFController.FormIEchoAssignmentData.value.mitral == 'Native'? Column(
                 key:ValueKey('Mitral Native ${formFController.FormIEchoAssignmentData.value.mitral}'),
                 children: [
                   MRowTextRadioWidget(enabled:isEnabled,title: 'Mitral Function',onChanged: (val ){
                     setState(() {
                       formFController.FormIEchoAssignmentData.value.mitralFunction = val;
                     });
                   },options: List_items.NormalAbnormal,isneedDivider: false,),
                   formFController.FormIEchoAssignmentData.value.mitralFunction =='Abnormal'? MRowTextCheckBox(enabled:isEnabled,selectedlist: MitralSelectedList,list: List_items.ValuFunction,
                     result: (val){
                       if(val.contains('Stenotic')){
                         formFController.FormIEchoAssignmentData.value.mitralStenotic = true;
                         setState(() {
                           isMitralStenotic = true;
                         });
                       }else{
                         formFController.FormIEchoAssignmentData.value.mitralStenotic = false;
                         setState(() {
                           isMitralStenotic = false;
                         });
                       }
                       if(val.contains('Regurgitant')){
                         formFController.FormIEchoAssignmentData.value.mitralRegurgitant = true;
                         setState(() {
                           isMitralRegurgitant = true;
                         });
                       }else{
                         formFController.FormIEchoAssignmentData.value.mitralRegurgitant = false;
                         setState(() {
                           isMitralRegurgitant = false;
                         });
                       }
                     },isneedDivider: isMitralStenotic ||isMitralRegurgitant ?false  : true,): Container(),
                   isMitralStenotic ?  MRowTextRadioWidget(enabled:isEnabled,initialValue: formFController.FormIEchoAssignmentData.value.mitralStenoticValue,onChanged: (val ){
                     formFController.FormIEchoAssignmentData.value.mitralStenoticValue = val;
                   },options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
                   isMitralStenotic ?  MrowTextTextFieldWidget(enabled:isEnabled,title: 'MVOA (cm2) ',initialValue: '${formFController.FormIEchoAssignmentData.value.mitralMVOA}',onChanged: (val ){
                     formFController.FormIEchoAssignmentData.value.mitralMVOA= int.tryParse(val);
                   },isneedDivider: false,) : Container(),
                   isMitralStenotic ?Column(
                     children: [
                       MSmallText(text: 'MVG',),
                       Space(),
                       MrowTextTextFieldWidget(enabled:isEnabled,title: 'MG',initialValue: '${formFController.FormIEchoAssignmentData.value.mitralMVGradientMean}',onChanged: (val ){
                         formFController.FormIEchoAssignmentData.value.mitralMVGradientMean= int.tryParse(val);
                       },isneedDivider: false,),
                       MrowTextTextFieldWidget(enabled:isEnabled,title: 'PG',initialValue: '${formFController.FormIEchoAssignmentData.value.mitralMVGradientPeak}',onChanged: (val ){
                         formFController.FormIEchoAssignmentData.value.mitralMVGradientPeak= int.tryParse(val);
                       },isneedDivider: false,)
                     ],
                   ): Container(),

                   isMitralRegurgitant ?  MRowTextRadioWidget(enabled:isEnabled,title: 'Regurgitant',initialValue: formFController.FormIEchoAssignmentData.value.mitralRegurgitantValue,onChanged: (val ){
                     formFController.FormIEchoAssignmentData.value.mitralRegurgitantValue = val;
                   },options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),

                 ],): Container(),
               MDivider(),
               Space(),
               Obx(()=> ValueFunction(key: Key('Aortic ${AorticSelectedList}'),enabled:isEnabled,title: 'Aortic',radioInitialValue: formFController.FormIEchoAssignmentData.value.aorticFunction
                   ,MGInitialValue: '${formFController.FormIEchoAssignmentData.value.aorticStenosisGradientMean}',
                   PGInitialValue: '${formFController.FormIEchoAssignmentData.value.aorticStenosisGradientPeak}',
                   StenoticInitialValue: formFController.FormIEchoAssignmentData.value.aorticStenoticValue
                   ,regurgitantInitialValue: formFController.FormIEchoAssignmentData.value.aorticRegurgitantValue
                   ,selectedlist: AorticSelectedList,
                   maininitialValue: formFController.FormIEchoAssignmentData.value.aortic,
                   mainValue: (val){
                     formFController.FormIEchoAssignmentData.value.aortic = val;
                     setState(() {
                     });
                   },
                   checkboxValue: (val){
                     formFController.FormIEchoAssignmentData.value.aorticStenotic = val;
                     print('Aortic ${AorticSelectedList}');
                     setState(() {
                     });
                   },checkboxValueRegurgitant: (val){
                     formFController.FormIEchoAssignmentData.value.aorticRegurgitant = val;
                     setState(() {
                     });
                   },MG: (val){
                     formFController.FormIEchoAssignmentData.value.aorticStenosisGradientMean = int.tryParse(val);
                     setState(() {
                     });
                   },PG: (val){
                     formFController.FormIEchoAssignmentData.value.aorticStenosisGradientPeak = int.tryParse(val);
                     setState(() {
                     });
                   },RegurgitantradioOnchange: (val){
                     formFController.FormIEchoAssignmentData.value.aorticRegurgitantValue = val;
                     setState(() {
                     });
                   },StenoticradioOnchange: (val){
                     formFController.FormIEchoAssignmentData.value.aorticStenoticValue = val;
                     setState(() {
                     });
                   },radioValue: (val){
                     formFController.FormIEchoAssignmentData.value.aorticFunction = val;
                     setState(() {
                     });
                   },),
               ),
               ValueFunction(key: Key('Tricuspid ${TricuspidSelectedList}'),enabled:isEnabled,title: 'Tricuspid',
                 radioInitialValue: formFController.FormIEchoAssignmentData.value.tricuspidFunction
                 ,MGInitialValue: '${formFController.FormIEchoAssignmentData.value.tricuspidGradientMean}',
                 PGInitialValue: '${formFController.FormIEchoAssignmentData.value.tricuspidGradientPeak}',
                 StenoticInitialValue: formFController.FormIEchoAssignmentData.value.tricuspidStenoticValue
                 ,regurgitantInitialValue: formFController.FormIEchoAssignmentData.value.tricuspidRegurgitantValue
                 ,selectedlist: TricuspidSelectedList,
                  maininitialValue: formFController.FormIEchoAssignmentData.value.tricuspid,
                 mainValue: (val){
                   formFController.FormIEchoAssignmentData.value.tricuspid = val;
                   setState(() {
                   });
                 },
                 checkboxValue: (val){
                   formFController.FormIEchoAssignmentData.value.tricuspidStenotic = val;
                   setState(() {
                   });
                 },checkboxValueRegurgitant: (val){
                   formFController.FormIEchoAssignmentData.value.tricuspidRegurgitant = val;
                   setState(() {
                   });
                 },MG: (val){
                   formFController.FormIEchoAssignmentData.value.tricuspidGradientMean = int.tryParse(val);
                   setState(() {
                   });
                 },PG: (val){
                   formFController.FormIEchoAssignmentData.value.tricuspidGradientPeak = int.tryParse(val);
                   setState(() {
                   });
                 },RegurgitantradioOnchange: (val){
                   formFController.FormIEchoAssignmentData.value.tricuspidRegurgitantValue = val;
                   setState(() {
                   });
                 },StenoticradioOnchange: (val){
                   formFController.FormIEchoAssignmentData.value.tricuspidStenoticValue = val;
                   setState(() {
                   });
                 },radioValue: (val){
                   formFController.FormIEchoAssignmentData.value.tricuspidFunction = val;
                   setState(() {
                   });
                 },),
               ValueFunction(key: Key('Pulmonary ${PulmonarySelectedList}'),enabled:isEnabled,title: 'Pulmonary',
                 radioInitialValue: formFController.FormIEchoAssignmentData.value.pulmonaryFunction,
                 MGInitialValue: formFController.FormIEchoAssignmentData.value.rvotObstructionGradientMean.toString(),
                 PGInitialValue: formFController.FormIEchoAssignmentData.value.rvotObstructionGradientPeak.toString(),
                 StenoticInitialValue: formFController.FormIEchoAssignmentData.value.pulmonaryStenoticValue
                 ,regurgitantInitialValue: formFController.FormIEchoAssignmentData.value.pulmonaryRegurgitantValue
                 ,selectedlist: PulmonarySelectedList,
                 maininitialValue: formFController.FormIEchoAssignmentData.value.pulmonary,
                 mainValue:  (val){
                   formFController.FormIEchoAssignmentData.value.pulmonary  = val;
                   setState(() {
                   });
                 },
                 checkboxValue: (val){
                   formFController.FormIEchoAssignmentData.value.pulmonaryStenotic = val;
                   setState(() {
                   });
                 },checkboxValueRegurgitant: (val){
                   formFController.FormIEchoAssignmentData.value.pulmonaryRegurgitant = val;
                   setState(() {
                   });
                 },MG: (val){
                   formFController.FormIEchoAssignmentData.value.rvotObstructionGradientMean = int.tryParse(val);
                   setState(() {
                   });
                 },PG: (val){
                   formFController.FormIEchoAssignmentData.value.rvotObstructionGradientPeak =int.tryParse(val) ;
                   setState(() {
                   });
                 },RegurgitantradioOnchange: (val){
                   formFController.FormIEchoAssignmentData.value.pulmonaryRegurgitantValue = val;
                   setState(() {
                   });
                 },StenoticradioOnchange: (val){
                   formFController.FormIEchoAssignmentData.value.pulmonaryStenoticValue = val;
                   setState(() {
                   });
                 },radioValue: (val){
                   formFController.FormIEchoAssignmentData.value.pulmonaryFunction = val;
                   setState(() {
                   });
                 },),
             ],
           ],): Container(),
          formFController.FormIEchoAssignmentData.value.valvularMorphology == 'Normal' ? MDivider() : Container(),
            MRowTextRadioWidget(enabled:isEnabled,isneedDivider: false,title: 'I7. Did the patient develop any complication (study outcome) Ell this visit: ',initialValue: formFController.FormIData.value.outComeIdentified,onChanged: (val){
              setState(() {
                formFController.FormIData.value.outComeIdentified = val;
              });
            },),
          formFController.FormIData.value.outComeIdentified == 'Yes' ?  FormH3(enabled: isEnabled,) : Container(),
          // formFController.FormIData.value.outComeIdentified == 'Yes' ? Column(children: [
          //   // ListView(
          //   //   shrinkWrap: true,
          //   //   physics: NeverScrollableScrollPhysics(),
          //   //   children: formFController.outCome.map((element) => Builder(
          //   //       builder: (context) {
          //   //         return InkWell(
          //   //           // onTap:(){
          //   //           //   showModalBottomSheet(
          //   //           //       constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.6),
          //   //           //       context: context, builder: (context)=>ImageViewer<EchoImageModel>(data: formFController.echoModel));
          //   //           // },
          //   //           onTap: (){
          //   //             showModalBottomSheet(
          //   //                 constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.6,minWidth: MediaQuery.of(context).size.width),
          //   //                 context: context, builder: (context)=>SingleImage(
          //   //               URL: element.filePath,
          //   //             )
          //   //             );
          //   //           },
          //   //           child: Container(
          //   //               height: 30,
          //   //               // padding:  EdgeInsets.all(4),
          //   //               decoration: BoxDecoration(
          //   //                 color: Colors.grey,
          //   //                 borderRadius: BorderRadius.circular(7),
          //   //               ),
          //   //               margin: EdgeInsets.all(4),
          //   //               child: Center(child: Text(element.name ?? ''))),
          //   //         );
          //   //       }
          //   //   )).toList(),
          //   // ),
          //   // MFilledButton(text: 'Upload study outcome',isLoading: formFController.isOutComeUploadLoading.value,onPressed: (){
          //   //   formFController.UploadOutCome();
          //   // },),
          //   FormH3(enabled: isEnabled,),
          // ],): Container(),
          // MFilledButton(text: 'Submit',onPressed: () async{
          // }),
          Space(),
          MDivider(),
          Space(),
          isEnabled? MFilledButton(text: 'Submit',onPressed: () async{
            if(await formFController.upLoadData()){
              if(await echoAssignmentController.uploadEchoAssignment(9, formFController.FormIEchoAssignmentData.value)){
                formFController.FormIEchoAssignmentData.value = echoAssignmentController.EchoAssignmentData.value;
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
            if(await formFController.upLoadData()){
              if(await echoAssignmentController.uploadEchoAssignment(9, formFController.FormIEchoAssignmentData.value)){
                formFController.FormIEchoAssignmentData.value = echoAssignmentController.EchoAssignmentData.value;
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
