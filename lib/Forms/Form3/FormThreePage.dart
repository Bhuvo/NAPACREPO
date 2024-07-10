import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:npac/Forms/Form3/FormThree2Page.dart';
import 'package:npac/Forms/Form3/FormThree3Page.dart';
import 'package:npac/Forms/Form3/Model/Form3Model.dart';
import 'package:npac/Forms/Form3/Model/RegistrationPregnancyModel.dart';
import 'package:npac/Forms/Form3/controller/Form3Controller.dart';
import 'package:npac/Forms/FormN/widget/MN1body.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/Views/MothersList/MotherListModel.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MAppBar.dart';
import 'package:npac/common_widget/MFormBody.dart';
import 'package:npac/common_widget/MRowTextRadioWidget.dart';
import 'package:npac/common_widget/MTextField.dart';
import 'package:npac/common_widget/MrowTextDatePicker.dart';
import 'package:npac/common_widget/MrowTextTextfieldWidget.dart';
import 'package:npac/utils/navigator_utils.dart';
import 'package:npac/widgets/loading_widget.dart';
import 'package:npac/widgets/m_scaffold.dart';

class FormThreePage extends StatefulWidget {
  final bool? isFromPatientDetails;
  final MotherListModel? data;
  const FormThreePage({super.key, this.isFromPatientDetails=true, required this.data});

  @override
  State<FormThreePage> createState() => _FormThreePageState();
}

class _FormThreePageState extends State<FormThreePage> {
  final formKey = GlobalKey<FormState>();

  RxList<String> selectedlist = <String>[].obs;
  bool isYes = false;
  bool isPriorRisk = false;
  bool isOtherPriorCardiac = false;
  bool isCardiacSurgeries = false;
  bool isCardiacInterventions = false;
  bool isPregnant = false;
  List<String> cOneList = [
    'During present Pregnancy',
    'During past Pregnancy',
    'Not during pregnancy'
  ];
  List<String> cTwoOne = ['Class I', 'Class II', 'Class III', 'Class IV'];
  List<String> YesNoDetails = ['Yes', 'No', 'Details NA'];
  List<String> Arrhthymia = ['AF', 'AT', 'SVT(AVRT/AVNRT)', 'VT/ VF', 'Other'];
  List<String> OtheCardiacEvents = [
    'CVA/TIA',
    'PVT',
    'Other Thrombotic/ Embolic Manifestation',
    'Major Bleed ',
    'Minor Bleed',
    'Hemoptysis',
    'Cerebral Abscess',
    'CVT',
    'Others'
  ];
  List<String> currentEXNever = ['Current', 'EX', 'Never'];

  bool isEnabled = false;
  Rx<int> count =0.obs;
  bool isLoading = false;
  bool isOthercardiac = false;

  Rx<Form3Controller> controller =Form3Controller().obs;
  Rx<RegistrationModel> registrationModelData = RegistrationModel().obs;
  RxList<RegistrationPregnancyModel> registrationPregnancyModelData = <RegistrationPregnancyModel>[].obs;

  @override
  void initState() {
    getRegistrationData();
    super.initState();
  }

  void getRegistrationData()async {
   ( widget.isFromPatientDetails ?? false) ? {
     setState(() {
       isLoading = true;
     }),
     registrationModelData.value = await controller.value.getRegistrationData(context, int.parse(widget.data?.tNPHDRNOID ?? '')),
     registrationPregnancyModelData.value = await controller.value.getRegistrationPregnancydata(context, int.parse(widget.data?.tNPHDRNOID ?? '')),

   Future.delayed(Duration(seconds: 1)),
     registrationModelData.value.arrhthymiasAF ?? false ? selectedlist.add('AF'): null,
     registrationModelData.value.arrhthymiasAT ?? false ? selectedlist.add('AT'): null,
     registrationModelData.value.arrhthymiasSVT ?? false ? selectedlist.add('SVT(AVRT/AVNRT)'): null,
     registrationModelData.value.arrhthymiasVTVF ?? false ? selectedlist.add('VT/ VF'): null,
     registrationModelData.value.arrhthymiasOthers ?? false ? selectedlist.add('Other'): null,

     setState(() {
       isCardiacInterventions = registrationModelData.value.cardiacInterventions == 'Yes' ? true : false;
       isCardiacSurgeries = registrationModelData.value.cardiacSurgeriesDone == 'Yes' ? true : false;
       isOtherPriorCardiac = registrationModelData.value.otherPriorCardiac == 'Other' ? true : false;
       isPriorRisk = registrationModelData.value.riskFactors == 'Yes' ? true : false;
       isYes = registrationModelData.value.priorCardiacArrhythmia == 'Yes' ? true : false;
       isPregnant = registrationModelData.value.previousPregnancyFlag == 'Yes' ? true : false;
       isEnabled = false;
     })
   }: setState(() {
     isEnabled = true;
   });

   setState(() {
     isLoading = false;
   });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MScaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MAppBar(
            title: 'REGISTRATION DETAILS-REGISTRATION PAGE (FORM C)',
          )),
      body:isLoading ? Center(child: LoadingWidget(),) :
      Obx(()=>   MFormBody(
          Childrens: [
           (widget.isFromPatientDetails ?? false) ? Row(
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
            ) : Container(),
            MText(text: 'C.1 FIRST DIAGNOSIS OF HEART DISEASE',),
            // MrowTextDatePickerWidget(enabled: isEnabled,
            //   onChanged: (val) {},
            //   title:
            //       'C.1 FIRST DIAGNOSIS OF HEART DISEASE',
            //   initialDate: DateTime.now(),
            // ),
            MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.heartdiseaseDiagnosisTime,
              onChanged: (val) {
                registrationModelData.value.heartdiseaseDiagnosisTime = val;
              },
              title: 'C.1.1 Time of heart disease diagnosis with pregnancy:',
              options: cOneList,
            ),
            MSmallText(text: 'Age at Diagnosis of Heart Disease (HD',),
            MrowTextTextFieldWidget(enabled: isEnabled,initialValue: registrationModelData.value.chronologicalAgeAtDiagnosis ,
            title: 'C.1.2 Chronological age at diagnosis of HD (inyears):',
              type: MInputType.numeric,
              onChanged: (val) {
                registrationModelData.value.chronologicalAgeAtDiagnosis = val;
              },
            ),
            MrowTextTextFieldWidget(
              enabled: isEnabled,initialValue: registrationModelData.value.gestAgeAtDiagnosis,
            title:
                  'C.1.2 Gestational age at detection of HD (only if diagnosedduring current pregnancy): ',
              type: MInputType.numeric,
              onChanged: (val) {
                registrationModelData.value.gestAgeAtDiagnosis = val;
              },
            ),
            Space(),
            MSmallText(
              text:
                  'C.2 PRE-PREGNANCY CARDIAC / NON-CARDIAC DISEASE DETAILS (includes details before present pregnancy)',
            ),
            MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.nYHAClass,
            onChanged: (val) {
                registrationModelData.value.nYHAClass = val;
              },
              title: 'C2.1 Pre-Pregnancy NYHA Class: ',
              options: cTwoOne,
            ),
            MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.priorCardiacEvent,
            onChanged: (val) {
                registrationModelData.value.priorCardiacEvent = val;
              },
              title: 'C2.2 Prior Cardiac Event:  ',
            ),
            MRowTextRadioWidget(enabled: isEnabled,isneedDivider: false,initialValue: registrationModelData.value.heartFailure,
            onChanged: (val) {
                setState(() {
                  registrationModelData.value.heartFailure = val;
                });
              },
              title: 'C2.2.1 Heart Failure ',
              options: YesNoDetails,
            ),
            (registrationModelData.value.heartFailure ?? 'No') == 'Yes' ?  MRowTextRadioWidget( enabled: isEnabled,isneedDivider: false,initialValue: registrationModelData.value.heartFailureHospitalization,
            onChanged: (val) {
                  registrationModelData.value.heartFailureHospitalization = val;
                },
                title: 'Required Hospitalization: ') : Container(),
            MDivider(),
            MRowTextRadioWidget(enabled: isEnabled,isneedDivider: false,initialValue: registrationModelData.value.priorCardiacArrhythmia,
            onChanged: (val) {
                registrationModelData.value.priorCardiacArrhythmia = val;
                setState(() {
                  isYes = val == 'Yes' ? true : false;
                });
              },
              title: 'C2.2.2 Prior Cardiac Arrhythmia:',
              options: YesNoDetails,
            ),
            isYes
                ? MRowTextCheckBox(enabled: isEnabled,selectedlist: selectedlist,
                    result: (val) {
                      registrationModelData.value.arrhthymiasAF =
                          val.contains('AF');
                      registrationModelData.value.arrhthymiasAT =
                          val.contains('AT');
                      registrationModelData.value.arrhthymiasSVT =
                          val.contains('SVT(AVRT/AVNRT)');
                      registrationModelData.value.arrhthymiasVTVF =
                          val.contains('VT/ VF');
                      registrationModelData.value.arrhthymiasOthers =
                          val.contains('Other');
                    },
                    title: 'Details of Arrhthymia:',
                    list: Arrhthymia,
                  )
                : Container(),
            isYes
                ? MRowTextRadioWidget(isneedDivider: false ,enabled: isEnabled,initialValue: registrationModelData.value.priorCardiacArrhythmiaHospitalization,
                    onChanged: (val) {
                      registrationModelData
                          .value.priorCardiacArrhythmiaHospitalization = val;
                    },
                    title: 'Required Hospitalization: ')
                : Container(),
            MDivider(),
            MRowTextRadioWidget(enabled: isEnabled,title: 'C2.2.3 Other prior cardiac events /complicaƟons : ',onChanged: (val){
              val =='Yes' ? isOthercardiac= true : isOthercardiac = false;
              setState(() {});
            },isneedDivider: false,),
            isOthercardiac  ? MRowTextCheckBox(isneedDivider: false,enabled: isEnabled,
            result: (val) {
                setState(() {
                  val.contains('Others') ? isOtherPriorCardiac = true : isOtherPriorCardiac = false;
                  // isOtherPriorCardiac = (val == 'Others' )? true : false;
                });
                // registrationModelData.value.otherPriorCardiac = val;
              },
              list: OtheCardiacEvents,
            ): Container(),
            isOtherPriorCardiac ? MTextField(label: 'If other Specify',enabled: isEnabled,initalValue: registrationModelData.value.otherPriorCardiacOthersSpecify, onChanged: (val){
              registrationModelData.value.otherPriorCardiacOthersSpecify = val;
            },) : Container(),
            isOthercardiac ?MRowTextRadioWidget(title: 'Required Hospitalization',isneedDivider: false,enabled: isEnabled,initialValue: registrationModelData.value.otherPriorCardiacHospitalization,onChanged: (val){
              registrationModelData.value.otherPriorCardiacHospitalization = val;
            },): Container(),
            MDivider(),
            MRowTextRadioWidget(
                enabled: isEnabled,initialValue:
                registrationModelData.value.cardiacSurgeriesDone,
              onChanged: (val) {
                setState(() {
                  isCardiacSurgeries = val == 'Yes' ? true : false;
                });
                registrationModelData.value.cardiacSurgeriesDone = val;
              },
              title: 'C 2.3 Prior cardiac surgeries done',
            ),
            isCardiacSurgeries ? Column(children: [
              MRowTextRadioWidget(title: 'C 2.3.1 Was it a valve Replacement',enabled: isEnabled,initialValue: registrationModelData.value.surgeriesValveReplacement,onChanged: (val){
                registrationModelData.value.surgeriesValveReplacement = val;
              },isneedDivider: false,),
              MrowTextTextFieldWidget(title: 'C 2.3.1 Name of the Procedure:',enabled: isEnabled,initialValue: registrationModelData.value.surgeriesProcedureName,onChanged: (val){
                registrationModelData.value.surgeriesProcedureName = val;
              },isneedDivider: false,),
              MrowTextTextFieldWidget(title: 'C 2.3.2 Month and Year of the Procedure:',enabled: isEnabled,initialValue: registrationModelData.value.surgeriesProcedureMonthandYear,isneedDivider: false,onChanged: (val){
                registrationModelData.value.surgeriesProcedureMonthandYear = val;
              },)
            ],): Container(),

            MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.cardiacInterventions,
            onChanged: (val) {
                setState(() {
                  isCardiacInterventions = val == 'Yes' ? true : false;
                });
                registrationModelData.value.cardiacInterventions = val;
              },
              title: 'C2.4 Prior cardiac procedures(interventions/surgery) done',
            ),
            isCardiacInterventions? Column(children: [
             MrowTextTextFieldWidget(
               title: 'C2.4.1 Name of the Procedure:',
               initialValue: registrationModelData.value.interventionsProcedureName,
               onChanged: (val) {
                 registrationModelData.value.interventionsProcedureName = val;
               },
             ),
              MrowTextTextFieldWidget(
               onChanged: (val) {
                 registrationModelData.value.interventionsProcedureMonthandYear = val;
               },
               title: 'C2.4.2 Month and Year of the Procedure',
               initialValue: registrationModelData.value.interventionsProcedureMonthandYear,
             ),
             MRowTextRadioWidget(title: 'C 2.4.3 Was the procedure antenatal:',initialValue: registrationModelData.value.interventionsProcedureAntenatal,onChanged: (val){
               registrationModelData.value.interventionsProcedureAntenatal = val;
             },),
           ],) : Container(),
            MRowTextRadioWidget(
                enabled: isEnabled,initialValue: registrationModelData.value.priorAnticoagulantUse,
            onChanged: (val) {
              registrationModelData.update((model) {
                model?.priorAnticoagulantUse = val;
              });
              val =='Yes' ? context.showSnackBar('Please Fill Drug Form N'): null;
               // registrationModelData.value.priorAnticoagulantUse= val;
              },
              title: 'C2.5 Prior Anticoagulant use: ',
              options: YesNoDetails,
            ),
            MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.priorCardiacDrugsUse,
            onChanged: (val) {
              registrationModelData.update((model) {
                model?.priorCardiacDrugsUse = val;
              });
              val =='Yes' ? context.showSnackBar('Please Fill Drug Form N'): null;
              // registrationModelData.value.priorCardiacDrugsUse = val;
              },
              title: 'C2.6 Prior Cardiac drugs use (other than OAC): ',
              options: YesNoDetails,
            ),
            MRowTextRadioWidget(enabled: isEnabled,initialValue:  registrationModelData.value.priorNonCardiacMedications,
            onChanged: (val) {
              registrationModelData.update((model) {
                model?.priorNonCardiacMedications = val;
              });
              val =='Yes' ? context.showSnackBar('Please Fill Drug Form N'): null;
              //registrationModelData.value.priorNonCardiacMedications = val;
              },
              title: 'C2.7 Prior non-cardiac medications: ',
              options: YesNoDetails,
            ),
            Obx(
                  ()=> registrationModelData.value.priorNonCardiacMedications=='Yes'||registrationModelData.value.priorAnticoagulantUse=='Yes' ||registrationModelData.value.priorCardiacDrugsUse=='Yes' ?
              MN1Body(isEnable: isEnabled,title: 'Drugs PRE-PREGNANCY',options: List_items.Drugs,drugMap: (e){
                print('Value from map $e');
              },): Container(),
            ),
            MRowTextRadioWidget(
                enabled: isEnabled,initialValue: registrationModelData.value.riskFactors ?? 'No',
            onChanged: (val) {
                if (val == 'Yes') {
                  setState(() {
                    isPriorRisk = true;
                  });
                } else {
                  setState(() {
                    isPriorRisk = false;
                  });
                }
                registrationModelData.value.riskFactors = val;
              },
              title: 'C2.8 Prior risk factors: ',
            ),
            isPriorRisk
                ? Column(
                    children: [
                      MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.diabetes ?? 'No',
                    onChanged: (val) {
                          registrationModelData.value.diabetes = val;
                        },
                        title: 'C2.8.1 Diabetes: ',
                      ),
                      MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.hTN ?? 'No',
                          onChanged: (val) {
                            registrationModelData.value.hTN = val;
                          }, title: 'C2.8.2 HTN '),
                      MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.psychIllness ?? 'No',
                          onChanged: (val) {
                            registrationModelData.value.psychIllness = val;
                          }, title: 'C2.8.3 Psych illness '),
                      MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.alcohol ?? 'No',
                          onChanged: (val) {
                            registrationModelData.value.alcohol = val;
                          }, title: 'C2.8.4 Alcoho '),
                      MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.smoking ?? 'No',
                        onChanged: (val) {
                          registrationModelData.value.smoking = val;
                        },
                        title: 'C2.8.5 Smoking',
                        options: currentEXNever,
                      ),
                      MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.anemia ?? 'No',
                          onChanged: (val) {
                            registrationModelData.value.anemia = val;
                          }, title: 'C2.8.6 Anemia'),
                      MRowTextRadioWidget( enabled: isEnabled,initialValue: registrationModelData.value.chewingTobacco ?? 'No',
                          onChanged: (val) {
                            registrationModelData.value.chewingTobacco = val;
                          }, title: 'C2.8.7 Chewing Tobacco'),
                      MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.hypothyroid ?? 'No',
                          onChanged: (val) {
                            registrationModelData.value.hypothyroid = val;
                          }, title: 'C2.8.8 Hypothyroid'),
                      MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.hyperthyroid ?? 'No',
                          onChanged: (val) {
                            registrationModelData.value.hyperthyroid = val;
                          }, title: 'C2.8.9 Hyperthyroid'),
                      MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.epilepsy ?? 'No',
                          onChanged: (val) {
                            registrationModelData.value.epilepsy = val;
                          }, title: 'C2.8.10 Epilepsy'),
                      MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.hIV ?? 'No',
                          onChanged: (val) {
                            registrationModelData.value.hIV = val;
                          }, title: 'C2.8.11 HIV'),
                      MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.autoimmune ?? 'No',
                          onChanged: (val) {
                            registrationModelData.value.autoimmune = val;
                          }, title: 'C2.8.12 Autoimmune'),
                      MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.riskFactorsOthersSpecify ?? 'No',
                          onChanged: (val) {
                            registrationModelData.value.riskFactorsOthers = val;
                            setState(() {

                            });
                          },isneedDivider: false, title: 'C2.8.13 Others'),
                      registrationModelData.value.riskFactorsOthers == 'Yes'? MTextField(enabled: isEnabled,label: 'Others Specify',initalValue: registrationModelData.value.riskFactorsOthersSpecify,onChanged: (val){
                        registrationModelData.value.riskFactorsOthersSpecify = val;
                      },): Container(),
                      MDivider(),
                      // MrowTextTextFieldWidget(enabled: isEnabled,initialValue: registrationModelData.value.riskFactorsOthersSpecify,
                      //   title: 'Others',
                      //   onChanged: (val) {
                      //     registrationModelData.value.riskFactorsOthersSpecify = val;
                      //   },
                      // ),
                    ],
                  )
                : Container(),
            MText(text: 'C3 PREVIOUS PREGNANCY DETAILS',),
            Space(),
            MRowTextRadioWidget(enabled: isEnabled,initialValue: registrationModelData.value.previousPregnancyFlag ?? 'No',title: 'Did patient have any previous pregnancy:',onChanged: (val){
              registrationModelData.value.previousPregnancyFlag = val;
              if(val == 'Yes'){
                registrationPregnancyModelData.add(RegistrationPregnancyModel());
                setState(() {
                  count.value = 1;
                  isPregnant = true;
                });
              }else{
                registrationPregnancyModelData.clear();
                setState(() {
                  count.value = 0;
                  isPregnant = false;
                });
              }
            },),
            //FilledButton(onPressed: (){context.push(Routes.Form3Two);}, child: Text('Next'))
            isPregnant? Obx(()=>Form(
              key: formKey,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: registrationPregnancyModelData.length >=1 ? registrationPregnancyModelData.length : 0,
                  itemBuilder: (context, index) {
                    // index = count.value;
                    //  count.value = index + 1;
                    registrationPregnancyModelData[index].prevPregDetailsId =registrationPregnancyModelData[index].prevPregDetailsId ?? 0;
                    registrationPregnancyModelData[index].previousPregNo =index;

                    return  Obx(
                      ()=> Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            IconButton(onPressed: () async {
                              await controller.value.deletePregnancy(context, registrationPregnancyModelData[index].prevPregDetailsId ?? 0);
                              registrationPregnancyModelData.removeAt(index);
                            }, icon: Icon(Icons.delete)),
                            ],
                          ),
                         // Space(),
                          FormThree2Page( isEnabled: isEnabled,Modeldata: registrationPregnancyModelData[index],index: index+1),
                          registrationPregnancyModelData.length -1 == index ? MFilledButton(text: 'Add Pregnancy',onPressed: (){
                            if(formKey.currentState!.validate()){
                              registrationPregnancyModelData.add(RegistrationPregnancyModel());
                            }
                           // print(jsonEncode(registrationPregnancyModelData));
                            //controller.registerPregnancyForm(context,registrationPregnancyModelData,int.parse(widget.data?.tNPHDRNOID ?? '0'));
                            // registrationPregnancyModelData.add(RegistrationPregnancyModel());
                          },): Container(),
                        ],
                      ),
                    );
                  },
                ),
            ),
            ):Container(),

            MRowTextRadioWidget(enabled: isEnabled , title: 'Medications advised?',onChanged: (val){}, ),
            Space(),
            (widget.isFromPatientDetails ?? false )? MFilledButton(text:isEnabled ? 'Save': 'Edit',onPressed: () async {
              if(isEnabled)  {
                controller.value.registerForm(context,registrationModelData.value,registrationPregnancyModelData,int.parse(widget.data?.tNPHDRNOID ?? ''));
                setState(() {
                  isEnabled = !isEnabled;
                });
              }else{

               setState(() {
                isEnabled = !isEnabled;
              });
              }
             // print(registrationModelData.value.toJson());
            },):  MFilledButton(text: 'Submit',onPressed: (){
              controller.value.registerForm(context,RegistrationModel(),[],int.parse(widget.data?.tNPHDRNOID ?? ''));
              //print(formEData.value.toJson());
            }),
          // MFilledButton(onPressed: (){ controller.registerForm(context,RegistrationModel());},text: 'Submit',)
           // FormThree2Page(),
           // FormThree3page()
          ],
        ),
      ),
    ));
  }
}
