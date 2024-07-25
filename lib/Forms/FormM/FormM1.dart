import 'package:flutter/material.dart';
import 'package:npac/Forms/CommonModelController/EchoAssignmentController.dart';
import 'package:npac/Forms/CommonModelController/EchoImage/EchoImageController.dart';
import 'package:npac/Forms/FormM/FormM2.dart';
import 'package:npac/Forms/FormM/FormMController/FormMController.dart';
import 'package:npac/app/export.dart';

class FormM1 extends StatefulWidget {
  const FormM1({super.key});

  @override
  State<FormM1> createState() => _FormM1State();
}

class _FormM1State extends State<FormM1> {
  bool isHospitalisations = false;
  bool isOther = false;
  bool isWallAbnormal = false;
  bool isEnabled = false;
  bool isEvaluated = false;
  bool isPerson = false;
  bool isPhonic = false;

  FormMController controller = Get.put(FormMController());
  EchoAssignmentController echoAssignmentController = Get.put(EchoAssignmentController());
  EchoImageController echoImageController = Get.put(EchoImageController());


  @override
  Widget build(BuildContext context) {
    return MScaffold(appBar: MAppBar(title: 'SECOND POST PARTUM VISIT FORM',),
    body: MFormBody(Childrens: [
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
      MRowTextRadioWidget(enabled: isEnabled,title: 'Type of Follow up: ',initialValue: controller.formMData.value.typeOfFollowup,onChanged: (val){
        val == 'In-person follow up' ? isPerson = true : isPerson = false;
        val == 'Telephonic follow up' ? isPhonic = true : isPhonic = false;
        controller.formMData.value.typeOfFollowup = val;
        setState(() {});
      },options: ['In-person follow up','Telephonic follow up'],),
      isPhonic ?Column(children: [
       MRowTextRadioWidget( enabled: isEnabled,title: 'M1. NYHA SYMPTOMS CLASS:',initialValue: controller.formMData.value.nyhaSymptomsClass, options: List_items.NYHAClass,onChanged: (val){
         controller.formMData.value.nyhaSymptomsClass = val;
       },),
       // MSmallText(text: 'M2 CLINICAL SIGNS & ECG',),
       MRowTextRadioWidget( enabled: isEnabled,title: 'M2 Clinical Evaluation:',initialValue: controller.formMData.value.ceDoneNotDone,options: ['Done','NotDone'],isneedDivider: false,onChanged: (val){
         if(val == 'Done'){
           setState(() {
             isEvaluated = true;
           });
         }else{
           setState(() {
             isEvaluated = false;
           });
         }
         controller.formMData.value.ceDoneNotDone = val;
       },),
       Space(),
       isEvaluated ? Column(children: [
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'M2.1 Weight (Kg):',initialValue: '${controller.formMData.value.clinicalSignWeight}',onChanged: (val){
           controller.formMData.value.clinicalSignWeight = int.tryParse(val);
         },type: MInputType.numeric,isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'M2.2 HR (/min): ',initialValue: '${controller.formMData.value.clinicalSignHR}',onChanged: (val){
           controller.formMData.value.clinicalSignHR = int.tryParse(val);
         },type: MInputType.numeric,isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'M2.3 SPO2 (%): ',initialValue: '${controller.formMData.value.clinicalSignSp}',onChanged: (val){
           controller.formMData.value.clinicalSignSp = int.tryParse(val);
         },type: MInputType.numeric,isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'M2.4 BP (mm Hg): ',initialValue: '${controller.formMData.value.clinicalSignBp}',onChanged: (val){
           controller.formMData.value.clinicalSignBp = int.tryParse(val);
         },type: MInputType.numeric,isneedDivider: false,),
         MRowTextRadioWidget(enabled: isEnabled,title: 'M2.5 CCF: ',initialValue: controller.formMData.value.clinicalSignCcf,onChanged: (val){
           controller.formMData.value.clinicalSignCcf = val;
         },isneedDivider: false,),
         MRowTextRadioWidget(enabled: isEnabled,title: 'M2.6 Cyanosis: ',initialValue: controller.formMData.value.clinicalSignCyanosis,onChanged: (val){
           controller.formMData.value.clinicalSignCyanosis = val;
         },isneedDivider: false,),
         MRowTextRadioWidget(enabled: isEnabled,title: 'M2.7 Cardiac murmur:',initialValue: controller.formMData.value.clinicalSignCardiacMurmur,onChanged: (val){
           controller.formMData.value.clinicalSignCardiacMurmur = val;
         },isneedDivider: false,),
         MrowTextDatePickerWidget(enabled: isEnabled,title: 'M2.8 ECG Date:',initialDate: stringToDate(controller.formMData.value.ecgDate ?? ''),onChanged: (val){
           controller.formMData.value.ecgDate = dateToString(val);
         },isneedDivider: false,),
         MRowTextRadioWidget(enabled: isEnabled,options:List_items.NormalAbnormal,initialValue: controller.formMData.value.ecgNormalAbnormal,onChanged: (val){
           controller.formMData.value.ecgNormalAbnormal = val;
         },isneedDivider: false,),
       ],): Container(),
        controller.formMData.value.ecgNormalAbnormal == 'Abnormal' ? Column(children: [
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
       // MSmallText(text: 'M3 ECHOCARDIOGRAPHIC ASSESSMENT',),
       // Space(),
       // MSmallText(text: 'Ventricular function ',),
       // Space(),
       // MRowTextRadioWidget(enabled: isEnabled,title: 'Wall Motion', options: ['Normal','Hypokinesia','Akinesia'],isneedDivider: false,onChanged: (val){
       //   if(val != 'Normal'){
       //     setState(() {
       //       isWallAbnormal = true;
       //     });
       //   }else{
       //     setState(() {
       //       isWallAbnormal = false;
       //     });
       //   }
       // },),
       // isWallAbnormal?MRowTextCheckBox(enabled: isEnabled,list: ['Global','Regional'],): Container(),
       // MDivider(),
       // MRowTextRadioWidget(title: 'M6.3 Adverse neonatal outcome:',options: ['Neonatal death','Cardiac lesion','Malnourishment'],onChanged: (val){},),

       //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormM2);},),
       FormM2(enabled: isEnabled,EchoAssignmentData: controller.FormLEchoAssignmentData,)
     ],) : Container(),
      isPerson ?Column(children: [
       MRowTextRadioWidget( enabled: isEnabled,title: 'M1. NYHA SYMPTOMS CLASS:', options: List_items.NYHAClass,onChanged: (val){},),
        MSmallText(text: 'M2 CLINICAL SIGNS & ECG',),
         Space(),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'M2.1 Weight (Kg):',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'M2.2 HR (/min): ',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'M2.3 SPO2 (%): ',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'M2.4 BP (mm Hg): ',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
         MRowTextRadioWidget(enabled: isEnabled,title: 'M2.5 CCF: ',onChanged: (val){},isneedDivider: false,),
         MRowTextRadioWidget(enabled: isEnabled,title: 'M2.6 Cyanosis:  ',onChanged: (val){},isneedDivider: false,),
         MRowTextRadioWidget(enabled: isEnabled,title: 'M2.7 Cardiac murmur:',onChanged: (val){},isneedDivider: false,),
         MrowTextDatePickerWidget(enabled: isEnabled,title: 'M2.8 ECG Date:',onChanged: (val){},isneedDivider: false,),
         MRowTextRadioWidget(enabled: isEnabled,options:List_items.NormalAbnormal ,onChanged: (val){},isneedDivider: false,),
       MDivider(),
       // MRowTextRadioWidget(title: 'M6.3 Adverse neonatal outcome:',options: ['Neonatal death','Cardiac lesion','Malnourishment'],onChanged: (val){},),
       //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormM2);},),
       FormM2(enabled: isEnabled,)
     ],) : Container(),
      Space(20),
      isEnabled? MFilledButton(text: 'Submit',onPressed: () async{
        if(await controller.UploadPostpartumsecondData()){
          if(await echoAssignmentController.uploadEchoAssignment(13, controller.FormLEchoAssignmentData.value)){
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
        if(await controller.UploadPostpartumsecondData()){
          if(await echoAssignmentController.uploadEchoAssignment(13, controller.FormLEchoAssignmentData.value)){
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
      Space(),
    ],),);
  }
}
