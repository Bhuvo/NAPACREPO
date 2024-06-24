import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:npac/Forms/Form2/controller/Form2Controller.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MAppBar.dart';
import 'package:npac/common_widget/MRowTextRadioWidget.dart';
import 'package:npac/common_widget/MTextField.dart';
import 'package:npac/common_widget/MrowTextDatePicker.dart';
import 'package:npac/common_widget/MrowTextOptionPickerwidget.dart';
import 'package:npac/common_widget/MrowTextTextfieldWidget.dart';
import 'package:npac/model/DistrictModel.dart';
import 'package:npac/model/StateModel.dart';
import 'package:npac/model/TalukModel.dart';
import 'package:npac/model/VillageModel.dart';
import 'package:npac/widgets/m_scaffold.dart';
import 'package:npac/widgets/space.dart';

class FormTwoPage extends StatefulWidget {
  const FormTwoPage({super.key});

  @override
  State<FormTwoPage> createState() => _FormTwoPageState();
}

class _FormTwoPageState extends State<FormTwoPage> {
  bool isEnabled = false;
  List<String> item =['Home Maker','Manual Labour','Semi-skilled Labourer','Professional','Other'];

  Form2Controller controller = Get.put(Form2Controller());
  var state = StateModel(stateName: 'Please select State',stateId: 0);
  var district = DistrictModel(cityName: 'Please select District',cityId: 0);
  var taluk = TalukModel(talukName: 'Please select Taluk',talukId: 0);
  var village = VillageModel(locationName: 'Please select Village',locationId: 0);

  @override
  void initState() {
    controller.getStateList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MScaffold(
      appBar:PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MAppBar(title: 'BASELINE DATA- IDENTIFIER PAGE (FORM B)',)),
    body: ListView  (
      children: [
        Padding(
          padding: kIsWeb? const EdgeInsets.only(left: 150,right: 150):  const EdgeInsets.all(15),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
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
                          icon: isEnabled
                              ? Icon(Icons.save)
                              : Icon(Icons.edit))
                    ],
                  ),
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                     children: [
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B1. Hospital/PIN number:',initialValue: '2344', onChanged: (val){}),
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B2. Full name of the patient:',initialValue: '8687788', onChanged: (val){}),
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B3. Name of the Husband/Guardian:',initialValue: 'Gobal',onChanged: (val){}),
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B4. Age',initialValue: '23',onChanged:(val){} ,type: MInputType.numeric,),
                       MrowTextDatePickerWidget(enabled: isEnabled,title:'B5. DOB:',initialDate: DateTime.now(),onChanged: (val){},),
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B6. House/Flat name or number:',initialValue: 'flat 34',onChanged: (val){},),
                       MrowTextSingleOption<StateModel>(enabled: isEnabled,title: 'B7. State:',initialValue: state ,onChanged: (val){
                         print(val);
                         setState(() {
                           state = val;
                         });
                         //print(controller.getStateIDFromMap(val));
                         controller.getDistrict(val.stateId ?? 0);
                       },items: controller.stateList, itemLabel: (item) => item.stateName ??''),
                       MrowTextSingleOption<DistrictModel>(enabled: isEnabled,title: 'B8. District',initialValue: district,onChanged: (val){
                         setState(() {
                           district = val;
                         });
                         controller.getTaluk(val.cityId!);
                         },items: controller.districtList, itemLabel:(item){
                         return item.cityName??'';
                       } ,),
                       MrowTextSingleOption<TalukModel>(enabled: isEnabled,title: 'B9. Street/locality:',initialValue: taluk,onChanged: (val){
                         setState(() {
                           taluk = val;
                         });
                         print(val.talukId);
                         controller.getVilliage(val.talukId!);
                       },items: controller.talukList, itemLabel:(item) => item.talukName ??'',),
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B10. Pin code',initialValue: '600001',onChanged: (val){},type: MInputType.numeric,),
                       MrowTextSingleOption<VillageModel>(enabled: isEnabled,title: 'B11. Village/city/town:',initialValue: village,onChanged: (val){
                         setState(() {
                           village = val;
                         });
                       },items: controller.villageList, itemLabel:(item) => item.locationName ??'',),
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B12. Patient’s mobile number: ',initialValue: '787565657',onChanged: (val){},type: MInputType.numeric,),
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B14. Alternate mobile number to contact (relative) (10 digit):',initialValue: '787565657',onChanged: (val){},type: MInputType.numeric,),
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B14. Name of the contact person/VNH/Asha worker: ',initialValue: 'bhuvan',onChanged: (val){},),
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B14. Relationship: ',initialValue: 'friend',onChanged: (val){},),
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B13.Patient’s alternate number:',initialValue: '787565657',onChanged: (val){},type: MInputType.numeric,),
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B15 Total number of years of formal education:', initialValue: '33', onChanged: (val){},type: MInputType.numeric,),
                       MRowTextRadioWidget(enabled: isEnabled,title: 'B16 Occupation of patient: ',initialValue: 'Home Maker',options:item,onChanged:(val){},),
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B17 Total number of years of formal education of husband: (Zero for Illiterates) ', initialValue: '33', onChanged: (val){},type: MInputType.numeric,),
                       MRowTextRadioWidget(enabled: isEnabled,title: 'B18 Occupation of husband : ',initialValue: 'Home Maker',options:item,onChanged:(val){},),
                       MRowTextRadioWidget(enabled: isEnabled,title: 'B19 Socio-economic status: ',initialValue: 'Home Maker',options:['Above poverty line ', 'Below poverty line'],onChanged:(val){},),
                       MrowTextTextFieldWidget(enabled: isEnabled,title: 'B20. Mention any additional details: ',initialValue: 'No',onChanged: (val){},),
                      Space(20),
                       FilledButton(onPressed: (){
                         isEnabled? context.push(Routes.Home):context.showSnackBar('Please fill all the fields');}, child: isEnabled ? Text('Submit'): Text('Edit'))
                       ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),

    ));
  }
}
