import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:npac/Forms/Form3/controller/Form3DrugController.dart';
import 'package:npac/Forms/FormN/DrugModel/DrugModel.dart';
import 'package:npac/Forms/FormN/DrugModel/UserDrugModel.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextDropDown.dart';

class MN1Body extends StatefulWidget {
  final String? title;
  final String? textTitle;
  final bool? isEnable ;
  final List<String>? options;
  final int? visitNo;

  final Function(Map<String, String>)? drugMap ;
  const MN1Body({super.key, this.title, this.options, this.drugMap, this.textTitle, this.isEnable, this.visitNo});

  @override
  State<MN1Body> createState() => _MN1BodyState();
}

class _MN1BodyState extends State<MN1Body> {
  Form3DrugController controller = Get.put(Form3DrugController());
  Rx<UserDrugModel> selectedValue = UserDrugModel().obs;

  RxList<UserDrugModel> drugList = <UserDrugModel>[].obs;
  Map<String, String> drugMap = {};
  bool isExpanded = false;
  List<String> wantText =['Statins','Vaccinations','Chronic Disease Medications','Other ARBs','Other ACEIs','Other diuretics','Other BB'];

  @override
  void initState() {
    getvalue();
    super.initState();
  }

  void getvalue()async{
    await controller.getDrug();
    await controller.getUserDrug(widget.visitNo ?? 3);
    drugList.value = controller.UserdrugList.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MText(text:widget.title ?? 'N1 PRE-PREGNANCY',),
            IconButton(onPressed: (){
              setState(() {
                isExpanded = !isExpanded;
              });
            }, icon: isExpanded ? Icon(Icons.arrow_drop_up) : Icon(Icons.arrow_drop_down,))
          ],
        ),
          isExpanded?  Column(
            children: [
          Space(),
            Obx(()=>ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children:drugList.map((e) {
                    return Column(
                      key: ValueKey(e.prescriptionId ?? 0),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MText(text: '${e.drugName}',),
                            Row(
                              children: [
                                IconButton(onPressed: (){
                                  controller.uploadDrug(widget.visitNo ?? 3 ,e);
                                  drugList.value = controller.UserdrugList.value;
                                }, icon: Icon(Icons.save)),
                                Space(),
                                IconButton(onPressed: (){
                                  controller.deleteDrug(widget.visitNo ?? 3 ,e.prescriptionId ?? 0);
                                  drugList.value = controller.UserdrugList.value;
                                  // drugList.remove(e);
                                  // widget.drugMap?.call(drugMap);
                                }, icon: Icon(Icons.delete)),
                              ],
                            )
                          ],
                        ),
                        e.drugName =='Others'?  MrowTextTextFieldWidget(title: 'Specify',initialValue: e.otherDrugName,type: MInputType.text,onChanged: (val){},isneedDivider: false,): Container(),
                        MrowTextTextFieldWidget(enabled: widget.isEnable,title: '${e.drugName} Dose',initialValue: '${e.dosage}',isneedDivider: false,type: MInputType.numeric,onChanged: (val){
                        },),
                        MRowTextDropDown(title: '${e.drugName} Frequency',enabled: widget.isEnable,initialValue: '${e.frequency}',items: ['OD','BID','TID','QID','Stat','SOS'],isneedDivider: false,onChanged: (val){},),
                        MRowTextDropDown(title: '${e.drugName} Route',enabled: widget.isEnable,isneedDivider: false,initialValue: e.roaValue,onChanged: (val){},items: ['Oral','IV Infusion','Subcutaneous','Intramuscular',]),
                        MrowTextTextFieldWidget(title: '${e.drugName} Duration advised',enabled: widget.isEnable,initialValue: '${e.numberOfDays}',isneedDivider: false,type: MInputType.numeric,onChanged: (val){},),
                        // Space(),
                      ],
                    );
                  }).toList(),
                ),
            ),
              Space(),
              drugList.length > 0 ? MDivider(): Container(),
            Obx(()=> selectedValue.value.drugName != null &&selectedValue.value.drugName != '' ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MText(text: selectedValue.value.drugName,),
                    IconButton(onPressed: (){
                      selectedValue.value = UserDrugModel();
                    }, icon: Icon(Icons.delete))
                  ],
                ),
                selectedValue.value.drugName =='Others'? MrowTextTextFieldWidget(title: 'Specify',enabled: widget.isEnable,initialValue: selectedValue.value.otherDrugName,type: MInputType.text,onChanged: (val){
                  selectedValue.value.otherDrugName = val;
                },isneedDivider: false,): Container(),
                MrowTextTextFieldWidget(enabled: widget.isEnable,title: '${selectedValue.value.drugName} Dose',initialValue: selectedValue.value.dosage != null ? '${selectedValue.value.dosage}': '',isneedDivider: false,type: MInputType.numeric,onChanged: (val){
                  selectedValue.value.dosage = int.tryParse(val);
                  widget.drugMap?.call(drugMap);
                },),
                MRowTextDropDown(title: '${selectedValue.value.drugName} Frequency',enabled: widget.isEnable,initialValue: selectedValue.value.frequency,items: ['OD','BID','TID','QID','Stat','SOS'],isneedDivider: false,onChanged: (val){
                  selectedValue.value.frequency = val;
                },),
                MRowTextDropDown(title: '${selectedValue.value.drugName} Route',enabled: widget.isEnable,initialValue: selectedValue.value.roaValue,isneedDivider: false,onChanged: (val){
                  selectedValue.value.roaValue = val;
                },items: ['Oral','IV Bolus','Infusion','Subcutaneous','Intramuscular',]),
                MrowTextTextFieldWidget(title: '${selectedValue.value.drugName} Duration advised',enabled: widget.isEnable,isneedDivider: false,type: MInputType.numeric,onChanged: (val){
                  selectedValue.value.numberOfDays = int.tryParse(val);
                },),
                Space(),
                FilledButton(onPressed: () async {
                 if( drugList.contains(selectedValue.value)==false ) {
                   await controller.uploadDrug(widget.visitNo ?? 3, selectedValue.value);
                   drugList.value = controller.UserdrugList.value;
                   // drugList.add(UserDrugModel(drugName: selectedValue.value.drugName,));
                   selectedValue.value = UserDrugModel();
                   // widget.drugMap?.call(drugMap);
                 }else{
                   selectedValue.value = UserDrugModel();
                 }
                }, child: Text('Save'))
              ],): Container(),
            ),
              Obx(
              ()=>MrowTextSingleOption<DrugModel>(enabled: widget.isEnable,title: widget.textTitle ?? 'DRUG',isneedDivider: false,onChanged: (val){
                if(drugList.map((e) => e.drugName).contains(val.drugName)==false) {
                  selectedValue.value = UserDrugModel(drugName: val.drugName,);

                }else{
                  context.showSnackBar('Drug Already added');
                }
                // drugList.add(val);
              },items: controller.drugList.value ?? [],),
              ),
          ],): Container(),
          MDivider(),
      ],);
  }
}
