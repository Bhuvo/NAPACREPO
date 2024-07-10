import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:npac/Forms/FormF/FormF1.dart';
import 'package:npac/Forms/FormF/widget/ValueFunction.dart';
import 'package:npac/Forms/FormG/Controller/AntenalFormJController.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextDropDown.dart';
import 'package:npac/common_widget/MSmallText.dart';

class FormG1 extends StatefulWidget {
  const FormG1({super.key});

  @override
  State<FormG1> createState() => _FormG1State();
}

class _FormG1State extends State<FormG1> {
  AntenalFormJController formGController = Get.put(AntenalFormJController());

  RxList<String> MitralSelectedList = <String>[].obs;
  RxList<String> AorticSelectedList = <String>[].obs;
  List<String> TricuspidSelectedList = <String>[].obs;
  List<String> PulmonarySelectedList = <String>[].obs;
  List<String> PericardialOtherSelectedList = <String>[].obs;
  List<String> HypoSelectedList = <String>[].obs;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData()async{
    await formGController.getFormFData(context,7964);
    await formGController.getEcho();
    await formGController.getOutCome();
    formGController.FormJData.value.valveMitralStenotic ?? false ? isMitralStenotic = true :null;
    formGController.FormJData.value.valveMitralRegurgitant ?? false ? isMitralRegurgitant = true :null;
    formGController.FormJData.value.valveMitralStenotic ?? false ? MitralSelectedList.add('Stenotic') :null;
    formGController.FormJData.value.valveMitralRegurgitant ?? false ? MitralSelectedList.add('Regurgitant') :null;
    formGController.FormJData.value.valveAorticStenotic ?? false ? AorticSelectedList.add('Stenotic') :null;
    formGController.FormJData.value.valveAorticRegurgitant ?? false ? AorticSelectedList.add('Regurgitant') :null;
    formGController.FormJData.value.valveTricuspidStenotic ?? false ? TricuspidSelectedList.add('Stenotic') :null;
    formGController.FormJData.value.valveTricuspidRegurgitant ?? false ? TricuspidSelectedList.add('Regurgitant') :null;
    formGController.FormJData.value.valvePulmonaryStenotic ?? false ? PulmonarySelectedList.add('Stenotic') :null;
    formGController.FormJData.value.valvePulmonaryRegurgitant ?? false ? PulmonarySelectedList.add('Regurgitant') :null;
    formGController.FormJData.value.othersVegetations ?? false ? PericardialOtherSelectedList.add('Vegetations') :null;
    formGController.FormJData.value.othersVegetations ?? false ? PericardialOtherSelectedList.add('Thrombus') :null;
    formGController.FormJData.value.wallMotionHypoGlobal ?? false ? PericardialOtherSelectedList.add('Global') :null;
    formGController.FormJData.value.wallMotionHypoRegional ?? false ? PericardialOtherSelectedList.add('Regional') :null;
    print('AorticSelectedList ${AorticSelectedList}');
    setState(() {
    });

  }

  bool isMitralStenotic = false;
  bool isMitralRegurgitant = false;
  bool isAssignment = false;
  bool isEcgAbnormal = false;
  bool isEnabled = false;


  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'FORM J- ANTENATAL REVISIT-2 ',),

      body: Obx(()=>MFormBody(Childrens: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      isEnabled = !isEnabled;
                    });
                  },
                  icon: isEnabled ? Icon(Icons.save) : Icon(Icons.edit))
            ],
          ),
          MRowTextDropDown(initialValue:'${formGController.FormJData.value.periodOfGestation??''}' ,enabled: isEnabled,title: 'J1 Period of gestation (in completed weeks):',onChanged: (val){
            formGController.FormJData.value.periodOfGestation = int.parse(val);
          },),
          MRowTextRadioWidget(enabled: isEnabled,title: 'J2 Trimester:',initialValue: formGController.FormJData.value.trimester,onChanged: (val){
            formGController.FormJData.value.trimester = val;
          },options: ['First','Second','Third']),
          MRowTextRadioWidget(enabled: isEnabled,title: 'J3 NYHA SYMPTOMS CLASS:',initialValue: formGController.FormJData.value.nyhaSymptomsClass,onChanged: (val){
            formGController.FormJData.value.nyhaSymptomsClass = val;
          },options:List_items.NYHAClass),
          MSmallText(text: 'J4 CLINICAL SIGNS & ECG',),
          Space(),
          MrowTextTextFieldWidget(enabled: isEnabled, title: 'J4.1 Weight (Kg):',initialValue: formGController.FormJData.value.clinicalSignWeight,type: MInputType.numeric,onChanged: (val){
            formGController.FormJData.value.clinicalSignWeight = val;
          },isneedDivider: false,),
          MrowTextTextFieldWidget(enabled: isEnabled, title: 'J4.2 HR (/min):',initialValue: formGController.FormJData.value.clinicalSignHR,type: MInputType.numeric,onChanged: (val){
            formGController.FormJData.value.clinicalSignHR = val;
          },isneedDivider: false,),
          MrowTextTextFieldWidget( enabled: isEnabled,title: 'J4.3 SPO2 (%):',initialValue: formGController.FormJData.value.clinicalSignSp,type: MInputType.numeric,onChanged: (val){
            formGController.FormJData.value.clinicalSignSp = val;
          },isneedDivider: false,),
          MrowTextTextFieldWidget( enabled: isEnabled,title: 'J4.4 BP (mm Hg):',initialValue: formGController.FormJData.value.clinicalSignBp,type: MInputType.numeric,onChanged: (val){
            formGController.FormJData.value.clinicalSignBp = val;
          },isneedDivider: false,),
          MRowTextRadioWidget(enabled: isEnabled,title: 'J4.5 Heart Failure:',initialValue: formGController.FormJData.value.clinicalSignCcf,isneedDivider: false,onChanged: (val){
            formGController.FormJData.value.clinicalSignCcf = val;
          },),
          MRowTextRadioWidget(enabled: isEnabled,title: 'J4.6 Cyanosis:',initialValue: formGController.FormJData.value.clinicalSignCyanosis,isneedDivider: false,onChanged: (val){
            formGController.FormJData.value.clinicalSignCyanosis = val;
          },),
          MRowTextRadioWidget(enabled: isEnabled,title: 'J4.7 Cardiac murmur:',initialValue: formGController.FormJData.value.clinicalSignCardiacMurmur,isneedDivider: false,onChanged: (val){
            formGController.FormJData.value.clinicalSignCardiacMurmur = val;
          },),
          MrowTextDatePickerWidget(enabled: isEnabled,title: 'J5 ECG Date:',initialDate: stringToDate(formGController.FormJData.value.ecgDate ?? ''),onChanged: (val){
            formGController.FormJData.value.ecgDate = dateToString(val);
          },isneedDivider: false,),
          MRowTextRadioWidget(enabled: isEnabled,options:List_items.NormalAbnormal,initialValue: formGController.FormJData.value.ecgNormalAbnormal ,onChanged: (val){
            // val =='Abnormal' ? isEcgAbnormal = true : isEcgAbnormal = false;
            setState(() {
              formGController.FormJData.value.ecgNormalAbnormal = val;
            });
          },),
          formGController.FormJData.value.ecgNormalAbnormal == 'Abnormal' ?Column(children: [
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: formGController.echoModel.map((element) => Builder(
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
            MFilledButton(text: 'Upload ECG',isLoading: formGController.isEcoLoading.value,onPressed: (){
              formGController.uploadEcho(context);
            },),
          ],): Container(),
          MSmallText(text:'J6 ECHOCARDIOGRAPHIC ASSESSMENT'),
          Space(),
          MRowTextRadioWidget(enabled: isEnabled,initialValue: formGController.FormJData.value.significantChanges,title: 'Any significant change from previous echo',onChanged: (val){
            // val =='Yes' ? isAssignment = true : isAssignment = false;
           setState(() {
             formGController.FormJData.value.significantChanges = val;
           });
          },),
          formGController.FormJData.value.significantChanges == 'Yes' ? Column(children: [
           MSmallText(text: 'Ventricular Function',),
           Space(),
           MRowTextRadioWidget(enabled: isEnabled,title: 'Wall Motion:',initialValue: formGController.FormJData.value.wallMotion,onChanged: (val){
             formGController.FormJData.value.wallMotion = val;
           },isneedDivider: false,options: ['Normal','Hypo / akinesia'],),
           MRowTextCheckBox(enabled: isEnabled,selectedlist: HypoSelectedList,list: ['Global','Regional'],result: (val){
             val.contains('Global') ?formGController.FormJData.value.wallMotionHypoGlobal = true : formGController.FormJData.value.wallMotionHypoGlobal = false;
             val.contains('Regional') ?formGController.FormJData.value.wallMotionHypoRegional = true : formGController.FormJData.value.wallMotionHypoRegional = false;
           },),
           Space(),
           MSmallText(text: 'LV systolic function',),
           Space(),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Diastole(mm):',initialValue: formGController.FormJData.value.lVIDDiastole,onChanged: (val){
             formGController.FormJData.value.lVIDDiastole = val;
           },type: MInputType.numeric,isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Systole(mm):',initialValue: formGController.FormJData.value.lVIDSystole,onChanged: (val){
             formGController.FormJData.value.lVIDSystole = val;
           },type: MInputType.numeric,isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'EF%:',initialValue: formGController.FormJData.value.lVEfPercent,onChanged: (val){
             formGController.FormJData.value.lVEfPercent = val;
           },type: MInputType.numeric),
           Space(),
           MSmallText(text: 'RV systolic function',),
           Space(),
           MRowTextRadioWidget(enabled: isEnabled,options: List_items.NormalAbnormal ,initialValue: formGController.FormJData.value.rvNormalAbnormal,onChanged: (val){
             formGController.FormJData.value.rvNormalAbnormal = val;
           },isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'TAPSE (mm)',initialValue: formGController.FormJData.value.rvTapse,onChanged: (val){
             formGController.FormJData.value.rvTapse = val;
           },type: MInputType.numeric,isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'Sa’',initialValue: formGController.FormJData.value.rvRvs,onChanged: (val){
             formGController.FormJData.value.rvRvs = val;
           },type: MInputType.numeric),

           MRowTextRadioWidget(enabled: isEnabled,title: 'Pericardial effusion',initialValue: formGController.FormJData.value.pericardialEffusion,onChanged: (val){
             formGController.FormJData.value.pericardialEffusion = val;
           },options: ['Mild','Moderate','Massive','Tamponade'],),
           MRowTextCheckBox(enabled: isEnabled,title: 'Others ',selectedlist: PericardialOtherSelectedList,list: ['Vegetations','Thrombus'],result: (val){
             val.contains('Vegetations') ? formGController.FormJData.value.othersVegetations = true :  formGController.FormJData.value.othersVegetations = false;
             val.contains('Thrombus') ?  formGController.FormJData.value.othersThrombus = true :  formGController.FormJData.value.othersThrombus = false;
           },),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'Any other salient Echo Findings:',initialValue: formGController.FormJData.value.otherEchoFindings,onChanged: (val){
             formGController.FormJData.value.otherEchoFindings = val;
           },),
           MText(text: 'Pulmonary Pressure',),
           Space(),
           // MrowTextTextFieldWidget(enabled: isEnabled,title: 'Tricuspid regurgitation ',initialValue: formGController.FormJData.value.pu,onChanged: (val){},isneedDivider: false,),
           // MrowTextTextFieldWidget(enabled: isEnabled,title: 'Pulmonary regurgitation ',onChanged: (val){},isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'TRPG (mmHg):',initialValue: formGController.FormJData.value.Trpg,onChanged: (val){
             formGController.FormJData.value.Trpg = val;
           },isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'Peak PR (mmHg):',initialValue: formGController.FormJData.value.PeakPr,onChanged: (val){
             formGController.FormJData.value.PeakPr = val;
           },isneedDivider: false,),
           MrowTextTextFieldWidget(enabled: isEnabled,title: 'PAT(msec)',initialValue: formGController.FormJData.value.Pat,onChanged: (val){
             formGController.FormJData.value.Pat = val;
           },),
           MText(text: 'VALVE FUNCTION',),
           Space(),
           MRowTextRadioWidget(enabled: isEnabled,title: 'Mitral',initialValue: (formGController.FormJData.value.valveMitralNormal ?? false) ?'Normal':'Abnormal',onChanged: (val ){
             val == 'Normal' ? formGController.FormJData.value.valveMitralNormal = true : formGController.FormJData.value.valveMitralNormal = false;
             setState(() {});
           },options: ['Normal','Abnormal'],isneedDivider: false,),
            !(formGController.FormJData.value.valveMitralNormal ?? false )? MRowTextCheckBox(enabled: isEnabled,list: List_items.ValuFunction,
             result: (val){
               if(val.contains('Stenotic')){
                 setState(() {
                   isMitralStenotic = true;
                 });
               }else{
                 setState(() {
                   isMitralStenotic = false;
                 });
               }
               if(val.contains('Regurgitant')){
                 setState(() {
                   isMitralRegurgitant = true;
                 });
               }else{
                 setState(() {
                   isMitralRegurgitant = false;
                 });
               }
             },isneedDivider: isMitralStenotic ||isMitralRegurgitant ?false  : true,):Container(),
           isMitralStenotic ?  MRowTextRadioWidget(enabled: isEnabled,title: 'Tricuspid',initialValue: formGController.FormJData.value.valveMitralStenoticMild ?? false ?'Mild':'Moderate',onChanged: (val ){},options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
           isMitralStenotic ?  MrowTextTextFieldWidget(enabled: isEnabled,title: 'MVOA (cm2) ',initialValue: formGController.FormJData.value.valveMitralMvoa,onChanged: (val ){
             formGController.FormJData.value.valveMitralMvoa = val;
           },isneedDivider: false,) : Container(),
           isMitralRegurgitant ?  MRowTextRadioWidget(enabled: isEnabled,title: 'Regurgitant',initialValue: formGController.FormJData.value.valveMitralRegurgitantMild ?? false ?'Mild':'Moderate',onChanged: (val ){},options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
           isMitralStenotic ||isMitralRegurgitant ? MDivider(): Container(),
           Space(),
            ValueFunction(key: Key('Aortic'), enabled: isEnabled, title: 'Aortic', radioInitialValue: formGController.FormJData.value.valveAorticNormal ?? false ? 'Normal' : 'Abnormal',
              MGInitialValue: formGController.FormJData.value.avgMg,
              PGInitialValue: formGController.FormJData.value.avgPg,
              StenoticInitialValue: formGController.FormJData.value.valveAorticStenoticMild ?? false ? 'Mild' : 'Moderate',
              regurgitantInitialValue: formGController.FormJData.value.valveAorticRegurgitantMild ?? false ? 'Mild' : 'Moderate',
              selectedlist: AorticSelectedList,
              checkboxValue: (val) {
                formGController.FormJData.value.valveAorticStenotic = val;
              },
              checkboxValueRegurgitant: (val) {
                formGController.FormJData.value.valveAorticRegurgitant = val;
              },
              MG: (val) {
                formGController.FormJData.value.avgMg = val;
              },
              PG: (val) {
                formGController.FormJData.value.avgPg = val;
              },
              RegurgitantradioOnchange: (val) {
                formGController.FormJData.value.valveAorticRegurgitantMild = val == 'Mild' ? true : false;
              },
              StenoticradioOnchange: (val) {
                formGController.FormJData.value.valveAorticStenoticMild = val == 'Mild' ? true : false;
              },
              radioValue: (val) {
                formGController.FormJData.value.valveAorticNormal = val == 'Normal' ? true : false;
              },
            ),
            ValueFunction(enabled: isEnabled, title: 'Tricuspid', radioInitialValue: formGController.FormJData.value.valveTricuspidNormal ?? false ? 'Normal' : 'Abnormal',
              MGInitialValue: formGController.FormJData.value.tvgMg,
              PGInitialValue: formGController.FormJData.value.tvgPg,
              StenoticInitialValue: formGController.FormJData.value.valveTricuspidStenoticMild ?? false ? 'Mild' : 'Moderate',
              regurgitantInitialValue: formGController.FormJData.value.valveTricuspidRegurgitantMild ?? false ? 'Mild' : 'Moderate',
              selectedlist: TricuspidSelectedList,
              checkboxValue: (val) {
                formGController.FormJData.value.valveTricuspidStenotic = val;
              },
              checkboxValueRegurgitant: (val) {
                formGController.FormJData.value.valveTricuspidRegurgitant = val;
              },
              MG: (val) {
                formGController.FormJData.value.tvgMg = val;
              },
              PG: (val) {
                formGController.FormJData.value.tvgPg = val;
              },
              RegurgitantradioOnchange: (val) {
                formGController.FormJData.value.valveTricuspidRegurgitantMild = val == 'Mild' ? true : false;
              },
              StenoticradioOnchange: (val) {
                formGController.FormJData.value.valveTricuspidStenoticMild = val == 'Mild' ? true : false;
              },
              radioValue: (val) {
                formGController.FormJData.value.valveTricuspidNormal = val == 'Normal' ? true : false;
              },
            ),
            ValueFunction(enabled: isEnabled, title: 'Pulmonary', radioInitialValue: formGController.FormJData.value.valvePulmonaryNormal ?? false ? 'Normal' : 'Abnormal',
              MGInitialValue: formGController.FormJData.value.pvgMg,
              PGInitialValue: formGController.FormJData.value.pvgPg,
              StenoticInitialValue: formGController.FormJData.value.valvePulmonaryStenoticMild ?? false ? 'Mild' : 'Moderate',
              regurgitantInitialValue: formGController.FormJData.value.valvePulmonaryRegurgitantMild ?? false ? 'Mild' : 'Moderate',
              selectedlist: PulmonarySelectedList,
              checkboxValue: (val) {
                formGController.FormJData.value.valvePulmonaryStenotic = val;
              },
              checkboxValueRegurgitant: (val) {
                formGController.FormJData.value.valvePulmonaryRegurgitant = val;
              },
              MG: (val) {
                formGController.FormJData.value.pvgMg = val;
              },
              PG: (val) {
                formGController.FormJData.value.pvgPg = val;
              },
              RegurgitantradioOnchange: (val) {
                formGController.FormJData.value.valvePulmonaryRegurgitantMild = val == 'Mild' ? true : false;
              },
              StenoticradioOnchange: (val) {
                formGController.FormJData.value.valvePulmonaryStenoticMild = val == 'Mild' ? true : false;
              },
              radioValue: (val) {
                formGController.FormJData.value.valvePulmonaryNormal = val == 'Normal' ? true : false;
              },
            ),
          ],): Container(),
          MRowTextRadioWidget(key:ValueKey('J7 ${formGController.FormJData.value.outComeIdentified}'),enabled: isEnabled,isneedDivider: false,title: 'J7.  Did the patient develop any complication (study outcome) Ell this visit:',initialValue: formGController.FormJData.value.outComeIdentified ?? 'No',onChanged: (val){
                setState(() {
                  formGController.FormJData.value.outComeIdentified = val;
                });
          },),
          Obx(
            ()=> formGController.FormJData.value.outComeIdentified == 'Yes' ? Column(children: [
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: formGController.outCome.map((element) => Builder(
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
             MFilledButton(text: 'Upload ECG',isLoading: formGController.isOutComeUploadLoading.value,onPressed: (){
                  formGController.UploadOutCome(context);
                },),

            ],): Container(),
          ),
          Space(),
          MDivider(),
          Space(),
          // MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},)
          isEnabled? MFilledButton(text: 'Submit',onPressed: () async{
            if(await formGController.upLoadData()){
              setState(() {
                isEnabled = !isEnabled;});
            }else{
              context.showSnackBar('Error while uploading AntenatalVisitOne data');
            }

          },):MFilledButton(text: 'Edit',onPressed: (){
            setState(() {
              isEnabled = !isEnabled;});
          },),
        ],),
      ),
    );
  }
}
