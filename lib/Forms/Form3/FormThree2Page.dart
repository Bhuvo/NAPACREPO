import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Forms/Form3/Model/RegistrationPregnancyModel.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MAppBar.dart';
import 'package:npac/common_widget/MFormBody.dart';
import 'package:npac/common_widget/MrowTextDatePicker.dart';
import 'package:npac/common_widget/MrowTextTextfieldWidget.dart';
import 'package:npac/utils/navigator_utils.dart';
import 'package:npac/widgets/m_scaffold.dart';

class FormThree2Page extends StatefulWidget {
  final RegistrationPregnancyModel? Modeldata;
  final int? index;
  final bool? isEnabled;
  const FormThree2Page({super.key, this.Modeldata, this.index, this.isEnabled});

  @override
  State<FormThree2Page> createState() => _FormThree2PageState();
}

class _FormThree2PageState extends State<FormThree2Page> {
  bool isPregnant = true;

  List<String> conception =['Spontaneous','Induced'];
  List<String> mode =['Vaginal','LSCS','Term','Preterm'];
  List<String> outCome = ['Live birth''IUD','Stillbirth','Molar pregnancy ','Ectopic pregnancy','Spontaneous Abortion','Induced Abortion'];
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
        Column(children: [
          Space(),
          Text('C3.1 Previous Pregnancy ${widget.index}', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          Space(),
          const Divider(thickness: 1,height: 3,),
          MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.Modeldata?.againstMedicalAdvice,title: 'C3.${widget.index}.1 Was the previous pregnancy continued Against Medical Advice:',onChanged: (val){
            widget.Modeldata?.againstMedicalAdvice = val;
          },),
          MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.Modeldata?.conception,title: 'C3.${widget.index}.2 Conception:',onChanged: (val){
            widget.Modeldata?.conception = val;
          },options: conception,),
          MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.Modeldata?.preconceptionContraception,title: 'C3.${widget.index}.3 Preconception Contraception',onChanged: (val){
            widget.Modeldata?.preconceptionContraception = val;
          },),
          MrowTextTextFieldWidget(enabled: widget.isEnabled,title: 'C3.${widget.index}.4 Year of delivery/termination of previous pregnancy: ',onChanged: (val){
            widget.Modeldata?.yearOfDelivery = val;
          },initialValue: widget.Modeldata?.yearOfDelivery,),
          MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.Modeldata?.modeOfPreviousPregnancy,title: 'C3.${widget.index}.5 Mode of Previous Pregnancy Delivery:',onChanged: (val){
            widget.Modeldata?.modeOfPreviousPregnancy = val;
          },options: mode,),
          MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.Modeldata?.previousPregnancyOutcome,title: 'C3.${widget.index}.6 Previous pregnancy outcome:',onChanged: (val){
            widget.Modeldata?.previousPregnancyOutcome = val;
          },isneedDivider: false,options: ['Live birth','Intra Uterine Death','Stillbirth','Spontaneous Abortion','Induced Abortion'],),
          MrowTextTextFieldWidget(enabled: widget.isEnabled,initialValue: widget.Modeldata?.birthWeight,title: 'Birth Weight (In Kgs): ',onChanged: (val){
            widget.Modeldata?.birthWeight = val;
          },type: MInputType.numeric,isneedDivider: false,),
          MRowTextCheckBox(enabled: widget.isEnabled,list: ['Molar pregnancy','Ectopic pregnancy'],result: (val){},isneedDivider: false,),
          MRowTextCheckBox(enabled: widget.isEnabled,title: 'Indication for induced abortion:',isneedDivider: false,result: (val){
            },list: ['Maternal - Cardiac','Fetal','Maternal- Obstetric','Social / others'],),

         Text('C3.${widget.index}.7 Previous pregnancy neonatal outcome:'),
          MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.Modeldata?.congenitalAnomaly,title: 'Adverse outcome:',onChanged: (val){
            widget.Modeldata?.congenitalAnomaly = val;
          }),
          MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.Modeldata?.neonatalDeath,title: 'Congenital anomaly:',onChanged: (val){
            widget.Modeldata?.congenitalAnomaly = val;
          }),
          MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.Modeldata?.neonatalComplication,title: 'Neonatal death: ',onChanged: (val){
            widget.Modeldata?.neonatalDeath = val;
          }),
          MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.Modeldata?.neonatalComplication,title: 'Neonatal complication: ',onChanged: (val){
            widget.Modeldata?.neonatalComplication = val;
          }),
         // const Divider(thickness: 1,height: 3,),
          MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.Modeldata?.postDeliveryContraceptionUse,title: 'C3.${widget.index}.8 Post delivery contraception use:',onChanged: (val){
            widget.Modeldata?.postDeliveryContraceptionUse = val;
          }),
        ],),
        //FilledButton(onPressed: (){context.push(Routes.Form3Three);}, child: Text('Next'))
      ]);
  }
}
