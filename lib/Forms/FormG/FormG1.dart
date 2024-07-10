import 'package:flutter/material.dart';
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
    getdatas();
    super.initState();
  }

  void getdatas()async{
    await formGController.getFormFData(context,7964);
    await formGController.getEcho();
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

      body: MFormBody(Childrens: [
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
        MrowTextTextFieldWidget(enabled: isEnabled, title: 'J4.1 Weight (Kg):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: isEnabled, title: 'J4.2 HR (/min):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget( enabled: isEnabled,title: 'J4.3 SPO2 (%):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget( enabled: isEnabled,title: 'J4.4 BP (mm Hg):',type: MInputType.numeric,onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: isEnabled,title: 'J4.5 Heart Failure:',isneedDivider: false,onChanged: (val){},),
        MRowTextRadioWidget(enabled: isEnabled,title: 'J4.6 Cyanosis:',isneedDivider: false,onChanged: (val){},),
        MRowTextRadioWidget(enabled: isEnabled,title: 'J4.7 Cardiac murmur:',isneedDivider: false,onChanged: (val){},),
        MrowTextDatePickerWidget(enabled: isEnabled,title: 'J5 ECG Date:',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: isEnabled,options:List_items.NormalAbnormal ,onChanged: (val){
          val =='Abnormal' ? isEcgAbnormal = true : isEcgAbnormal = false;
          setState(() {});
        },),
        isEcgAbnormal ?Column(children: [
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
          MFilledButton(text: 'Upload ECG',onPressed: (){
            formGController.uploadEcho();
          },),
        ],): Container(),
        MSmallText(text:'J6 ECHOCARDIOGRAPHIC ASSESSMENT'),
        Space(),
        MRowTextRadioWidget(enabled: isEnabled,title: 'Any significant change from previous echo',onChanged: (val){
          val =='Yes' ? isAssignment = true : isAssignment = false;
         setState(() {});
        },),
        isAssignment ? Column(children: [
         MSmallText(text: 'Ventricular Function',),
         Space(),
         MRowTextRadioWidget(enabled: isEnabled,title: 'Wall Motion:',onChanged: (val){},isneedDivider: false,options: ['Normal','Hypo / akinesia'],),
         MRowTextCheckBox(enabled: isEnabled,list: ['Global','Regional'],result: (val){},),
         Space(),
         MSmallText(text: 'LV systolic function',),
         Space(),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Diastole(mm):',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'LVID Systole(mm):',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'EF%:',onChanged: (val){},type: MInputType.numeric),
         Space(),
         MSmallText(text: 'RV systolic function',),
         Space(),
         MRowTextRadioWidget(enabled: isEnabled,options: List_items.NormalAbnormal ,onChanged: (val){},isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'TAPSE (mm)',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'Sa’',onChanged: (val){},type: MInputType.numeric),
         MRowTextRadioWidget(enabled: isEnabled,title: 'Pericardial effusion',onChanged: (val){},options: ['Mild','Moderate','Massive','Tamponade'],),
         MRowTextCheckBox(enabled: isEnabled,title: 'Others ',list: ['Vegetations','Thrombus'],),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'Any other salient Echo Findings:',onChanged: (val){},),
         MText(text: 'Pulmonary Pressure',),
         Space(),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'Tricuspid regurgitation ',onChanged: (val){},isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'Pulmonary regurgitation ',onChanged: (val){},isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'TRPG (mmHg):',onChanged: (val){},isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'Peak PR (mmHg):',onChanged: (val){},isneedDivider: false,),
         MrowTextTextFieldWidget(enabled: isEnabled,title: 'PAT(msec)',onChanged: (val){},),
         MText(text: 'VALVE FUNCTION',),
         Space(),
         MRowTextRadioWidget(enabled: isEnabled,title: 'Mitral',onChanged: (val ){},options: ['Normal','Abnormal'],isneedDivider: false,),
         MRowTextCheckBox(enabled: isEnabled,list: List_items.ValuFunction,
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
           },isneedDivider: isMitralStenotic ||isMitralRegurgitant ?false  : true,),
         isMitralStenotic ?  MRowTextRadioWidget(enabled: isEnabled,title: 'Tricuspid',onChanged: (val ){},options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
         isMitralStenotic ?  MrowTextTextFieldWidget(enabled: isEnabled,title: 'MVOA (cm2) ',onChanged: (val ){},isneedDivider: false,) : Container(),
         isMitralRegurgitant ?  MRowTextRadioWidget(enabled: isEnabled,title: 'Regurgitant',onChanged: (val ){},options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
         isMitralStenotic ||isMitralRegurgitant ? MDivider(): Container(),
         Space(),
         ValueFunction(enabled: isEnabled,title: 'Aortic',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
         ValueFunction(enabled: isEnabled,title: 'Tricuspid',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),
         ValueFunction(enabled: isEnabled,title: 'Pulmonary',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){},),

       ],): Container(),
        MRowTextRadioWidget(enabled: isEnabled,title: 'J7.  Did the paEent develop any complicaEon (study outcome) Ell this visit:',onChanged: (val){},),
        MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},)
      ],),
    );
  }
}
