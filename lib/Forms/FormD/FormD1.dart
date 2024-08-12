
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Forms/CommonModelController/EchoImage/EchoImageController.dart';
import 'package:npac/Forms/FormD/Controller/FormDController.dart';
import 'package:npac/Forms/FormD/FormD2.dart';
import 'package:npac/Forms/FormD/FormD3.dart';
import 'package:npac/Forms/FormD/FormD4.dart';
import 'package:npac/Forms/FormD/FormD5.dart';
import 'package:npac/Forms/FormD/FormD6.dart';
import 'package:npac/Forms/FormD/FormD7.dart';
import 'package:npac/Forms/FormD/FormD8.dart';
import 'package:npac/Forms/FormD/FormD9.dart';
import 'package:npac/Forms/FormE/FormE1.dart';
import 'package:npac/Forms/FormF/FormF1.dart';
import 'package:npac/Forms/FormI/FormI1.dart';
import 'package:npac/Forms/FormI/FormI2.dart';
import 'package:npac/Forms/FormJ/FormEcontroller.dart';
import 'package:npac/Forms/FormJ/FormJ1.dart';
import 'package:npac/Forms/FormL/FormL1.dart';
import 'package:npac/Forms/FormL/FormL2.dart';
import 'package:npac/Forms/Formk/FormK1.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextDropDown.dart';
import 'package:npac/common_widget/MRowTextRadioWidget.dart';
import 'package:npac/common_widget/MrowTextTextfieldWidget.dart';
import 'package:npac/utils/navigator_utils.dart';
import 'package:npac/widgets/loading_widget.dart';

class FormD1 extends StatefulWidget {
  final String? patientId;
  const FormD1({super.key, this.patientId});

  @override
  State<FormD1> createState() => _FormD1State();
}

class _FormD1State extends State<FormD1> {
  bool isEnabled = false;
  bool AntenatalCheck =false;
  bool isinterventions = false;
  bool AbnormalEcg = false;


  bool isPrimaryDiagnosisCongenital = false;
  bool isPrimaryDiagnosisAortopathies = false;
  bool isPrimaryDiagnosisCardiomyopathy = false;
  bool isPrimaryDiagnosisVenous = false;

  bool isMitralProsthetic = false;
  bool isAorticProsthetic = false;
  bool isTricuspidProsthetic = false;
  bool isPulmonaryProsthetic = false;
  bool isAortaAbnormal = false;

  bool isAnEcoagulant = false;
  bool isAssessment = false;
  bool isFirstAnVisit = false;

  bool isEcho = false;
  DateTime Lmp = DateTime.now();
  DateTime addMonthsAndDays(DateTime inputDate) {
    DateTime result = DateTime(
      inputDate.year,
      inputDate.month + 9,
      inputDate.day,
    );
    result = result.add(Duration(days: 7));

    return result;
  }
  FormDController  controller = Get.put(FormDController());
  FormEcontroller formEcontroller = Get.put(FormEcontroller());
  EchoImageController echoImageController = Get.put(EchoImageController());


  @override
  void initState() {
    getData();
    super.initState();
  }
  void getData()async{
    controller.isDataLoading.value = true;
    await controller.getFormD1Data(widget.patientId?? '7965',context);
    await controller.getFormD2Data(widget.patientId?? '7965',context);
    await controller.getFormD3Data(widget.patientId?? '7965',context);
    await controller.getFormD4Data(widget.patientId?? '7965',context);
    await controller.getFormDR4Data(widget.patientId?? '7965',context);
    await controller.getFormD5Data(widget.patientId?? '7965',context);
    await controller.getFormD6Data(widget.patientId?? '7965',context);
    await controller.getFormD7Data(widget.patientId?? '7965',context);
    await controller.getFormD9Data(widget.patientId?? '7965',context);
    await formEcontroller.getFormEData(widget.patientId?? '7965',context);
    controller.isDataLoading.value = false;
    setState(() {});

   print('date is ${ controller.formD1Model.value.whenFirstANVisitDone}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MScaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MAppBar(title: 'D. Current Pregnancy (FORM D)',)),

      body:   Obx(()=>controller.isDataLoading.value ? Center(child: LoadingWidget()): MFormBody(Childrens: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('For all patients (Tick theapplicable)'),
              IconButton(
                  onPressed: () async {
                    // await controller.saveFormD1Data(widget.patientId?? '7965',context);
                    // setState(() {});
                    setState(() {
                      isEnabled = !isEnabled;
                    });
                  },
                  icon: isEnabled ? Icon(Icons.save) : Icon(Icons.edit))
            ],
          ),
          // FormD4(isEnabled:isEnabled , formDR4Model: controller.formDR4Model,),
          // FormD9(isEnabled: isEnabled, formD9Model: controller.formD9Model,),
          Space(),
          Text('PRESENT PREGNANCY DETAILS', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          Space(),
          Text('D1 ANTENATAL DETAILS', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
          Space(),
          const Divider(thickness: 1,height: 3,),
          MRowTextDropDown(enabled: isEnabled,title: 'D1.1 Gestational age at  Enrolment(Weeks)',initialValue:controller.formD1Model.value.gestationalAgeAtEnrollment.toString(),onChanged: (val){
            controller.formD1Model.value.gestationalAgeAtEnrollment = int.tryParse(val);
          },),
          MrowTextDatePickerWidget(enabled: isEnabled,title: ' D1.2 Date:',initialDate: stringToDate(controller.formD1Model.value.firstVisitDate ?? ''),onChanged: (val){
            controller.formD1Model.value.firstVisitDate = dateToString(val);
          },),
          MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
            controller.formD1Model.value.conception = val;
          },initialValue: controller.formD1Model.value.conception,title: 'D1.3 Conception:',options: List_items.conception,),
          MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
            controller.formD1Model.value.priorCardiacEvent = val;
          },initialValue: controller.formD1Model.value.priorCardiacEvent,title: 'D1.4 Preconception counselling: '),
          Column(
            children: [
              Row(
                children: [
                  Text('D1.5 Obstetric score :'),
                ],
              ),
              MrowTextTextFieldWidget(enabled: isEnabled, initialValue: controller.formD1Model.value.obstetricScoreG.toString(),onChanged: (val){
                controller.formD1Model.value.obstetricScoreG = int.tryParse(val);
              },title: 'G :',isneedDivider: false,type: MInputType.decimal,),
              MrowTextTextFieldWidget(enabled: isEnabled,initialValue: controller.formD1Model.value.obstetricScoreP.toString(),onChanged: (val){
                controller.formD1Model.value.obstetricScoreP = int.tryParse(val);
              },title: 'P :',isneedDivider: false,type: MInputType.decimal,),
              MrowTextTextFieldWidget(enabled: isEnabled,initialValue: controller.formD1Model.value.obstetricScoreL.toString(),onChanged: (val){
                controller.formD1Model.value.obstetricScoreL = int.tryParse(val);
              },title: 'L :',isneedDivider: false,type: MInputType.decimal,),
              MrowTextTextFieldWidget(enabled: isEnabled, initialValue: controller.formD1Model.value.obstetricScoreA.toString(),onChanged: (val){
                controller.formD1Model.value.obstetricScoreA = int.tryParse(val);
              },title: 'A :',isneedDivider: false,type: MInputType.decimal,),
              MDivider()
            ],
          ),
          MRowTextRadioWidget(enabled: isEnabled,initialValue: controller.formD1Model.value.pregnancyType,onChanged: (val){
            controller.formD1Model.value.pregnancyType = val;
          },title: 'D1.6 Pregnancy type:',options: ['Singleton','Twin','Others'],),
          MrowTextDatePickerWidget(enabled: isEnabled,onChanged: (val){
            setState(() {
              controller.formD1Model.value.lMP = dateToString(val);
            });
            // setState(() {
            //   Lmp = val;
            // });
          },title: 'D1.7 LMP:',initialDate: stringToDate(controller.formD1Model.value.lMP ?? ''),),
          MrowTextDatePickerWidget( key: ValueKey('${controller.formD1Model.value.lMP}'),enabled: isEnabled,onChanged: (val){
            controller.formD1Model.value.eDD = dateToString(val);
          },title: 'D1.8 EDD:',initialDate: addMonthsAndDays(stringToDate(controller.formD1Model.value.lMP ?? '')?? DateTime.now()),),
         // MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
         //   setState(() {
         //     AntenatalCheck = val == 'Yes' ? true : false;
         //   });
         // },title: 'D1.9 Antenatal Check up:',isneedDivider: false,),
         // if(AntenatalCheck) Column(children: [
          MSmallText(text: 'D1.9 Antenatal check-ups',),
           // MrowTextDatePickerWidget(enabled: isEnabled,onChanged: (val){
           //   controller.formD1Model.value.whenFirstANVisitDone = dateToString(val);
           // },title: 'D1.9.1 When was the first AN visit done ',initialDate: stringToDate(controller.formD1Model.value.whenFirstANVisitDone ?? ''),isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:isEnabled,title: 'D1.9.1 When was the first AN visit done',initialValue:  controller.formD1Model.value.whenFirstANVisitDone,onChanged: (val){
            controller.formD1Model.value.whenFirstANVisitDone = val;
          },isneedDivider: false,),
           MRowTextRadioWidget(enabled: isEnabled,initialValue: controller.formD1Model.value.whereFirstANVisitDone,onChanged: (val){
              controller.formD1Model.value.whereFirstANVisitDone = val;
             setState(() {
               isFirstAnVisit =true;
             });
           },title: 'D1.9.2 Where was the first AN visit done:', options:['Primary Health care','Secondary care centre','Tertiary Care Centre'],isneedDivider: false),
            isFirstAnVisit  ? MRowTextRadioWidget(title: 'Affiliated to:',isneedDivider: false,options: ['Government','Private'],) : Container(),
           MrowTextTextFieldWidget(enabled: isEnabled,initialValue: controller.formD1Model.value.whenFirstVisitWithCardiacSupport,onChanged: (val){
             controller.formD1Model.value.whenFirstVisitWithCardiacSupport = val;
           },title: 'D1.9.3 when was the first visit to a centre with cardiac care done(weeks): ',isneedDivider: false,),
         // ],),
          MDivider(),
          MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
             controller.formD1Model.value.againstMedicalAdvice = val;
          },initialValue: controller.formD1Model.value.againstMedicalAdvice,title: 'D1.10 Current pregnancy continued Against Medical Advice:  ',),
          MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
            if(val == 'Yes'){
              setState(() {
                isinterventions = true;
              });
            }else{
              setState(() {
                isinterventions = false;
              });
            }
             controller.formD1Model.value.anyAntenatalInterventionsDone = val;
          },isneedDivider: isinterventions ? false : true ,initialValue: controller.formD1Model.value.anyAntenatalInterventionsDone,title: 'D1.11  Any antenatal interventions done during current pregnancy (If yes, kindly specify):',),
          isinterventions ? MTextField(enabled: isEnabled,initalValue: controller.formD1Model.value.anyAntenatalInterventionsSpecify,onChanged: (val){
            controller.formD1Model.value.anyAntenatalInterventionsSpecify = val;
          },label:'(If yes, kindly specify)' ,) : Container(),
        MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
          controller.formD1Model.value.nYHAClass = val;
        },initialValue: controller.formD1Model.value.nYHAClass,title: 'D2 NYHA SYMPTOMS CLASS: ',options: List_items.NYHAClass,),
          Row(
            children: [
              Text('D3 CLINICAL SIGNS'),
            ],
          ),
          Space(),
          MrowTextTextFieldWidget(enabled: isEnabled,initialValue: controller.formD2Model.value.height.toString(),onChanged: (val){
            controller.formD2Model.value.height = double.parse(val);
          },title: 'D3.1 Height (cm):',isneedDivider: false,type: MInputType.decimal,),
          MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){
            controller.formD2Model.value.weight = double.parse(val);
          },initialValue: controller.formD2Model.value.weight.toString(),title: 'D3.2 Weight (kg):',isneedDivider: false,type: MInputType.decimal,),
          MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){
            controller.formD2Model.value.sPO2 = int.tryParse(val);
          },initialValue: controller.formD2Model.value.sPO2.toString(),title: 'D3.3 SPO2 (%):',isneedDivider: false,type: MInputType.numeric,),
          MrowTextTextFieldWidget(enabled: isEnabled,initialValue: controller.formD2Model.value.heartRate.toString(),onChanged: (val){
            controller.formD2Model.value.heartRate = int.tryParse(val);
          },title: 'D3.4 HR (/min):',isneedDivider: false,type: MInputType.decimal,),
          MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){
            controller.formD2Model.value.bloodPressure = int.tryParse(val);
          },initialValue: controller.formD2Model.value.bloodPressure.toString(),title: 'D3.5 BP (mm Hg):',isneedDivider: false,type: MInputType.decimal,),
          MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
            controller.formD2Model.value.heartFailure = val;
          },initialValue: controller.formD2Model.value.heartFailure,title: 'D3.6 Heart Failure: ',isneedDivider: false,),
          MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
            controller.formD2Model.value.cyanosis = val;
          },initialValue: controller.formD2Model.value.cyanosis,title: 'D3.7 Cyanosis: ',isneedDivider: false,),
          MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
            controller.formD2Model.value.cardiacMurmur = val;
          },initialValue: controller.formD2Model.value.cardiacMurmur,title: 'D3.8 Cardiac murmur:',isneedDivider: false,),
          MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
            controller.formD2Model.value.abdomenExamination = val;
          },initialValue: controller.formD2Model.value.abdomenExamination,title: 'D3.9 Fetal assessment (per abdomen exam): ', options: List_items.assessment,isneedDivider: false,),
          const Divider(thickness: 1,height: 3,),
        Row(
          children: [
            Text('D4 BASELINE INVESTIGATIONS:'),
          ],
        ),
          Space(),
          MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
            controller.formD2Model.value.gTT = val;
          },initialValue: controller.formD2Model.value.gTT,title: 'D4.1 GTT ', options: List_items.GTT,isneedDivider: false,),
          MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){
            controller.formD2Model.value.bloodUrea = double.parse(val);
          },initialValue: controller.formD2Model.value.bloodUrea.toString(),title: 'D4.2 Blood Urea (mg/dl):',isneedDivider: false,type: MInputType.decimal,),
          MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){
            controller.formD2Model.value.srCreatinine = double.parse(val);
          },initialValue: controller.formD2Model.value.srCreatinine.toString(),title: 'D4.3 Sr. Creatinine (mg/dl):',isneedDivider: false,type: MInputType.decimal,),
          MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){
            controller.formD2Model.value.tSH = int.tryParse(val);
          },initialValue: controller.formD2Model.value.tSH.toString(),title: 'D4.4 TSH (IU/mL):',isneedDivider: false,type: MInputType.decimal,),
          MrowTextTextFieldWidget( enabled: isEnabled,onChanged: (val){
            controller.formD2Model.value.hb = int.tryParse(val);
          },initialValue: controller.formD2Model.value.hb.toString(),title: 'D4.5 Hb(g/dl) ',isneedDivider: false,type: MInputType.decimal,),
          MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){
            controller.formD2Model.value.hCT = int.tryParse(val);
          },initialValue: controller.formD2Model.value.hCT.toString(),title: 'D4.6 Hct/PCV:',isneedDivider: false,type: MInputType.decimal,),
          MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){
            controller.formD2Model.value.bNP = int.tryParse(val);
          },initialValue: controller.formD2Model.value.bNP.toString(),title: 'D4.7 BNP (pg/ml):',maxLength: 3,isneedDivider: false,type: MInputType.decimal,),
          MrowTextTextFieldWidget( enabled: isEnabled,onChanged: (val){
            controller.formD2Model.value.nTProBNP = int.tryParse(val);
          },initialValue: controller.formD2Model.value.nTProBNP.toString(),title: 'D4.8 NT-pro BNP (pg/ml)',maxLength: 3,isneedDivider: false,type: MInputType.decimal,),
          MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){
            controller.formD2Model.value.ifAnyOthersInvestigations = val;
          },initialValue: controller.formD2Model.value.ifAnyOthersInvestigations,title: 'D4.9 Other relevant investigations (if any)',isneedDivider: false,type: MInputType.decimal,),
         const Divider(thickness: 1,height: 3,),
          MrowTextDatePickerWidget(enabled: isEnabled,onChanged: (val){
            controller.formD2Model.value.eCGDate = dateToString(val);
          },initialDate: stringToDate(controller.formD2Model.value.eCGDate ?? ''),title: 'D4.10 ECG Date:',isneedDivider: false,),
          MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
            controller.formD2Model.value.eCGValue = val;
            setState(() {
              AbnormalEcg = val == 'Abnormal' ? true : false;
            });
          },initialValue: controller.formD2Model.value.eCGValue,title: 'ECG status', options: ['Normal','Abnormal'],isneedDivider: false,),
          controller.formD2Model.value.eCGValue == 'Abnormal' ? Column(children: [
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: controller.EchoImage.map((element) => Builder(
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
              echoImageController.uploadEchoImage(7964 ,4);
            },),
          ],): Container(),
             Space(),
             MDivider(),
             Space(),
             // Container(width:  double.infinity, child: FilledButton(onPressed: (){context.push(Routes.FormD2);}, child: Text('Next')))
          FormD2(enabled: isEnabled,formD3Model: controller.formD3Model,isPrimaryDiagnosisAortopathies: (val){
            setState(() {
              isPrimaryDiagnosisAortopathies = val;
            });
          },isPrimaryDiagnosisCardiomyopathy: (val){
            setState(() {
              isPrimaryDiagnosisCardiomyopathy = val;
            });
          },isPrimaryDiagnosisCongenital: (val){
            setState(() {
              isPrimaryDiagnosisCongenital = val;
            });
          }, isPrimaryDiagnosisVenous: (val){
            setState(() {
              isPrimaryDiagnosisVenous = val;
            });
          },),
           FormD3(enabled: isEnabled,formD4Model: controller.formD4Model,isAortaAbnormal: (val){
             setState(() {
               isAortaAbnormal = val;
             });
           },isAorticProsthetic: (val){
             setState(() {
               isAorticProsthetic = val;
             });
           },isMitralProsthetic: (val){
             setState(() {
               isMitralProsthetic = val;
             });
           },isPulmonaryProsthetic: (val){
             setState(() {
               isPulmonaryProsthetic = val;
             });
           },isTricuspidProsthetic: (val){
             setState(() {
               isTricuspidProsthetic = val;
             });
           },),
          // FormD4(),
          // FormD5(),
          // FormD6(),
          // FormD7(),
          // FormD8(),
          // FormD9(),
          Space(),
          isMitralProsthetic || isAorticProsthetic || isTricuspidProsthetic || isPulmonaryProsthetic ?Column(
            children: [
              FormD4(isEnabled: isEnabled, formDR4Model: controller.formDR4Model,),
              FormI1(isEnabled: isEnabled,isAnEcoagulant: (val){
                setState(() {
                  isAnEcoagulant= val;
                });
              },isAssessment: (val){
                setState(() {
                  isAssessment = val;
                });
              },),
            ],
          ) : Container(),
          isPrimaryDiagnosisCongenital? Column(
            children: [
              FormD5(isEnabled: isEnabled,formD5Model: controller.formD5Model,),
              FormJ1(enabled: isEnabled,formEModel: formEcontroller.formEModel,),
            ],
          ) : Container(),
          isPrimaryDiagnosisAortopathies|| isAortaAbnormal ? FormD6(isEnabled:isEnabled ,formD6Model: controller.formD6Model,): Container(),
          isPrimaryDiagnosisAortopathies? FormK1(isEnabled: isEnabled,isEcho: (val){
            setState(() {
              isEcho = val;
            });
          },) : Container(),
          isPrimaryDiagnosisCardiomyopathy ||isEcho? FormD7(isEnabled: isEnabled,formD7Model: controller.formD7Model,) : Container(),
          isPrimaryDiagnosisVenous ||isAnEcoagulant? FormI2(isEnabled:isEnabled,) : Container(),
          // FormD8(isEnabled: isEnabled,),
          FormD9(isEnabled: isEnabled,formD9Model: controller.formD9Model,),
          MFilledButton(key :ValueKey('Value ${controller.isDataSaved.value}'),text: 'Submit',isLoading: controller.isDataSaved.value,onPressed: () async {
           await controller.saveFormD(widget.patientId?? '7965',context);
           await formEcontroller.saveFormEData(widget.patientId?? '7965',context);
          },),
        ],
        ),
      ),
    ));
  }
}
