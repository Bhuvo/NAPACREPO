import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Forms/CommonModelController/EchoAssignmentController.dart';
import 'package:npac/Forms/CommonModelController/EchoImage/EchoImageController.dart';
import 'package:npac/Forms/FormL/Controller/FormLController.dart';
import 'package:npac/Forms/FormL/FormL2.dart';
import 'package:npac/Forms/FormL/widget/ValueFunction.dart';
import 'package:npac/app/export.dart';
import 'package:npac/widgets/loading_widget.dart';

class FormL1 extends StatefulWidget {
  final int? patientId ;
  const FormL1({super.key, required this.patientId});

  @override
  State<FormL1> createState() => _FormL1State();
}

class _FormL1State extends State<FormL1> {
  RxBool isLoading = false.obs;
  bool isWallAbnormal = false;
  bool isRVAbnormal = false;
  bool isOthers = false;
  bool isEnabled = false;
  bool ecgAbnormal = false;
  bool isGlobal=false;
  bool isRegional = false;
  List<String> GRSelectedList = [];
  List<String> VHSelectedList = [];

  RxList<String> MitralSelectedList = <String>[].obs;
  RxList<String> AorticSelectedList = <String>[].obs;
  List<String> TricuspidSelectedList = <String>[].obs;
  List<String> PulmonarySelectedList = <String>[].obs;

  FormLController controller = Get.put(FormLController());
  EchoAssignmentController echoAssignmentController = Get.put(EchoAssignmentController());
  EchoImageController echoImageController = Get.put(EchoImageController());


  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData()async{
    isLoading.value = true;
    await controller.getPostpartumFirstData();
    await echoImageController.getEchoImage(widget.patientId ?? 0 ,12);
    await echoAssignmentController.getEcoAssignmentData(widget.patientId ?? 0,12);
    controller.FormLEchoAssignmentData.value = echoAssignmentController.EchoAssignmentData.value;
    await Future.delayed(Duration(seconds: 1));
    // controller.FormLEchoAssignmentData.value.mitralStenotic ?? false ? isMitralStenotic = true :null;
    // controller.FormLEchoAssignmentData.value.mitralRegurgitant ?? false ? isMitralRegurgitant = true :null;
    controller.FormLEchoAssignmentData.value.mitralStenotic ?? false ? MitralSelectedList.add('Stenotic') :null;
    controller.FormLEchoAssignmentData.value.mitralRegurgitant ?? false ? MitralSelectedList.add('Regurgitant') :null;
    controller.FormLEchoAssignmentData.value.aorticStenotic ?? false ? AorticSelectedList.add('Stenotic') :null;
    controller.FormLEchoAssignmentData.value.aorticRegurgitant ?? false  ? AorticSelectedList.add('Regurgitant') :null;
    controller.FormLEchoAssignmentData.value.tricuspidStenotic ?? false ? TricuspidSelectedList.add('Stenotic') :null;
    controller.FormLEchoAssignmentData.value.tricuspidRegurgitant ?? false ? TricuspidSelectedList.add('Regurgitant') :null;
    controller.FormLEchoAssignmentData.value.pulmonaryStenotic ?? false ? PulmonarySelectedList.add('Stenotic') :null;
    controller.FormLEchoAssignmentData.value.pulmonaryRegurgitant ?? false ? PulmonarySelectedList.add('Regurgitant') :null;
    print('AorticSelectedList ${AorticSelectedList}');
    isLoading.value = false;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) { 
    return MScaffold(
      appBar: MAppBar(title: 'L. FIRST POST PARTUM VISIT (6 WEEKS) (FORM L)',),
      body:Obx(()=>isLoading.value ? Center(child: LoadingWidget()) : MFormBody(Childrens: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('For all patients (Tick theapplicable)'),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isEnabled = !isEnabled;
                    });
                  },
                  icon: isEnabled ? Icon(Icons.save) : Icon(Icons.edit))
            ],
          ),
          MrowTextDatePickerWidget(enabled: isEnabled,title: 'Date of visit',initialDate: stringToDate(controller.formLData.value.dateOfVisit ?? ''),onChanged: (val){
            controller.formLData.value.dateOfVisit = dateToString(val);
          },),
          MRowTextRadioWidget(enabled: isEnabled,title: 'L1. NYHA SYMPTOMS CLASS:',initialValue: controller.formLData.value.nyhaSymptomsClass,onChanged: (val){
            controller.formLData.value.nyhaSymptomsClass = val;
          },options: List_items.NYHAClass,),
          MSmallText(text: 'L2. CLINICAL SIGNS & ECG',),
          Space(),
          MrowTextTextFieldWidget(enabled: isEnabled,title: 'L2.1 Weight (Kg):',initialValue: '${controller.formLData.value.clinicalSignWeight}',onChanged: (val){
            controller.formLData.value.clinicalSignWeight = int.tryParse(val);
          },type: MInputType.numeric,),
          MrowTextTextFieldWidget(enabled: isEnabled,title: 'L2.2 HR (/min): ',initialValue: '${controller.formLData.value.clinicalSignHR}',onChanged: (val){
            controller.formLData.value.clinicalSignHR = int.tryParse(val);
          },type: MInputType.numeric,),
          MrowTextTextFieldWidget(enabled: isEnabled,title: 'L2.3 SPO2 (%): ',initialValue: '${controller.formLData.value.clinicalSignSp}',onChanged: (val){
            controller.formLData.value.clinicalSignSp = int.tryParse(val);
          },type: MInputType.numeric,),
          MrowTextTextFieldWidget(enabled: isEnabled,title: 'L2.4 BP (mm Hg): ',initialValue: '${controller.formLData.value.clinicalSignBp}',onChanged: (val){
            controller.formLData.value.clinicalSignBp = int.tryParse(val);
          },type: MInputType.numeric,),
          MRowTextRadioWidget(enabled: isEnabled,title: 'L2.5 Heart failure: ',initialValue: controller.formLData.value.clinicalSignCcf,onChanged: (val){
            controller.formLData.value.clinicalSignCcf = val;
          },),
          MRowTextRadioWidget(enabled: isEnabled,title: 'L2.6 Cyanosis:  ',initialValue:  controller.formLData.value.clinicalSignCyanosis,onChanged: (val){
            controller.formLData.value.clinicalSignCyanosis = val;
          },),
          MRowTextRadioWidget(enabled: isEnabled,title: 'L2.7 Cardiac murmur:',initialValue: controller.formLData.value.clinicalSignCardiacMurmur,onChanged: (val){
            controller.formLData.value.clinicalSignCardiacMurmur = val;
          },),
          MrowTextDatePickerWidget(enabled: isEnabled,title: 'L2.8 ECG Date:',initialDate: stringToDate(controller.formLData.value.ecgDate ?? ''),onChanged: (val){
            controller.formLData.value.ecgDate = dateToString(val);
          },isneedDivider: false,),
          MRowTextRadioWidget(enabled: isEnabled,options:List_items.NormalAbnormal ,initialValue: controller.formLData.value.ecgNormalAbnormal,onChanged: (val){
            val == 'Abnormal' ? ecgAbnormal = true : ecgAbnormal =false;
            controller.formLData.value.ecgNormalAbnormal = val;
            setState(() {});
          },),
        controller.formLData.value.ecgNormalAbnormal == 'Abnormal' ? Column(children: [
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
            MFilledButton(text: 'Upload ECG',onPressed: (){
              // formFController.uploadEcho();
              echoImageController.uploadEchoImage(7964 ,12);
            },),
          ],): Container(),
          Space(),
          MDivider(),
          Space(),
          MSmallText(text: 'L3 ECHOCARDIOGRAPHIC ASSESSMENT',),
          Space(),
          MRowTextRadioWidget(title: 'Any significant change from previous echo',initialValue: controller.formLData.value.significantChanges ,isneedDivider: false,onChanged: (val){
             controller.formLData.value.significantChanges = val;
          },),
          controller.formLData.value.significantChanges =='Yes' ?Column(
            children: [
              MSmallText(text: 'Ventricular function ',),
         Space(),
         MRowTextRadioWidget(enabled: isEnabled,title: 'Wall Motion',initialValue: controller.FormLEchoAssignmentData.value.wallMotion, options: ['Normal','Hypokinesia','Akinesia'],isneedDivider: false,onChanged: (val){
           if(val != 'Normal'){
             setState(() {
               isWallAbnormal = true;
             });
           }else{
             setState(() {
               isWallAbnormal = false;
             });
           }
           controller.FormLEchoAssignmentData.value.wallMotion = val;
         },),
         isWallAbnormal?MRowTextCheckBox(enabled: isEnabled,selectedlist: GRSelectedList,list: ['Global','Regional'],result: (val){
           val.contains('Global') ? controller.FormLEchoAssignmentData.value.wallMotionHypoGlobal = true : controller.FormLEchoAssignmentData.value.wallMotionHypoGlobal = false;
           val.contains('Regional') ? controller.FormLEchoAssignmentData.value.wallMotionHypoRegional = true : controller.FormLEchoAssignmentData.value.wallMotionHypoRegional = false;
         },): Container(),
         MDivider(),
         MSmallText(text: 'LV systolic function',),
         Space(),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Diastole(mm): ',initialValue: '${controller.FormLEchoAssignmentData.value.lVIDDiastole}',onChanged: (val){
           controller.FormLEchoAssignmentData.value.lVIDDiastole = val;
         },type: MInputType.numeric,isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Systole(mm) ',initialValue: '${controller.FormLEchoAssignmentData.value.lVIDSystole}',onChanged: (val){
           controller.FormLEchoAssignmentData.value.lVIDSystole = val;
         },type: MInputType.numeric,isneedDivider: false),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'EF% : ',initialValue: '${controller.FormLEchoAssignmentData.value.lVEfPercent}',onChanged: (val){
           controller.FormLEchoAssignmentData.value.lVEfPercent = val;
         },type: MInputType.numeric,),
         MSmallText(text: 'Pulmonary pressures',),
         Space(),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'Tricuspid regurgitation TRPG (mmHg):',initialValue: '${controller.FormLEchoAssignmentData.value.trpg}',onChanged: (val){
           controller.FormLEchoAssignmentData.value.trpg = int.tryParse(val);
         },isneedDivider: false,type: MInputType.numeric,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'Pulmonary regurgitation Peak PR (mmHg):',initialValue: '${controller.FormLEchoAssignmentData.value.peakPr}',onChanged: (val){
           controller.FormLEchoAssignmentData.value.peakPr = int.tryParse(val);
         },isneedDivider: false,type: MInputType.numeric,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'PAT(ms)',initialValue: '${controller.FormLEchoAssignmentData.value.pat}',onChanged: (val){
           controller.FormLEchoAssignmentData.value.pat = int.tryParse(val);
         },type: MInputType.numeric,),
         MRowTextRadioWidget(enabled: isEnabled,title: 'RV systolic function ',initialValue: controller.FormLEchoAssignmentData.value.rvNormalAbnormal,onChanged: (val){
           controller.FormLEchoAssignmentData.value.rvNormalAbnormal = val;
           val == 'Abnormal' ? setState(() {
             isRVAbnormal = true;
           }):setState(() {
             isRVAbnormal = false;
           });
         },options: List_items.NormalAbnormal,isneedDivider: false,),

         isRVAbnormal? MTextField(enabled: isEnabled,label: 'TAPSE (mm)',initalValue: '${controller.FormLEchoAssignmentData.value.rvTapse}',onChanged: (val){
           controller.FormLEchoAssignmentData.value.rvTapse = val;
         },): Container(),
         isRVAbnormal? MTextField(enabled: isEnabled,label: 'RV S’ (cm/sec)',initalValue: '${controller.FormLEchoAssignmentData.value.rvRvs}',onChanged: (val){
           controller.FormLEchoAssignmentData.value.rvRvs = val;
         },): Container(),
         MDivider(),
         Space(),

         MText(text: 'Valve function',),
         Space(),
         // ValueFunction(enabled: isEnabled,title: 'Mitral',isMVOA: true,MVOA: (val){},radioValue: (val){
         //
         // },MG: (val){},PG: (val){},checkboxValue: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},),

              ValueFunction(
                key: Key('Mitral ${MitralSelectedList}'),
                enabled:isEnabled,
                title: 'Mitral',
                maininitialValue: controller.FormLEchoAssignmentData.value.mitral,
                isMVOA: true,
                radioInitialValue: controller.FormLEchoAssignmentData.value.mitralFunction
                ,MGInitialValue: '${controller.FormLEchoAssignmentData.value.mitralMVGradientMean}',
                PGInitialValue: '${controller.FormLEchoAssignmentData.value.mitralMVGradientPeak}',
                StenoticInitialValue: controller.FormLEchoAssignmentData.value.mitralStenoticValue
                ,regurgitantInitialValue: controller.FormLEchoAssignmentData.value.mitralRegurgitantValue
                ,selectedlist: MitralSelectedList,
                checkboxValue: (val){
                  controller.FormLEchoAssignmentData.value.mitralStenotic = val;
                  setState(() {
                  });
                },checkboxValueRegurgitant: (val){
                  controller.FormLEchoAssignmentData.value.mitralRegurgitant = val;
                  setState(() {
                  });
                },MG: (val){
                  controller.FormLEchoAssignmentData.value.mitralMVGradientMean = int.tryParse(val);
                  setState(() {
                  });
                },PG: (val){
                  controller.FormLEchoAssignmentData.value.mitralMVGradientPeak = int.tryParse(val);
                  setState(() {
                  });
                },mainValue: (val){
                  controller.FormLEchoAssignmentData.value.mitral = val;
                  setState(() {
                  });
              },StenoticradioOnchange: (val){
                controller.FormLEchoAssignmentData.value.mitralStenoticValue = val;
                setState(() {
                });
              },RegurgitantradioOnchange: (val){
                controller.FormLEchoAssignmentData.value.mitralRegurgitantValue = val;
                setState(() {
                });
              },radioValue: (val){
                controller.FormLEchoAssignmentData.value.mitralFunction = val;
                setState(() {
                });
              },MVOA: (val){
                controller.FormLEchoAssignmentData.value.mitralMVGradientMean = int.tryParse(val);
                setState(() {
                });
              },
              ) ,

              Obx(()=> ValueFunction(key: Key('Aortic ${AorticSelectedList}'),enabled:isEnabled,title: 'Aortic',radioInitialValue: controller.FormLEchoAssignmentData.value.aorticFunction
                  ,MGInitialValue: '${controller.FormLEchoAssignmentData.value.aorticStenosisGradientMean}',
                  PGInitialValue: '${controller.FormLEchoAssignmentData.value.aorticStenosisGradientPeak}',
                  StenoticInitialValue: controller.FormLEchoAssignmentData.value.aorticStenoticValue
                  ,regurgitantInitialValue: controller.FormLEchoAssignmentData.value.aorticRegurgitantValue
                  ,selectedlist: AorticSelectedList,
                  maininitialValue: controller.FormLEchoAssignmentData.value.aortic,
                  isMVOA: false,
                  mainValue: (val){
                    controller.FormLEchoAssignmentData.value.aortic = val;
                    setState(() {
                    });
                  },
                  checkboxValue: (val){
                    controller.FormLEchoAssignmentData.value.aorticStenotic = val;
                    print('Aortic ${AorticSelectedList}');
                    setState(() {
                    });
                  },checkboxValueRegurgitant: (val){
                    controller.FormLEchoAssignmentData.value.aorticRegurgitant = val;
                    setState(() {
                    });
                  },MG: (val){
                    controller.FormLEchoAssignmentData.value.aorticStenosisGradientMean = int.tryParse(val);
                    setState(() {
                    });
                  },PG: (val){
                    controller.FormLEchoAssignmentData.value.aorticStenosisGradientPeak = int.tryParse(val);
                    setState(() {
                    });
                  },RegurgitantradioOnchange: (val){
                    controller.FormLEchoAssignmentData.value.aorticRegurgitantValue = val;
                    setState(() {
                    });
                  },StenoticradioOnchange: (val){
                    controller.FormLEchoAssignmentData.value.aorticStenoticValue = val;
                    setState(() {
                    });
                  },radioValue: (val){
                    controller.FormLEchoAssignmentData.value.aorticFunction = val;
                    setState(() {
                    });
                  },),
              ),
              ValueFunction(key: Key('Tricuspid ${TricuspidSelectedList}'),enabled:isEnabled,title: 'Tricuspid',
                radioInitialValue: controller.FormLEchoAssignmentData.value.tricuspidFunction
                ,MGInitialValue: '${controller.FormLEchoAssignmentData.value.tricuspidGradientMean}',
                PGInitialValue: '${controller.FormLEchoAssignmentData.value.tricuspidGradientPeak}',
                StenoticInitialValue: controller.FormLEchoAssignmentData.value.tricuspidStenoticValue
                ,regurgitantInitialValue: controller.FormLEchoAssignmentData.value.tricuspidRegurgitantValue
                ,selectedlist: TricuspidSelectedList,
                maininitialValue: controller.FormLEchoAssignmentData.value.tricuspid,
                mainValue: (val){
                  controller.FormLEchoAssignmentData.value.tricuspid = val;
                  setState(() {
                  });
                },isMVOA:  false,
                checkboxValue: (val){
                  controller.FormLEchoAssignmentData.value.tricuspidStenotic = val;
                  setState(() {
                  });
                },checkboxValueRegurgitant: (val){
                  controller.FormLEchoAssignmentData.value.tricuspidRegurgitant = val;
                  setState(() {
                  });
                },MG: (val){
                  controller.FormLEchoAssignmentData.value.tricuspidGradientMean = int.tryParse(val);
                  setState(() {
                  });
                },PG: (val){
                  controller.FormLEchoAssignmentData.value.tricuspidGradientPeak = int.tryParse(val);
                  setState(() {
                  });
                },RegurgitantradioOnchange: (val){
                  controller.FormLEchoAssignmentData.value.tricuspidRegurgitantValue = val;
                  setState(() {
                  });
                },StenoticradioOnchange: (val){
                  controller.FormLEchoAssignmentData.value.tricuspidStenoticValue = val;
                  setState(() {
                  });
                },radioValue: (val){
                  controller.FormLEchoAssignmentData.value.tricuspidFunction = val;
                  setState(() {
                  });
                },),
              ValueFunction(key: Key('Pulmonary ${PulmonarySelectedList}'),enabled:isEnabled,title: 'Pulmonary',
                radioInitialValue: controller.FormLEchoAssignmentData.value.pulmonaryFunction,
                MGInitialValue: controller.FormLEchoAssignmentData.value.rvotObstructionGradientMean.toString(),
                PGInitialValue: controller.FormLEchoAssignmentData.value.rvotObstructionGradientPeak.toString(),
                StenoticInitialValue: controller.FormLEchoAssignmentData.value.pulmonaryStenoticValue
                ,regurgitantInitialValue: controller.FormLEchoAssignmentData.value.pulmonaryRegurgitantValue
                ,selectedlist: PulmonarySelectedList,
                maininitialValue: controller.FormLEchoAssignmentData.value.pulmonary,
                mainValue: (val){
                  controller.FormLEchoAssignmentData.value.pulmonary = val;
                  setState(() {
                  });
                },
                checkboxValue: (val){
                  controller.FormLEchoAssignmentData.value.pulmonaryStenotic = val;
                  setState(() {
                  });
                },checkboxValueRegurgitant: (val){
                  controller.FormLEchoAssignmentData.value.pulmonaryRegurgitant = val;
                  setState(() {
                  });
                },MG: (val){
                  controller.FormLEchoAssignmentData.value.rvotObstructionGradientMean = int.tryParse(val);
                  setState(() {
                  });
                },PG: (val){
                  controller.FormLEchoAssignmentData.value.rvotObstructionGradientPeak =int.tryParse(val) ;
                  setState(() {
                  });
                },RegurgitantradioOnchange: (val){
                  controller.FormLEchoAssignmentData.value.pulmonaryRegurgitantValue = val;
                  setState(() {
                  });
                },StenoticradioOnchange: (val){
                  controller.FormLEchoAssignmentData.value.pulmonaryStenoticValue = val;
                  setState(() {
                  });
                },radioValue: (val){
                  controller.FormLEchoAssignmentData.value.pulmonaryFunction = val;
                  setState(() {
                  });
                },),
              MRowTextRadioWidget(enabled: isEnabled,title: 'Pericardial effusion ',onChanged: (val){},options: ['Mild','Moderate','Massive','Tamponade','Others'],isneedDivider: false,),
         isOthers? MRowTextCheckBox(enabled: isEnabled,title: 'Others',selectedlist: VHSelectedList,result: (val){
           val.contains('Vegetation') ?controller.FormLEchoAssignmentData.value.othersVegetations = true:controller.FormLEchoAssignmentData.value.othersVegetations = false;
           val.contains('Thrombus') ?controller.FormLEchoAssignmentData.value.othersThrombus = true:controller.FormLEchoAssignmentData.value.othersThrombus = false;
           setState(() {});
         },list: ['Vegetation','Thrombus'],isneedDivider: false): Container(),
         MDivider(),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'Other salient echo details (if any):',onChanged: (val){},),
             ],) : Container(),
             //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormL2);},)
          FormL2(enabled: isEnabled,formLData:controller.formLData,),
          Space(20),
          isEnabled? MFilledButton(text: 'Submit',onPressed: () async{
            if(await controller.UploadPostpartumFirstData()){
              if(await echoAssignmentController.uploadEchoAssignment(widget.patientId ??0,12, controller.FormLEchoAssignmentData.value)){
                controller.FormLEchoAssignmentData.value = echoAssignmentController.EchoAssignmentData.value;
                setState(() {
                  isEnabled = !isEnabled;});
                context.showSnackBar('FormL data uploaded successfully');
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
          MFilledButton(text: 'Save & Continue',onPressed: () async{
            if(await controller.UploadPostpartumFirstData()){
            if(await echoAssignmentController.uploadEchoAssignment(widget.patientId ?? 0 ,12, controller.FormLEchoAssignmentData.value)){
            controller.FormLEchoAssignmentData.value = echoAssignmentController.EchoAssignmentData.value;
            setState(() {
            isEnabled = !isEnabled;});
            context.showSnackBar('FormL data uploaded successfully');
            context.push(Routes.FormM1);
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
