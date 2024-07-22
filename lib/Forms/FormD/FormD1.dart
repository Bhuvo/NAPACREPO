import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class FormD1 extends StatefulWidget {
  const FormD1({super.key});

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


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MScaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MAppBar(title: 'D. Current Pregnancy (FORM D)',)),

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
        // FormD4(isEnabled:isEnabled ,),
        Space(),
        Text('PRESENT PREGNANCY DETAILS', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        Space(),
        Text('D1 ANTENATAL DETAILS', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        Space(),
        const Divider(thickness: 1,height: 3,),
        MRowTextDropDown(enabled: isEnabled,title: 'D1.1 Gestational age at  Enrolment(Weeks)',onChanged: (val){},),
        MrowTextDatePickerWidget(enabled: isEnabled,title: ' D1.2 Date:',onChanged: (val){},),
        MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){},title: 'D1.3 Conception:',options: List_items.conception,),
        MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){},title: 'D1.4 Preconception counselling: '),
        Column(
          children: [
            Row(
              children: [
                Text('D1.5 Obstetric score :'),
              ],
            ),
            MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'G :',isneedDivider: false,type: MInputType.numeric,),
            MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'P :',isneedDivider: false,type: MInputType.numeric,),
            MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'L :',isneedDivider: false,type: MInputType.numeric,),
            MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'A :',isneedDivider: false,type: MInputType.numeric,),
            MDivider()
          ],
        ),
        MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){},title: 'D1.6 Pregnancy type:',options: List_items.YesNoDetails,),
        MrowTextDatePickerWidget(enabled: isEnabled,onChanged: (val){
          setState(() {
            Lmp = val;
          });
        },title: 'D1.7 LMP:',initialDate: DateTime.now(),),
        MrowTextDatePickerWidget( key: ValueKey('${ addMonthsAndDays(Lmp)}'),enabled: isEnabled,onChanged: (val){},title: 'D1.8 EDD:',initialDate: addMonthsAndDays(Lmp),),
       MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
         setState(() {
           AntenatalCheck = val == 'Yes' ? true : false;
         });
       },title: 'D1.9 Antenatal Check up:',isneedDivider: false,),
       if(AntenatalCheck) Column(children: [
         MrowTextDatePickerWidget(enabled: isEnabled, onChanged: (val){},title: 'D1.9.1 When was the first AN visit done ',initialDate: DateTime.now(),isneedDivider: false,),
         MRowTextRadioWidget(enabled: isEnabled, onChanged: (val){},title: 'D1.9.2 Where was the first AN visit done:', options:List_items.AntenatalCheckUpPlace,isneedDivider: false),
         MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'D1.9.3 When first visit to a centre with cardiac support done(weeks): ',isneedDivider: false,),
       ],),
        MDivider(),
        MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){},title: 'D1.10 Current pregnancy con:nued Against Medical Advice:  ',),
        MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){setState(() {
          if(val == 'Yes'){
            setState(() {
              isinterventions = true;
            });
          }else{
            setState(() {
              isinterventions = false;
            });
          }
        });},isneedDivider: isinterventions ? false : true ,title: 'D1.11  Any antenatal interventions done during current pregnancy (If yes, kindly specify):',),
        isinterventions ? MTextField(enabled: isEnabled,onChanged: (val){},label:'(If yes, kindly specify)' ,) : Container(),
      MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){},title: 'D2 NYHA SYMPTOMS CLASS: ',options: List_items.NYHAClass,),
        Row(
          children: [
            Text('D3 CLINICAL SIGNS'),
          ],
        ),
        Space(),
        MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'D3.1 Height (cm):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'D3.2 Weight (kg):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'D3.3 SPO2 (%):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'D3.4 HR (/min):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'D3.5 BP (mm Hg):',isneedDivider: false,type: MInputType.numeric,),
        MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){},title: 'D3.6 CCF: ',isneedDivider: false,),
        MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){},title: 'D3.7 Cyanosis: ',isneedDivider: false,),
        MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){},title: 'D3.8 Cardiac murmur:',isneedDivider: false,),
        MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){},title: 'D3.9 Fetal assessment (per abdomen exam): ', options: List_items.assessment,isneedDivider: false,),
        const Divider(thickness: 1,height: 3,),
      Row(
        children: [
          Text('D4 BASELINE INVESTIGATIONS:'),
        ],
      ),
        Space(),
        MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){},title: 'D4.1 GTT ', options: List_items.GTT,isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'D4.2 Blood Urea (mg/dl):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'D4.3 Sr. Creatinine (mg/dl):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'D4.4 TSH (IU/mL):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget( enabled: isEnabled,onChanged: (val){},title: 'D4.5 Hb(g/dl) ',isneedDivider: false,type: MInputType.decimal,),
        MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'D4.6 Hct/PCV:',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'D4.7 BNP (pg/ml):',maxLength: 3,isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget( enabled: isEnabled,onChanged: (val){},title: 'D4.8 NT-pro BNP (pg/ml)',maxLength: 3,isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: isEnabled, onChanged: (val){},title: 'D4.9 Other relevant investigations (if any)',isneedDivider: false,type: MInputType.numeric,),
       const Divider(thickness: 1,height: 3,),
        MrowTextDatePickerWidget(enabled: isEnabled,onChanged: (val){},title: 'D4.9 ECG Date:',isneedDivider: false,),
        MRowTextRadioWidget(enabled: isEnabled,onChanged: (val){
          setState(() {
            AbnormalEcg = val == 'Abnormal' ? true : false;
          });
        },title: 'ECG status', options: ['Normal','Abnormal'],isneedDivider: false,),
        AbnormalEcg ? MFilledButton(text: 'Upload ECG',onPressed: (){},): Container(),
     Space(),
     MDivider(),
     Space(),
     // Container(width:  double.infinity, child: FilledButton(onPressed: (){context.push(Routes.FormD2);}, child: Text('Next')))
        FormD2(enabled: isEnabled,isPrimaryDiagnosisAortopathies: (val){
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
         FormD3(enabled: isEnabled,isAortaAbnormal: (val){
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
            FormD4(isEnabled: isEnabled),
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
            FormD5(isEnabled: isEnabled),
            FormJ1(enabled: isEnabled),
          ],
        ) : Container(),
        isPrimaryDiagnosisAortopathies|| isAortaAbnormal ? FormD6(isEnabled:isEnabled ): Container(),
        isPrimaryDiagnosisAortopathies? FormK1(isEnabled: isEnabled,isEcho: (val){
          setState(() {
            isEcho = val;
          });
        },) : Container(),
        isPrimaryDiagnosisCardiomyopathy ||isEcho? FormD7(isEnabled: isEnabled,) : Container(),
        isPrimaryDiagnosisVenous ||isAnEcoagulant? FormI2(isEnabled:isEnabled,) : Container(),
        FormD8(isEnabled: isEnabled,),
        FormD9(isEnabled: isEnabled),
        MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},),
      ],
      ),
    ));
  }
}
