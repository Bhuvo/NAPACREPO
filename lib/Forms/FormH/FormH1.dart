import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Forms/CommonModelController/EchoAssignmentController.dart';
import 'package:npac/Forms/CommonModelController/EchoImage/EchoImageController.dart';
import 'package:npac/Forms/CommonModelController/OtherImageController/OtherImageController.dart';
import 'package:npac/Forms/FormH/Controller/FormKController.dart';
import 'package:npac/Forms/FormL/widget/ValueFunction.dart';
import 'package:npac/Forms/FormH/FormH2.dart';
import 'package:npac/Forms/FormH/FormH3.dart';
import 'package:npac/Forms/FormH/FormH4.dart';
import 'package:npac/Forms/FormH/FormH5.dart';
import 'package:npac/Forms/FormH/FormH6.dart';
import 'package:npac/Forms/FormH/FormH7.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/navigator_utils.dart';
import 'package:npac/widgets/loading_widget.dart';

class FormH1 extends StatefulWidget {
  final int? patientId;
  const FormH1({super.key, this.patientId});

  @override
  State<FormH1> createState() => _FormH1State();
}

class _FormH1State extends State<FormH1> {

  bool isEnabled = false;

  // bool isMitralStenotic = false;
  // bool isMitralRegurgitant = false;
  // bool isMitralAbNormal = false;
  // bool ecgAbnormal = false;
  // bool isAssignment = false;
  List<String> GRSelectedList = [];
  List<String> VHSelectedList = [];

  RxList<String> MitralSelectedList = <String>[].obs;
  RxList<String> AorticSelectedList = <String>[].obs;
  List<String> TricuspidSelectedList = <String>[].obs;
  List<String> PulmonarySelectedList = <String>[].obs;

  FormKController controller = Get.put(FormKController());
  EchoAssignmentController echoAssignmentController = Get.put(EchoAssignmentController());
  EchoImageController echoImageController = Get.put(EchoImageController());
  OtherImageController otherImageController = Get.put(OtherImageController());

  @override
  void initState() {
    getData();
    super.initState();
  }
  
  void getData()async{
    controller.patientId.value = widget.patientId ?? 7964;
    print(controller.patientId.value);
     controller.isLoading.value = true;
    await controller.getFormKData();
    await echoAssignmentController.getEcoAssignmentData(controller.patientId.value, controller.formId.value);
    await echoImageController.getEchoImage(controller.patientId.value, controller.formId.value);
    await otherImageController.getOtherImage(controller.patientId.value, controller.formId.value,'\'DeathSummary\'');

    controller.formKEchoAssignmentData = echoAssignmentController.EchoAssignmentData;
    controller.EchoImage = echoImageController.EchoImage;
    controller.otherImage = otherImageController.otherImage;
    controller.formKEchoAssignmentData.value.mitralStenotic ?? false ? MitralSelectedList.add('Stenotic') :null;
    controller.formKEchoAssignmentData.value.mitralRegurgitant ?? false ? MitralSelectedList.add('Regurgitant') :null;
    controller.formKEchoAssignmentData.value.aorticStenotic ?? false ? AorticSelectedList.add('Stenotic') :null;
    controller.formKEchoAssignmentData.value.aorticRegurgitant ?? false  ? AorticSelectedList.add('Regurgitant') :null;
    controller.formKEchoAssignmentData.value.tricuspidStenotic ?? false ? TricuspidSelectedList.add('Stenotic') :null;
    controller.formKEchoAssignmentData.value.tricuspidRegurgitant ?? false ? TricuspidSelectedList.add('Regurgitant') :null;
    controller.formKEchoAssignmentData.value.pulmonaryStenotic ?? false ? PulmonarySelectedList.add('Stenotic') :null;
    controller.formKEchoAssignmentData.value.pulmonaryRegurgitant ?? false ? PulmonarySelectedList.add('Regurgitant') :null;
    controller.formKEchoAssignmentData.value.wallMotionHypoGlobal ?? false ? GRSelectedList.add('Global') :null;
    controller.formKEchoAssignmentData.value.wallMotionHypoRegional ?? false ? GRSelectedList.add('Regional') :null;
    controller.formKEchoAssignmentData.value.othersVegetations ?? false ? VHSelectedList.add('Vegetations') :null;
    controller.formKEchoAssignmentData.value.othersThrombus ?? false ? VHSelectedList.add('Thrombus') :null;
    controller.isLoading.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'Hospitalization for Delivery (Intrapartum and Immediate Postpartum Details)',),

      body: Obx(()=>controller.isLoading.value ? Center(child: LoadingWidget()) : MFormBody(Childrens: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('For all patients (Tick theapplicable)'),
              IconButton(
                  onPressed: () async {
                    await controller.getFormK7Data();
                    // await controller.saveFormK7Data();
                    setState(() {
                      isEnabled = !isEnabled;
                    });
                  },
                  icon: isEnabled ? Icon(Icons.save) : Icon(Icons.edit))
            ],
          ),
        // FormH3(enabled: isEnabled,formK3Data: controller.formK3Data,),
        // FormH7(key : ValueKey('Form K7 ${controller.otherImage}'),enabled: isEnabled,formK7Data: controller.formK7Data,otherImage: controller.otherImage,onChanged: () async {
        //   await otherImageController.uploadOtherImage(controller.patientId.value,controller.formId.value);
        //   controller.otherImage = otherImageController.otherImage;
        // },),
        // Space(),
          MrowTextDatePickerWidget(enabled: isEnabled,title: 'K1 Date of Admission:',initialDate: stringToDate(controller.formK1Data.value.dateOfAdmission ?? ''),onChanged: (val){
            controller.formK1Data.value.dateOfAdmission = dateToString(val);
          },),
          MrowTextDatePickerWidget(enabled: isEnabled,title: 'K2 Date of Discharge:',initialDate: stringToDate(controller.formK1Data.value.dateOfDischarge ?? ''),onChanged: (val){
            controller.formK1Data.value.dateOfDischarge = dateToString(val);
          },),
          MRowTextRadioWidget(enabled: isEnabled,title: 'K3.1 NYHA SYMPTOMS CLASS:',initialValue: controller.formK1Data.value.nyhaSymptomsClass,onChanged: (val){
            controller.formK1Data.value.nyhaSymptomsClass = val;
          },options:List_items.NYHAClass),
          MRowTextRadioWidget(enabled: isEnabled,title: 'K3.2 mWHO CLASSIFICATION (as evaluated in present visit):',initialValue: controller.formK1Data.value.mWhoClassification,onChanged: (val){
            controller.formK1Data.value.mWhoClassification = val;
          },options:List_items.MWHORisk),
          MSmallText(text: 'K4 CLINICAL SIGNS & ECG',),
          Space(),
          MrowTextTextFieldWidget(enabled: isEnabled, title: 'K4.1 Weight (Kg):',initialValue: '${controller.formK1Data.value.clinicalSignWeight}',type: MInputType.decimal,onChanged: (val){
            controller.formK1Data.value.clinicalSignWeight = int.parse(val);
          },isneedDivider: false,),
          MrowTextTextFieldWidget( enabled: isEnabled,title: 'K4.2 HR (/min):',initialValue: '${controller.formK1Data.value.clinicalSignHR}',type: MInputType.decimal,onChanged: (val){
            controller.formK1Data.value.clinicalSignHR = int.parse(val);
          },isneedDivider: false,),
          MrowTextTextFieldWidget( enabled: isEnabled,title: 'K4.3 SPO2 (%):',initialValue: '${controller.formK1Data.value.clinicalSignSp}',type: MInputType.decimal,onChanged: (val){
            controller.formK1Data.value.clinicalSignSp = int.parse(val);
          },isneedDivider: false,),
          MrowTextTextFieldWidget( enabled: isEnabled,title: 'K4.4 BP (mm Hg):',initialValue: '${controller.formK1Data.value.clinicalSignBp}',type: MInputType.decimal,onChanged: (val){
            controller.formK1Data.value.clinicalSignBp = int.parse(val);
          },isneedDivider: false,),
          MRowTextRadioWidget(enabled: isEnabled,title: 'K4.5 CCF:',initialValue: controller.formK1Data.value.clinicalSignCcf,isneedDivider: false,onChanged: (val){
            controller.formK1Data.value.clinicalSignCcf = val;
          },),
          MRowTextRadioWidget(enabled: isEnabled,title: 'K4.6 Cyanosis:',initialValue: controller.formK1Data.value.clinicalSignCyanosis,isneedDivider: false,onChanged: (val){
            controller.formK1Data.value.clinicalSignCyanosis = val;
          },),
          MRowTextRadioWidget(enabled: isEnabled,title: 'K4.7 Cardiac murmur:',initialValue: controller.formK1Data.value.clinicalSignCardiacMurmur,onChanged: (val){
            controller.formK1Data.value.clinicalSignCardiacMurmur = val;
          },),
          MrowTextDatePickerWidget(enabled: isEnabled,title: 'K5 ECG Date:',initialDate: stringToDate(controller.formK1Data.value.ecgDate ?? ''),onChanged: (val){
            controller.formK1Data.value.ecgDate = dateToString(val);
          },isneedDivider: false,),
        MRowTextRadioWidget(enabled: isEnabled,options:List_items.NormalAbnormal ,initialValue: controller.formK1Data.value.ecgNormalAbnormal,onChanged: (val){
          // val == 'Abnormal' ? ecgAbnormal = true : ecgAbnormal =false;
          controller.formK1Data.value.ecgNormalAbnormal = val;
          setState(() {});
        },isneedDivider: false,),
        controller.formK1Data.value.ecgNormalAbnormal == 'Abnormal' ? Column(children: [
          Column(
            key: ValueKey('${controller.EchoImage.length}'),
            // shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            children:controller.EchoImage.map((element) => Builder(
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
          MFilledButton(text: 'Upload ECG',onPressed: (){
            // formFController.uploadEcho();
            echoImageController.uploadEchoImage(7964 ,11);
          },),
        ],): Container(),
          // MRowTextRadioWidget(enabled: isEnabled,options:List_items.NormalAbnormal ,onChanged: (val){
          //   val =='Abnormal' ? ecgAbnormal = true : ecgAbnormal = false;
          //   setState(() {});
          // },isneedDivider: false,),
          // ecgAbnormal ? MFilledButton(text: 'Upload ECG',onPressed: (){},) : Container(),
          Space(),
          MDivider(),
          Space(),
          MSmallText(text:'K6 ECHOCARDIOGRAPHIC ASSESSMENT'),
          // Space(),
          MRowTextRadioWidget(enabled: isEnabled,title: 'Any significant change from previous echo',initialValue: controller.formK1Data.value.significantChanges,onChanged: (val){
            // val =='Yes' ? isAssignment = true : isAssignment  = false;
            controller.formK1Data.value.significantChanges = val;
            setState(() {});
          },),
          controller.formK1Data.value.significantChanges == 'Yes' ? Column(children: [
            MText(text: 'Ventricular Function',),
            Space(),
            MRowTextRadioWidget(enabled: isEnabled,title: 'Wall Motion:',initialValue: controller.formKEchoAssignmentData.value.wallMotion,onChanged: (val){
              controller.formKEchoAssignmentData.value.wallMotion = val;
            },isneedDivider: false,options: ['Normal','Hypo / akinesia'],),
            MRowTextCheckBox(enabled: isEnabled,list: ['Global','Regional'],selectedlist: GRSelectedList,result: (val){
              val.contains('Global') ?controller.formKEchoAssignmentData.value.wallMotionHypoGlobal = true:controller.formKEchoAssignmentData.value.wallMotionHypoGlobal = false;
              val.contains('Regional') ?controller.formKEchoAssignmentData.value.wallMotionHypoRegional = true:controller.formKEchoAssignmentData.value.wallMotionHypoRegional = false;
              setState(() {});
            },),
            Space(),
            MSmallText(text: 'LV systolic function',),
            Space(),
            MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Diastole(mm):',initialValue: controller.formKEchoAssignmentData.value.lVIDDiastole,onChanged: (val){
              controller.formKEchoAssignmentData.value.lVIDDiastole = val;
            },type: MInputType.numeric,isneedDivider: false,),
            MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Systole(mm):',initialValue: controller.formKEchoAssignmentData.value.lVIDSystole,onChanged: (val){
              controller.formKEchoAssignmentData.value.lVIDSystole = val;
            },type: MInputType.numeric,isneedDivider: false,),
            MrowTextTextFieldWidget(enabled: isEnabled,title: 'EF%:',initialValue: controller.formKEchoAssignmentData.value.lVEfPercent,onChanged: (val){
              controller.formKEchoAssignmentData.value.lVEfPercent = val;
            },type: MInputType.numeric),
            Space(),
            MSmallText(text: 'RV systolic function',),
            Space(),
            MRowTextRadioWidget(enabled: isEnabled,options: List_items.NormalAbnormal ,initialValue: controller.formKEchoAssignmentData.value.rvNormalAbnormal,onChanged: (val){
              controller.formKEchoAssignmentData.value.rvNormalAbnormal = val;
            },isneedDivider: false,),
            controller.formKEchoAssignmentData.value.rvNormalAbnormal =='Abnormal'? Column(children: [
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'TAPSE (mm)',initialValue: controller.formKEchoAssignmentData.value.rvTapse,onChanged: (val){
                controller.formKEchoAssignmentData.value.rvTapse = val;
              },type: MInputType.numeric,isneedDivider: false,),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'RV S’ (cm/sec):',initialValue: controller.formKEchoAssignmentData.value.rvRvs,onChanged: (val){
                controller.formKEchoAssignmentData.value.rvRvs = val;
              },type: MInputType.numeric),
            ],): Container(),
            MRowTextRadioWidget(enabled: isEnabled,title: 'Pericardial effusion',initialValue: controller.formKEchoAssignmentData.value.pericardialEffusion,onChanged: (val){
              controller.formKEchoAssignmentData.value.pericardialEffusion = val;
            },options: ['Mild','Moderate','Massive','Tamponade'],),
            MRowTextCheckBox(enabled: isEnabled,title: 'Others ',selectedlist: VHSelectedList,result: (val){
              val.contains('Vegetations') ?controller.formKEchoAssignmentData.value.othersVegetations = true:controller.formKEchoAssignmentData.value.othersVegetations = false;
              val.contains('Thrombus') ?controller.formKEchoAssignmentData.value.othersThrombus = true:controller.formKEchoAssignmentData.value.othersThrombus = false;
              setState(() {});
            },list: ['Vegetations','Thrombus'],),
            MrowTextTextFieldWidget(enabled: isEnabled,title: 'Any other salient Echo Findings:',initialValue: controller.formKEchoAssignmentData.value.otherEchoFindings,onChanged: (val){
              controller.formKEchoAssignmentData.value.otherEchoFindings = val;
            },),
            MText(text: 'Pulmonary Pressure',),
            Space(),
            // MrowTextTextFieldWidget(title: 'Tricuspid regurgitation ',onChanged: (val){},isneedDivider: false,),
            // MrowTextTextFieldWidget(title: 'Pulmonary regurgitation ',onChanged: (val){},isneedDivider: false,),
            MrowTextTextFieldWidget(enabled: isEnabled,title: 'TRPG (mmHg):',initialValue: '${controller.formKEchoAssignmentData.value.trpg}',onChanged: (val){
              controller.formKEchoAssignmentData.value.trpg = int.tryParse(val) ?? 0;
            },isneedDivider: false,),
            MrowTextTextFieldWidget(enabled: isEnabled,title: 'Peak PR (mmHg):',initialValue: '${controller.formKEchoAssignmentData.value.peakPr}',onChanged: (val){
              controller.formKEchoAssignmentData.value.peakPr = int.tryParse(val) ?? 0;
            },isneedDivider: false,),
            MrowTextTextFieldWidget(enabled: isEnabled,title: 'PAT(msec)',initialValue: '${controller.formKEchoAssignmentData.value.pat}',onChanged: (val){
              controller.formKEchoAssignmentData.value.pat = int.tryParse(val) ?? 0;
            },),
            MText(text: 'VALVE FUNCTION',),
            Space(),
            ValueFunction(
              key: Key('Mitral ${MitralSelectedList}'),
              enabled:isEnabled,
              title: 'Mitral',
              maininitialValue: controller.formKEchoAssignmentData.value.mitral,
              isMVOA: true,
              radioInitialValue: controller.formKEchoAssignmentData.value.mitralFunction
              ,MGInitialValue: '${controller.formKEchoAssignmentData.value.mitralMVGradientMean}',
              PGInitialValue: '${controller.formKEchoAssignmentData.value.mitralMVGradientPeak}',
              StenoticInitialValue: controller.formKEchoAssignmentData.value.mitralStenoticValue
              ,regurgitantInitialValue: controller.formKEchoAssignmentData.value.mitralRegurgitantValue
              ,selectedlist: MitralSelectedList,
              checkboxValue: (val){
                controller.formKEchoAssignmentData.value.mitralStenotic = val;
                setState(() {
                });
              },checkboxValueRegurgitant: (val){
              controller.formKEchoAssignmentData.value.mitralRegurgitant = val;
              setState(() {
              });
            },MG: (val){
              controller.formKEchoAssignmentData.value.mitralMVGradientMean = int.tryParse(val);
              setState(() {
              });
            },PG: (val){
              controller.formKEchoAssignmentData.value.mitralMVGradientPeak = int.tryParse(val);
              setState(() {
              });
            },mainValue: (val){
              controller.formKEchoAssignmentData.value.mitral = val;
              setState(() {
              });
            },StenoticradioOnchange: (val){
              controller.formKEchoAssignmentData.value.mitralStenoticValue = val;
              setState(() {
              });
            },RegurgitantradioOnchange: (val){
              controller.formKEchoAssignmentData.value.mitralRegurgitantValue = val;
              setState(() {
              });
            },radioValue: (val){
              controller.formKEchoAssignmentData.value.mitralFunction = val;
              setState(() {
              });
            },MVOA: (val){
              controller.formKEchoAssignmentData.value.mitralMVGradientMean = int.tryParse(val);
              setState(() {
              });
            },
            ) ,

            Obx(()=> ValueFunction(key: Key('Aortic ${AorticSelectedList}'),enabled:isEnabled,title: 'Aortic',radioInitialValue: controller.formKEchoAssignmentData.value.aorticFunction
              ,MGInitialValue: '${controller.formKEchoAssignmentData.value.aorticStenosisGradientMean}',
              PGInitialValue: '${controller.formKEchoAssignmentData.value.aorticStenosisGradientPeak}',
              StenoticInitialValue: controller.formKEchoAssignmentData.value.aorticStenoticValue
              ,regurgitantInitialValue: controller.formKEchoAssignmentData.value.aorticRegurgitantValue
              ,selectedlist: AorticSelectedList,
              maininitialValue: controller.formKEchoAssignmentData.value.aortic,
              isMVOA: false,
              mainValue: (val){
                controller.formKEchoAssignmentData.value.aortic = val;
                setState(() {
                });
              },
              checkboxValue: (val){
                controller.formKEchoAssignmentData.value.aorticStenotic = val;
                print('Aortic ${AorticSelectedList}');
                setState(() {
                });
              },checkboxValueRegurgitant: (val){
                controller.formKEchoAssignmentData.value.aorticRegurgitant = val;
                setState(() {
                });
              },MG: (val){
                controller.formKEchoAssignmentData.value.aorticStenosisGradientMean = int.tryParse(val);
                setState(() {
                });
              },PG: (val){
                controller.formKEchoAssignmentData.value.aorticStenosisGradientPeak = int.tryParse(val);
                setState(() {
                });
              },RegurgitantradioOnchange: (val){
                controller.formKEchoAssignmentData.value.aorticRegurgitantValue = val;
                setState(() {
                });
              },StenoticradioOnchange: (val){
                controller.formKEchoAssignmentData.value.aorticStenoticValue = val;
                setState(() {
                });
              },radioValue: (val){
                controller.formKEchoAssignmentData.value.aorticFunction = val;
                setState(() {
                });
              },),
            ),
            ValueFunction(key: Key('Tricuspid ${TricuspidSelectedList}'),enabled:isEnabled,title: 'Tricuspid',
              radioInitialValue: controller.formKEchoAssignmentData.value.tricuspidFunction
              ,MGInitialValue: '${controller.formKEchoAssignmentData.value.tricuspidGradientMean}',
              PGInitialValue: '${controller.formKEchoAssignmentData.value.tricuspidGradientPeak}',
              StenoticInitialValue: controller.formKEchoAssignmentData.value.tricuspidStenoticValue
              ,regurgitantInitialValue: controller.formKEchoAssignmentData.value.tricuspidRegurgitantValue
              ,selectedlist: TricuspidSelectedList,
              maininitialValue: controller.formKEchoAssignmentData.value.tricuspid,
              mainValue: (val){
                controller.formKEchoAssignmentData.value.tricuspid = val;
                setState(() {
                });
              },isMVOA:  false,
              checkboxValue: (val){
                controller.formKEchoAssignmentData.value.tricuspidStenotic = val;
                setState(() {
                });
              },checkboxValueRegurgitant: (val){
                controller.formKEchoAssignmentData.value.tricuspidRegurgitant = val;
                setState(() {
                });
              },MG: (val){
                controller.formKEchoAssignmentData.value.tricuspidGradientMean = int.tryParse(val);
                setState(() {
                });
              },PG: (val){
                controller.formKEchoAssignmentData.value.tricuspidGradientPeak = int.tryParse(val);
                setState(() {
                });
              },RegurgitantradioOnchange: (val){
                controller.formKEchoAssignmentData.value.tricuspidRegurgitantValue = val;
                setState(() {
                });
              },StenoticradioOnchange: (val){
                controller.formKEchoAssignmentData.value.tricuspidStenoticValue = val;
                setState(() {
                });
              },radioValue: (val){
                controller.formKEchoAssignmentData.value.tricuspidFunction = val;
                setState(() {
                });
              },),
            ValueFunction(key: Key('Pulmonary ${PulmonarySelectedList}'),enabled:isEnabled,title: 'Pulmonary',
              radioInitialValue: controller.formKEchoAssignmentData.value.pulmonaryFunction,
              MGInitialValue: controller.formKEchoAssignmentData.value.rvotObstructionGradientMean.toString(),
              PGInitialValue: controller.formKEchoAssignmentData.value.rvotObstructionGradientPeak.toString(),
              StenoticInitialValue: controller.formKEchoAssignmentData.value.pulmonaryStenoticValue
              ,regurgitantInitialValue: controller.formKEchoAssignmentData.value.pulmonaryRegurgitantValue
              ,selectedlist: PulmonarySelectedList,
              maininitialValue: controller.formKEchoAssignmentData.value.pulmonary,
              mainValue: (val){
                controller.formKEchoAssignmentData.value.pulmonary = val;
                setState(() {
                });
              },
              checkboxValue: (val){
                controller.formKEchoAssignmentData.value.pulmonaryStenotic = val;
                setState(() {
                });
              },checkboxValueRegurgitant: (val){
                controller.formKEchoAssignmentData.value.pulmonaryRegurgitant = val;
                setState(() {
                });
              },MG: (val){
                controller.formKEchoAssignmentData.value.rvotObstructionGradientMean = int.tryParse(val);
                setState(() {
                });
              },PG: (val){
                controller.formKEchoAssignmentData.value.rvotObstructionGradientPeak =int.tryParse(val) ;
                setState(() {
                });
              },RegurgitantradioOnchange: (val){
                controller.formKEchoAssignmentData.value.pulmonaryRegurgitantValue = val;
                setState(() {
                });
              },StenoticradioOnchange: (val){
                controller.formKEchoAssignmentData.value.pulmonaryStenoticValue = val;
                setState(() {
                });
              },radioValue: (val){
                controller.formKEchoAssignmentData.value.pulmonaryFunction = val;
                setState(() {
                });
              },),
          ],): Container(),
        controller.formK1Data.value.significantChanges  !='Yes' ? MDivider(): Container(),
          // MRowTextRadioWidget(title: 'G4. Any outcome identified in this visit:',onChanged: (val){},),
         // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH2);},)
          FormH2(enable: isEnabled,formK2Data: controller.formK2Data,),
           FormH3(enabled: isEnabled,formK3Data: controller.formK3Data,),
           FormH4(enabled: isEnabled,formK4Data: controller.formK4Data,),
           FormH5(enabled: isEnabled,formK5Data: controller.formK5Data,),
           FormH6(enabled: isEnabled,formK6Data: controller.formK6Data,),
        FormH7(key : ValueKey('Form K7 ${controller.otherImage}'),enabled: isEnabled,formK7Data: controller.formK7Data,otherImage: controller.otherImage,onChanged: () async {
          await otherImageController.uploadOtherImage(controller.patientId.value,controller.formId.value,'\'DeathSummary\'');
          controller.otherImage = otherImageController.otherImage;
        },),
          MFilledButton(key:ValueKey('value $isEnabled}'),text:isEnabled ? 'Save' : 'Edit',onPressed: () async {
            if(isEnabled){
              await controller.saveFormKData();
            }
            setState(() {
              isEnabled = !isEnabled;
            });
          },),
          Space(),
          MFilledButton(text: 'Save & Continue',onPressed: ()  {
            setState(() {
              isEnabled = !isEnabled;
            });
            context.push(Routes.FormL1);
          },),
          Space(),

        ],),
      ),
    );
  }
}
