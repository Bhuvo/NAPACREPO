import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextRadioWidget.dart';
import 'package:npac/utils/navigator_utils.dart';

class FormD1 extends StatefulWidget {
  const FormD1({super.key});

  @override
  State<FormD1> createState() => _FormD1State();
}

class _FormD1State extends State<FormD1> {

  bool AntenatalCheck =false;
  bool isinterventions = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MScaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MAppBar(title: 'D. FIRST VISIT PAGE (FORM D)',)),

      body: MFormBody(Childrens: [
        Space(),
        Text('PRESENT PREGNANCY DETAILS', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        Space(),
        Text('D1 ANTENATAL DETAILS', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        Space(),
        const Divider(thickness: 1,height: 3,),
        MRowTextRadioWidget(onChanged: (val){},title: 'D1.1 Conception:',options: List_items.conception,),
        MRowTextRadioWidget(onChanged: (val){},title: 'D1.2 Preconception counselling: '),
        Column(
          children: [
            Text('D1.3 Obstetric score :'),
            MrowTextTextFieldWidget( onChanged: (val){},title: 'G :',isneedDivider: false,type: MInputType.numeric,),
            MrowTextTextFieldWidget( onChanged: (val){},title: 'P :',isneedDivider: false,type: MInputType.numeric,),
            MrowTextTextFieldWidget( onChanged: (val){},title: 'L :',isneedDivider: false,type: MInputType.numeric,),
            MrowTextTextFieldWidget( onChanged: (val){},title: 'A :',isneedDivider: false,type: MInputType.numeric,),
          ],
        ),
        MRowTextRadioWidget(onChanged: (val){},title: 'D1.4 Pregnancy type:',options: List_items.YesNoDetails,),
        MrowTextDatePickerWidget(onChanged: (val){},title: 'D1.5 LMP:',initialDate: DateTime.now(),),
        MrowTextDatePickerWidget(onChanged: (val){},title: 'D1.6 EDD:',initialDate: DateTime.now(),),
        MRowTextCheck(title: 'D1.7 Antenatal check-ups (tick applicable)',checkboxvalue: AntenatalCheck,onChanged: (val){setState(() {
          AntenatalCheck = val!;
        });},),
       if(AntenatalCheck) Column(children: [
         MrowTextDatePickerWidget( onChanged: (val){},title: 'D1.7.1 When was the first AN visit done ',initialDate: DateTime.now(),),
         MRowTextRadioWidget( onChanged: (val){},title: 'D1.7.2 Where was the first AN visit done:', options:List_items.AntenatalCheckUpPlace,),
         MrowTextDatePickerWidget( onChanged: (val){},title: 'D1.7.3 When first visit to a centre with cardiac support done(weeks): ',initialDate: DateTime.now(),),
       ],),
        MRowTextRadioWidget(onChanged: (val){},title: 'D1.8 Present pregnancy continued Against Medical Advice: ',),
        MRowTextRadioWidget(onChanged: (val){setState(() {
          if(val == 'Yes'){
            setState(() {
              isinterventions = true;
            });
          }else{
            setState(() {
              isinterventions = false;
            });
          }
        });},isneedDivider: isinterventions ? false : true ,title: 'D1.9 Any antenatal interventions done during current pregnancy (If yes, kindly specify):',),
        isinterventions ? MTextField(onChanged: (val){},label:'(If yes, kindly specify)' ,) : Container(),
      MRowTextRadioWidget(onChanged: (val){},title: 'D2 NYHA SYMPTOMS CLASS: ',options: List_items.NYHAClass,),
        Text('D3 CLINICAL SIGNS'),
        Space(),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'D3.1 Height (cm):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'D3.2 Weight (kg):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'D3.3 SPO2 (%):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'D3.4 HR (/min):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'D3.5 BP (mm Hg):',isneedDivider: false,type: MInputType.numeric,),
        MRowTextRadioWidget(onChanged: (val){},title: 'D3.6 CCF: ',isneedDivider: false,),
        MRowTextRadioWidget(onChanged: (val){},title: 'D3.7 Cyanosis: ',isneedDivider: false,),
        MRowTextRadioWidget(onChanged: (val){},title: 'D3.8 Cardiac murmur:',isneedDivider: false,),
        const Divider(thickness: 1,height: 3,),
        MRowTextRadioWidget(onChanged: (val){},title: 'D3.9 Per abdomen examination and foetal assessment:', options: List_items.assessment,),
      Text('D4 BASELINE INVESTIGATIONS:'),
        Space(),
        MRowTextRadioWidget(onChanged: (val){},title: 'D4.1 GTT ', options: List_items.GTT,isneedDivider: false,),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'D4.2 Blood Urea (mg/dl):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'D4.3 Sr. Creatinine (mg/dl):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'D4.4a BNP (pg/ml):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'D4.4b NT-pro BNP (pg/ml):',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'D4.5 Hb(g/dl) ',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'D4.6 Hct/PCV:',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'D4.7 TSH (uIU/mL): ',isneedDivider: false,type: MInputType.numeric,),
        MrowTextTextFieldWidget( onChanged: (val){},title: 'D4.8 Other relevant investigations (if any)',isneedDivider: false,type: MInputType.numeric,),
       const Divider(thickness: 1,height: 3,),
        MrowTextDatePickerWidget(onChanged: (val){},title: 'D4.9 ECG Date:',isneedDivider: false,),
        MRowTextRadioWidget(onChanged: (val){},title: '', options: ['Normal','Abnormal Upload ECG'],isneedDivider: false,),
      FilledButton(onPressed: (){context.push(Routes.FormD2);}, child: Text('Next'))
      ],
      ),
    ));
  }
}
