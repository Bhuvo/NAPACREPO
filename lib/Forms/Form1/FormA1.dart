import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:npac/Forms/Form1/contoller/FormA1Controller.dart';
import 'package:npac/Forms/Form2/FormtwoPage.dart';
import 'package:npac/Forms/Form2/controller/Form2Controller.dart';
import 'package:npac/app/export.dart';
import 'package:npac/model/BaseLineDataModel.dart';
import 'package:npac/model/StateModel.dart';
import 'package:npac/model/DistrictModel.dart';
import 'package:npac/model/StateModel.dart';
import 'package:npac/model/TalukModel.dart';
import 'package:npac/model/VillageModel.dart';
import 'package:npac/widgets/loading_widget.dart';

class FormA1 extends StatefulWidget {
  final bool? isFromPatientDetails;
  const FormA1({super.key, required this.isFromPatientDetails});

  @override
  State<FormA1> createState() => _FormA1State();
}
class _FormA1State extends State<FormA1> {
  bool A7 =false;
  bool A8 =false;
  bool A9 =false;
  bool isEnabled = false;
  bool isLoading = false;

  List<String> item =['Home Maker','Manual Labour','Semi-skilled Labourer','Professional','Other'];

  Form2Controller controller = Get.put(Form2Controller());
  FormA1Controller formA1Controller = Get.put(FormA1Controller());
  Rx<BaseLineData>  formA1Data = BaseLineData().obs;

  var state =  StateModel(stateName: 'Please select State',stateId: 0).obs;
  var district = DistrictModel(cityName: 'Please select District',cityId: 0).obs;
  var taluk = TalukModel(talukName: 'Please select Taluk',talukId: 0).obs;
  var village = VillageModel(locationName: 'Please select Village',locationId: 0).obs;

   void getBaseLineData()async{
     setState(() {
       isLoading = true;
     });
    formA1Data.value = await formA1Controller.getBaseLineData(102) ?? BaseLineData();
    print(formA1Data.value.rCHNO);
    if(formA1Data.value.antenatalorpostnatal != null){
      setState(() {
        A7 = !A7;
      });
    }
    if(formA1Data.value.heartDisease != 'No'){
      setState(() {
        A8 = !A8;
      });
    }
    if(formA1Data.value.consented != 'No'){
      setState(() {
        A9 = !A9;
      });
    }

     try{
       await  controller.getDistrict(int.parse(formA1Data.value.stateid!));
       await controller.getTaluk(int.parse(formA1Data.value.district!));
       await controller.getVilliage(int.parse(formA1Data.value.talukId!));
     }catch(e){
       print(e);
     }
     Future.delayed(Duration(seconds: 1));
     setState(() {
       state.value = controller.stateList.firstWhere((element) => element.stateId == int.parse(formA1Data.value.stateid!));
       district.value = controller.districtList.firstWhere((element) => element.cityId == int.parse(formA1Data.value.district!));
       taluk.value= controller.talukList.firstWhere((element) => element.talukId == int.parse(formA1Data.value.talukId!));
       village.value= controller.villageList.firstWhere((element) => element.locationId == int.parse(formA1Data.value.villageid!));
     });

     setState(() {
       isLoading = false;
     });
   }

  @override
  void initState() {
     formA1Data.value = BaseLineData();
    controller.getStateList();
    Future.delayed(const Duration(seconds: 1));
     (widget.isFromPatientDetails ?? false) ? {
        getBaseLineData(),
      setState(() {
        isEnabled = false;
      }) }: setState(() {
      isEnabled = true;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'INCLUSION CRITERIA CHECKLIST (FORM A)',),
      body:isLoading ? Center(child: LoadingWidget()) : Obx(()=> MFormBody(Childrens: [
        (widget.isFromPatientDetails ?? false) ?  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('For all patients (Tick theapplicable)'),
              IconButton(
                  icon: isEnabled
                      ?  Icon(Icons.save) :Icon(Icons.edit)
                      , onPressed: () {
               // getBaseLineData();
                   // print(formA1Data.value.dateOfReferral);
                //formA1Controller.uploadFormA1Data(formA1Data.value,context);
                //formA1Controller.getBaseLineData(102);
                setState(() {
                  isEnabled = !isEnabled;
                });
                print('selcted option $isEnabled');
              },),
            ],
          ): Container(),
            MrowTextTextFieldWidget(title:'A1. NPAC No:',enabled: isEnabled,onChanged: (val){},),
            Obx(()=> MrowTextTextFieldWidget(title:'A2. RCH. No:',initialValue: formA1Data.value.rCHNO ?? '',enabled: isEnabled,onChanged: (val){formA1Data.value.rCHNO = val;},)),
            MrowTextDatePickerWidget(title: 'A3. DATE OF REGISTRATION:', initialDate:stringToDate(formA1Data.value.dateOfRegistration?? ''),enabled: isEnabled,onChanged: (val){
               formA1Data.value.dateOfRegistration =dateToString(val);
              },),
            MrowTextDatePickerWidget(title: 'A4. DATE OF REFERRAL: ',initialDate:stringToDate(formA1Data.value.dateOfReferral?? ''),enabled: isEnabled,onChanged: (val){
              formA1Data.value.dateOfReferral =dateToString(val);
            },),
            MrowTextTextFieldWidget(title: 'A5. PLACE OF FIRST REPORTING:',initialValue: formA1Data.value.placeOfFirstReporting,onChanged: (val){
              formA1Data.value.placeOfFirstReporting = val;
            },enabled: isEnabled,),
            MrowTextTextFieldWidget(title: 'A6. WHEN SEEN BY THE CARDIOLOGIST:',initialValue: formA1Data.value.whenSeenByTheCardiologist,onChanged: (val){
              formA1Data.value.whenSeenByTheCardiologist = val;
            },enabled: isEnabled,),
            MRowTextRadioWidget(enabled: isEnabled,title: 'A7',initialValue: formA1Data.value.antenatalorpostnatal,options: ['Antenatal',  'Post-partum (Up to 6 weeks)','Postnatal (up to 5 months, only for peri-partum cardiomyopathy)'],onChanged: (val){
              setState(() {
                A7= true;
              });
              formA1Data.value.antenatalorpostnatal = val;
            }),
            MRowTextRadioWidget(enabled: isEnabled,title: 'A8. Heart disease as per inclusion criteria',initialValue: formA1Data.value.heartDisease,onChanged: (val){
              if(val == 'Yes'){
              setState(() {
              A8 = true;
            });}else{
                setState(() {
                  A8 = false;
                });
              }
              formA1Data.value.heartDisease = val;
              },),
            MRowTextRadioWidget(enabled: isEnabled,title: 'A9. Consented for the study',initialValue: formA1Data.value.consented,onChanged: (val){
              if(val == 'Yes'){
                setState(() {
                  A9 = true;
                });}else{
                setState(() {
                  A9 = false;
                });
              }
              formA1Data.value.consented = val;
            },),
          (A7 && A8 && A9) ? Column(
            children: [
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B1. Hospital/PIN number:',initialValue: formA1Data.value.pinNumber, onChanged: (val){
                formA1Data.value.pinNumber = val;
              }),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B2. Full name of the patient:',initialValue: formA1Data.value.patientfullname, onChanged: (val){
                formA1Data.value.patientfullname = val;
              }),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B3. Name of the Husband/Guardian:',initialValue: formA1Data.value.guardian,onChanged: (val){
                formA1Data.value.guardian = val;
              }),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B4. Age',initialValue: '${formA1Data.value.age}',onChanged:(val){
               val.length >0 ?( formA1Data.value.age = int.parse(val)) : null;
              } ,type: MInputType.numeric,),
              MrowTextDatePickerWidget(enabled: isEnabled,title:'B5. DOB:',initialDate: stringToDate(formA1Data.value.dob??''),onChanged: (val){
                formA1Data.value.dob = dateToString(val);
              },),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B6. House/Flat name or number:',initialValue: formA1Data.value.flatname,onChanged: (val){
                formA1Data.value.flatname = val;
              },),
              Obx(()=>MrowTextSingleOption<StateModel>(enabled: isEnabled,title: 'B7. State:',initialValue: state.value ,onChanged: (val){
                 state.value = val;
                  formA1Data.value.stateid ='${val.stateId}';
                  //print(controller.getStateIDFromMap(val));
                  controller.getDistrict(val.stateId ?? 0);
                },items: controller.stateList, itemLabel: (item) => item.stateName ??''),
              ),
              Obx(()=>MrowTextSingleOption<DistrictModel>(enabled: isEnabled,title: 'B8. District',initialValue: district.value,onChanged: (val){
                  district.value = val;
                  formA1Data.value.district = '${val.cityId}';
                  controller.getTaluk(val.cityId!);
                },items: controller.districtList, itemLabel:(item){
                  return item.cityName??'';
                } ,),
              ),
              MrowTextSingleOption<TalukModel>(enabled: isEnabled,title: 'B9. Street/locality:',initialValue: taluk.value,onChanged: (val){
                setState(() {
                  taluk.value = val;
                });
                formA1Data.value.talukId = '${val.talukId}';
               // print(val.talukId);
                controller.getVilliage(val.talukId!);
              },items: controller.talukList, itemLabel:(item) => item.talukName ??'',),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B10. Pin code',initialValue: formA1Data.value.pincode !=null ?'${formA1Data.value.pincode}':'',onChanged: (val){
                formA1Data.value.pincode = int.parse(val);
              },type: MInputType.numeric,),
              MrowTextSingleOption<VillageModel>(enabled: isEnabled,title: 'B11. Village/city/town:',initialValue: village.value,onChanged: (val){
                setState(() {
                  village.value = val;
                });
                formA1Data.value.villageid = '${val.locationId}';
              },items: controller.villageList, itemLabel:(item) => item.locationName ??'',),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B12. Patient’s mobile number: ',initialValue: '${formA1Data.value.mobilenumber??''}',onChanged: (val){
                val.length >0 ?(formA1Data.value.mobilenumber = val) : null;
              },type: MInputType.phone,),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B13.Patient’s alternate number: ',initialValue: '${formA1Data.value.alternatemobilenumber??''}',onChanged: (val){
               val.length >0 ? (formA1Data.value.alternatemobilenumber = val) : null;
              },type: MInputType.phone,),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B14. Alternate mobile number to contact (relative) (10 digit):',initialValue: '${formA1Data.value.relativemobilenumber}',onChanged: (val){
                val.length >0 ?formA1Data.value.relativemobilenumber =  val : null;
              },type: MInputType.phone,),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B14. Name of the contact person/VNH/Asha worker: ',initialValue: '${formA1Data.value.contactPersonName}',onChanged: (val){
                formA1Data.value.contactPersonName = val;
              },),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B14. Relationship: ',initialValue: formA1Data.value.relativeRelation ??'',onChanged: (val){
                formA1Data.value.relativeRelation = val;
              },),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B15 Total number of years of formal education:', initialValue: '${formA1Data.value.noofyeareducation}', onChanged: (val){
               val.length >0 ? formA1Data.value.noofyeareducation = int.tryParse(val) : null;
              },type: MInputType.numeric,),
              MRowTextRadioWidget(enabled: isEnabled,title: 'B16 Occupation of patient: ',initialValue:formA1Data.value.occupation,options:item,onChanged:(val){
                formA1Data.value.occupation = val;
              },),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B17 Total number of years of formal education of husband: (Zero for Illiterates)', initialValue: '33', onChanged: (val){
                val.length > 0 ?formA1Data.value.noofyeareducationHusband = int.tryParse(val) : null;
              },type: MInputType.numeric,),
              MRowTextRadioWidget(enabled: isEnabled,title: 'B18 Occupation of husband : ',initialValue: formA1Data.value.occupationHusband,options:item,onChanged:(val){
                formA1Data.value.occupationHusband = val;
              },),
              MRowTextRadioWidget(enabled: isEnabled,title: 'B19 Socio-economic status: ',initialValue: formA1Data.value.economicstatus,options:['Above Poverty Line', 'Below Poverty Line'],onChanged:(val){
                formA1Data.value.economicstatus = val;
              },),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B20. Mention any additional details: ',initialValue: 'No',onChanged: (val){
                formA1Data.value.additionalDetails = val;
              },),
              Space(20),
              ((widget.isFromPatientDetails?? false) == false) ? FilledButton(onPressed: (){
               // print(formA1Data.value.toJson());
              formA1Controller.createFormA1Data(formA1Data.value,context);
              }, child:  Text('Submit')) : Container(),
              (widget.isFromPatientDetails ?? false) ? MFilledButton(text:isEnabled ? 'Save': 'Edit',onPressed: (){
                isEnabled? formA1Controller.updateFormA1Data(formA1Data.value,context) : null;
                setState(() {
                  isEnabled = !isEnabled;
                });
              },): Container(),
            ],
          )
              :Container(),
        ],),
      ),
    );
  }
}
