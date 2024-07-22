import 'package:flutter/material.dart';
import 'package:npac/Forms/FormE/FormE2.dart';
import 'package:npac/Forms/FormE/FormEModel/FormEModel.dart';
import 'package:npac/Forms/FormE/controller/FormEController.dart';
import 'package:npac/Forms/FormN/FormN3.dart';
import 'package:npac/Views/MothersList/MotherListModel.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextCheckBox.dart';
import 'package:npac/common_widget/MRowTextDropDown.dart';
import 'package:npac/widgets/loading_widget.dart';

class FormE1 extends StatefulWidget {
  final bool? isFromPatientDetails;
  final MotherListModel? data;
  const FormE1({super.key, this.isFromPatientDetails, this.data});

  @override
  State<FormE1> createState() => _FormE1State();
}

class _FormE1State extends State<FormE1> {
  FormEController controller = Get.put(FormEController());
  Rx<FormEModel> formEData = FormEModel().obs;

  bool isSurgicalMethod = false;
  bool isMedicalMethod = false;
  bool isMifepristone = false;
  bool isMisoprostol = false;
  bool isProphylaxis = false;
  bool isAdvised = false;
  bool isOtherAdvise = false;
  bool isObstetric = false;
  bool isNonObstetric = false;
  bool isComplications = false;
   bool isEnabled = false;
   bool isLoading = false;

RxList<String> selectedlist = <String>[].obs;
RxList<String> MTPselectedlist = <String>[].obs;

 @override
  void initState() {
   // selectedlist.value.add( 'Suction & evacuation');
   getMTPData();
    super.initState();
  }

   getMTPData() async {
   setState(() {
     isLoading = true;
   });
   if(widget.isFromPatientDetails ?? false){
   //await controller.getMTPData(8);
   formEData.value = await controller.getMTPData( context ,int.parse(widget.data?.tNPHDRNOID?? '0'));
   await controller.getAntibiotics(context,int.parse(widget.data?.tNPHDRNOID?? '0') );
   Future.delayed(Duration(seconds: 1));
   print(formEData.value.methodSuctionEvacuation);
   formEData.value.methodSuctionEvacuation ?? false ?selectedlist.value.add( 'Suction & evacuation'): null;
   formEData.value.methodDilationCurettage ?? false ?selectedlist.value.add( 'Dilatation & Curewage '): null;
   formEData.value.methodDilationEvacuation ?? false ? selectedlist.value.add('Dilatation & evacuation'): null;
   formEData.value.methodHysterotomy ?? false ?selectedlist.value.add( 'Hysterotomy'): null;
   formEData.value.methodMifepristone ?? false ?  selectedlist.value.add('Mifepristone'): null;
   formEData.value.methodMisoprostol?? false ?selectedlist.value.add( 'Misoprostol'): null;
   formEData.value.methodDinoprostone  ?? false ?selectedlist.value.add( 'Dinoprostone'): null;
   formEData.value.methodMechanical ?? false ?selectedlist.value.add( 'Mechanical methods'): null;
   formEData.value.methodOxytocin ?? false ?selectedlist.value.add( 'Oxytocin'): null;

   formEData.value.MtpCardiac?? false ?MTPselectedlist.value.add( 'Maternal - Cardiac'): null;
   formEData.value.MtpObstetric?? false ?MTPselectedlist.value.add( 'Maternal- Obstetric'): null;
   formEData.value.MtpFetal?? false ?MTPselectedlist.value.add( 'Fetal'): null;
   formEData.value.MtpSocial?? false ?MTPselectedlist.value.add( 'Social / others'): null;


   print(formEData.value.methodSuctionEvacuation);
   setState(() {
     isEnabled = false;
   });
   }else{
     setState(() {
       isEnabled = true;
     });
   }
   setState(() {
     isMifepristone = formEData.value.methodMifepristone ?? false;
     isMisoprostol = formEData.value.methodMisoprostol ?? false;
     isProphylaxis = formEData.value.antibioticProphylaxis=='Yes' ? true : false;
     isAdvised = formEData.value.contraceptionAdvisedAfterMtp=='Yes' ? true : false;
     isOtherAdvise = formEData.value.contraceptionAdvisedValueOthers== 'yes'? true :false;
     isObstetric = formEData.value.obstetricOutcome == 'Yes' ? true: false;
    // isNonObstetric = formEData.value.isNonObstetric ?? false;
    // isComplications = formEData.value.isComplications ?? false;

     isLoading = false;
   });


  }

  @override
  Widget build(BuildContext context) {
   print(widget.data?.toString());
   // print('jdggvcdhsv ${widget.data?.tNPHDRNOID}');
    return MScaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MAppBar(title: 'H. ABORTION / MTP PAGE (FORM H)')),

      body: isLoading ? Center(child: LoadingWidget(),) :Obx(()=>MFormBody(
        Childrens: [
          (widget.isFromPatientDetails ?? false )? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('For all patients (Tick theapplicable)'),
              IconButton(
                  onPressed: () {
                  //  controller.getMTPData(8);
                    setState(() {
                      isEnabled = !isEnabled;
                    });
                  },
                  icon: isEnabled
                      ? Icon(Icons.save)
                      : Icon(Icons.edit))
            ],
          ) : Container(),
          MText(text: ' H. ABORTION / MTP PAGE (FORM H)',),
          MRowTextRadioWidget(enabled : isEnabled,title: 'H1 AbortType',initialValue: formEData.value.abortType,options: const ['Spontaneous', 'Induced'],onChanged: (val){
            formEData.value.abortType = val;
          },),
          MrowTextDatePickerWidget(enabled : isEnabled,title: 'H2 Date of abortion:',initialDate: stringToDate(formEData.value.visitDate ?? ''),onChanged: (val){
            formEData.value.visitDate = dateToString(val);
          },),
          MRowTextDropDown(enabled: isEnabled,title: 'H3.Period of gestation (in completed weeks):',initialValue: formEData.value.GestationalAge,onChanged: (val){
            formEData.value.GestationalAge = val;
          },),
          // MrowTextTextFieldWidget(enabled : isEnabled,title: 'H3. Period of gestation  (in completed weeks) :',initialValue: formEData.value.periodOfGestation,onChanged: (val){
          //   formEData.value.periodOfGestation = val;
          // },type: MInputType.numeric,),
          MRowTextCheckBox(enabled : isEnabled,title: 'H4 Indication for MTP: ',selectedlist: MTPselectedlist,list: const ['Maternal - Cardiac','Maternal- Obstetric', 'Fetal','Social / others'],result: (val){
            // formEData.value.indicationForMtp = val;
            // MTPselectedlist.value = val;
            val.contains('Maternal - Cardiac') ? formEData.value.MtpCardiac = true : formEData.value.MtpCardiac = false;
            val.contains('Maternal- Obstetric') ? formEData.value.MtpObstetric = true : formEData.value.MtpObstetric = false;
            val.contains('Fetal') ? formEData.value.MtpFetal = true : formEData.value.MtpFetal = false;
            val.contains('Social / others') ? formEData.value.MtpSocial = true : formEData.value.MtpSocial = false;
            setState(() {});
          },),
          MRowTextRadioWidget(enabled : isEnabled,title: 'H5 Gestation at which MTP performed: ',initialValue: formEData.value.gestationWeek,options: const ['Less than 12 weeks', 'Between 12 to 20 weeks','After 20 week'],onChanged: (val){
            formEData.value.gestationWeek = val;
          },),
          // MRowTextRadioWidget(title: 'H6 Method adopted for MTP:',options: const ['Surgical', 'Medical'],onChanged: (val){
          //   if(val =='Surgical'){
          //     setState(() {
          //       isSurgicalMethod = true;
          //     });
          //   }else{
          //     setState(() {
          //       isSurgicalMethod = false;
          //     });
          //   }
          //   if(val =='Medical'){
          //     setState(() {
          //       isMedicalMethod = true;
          //     });
          //   }else{
          //     setState(() {
          //       isMedicalMethod = false;
          //     });
          //   }
          //   formEData.value.methodAdoptedForMtp = val;
          // },isneedDivider:isMedicalMethod ||isSurgicalMethod ? false: true,),
          // isSurgicalMethod ? MRowTextCheckBox(result: (val){
          //   val.contains('Suction & evacuation') ? formEData.value.methodSuctionEvacuation = true : formEData.value.methodSuctionEvacuation = false;
          //   val.contains('Dilatation & curettage') ? formEData.value.methodDilationCurettage = true : formEData.value.methodDilationCurettage = false;
          //   val.contains('Dilatation & evacuation') ? formEData.value.methodDilationEvacuation = true : formEData.value.methodDilationEvacuation = false;
          //   val.contains('Hysterotomy') ? formEData.value.methodHysterotomy = true : formEData.value.methodHysterotomy = false;
          // },list: ['Suction & evacuation','Dilatation & curettage','Dilatation & evacuation','Hysterotomy'],):
          // isMedicalMethod? MRowTextCheckBox(list: const ['Mifepristone','Misoprostol','Dinoprostone','Mechanical method','Oxytocin'],isneedDivider: isMifepristone || isMisoprostol ? false : true,result:(val){
          //   if(val.contains('Mifepristone')){
          //     setState(() {
          //       isMifepristone = true;
          //     });
          //     formEData.value.methodMifepristone = true;
          //   }else{
          //     setState(() {
          //       isMifepristone = false;
          //     });
          //     formEData.value.methodMifepristone = false;
          //   }
          //   if(val.contains('Misoprostol')){
          //     setState(() {
          //       isMisoprostol = true;
          //     });
          //     formEData.value.methodMisoprostol = true;
          //   }else{
          //     setState(() {
          //       isMisoprostol = false;
          //     });
          //     formEData.value.methodMisoprostol = false;
          //   }
          // },): Container(),
          MRowTextCheckBox( selectedlist: selectedlist,enabled : isEnabled,title: 'Method adopted for MTP:',result: (val){
            print(val);
            if(val.contains('Mifepristone')){
              formEData.value.methodMifepristone = true;
              setState(() {
                isMifepristone = true;
              });
            }else{
              formEData.value.methodMifepristone = false;
              setState(() {
                isMifepristone = false;
              });
            }
            if(val.contains('Misoprostol')){
              formEData.value.methodMisoprostol = true;
              setState(() {
                isMisoprostol = true;
              });
            }else{
              formEData.value.methodMisoprostol = false;
              setState(() {
                isMisoprostol = false;
              });
            }

            formEData.value.methodDinoprostone = val.contains('Dinoprostone');
            formEData.value.methodMechanical = val.contains('Mechanical method');
            formEData.value.methodOxytocin = val.contains('Oxytocin');
            formEData.value.methodSuctionEvacuation = val.contains('Suction & evacuation');
            formEData.value.methodDilationCurettage = val.contains('Dilatation & curettage');
            formEData.value.methodDilationEvacuation = val.contains('Dilatation & evacuation');
            formEData.value.methodHysterotomy = val.contains('Hysterotomy');
            // if(val.contains('Dinoprostone')){
            //   formEData.value.methodDinoprostone = true;
            // }else{
            //   formEData.value.methodDinoprostone = false;
            // }
            // if(val.contains('Mechanical method')){
            //   formEData.value.methodMechanical = true;
            // }else{
            //   formEData.value.methodMechanical = false;
            // }
            // if(val.contains('Oxytocin')){
            //   formEData.value.methodOxytocin = true;
            // }else{
            //   formEData.value.methodOxytocin = false;
            // }
            // if(val.contains('Suction & evacuation')){
            //   formEData.value.methodSuctionEvacuation = true;
            // }else{
            //   formEData.value.methodSuctionEvacuation = false;
            // }
            // if(val.contains('Dilatation & curettage')){
            //   formEData.value.methodDilationCurettage = true;
            // }else{
            //   formEData.value.methodDilationCurettage = false;
            // }
            // if(val.contains('Dilatation & evacuation')){
            //   formEData.value.methodDilationEvacuation = true;
            // }else{
            //   formEData.value.methodDilationEvacuation = false;
            // }
            // if(val.contains('Hysterotomy')){
            //   formEData.value.methodHysterotomy = true;
            // }else{
            //   formEData.value.methodHysterotomy = false;
            // }
            //

          },isneedDivider: false,list: ['Suction & evacuation','Dilatation & Curewage','Dilatation & evacuation','Hysterotomy','Mifepristone','Misoprostol','Dinoprostone','Mechanical methods','Oxytocin'],),
          isMifepristone? MTextField(label: 'Mifepristone (Total Dose)',initalValue: formEData.value.mifepristoneDose,onChanged: (val){
            val.length > 0 ? formEData.value.mifepristoneDose = val : null;
          },) : Container(),
          isMisoprostol? MTextField(label: 'Misoprostol (Total Dose)',initalValue: formEData.value.misoprostolDose,onChanged: (val){
            val.length > 0 ? formEData.value.misoprostolDose = val : null;
          },): Container(),
         const MDivider(),
          MRowTextRadioWidget(enabled : isEnabled,initialValue: formEData.value.modeOfAnesthesiaAnalgesia,onChanged: (val){
            formEData.value.modeOfAnesthesiaAnalgesia = val;
          },title: 'H7 Mode of anesthesia / analgesia:',options: const ['Local','Regional','GA'],),
          MRowTextRadioWidget(enabled : isEnabled,initialValue: formEData.value.antibioticProphylaxis,onChanged: (val){if(val =='Yes'){
            setState(() {
              isProphylaxis = true;
            });

          }else{
            setState(() {
              isProphylaxis = false;
            });
          }
          formEData.value.antibioticProphylaxis = val;
            },title: 'H8 Antibiotic Prophylaxis:',isneedDivider:false),
          // isProphylaxis ? MTextField(label: 'If Yes details: ',initalValue: formEData.value.antibioticProphylaxisDetails,onChanged: (val){
          //   isProphylaxis ? formEData.value.antibioticProphylaxisDetails = val: null;
          // },) : Container(),
          // isProphylaxis? const MDivider(): Container(),
          isProphylaxis ?FormN3(controller: controller,) : Container(),
          MDivider(),
          // MRowTextRadioWidget(title: 'E6 Contraception advised after MTP/Abortion:',),
          MRowTextRadioWidget(enabled : isEnabled,initialValue: formEData.value.contraceptionAdvisedAfterMtp,title: 'H9 Contraception advised after MTP/Abortion:',onChanged: (val){if(val =='Yes'){
            setState(() {
              isAdvised = true;
            });
          }else{
            setState(() {
              isAdvised = false;
            });
          }
          formEData.value.contraceptionAdvisedAfterMtp = val;
            },isneedDivider: isAdvised? false: true,),
          isAdvised ? MRowTextRadioWidget(initialValue: formEData.value.contraceptionAdvisedValue,options: const ['IUCD','OCP','Barrier method','Tubectomy','Others'],onChanged: (val){ if(val == 'Others'){
            setState(() {
              isOtherAdvise = true;
            });
          }else{setState(() {
            isOtherAdvise = false;
          });}
          formEData.value.contraceptionAdvisedValue = val;
          },isneedDivider:isOtherAdvise? false: true,): Container(),
          isOtherAdvise? MTextField(label: 'If others please specify',initalValue: formEData.value.contraceptionAdvisedValueOthers,onChanged: (val){
            isOtherAdvise ? formEData.value.contraceptionAdvisedValueOthers = val: null;
          },) : Container(),
          isOtherAdvise? const MDivider(): Container(),

          MRowTextRadioWidget(enabled : isEnabled,initialValue: formEData.value.outcomeAndComplication,isneedDivider:false,title: 'H10 Outcome and Complication:',onChanged: (val){
            if(val =='Yes'){
              setState(() {
                isObstetric = true;
              });
            }else{
              setState(() {
                isObstetric = false;
              });
            }
          },),
          // isComplications?MRowTextCheckBox(enabled : isEnabled,list: ['Cardiac','Obstetric'],result: (val){
          //   if(val.contains('Cardiac')) {
          //     formEData.value.outcomeAndComplication = 'Cardiac';
          //   }else{
          //     formEData.value.outcomeAndComplication = null;
          //   }
          //   if(val.contains('Obstetric')) {
          //     setState(() {
          //       isObstetric = true;
          //     });
          //     formEData.value.obstetricOutcome = 'Obstetric';
          //   }else{
          //     setState(() {
          //       isObstetric = false;
          //     });
          //     formEData.value.obstetricOutcome = null;
          //   }
          // },isneedDivider: false,) : Container(),
          isObstetric ?MRowTextCheckBox(title:'H10.1 Obstetric outcome related to MTP',enabled : isEnabled,result: (val){
            //formEData.value.obstetricOutcome = val.toString();
          },list: ['Perforation','Rupture','Hemorrhage','Retained products/Sepsis'],) : Container(),
         //MDivider(),

          MrowTextTextFieldWidget(title: 'Signature of Site PI/ I - Obstetrics',enabled : isEnabled,initialValue: formEData.value.obstetricsVerifiedBy,onChanged: (val){
            formEData.value.obstetricsVerifiedBy = val;
          },),
         // MFilledButton(onPressed: (){context.push(Routes.FormE2);},text: 'Next',)
          isObstetric? FormE2(formEData: formEData,enabled: isEnabled,) : Container(),
          Space(20),
         (widget.isFromPatientDetails ?? false )? MFilledButton(text:isEnabled ? 'Save': 'Edit',onPressed: () async {
           isEnabled ? { await controller.saveData(context,formEData.value,int.parse(widget.data?.tNPHDRNOID ?? '')),
           setState(() {
           isEnabled = !isEnabled;
           })
           }:  setState(() {
             isEnabled = !isEnabled;
           });
         },):  MFilledButton(text: 'Submit',onPressed: (){
           controller.saveData(   context,formEData.value,int.parse(widget.data?.tNPHDRNOID ?? ''));
           //print(formEData.value.toJson());
         }),
          Space(),
          MFilledButton(text: 'Save & Continue',onPressed: () async {
            await controller.saveData(   context,formEData.value,int.parse(widget.data?.tNPHDRNOID ?? ''));
            context.push(Routes.FormI1);
          },),
          Space(),
        ],),
      ),
      );
  }
}
