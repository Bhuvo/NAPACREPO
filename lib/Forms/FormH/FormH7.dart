import 'package:flutter/material.dart';
import 'package:npac/Forms/CommonModelController/EchoImage/EchoImageModel.dart';
import 'package:npac/Forms/FormH/Controller/FormKController.dart';
import 'package:npac/Forms/FormH/Model/FormK7Model.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextRadioWidget.dart';

class FormH7 extends StatefulWidget {
  final bool? enabled;
  final Rx<FormK7Model>? formK7Data;
  final  RxList<EchoImageModel>? otherImage;
  final Function()? onChanged;
  const FormH7({super.key, this.enabled, this.formK7Data, this.otherImage, this.onChanged});

  @override
  State<FormH7> createState() => _FormH7State();
}

class _FormH7State extends State<FormH7> {
  bool isDead = false;
  bool isDischarge = false;
  bool isDeadDetails =false;
  // bool isOther = false;
  // bool isEstablished = false;

  // FormKController controller = Get.put(FormKController());

  @override
  void initState() {
    super.initState();
  }

  void getData(){
    widget.formK7Data?.value.finalOutcomeValue == 'Death' ? isDead =true : isDead= false;
    widget.formK7Data?.value.finalOutcomeValue == 'Discharge' ? isDischarge =true : isDischarge= false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Column(children: [
          MRowTextRadioWidget(enabled: widget.enabled,title: 'K9. FINAL OUTCOME',initialValue: widget.formK7Data?.value.finalOutcomeValue,onChanged: (val){
            if(val =='Death'){
              setState(() {
                isDead = true;
              });
            }else{
              setState(() {
                isDead = false;
              });
            }
            if(val =='Discharge'){
              setState(() {
                isDischarge = true;
              });
            }else{
              setState(() {
                isDischarge = false;
              });
            }
            widget.formK7Data?.value.finalOutcomeValue = val;
          },options: ['Death', 'Discharge'],isneedDivider: false,),
          isDead? Column(
            children: [
              MrowTextDatePickerWidget(enabled: widget.enabled,title: 'K9.2.1 Date of death:',initialDate: stringToDate(widget.formK7Data?.value.dateOfDeath ?? ''),onChanged: (val){
                widget.formK7Data?.value.dateOfDeath = dateToString(val);
              },),
              MRowTextRadioWidget(enabled: widget.enabled,title: 'K9.2.2 DEATH DETAILS: (Death Summary)',onChanged: (val){
                val == 'Yes' ? isDeadDetails = true : isDeadDetails = false;
                setState(() {});
                              },isneedDivider: false,),
              isDeadDetails ? Column(children: [
                Column(
                  key: ValueKey('${widget.otherImage?.length}'),
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  children:widget.otherImage?.map((element) => Builder(
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
                  )).toList() ?? [],
                ),
                MFilledButton(text: 'Upload Death Summary',onPressed:widget.onChanged,),
              ],): Container(),
              Space(),
              MDivider(),
              Space(),
            ],
          ):  Container(),
          isDischarge?Obx(
            ()=> Column(children: [
              MSmallText(text: 'K9.1. DISCHARGE DETAILS',),
              Space(),
              MrowTextDatePickerWidget(enabled: widget.enabled,title: 'K9.1.1 Date of Discharge: ',initialDate: stringToDate(widget.formK7Data?.value.dateOfDischarge ?? ''),onChanged: (val){
                widget.formK7Data?.value.dateOfDischarge = dateToString(val);
              },),
              MrowTextTextFieldWidget(enabled: widget.enabled,title: 'K9.1.2 Duration of stay:',initialValue: widget.formK7Data?.value.durationOfStay,onChanged: (val){
                widget.formK7Data?.value.durationOfStay = val;
              },),
              MRowTextRadioWidget(enabled: widget.enabled,title: 'K9.1.3  NYHA Class at discharge',initialValue: widget.formK7Data?.value.functionalClass,onChanged: (val){
                widget.formK7Data?.value.functionalClass = val;
              },options: List_items.NYHAClass,),
              MRowTextRadioWidget(enabled: widget.enabled,title: 'K9.1.4 Mode of Contraception advised / provided: ',initialValue: widget.formK7Data?.value.contraceptionUsed,onChanged: (val){
                // if(val =='Others'){
                //   setState(() {
                //     isOther = true;
                //   });
                // }else{
                //   setState(() {
                //     isOther = false;
                //   });
                // }
                // widget.formK7Data?.refresh();
                widget.formK7Data?.update((value) {
                  widget.formK7Data?.value.contraceptionUsed= val;
                });
                // print('$val ${widget.formK7Data?.value.contraceptionUsed}');
              },options:['Nil','IUCD','OCP','Barrier method','Tubectomy','Others'],isneedDivider: false,),
              widget.formK7Data?.value.contraceptionUsed == 'Others'? MTextField(enabled: widget.enabled,label: 'If Other Specify',initalValue: widget.formK7Data?.value.contraceptionUsedOthersValue,onChanged: (val){
                widget.formK7Data?.value.contraceptionUsedOthersValue = val;
              },): Container(),
              MDivider(),
              MRowTextRadioWidget(enabled: widget.enabled,title: 'K9.1.4 Breast feeding:',initialValue: widget.formK7Data?.value.breastFeeding,onChanged: (val){
                // val =='Established'? isEstablished = true : isEstablished = false;
                widget.formK7Data?.value.breastFeeding = val;
                setState(() {});
              },options: ['Established','Not established'],),
              widget.formK7Data?.value.breastFeeding =='Established' ? MTextField(label: 'Postnatal day at which established',initalValue: widget.formK7Data?.value.breastFeedingDay,onChanged: (val){
                widget.formK7Data?.value.breastFeedingDay = val;
              },): Container(),
              MrowTextDatePickerWidget(enabled: widget.enabled,title: 'K9.1.5  Next follow up date advised',initialDate: stringToDate(widget.formK7Data?.value.nextFollowupDate ?? ''),onChanged: (val){
                widget.formK7Data?.value.nextFollowupDate = dateToString(val);
              },),
              MrowTextTextFieldWidget(enabled: widget.enabled,title: 'K10 Any other relevant information/ remarks:',initialValue: widget.formK7Data?.value.otherInformation,onChanged: (val){
                widget.formK7Data?.value.otherInformation = val;
              },),
             MrowTextTextFieldWidget(title: 'verification of Site Principal investigator/ Investigator',enabled: widget.enabled,onChanged: (val){

             },)
             // MFilledButton(text: 'submit',onPressed: (){context.push(Routes.Home);},)
            ],),
          ):  Container(),
         // MFilledButton(text: 'submit',onPressed: (){context.push(Routes.Home);},)
        ],),
    );
  }
}
