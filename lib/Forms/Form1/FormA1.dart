import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
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
  bool hasRch = false;
  bool isHealthCare = false;
  bool isOtherOccupation = false;
  bool isgardianOthers = false;


  List<String> item =['Home Maker','Manual Labour','Semi-skilled Labourer','Professional','Others'];

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
  String age = 'Enter Age';

  @override
  void initState() {
     formA1Data.value = BaseLineData();
    controller.getStateList();
    formA1Controller.getNpacNumber();
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
  final CustomTextEditingController _controller = CustomTextEditingController();
  final _formatter = SplitTextInputFormatter();

  // GetxController getController = Get.find();
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
        MRowTextRadioWidget(enabled: isEnabled,title: 'A1. Heart disease as per inclusion criteria',initialValue: formA1Data.value.heartDisease,onChanged: (val){
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
        MRowTextRadioWidget(enabled: isEnabled,title: 'A2. Consented for the study',initialValue: formA1Data.value.consented,onChanged: (val){
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
        MRowTextRadioWidget(enabled: isEnabled,title: 'A3. Time of enrolment of the pa:ent in the study:',initialValue: formA1Data.value.antenatalorpostnatal,options: ['Antenatal',  'Post-partum (Up to 6 weeks)','Postnatal (up to 5 months, only for peri-partum cardiomyopathy)'],onChanged: (val){
          setState(() {
            A7= true;
          });
          formA1Data.value.antenatalorpostnatal = val;
        }),

        MrowTextTextFieldWidget(key :ValueKey('Npacno${formA1Controller.npacNumber.value}'),title:'A4. NPAC No:',initialValue: formA1Controller.npacNumber.value,enabled: isEnabled,onChanged: (val){
          formA1Controller.npacNumber.value = val;
            },),
            MRowTextRadioWidget(title: 'A5. RCH No',options: ['Available','Not Available'],onChanged: (val){
              val =='Available' ? hasRch = true : hasRch = false;
              setState(() {});
            },),
        hasRch? Obx(()=> MrowTextTextFieldWidget(title:'RCH. No:',initialValue: formA1Data.value.rCHNO ?? '',enabled: isEnabled,onChanged: (val){formA1Data.value.rCHNO = val;},)): Container(),
            MrowTextDatePickerWidget(title: 'A6. Date of registration at participating site :', initialDate:stringToDate(formA1Data.value.dateOfRegistration?? ''),enabled: isEnabled,onChanged: (val){
               formA1Data.value.dateOfRegistration =dateToString(val);
              },),
            MrowTextDatePickerWidget(title: 'A7. Date of referral to participating site (if referred): ',initialDate:stringToDate(formA1Data.value.dateOfReferral?? ''),enabled: isEnabled,onChanged: (val){
              formA1Data.value.dateOfReferral =dateToString(val);
            },),
        MrowTextDatePickerWidget(title: 'A8. Date of enrollment in the study',initialDate:stringToDate(formA1Data.value.dateOfEnrollment?? ''),enabled: isEnabled,onChanged: (val){
          formA1Data.value.dateOfEnrollment =dateToString(val);
        },),
            // MrowTextTextFieldWidget(title: 'A8. PLACE OF FIRST REPORTING:',initialValue: formA1Data.value.f,onChanged: (val){
            //   formA1Data.value.placeOfFirstReporting = val;
            // },enabled: isEnabled,),
            // MrowTextTextFieldWidget(title: 'A9. WHEN SEEN BY THE CARDIOLOGIST:',initialValue: formA1Data.value.whenSeenByTheCardiologist,onChanged: (val){
            //   formA1Data.value.whenSeenByTheCardiologist = val;
            // },enabled: isEnabled,),

           (A7 && A8 && A9) ? Column(
            children: [
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B1.  Hospital Identification number (UHD/ MRD/ OP/ IP Number):',initialValue: formA1Data.value.pinNumber, onChanged: (val){
                formA1Data.value.pinNumber = val;
              }),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B2. Full name of the patient:',initialValue: formA1Data.value.patientfullname, onChanged: (val){
                formA1Data.value.patientfullname = val;
              }),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B3. Name of the Husband/Guardian:',initialValue: formA1Data.value.guardian,onChanged: (val){
                formA1Data.value.guardian = val;
              },isneedDivider: false,),
              MRowTextRadioWidget(enabled: isEnabled, options: ['Husband','Father','Mother','Others'],onChanged: (val){
                val =='Others' ? isgardianOthers =true : isgardianOthers = false;
                setState(() {});
              },isneedDivider: false,),

              isgardianOthers ? MTextField(label: 'Others ,Please specify:',enabled: isEnabled,onChanged: (val){},) :Container(),
            MDivider(),
             Obx(
                 ()=> MrowTextTextFieldWidget(
                 key:ValueKey('age${formA1Data.value.age}'),
                 enabled: isEnabled,title: 'B4. Age',initialValue: '${formA1Data.value.age}',onChanged:(val){
                   val.length >0 ?( formA1Data.value.age = int.parse(val)) : null;
                  } ,type: MInputType.numeric,),
             ),

              Obx(
                ()=> MrowTextDatePickerWidget(enabled: isEnabled,title:'B5. DOB:',initialDate: stringToDate(formA1Data.value.dob??''),onChanged: (val){
                  formA1Data.update((model) {
                    model?.age = int.parse(calculateAge(val));
                    model?.dob = dateToString(val);
                  });
                  // formA1Controller.age.value = int.parse(calculateAge(val));
                  // setState(() {
                  //   age = calculateAge(val);
                  // });
                  formA1Data.value.age = int.parse(calculateAge(val));
                  formA1Data.value.dob = dateToString(val);

                  setState(() {

                  });
                },),
              ),
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
                val.length >0 ?(formA1Data.value.mobilenumber = int.parse(val)) : null;
              },type: MInputType.phone,),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B13. Name of the Alternate Contact Person:',initialValue: '${formA1Data.value.relativename??''}',onChanged: (val){
               val.length >0 ? (formA1Data.value.relativename = val) : null;
              },type: MInputType.phone,),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B13. Alternate contact person’s mobile number: ',initialValue: '${formA1Data.value.relativemobilenumber??''}',onChanged: (val){
                val.length >0 ? (formA1Data.value.relativemobilenumber = val) : null;
              },type: MInputType.phone,),
              MRowTextRadioWidget(isneedDivider: false ,initialValue: formA1Data.value.relativeRelation,enabled: isEnabled,title: 'B13. Relationship',options: ['Husband','Father','Mother','Relative','Friend','Others'],onChanged: (val){
                  setState(() {
                 formA1Data.value.relativeRelation = val;
                 if(val != 'Others'){
                   formA1Data.value.relativeRelationOthers =null;
                 }
                });
              },),
              formA1Data.value.relativeRelation=='Others'? MTextField(label: 'If other, please specify',initalValue: formA1Data.value.relativeRelationOthers,onChanged: (val){
                formA1Data.value.relativeRelationOthers = val;
              },): Container(),
              MDivider(),
              MRowTextRadioWidget(title: 'B14. Provide name of any Health care Contact person (VHN/ASHA worker equivalent):',onChanged: (val){
                val =='Yes'? isHealthCare = true : isHealthCare = false;
                formA1Data.value.healthCare= val;
                setState(() {});
              },isneedDivider: false,),
              isHealthCare ? Column(children: [
                MrowTextTextFieldWidget(enabled: isEnabled,title: 'Health Care Contact person’s name:',initialValue: '${formA1Data.value.healthCarePersonName}',onChanged: (val){
                  formA1Data.value.healthCarePersonName = val;
                },isneedDivider: false),
                MrowTextTextFieldWidget(enabled: isEnabled,title: 'Health Care Contact person’s Mobile Number',initialValue: '${formA1Data.value.healthCarePersonMoblieNo}',onChanged: (val){
                  formA1Data.value.healthCarePersonMoblieNo = val;
                },isneedDivider: false),
                MrowTextTextFieldWidget(enabled: isEnabled,title: 'Health Care Contact person designation : ',initialValue: formA1Data.value.healthCarePersonDesignation ??'',onChanged: (val){
                  formA1Data.value.healthCarePersonDesignation = val;
                },isneedDivider: false),
              ],) : Container(),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B15 Total number of years of formal education:',validator: (val){
                if(val!=null && val.isNotEmpty){
                  int.parse(val) <=31 ?  null: 'value should be less than 31';
                }
                return null;
              } ,initialValue: '${formA1Data.value.noofyeareducation}', onChanged: (val){
               val.length >0 ? formA1Data.value.noofyeareducation = int.tryParse(val) : null;
              },type: MInputType.numeric,),
              MRowTextRadioWidget(enabled: isEnabled,title: 'B16 Occupation of patient: ',initialValue:formA1Data.value.occupation,options:item,onChanged:(val){
                formA1Data.value.occupation = val;
              },),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B17 Total number of years of formal education of husband: (Zero for Illiterates)', validator: (val){
                if(val!=null && val.isNotEmpty){
                  int.parse(val) <=31 ?  null: 'value should be less than 31';
                }
                return null;
              } ,initialValue: '${formA1Data.value.noofyeareducationHusband}', onChanged: (val){
                val.length > 0 ?formA1Data.value.noofyeareducationHusband =val : null;
              },type: MInputType.numeric,),
              MRowTextRadioWidget(enabled: isEnabled,title: 'B18 Occupation of husband : ',initialValue: formA1Data.value.occupationHusband,options:item,onChanged:(val){
                formA1Data.value.occupationHusband = val;
                formA1Data.value.occupationHusband =='Others' ? isOtherOccupation = true : isOtherOccupation = false;
                setState(() {});
              },),
              isOtherOccupation? MTextField(enabled: isEnabled,label: 'Others specify',onChanged: (val){},): Container(),
              MRowTextRadioWidget(enabled: isEnabled,title: 'B19 Socio-economic status: ',initialValue: formA1Data.value.economicstatus,options:['Above Poverty Line', 'Below Poverty Line'],onChanged:(val){
                formA1Data.value.economicstatus = val;
                setState(() {
                });
              },isneedDivider: false,),

              formA1Data.value.economicstatus != null? MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){},isneedDivider: false,options: ['Ration card','kuppusamy scale'],): Container(),
              MDivider(),
              MrowTextTextFieldWidget(enabled: isEnabled,title: 'B20. Mention any additional details: ',initialValue: formA1Data.value.additionalDetails,onChanged: (val){
                formA1Data.value.additionalDetails = val;
              },),
              Space(20),
              MFilledButton(text: 'Save & Continue',onPressed: (){
              formA1Controller.updateFormA1Data(formA1Data.value,context);
                context.push(Routes.Form3One);
              },),
              Space(),
              ((widget.isFromPatientDetails?? false) == false) ? FilledButton(onPressed: (){
               // print(formA1Data.value.toJson()); n
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

class SplitTextField extends StatefulWidget {
  @override
  _SplitTextFieldState createState() => _SplitTextFieldState();
}

class _SplitTextFieldState extends State<SplitTextField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      inputFormatters: [
        SplitTextInputFormatter(),
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter text',
      ),
    );
  }
}



class SplitTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final newText = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    // First 3 characters as alphabets
    if (newText.length > 3) {
      buffer.write(newText.substring(0, 3));
      buffer.write(' '); // add a space after the first 3 characters
    } else {
      buffer.write(newText);
    }

    // Next 1 character as number
    if (newText.length > 3 && newText.length <= 4) {
      buffer.write(newText.substring(3));
    } else if (newText.length > 4) {
      buffer.write(newText.substring(3, 4));
      buffer.write(' '); // add a space after the next 1 character
    }

    // Next 4 characters as numbers
    if (newText.length > 4) {
      buffer.write(newText.substring(4, newText.length > 8 ? 8 : newText.length));
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

class CustomTextEditingController extends TextEditingController {
  @override
  void addListener(VoidCallback listener) {
    super.addListener(() {
      final oldText = super.text;
      final newText = _formatText(oldText);

      if (oldText != newText) {
        final oldSelection = selection;
        value = value.copyWith(
          text: newText,
          selection: oldSelection.copyWith(
            baseOffset: _getNewCursorPosition(oldText, newText, oldSelection.baseOffset),
            extentOffset: _getNewCursorPosition(oldText, newText, oldSelection.extentOffset),
          ),
        );
      }
    });
  }

  String _formatText(String text) {
    final strippedText = text.replaceAll(' ', '');

    if (strippedText.length <= 3) {
      return strippedText;
    } else if (strippedText.length <= 5) {
      return '${strippedText.substring(0, 3)} ${strippedText.substring(3)}';
    } else if (strippedText.length <= 9) {
      return '${strippedText.substring(0, 3)} ${strippedText.substring(3, 5)} ${strippedText.substring(5)}';
    } else {
      return '${strippedText.substring(0, 3)} ${strippedText.substring(3, 5)} ${strippedText.substring(5, 9)}';
    }
  }

  int _getNewCursorPosition(String oldText, String newText, int oldPosition) {
    int newPosition = oldPosition;
    int removedSpaces = oldText.substring(0, oldPosition).split(' ').length - 1;
    newPosition -= removedSpaces;

    int insertedSpaces = newText.substring(0, newPosition).split(' ').length - 1;
    newPosition += insertedSpaces;

    return newPosition;
  }
}
