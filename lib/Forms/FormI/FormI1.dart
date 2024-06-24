import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormI/FormI2.dart';
import 'package:npac/Forms/FormI/Widget/valueFunction.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextCheckBox.dart';
import 'package:npac/common_widget/MSmallText.dart';

class FormI1 extends StatefulWidget {
  const FormI1({super.key});

  @override
  State<FormI1> createState() => _FormI1State();
}

class _FormI1State extends State<FormI1> {
  bool isDiagnosisOthers = false;
  bool isAdmitted = false;
  bool isPvt = false;
  bool isAn =false;
  bool isPn =false;
  bool isOthers = false;

  bool isMitral = false;
  bool isAortic = false;
  bool isTricuspid = false;
  bool isPulmonary = false;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'I.SPECIFIC DISEASE PROFORMA (FORM I)',),

      body: MFormBody(Childrens: [
        MText(text: 'I. PROSTHETIC VALVE',),
        Space(),
        MSmallText(text: 'I1 Pre-operative Diagnosis:',),
        Space(),
        MRowTextCheckBox(title: 'Etiological diagnosis:',list: ['RHD','CHD','DEGENERATIVE','BCAV','OTHERS'],result: (val){
          if(val.contains('OTHERS')){
            setState(() {
              isDiagnosisOthers = true;
            });
          }else{
            setState(() {
              isDiagnosisOthers = false;
            });
          }
        }, isneedDivider: isDiagnosisOthers ?false: true,),
        isDiagnosisOthers ?MTextField(label: 'If Others specify:',onChanged: (val){},):Container(),
        isDiagnosisOthers ? MDivider():Container(),
        MSmallText(text: 'I2 Baseline prosthetic valve details:',),
        Space(),
        MrowTextDatePickerWidget(title: 'Date(s) of valve replacement:',onChanged: (val){},),
        MRowTextCheckBox(title: 'I2.1 Valve replaced.',result: (val){
         setState(() {
           isMitral = val.contains('Mitral');
           isAortic = val.contains('Aortic');
           isTricuspid = val.contains('Tricuspid');
           isPulmonary = val.contains('Pulmonary');
         });
        },list: ['Mitral','Aortic','Tricuspid','Pulmonary'],isneedDivider:isMitral || isAortic || isTricuspid || isPulmonary ? false: true,),
        Space(),

        isMitral ? valueFunction(title: 'Mitral',): Container(),
        isAortic ?valueFunction(title: 'Aortic',) : Container(),
        isTricuspid ? valueFunction(title: 'Tricuspid',): Container(),
        isPulmonary ? valueFunction(title: 'Pulmonary',): Container(),
        Space(),
        MText(text: 'I3. ANTICOAGULANT THERAPY & ECHOCARDIOGRAPHIC ASSESSMENT (Please fill section I6 & D7)',),
        Space(),
  MSmallText(text: 'I4. Present Pregnancy Complications',),
        Space(),
        MRowTextRadioWidget(title: 'Admitted:',onChanged: (val){},isneedDivider:false,),
        isAdmitted ?MTextField(label: 'If YES specify:',onChanged: (val){},): Container(),
        MDivider(),
        MSmallText(text: 'I4.1 Prosthetic Valve Thrombosis '),
        Space(),
        MRowTextRadioWidget(title: 'PVT:',onChanged: (val){
          if(val == 'Yes'){
            setState(() {
              isPvt =true;
            });
          }else{
            setState(() {
              isPvt =false;
            });
          }
        },isneedDivider:false,),
        isPvt? MRowTextRadioWidget(title: 'Time of PVT:',onChanged: (val){
          if(val == 'AN'){
            setState(() {
              isAn =true;
            });
          }else{
            setState(() {
              isAn =false;
            });
          }
          if(val == 'PN'){
            setState(() {
              isPn =true;
            });
          }else{
            setState(() {
              isPn =false;
            });
          }
        },options: ['AN' , 'PN'],isneedDivider: false,):Container(),
        isAn ? MTextField(label: 'Gest weeks:',onChanged: (val){},):Container(),
        isPn ? MTextField(label: 'PN day',onChanged: (val){},):Container(),
        MDivider(),
        MRowTextRadioWidget(title: 'Thrombolysis done with',onChanged: (val){},options: ['Nil','SK','TNK'],),
        MRowTextRadioWidget(title: 'Outcome of Lysis:',onChanged: (val){},options: ['Success','Failure'],),
        MRowTextRadioWidget(title: 'Anti-coagulant at PVT onset:',onChanged: (val){},options: ['Nil','Don’t Know','OAC','Heparin','UFH','LMWH'],),
        MrowTextTextFieldWidget(title: 'INR/APTT at time of PVT',onChanged: (val){},),
        Space(),
        MSmallText(text: 'I4.2 Bleeding Complications',),
        Space(),
        MRowTextRadioWidget(title: 'Bleeding: ',onChanged: (val){},),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          MSmallText(text: 'Type of Bleed',),
          Space(),
          MRowTextRadioWidget(title: 'Major',onChanged: (val){},options: ['IC Bleed','Retroperitoneal','GIB','Others'],),
          MRowTextRadioWidget(title: 'Minor',onChanged: (val){},options: ['Sub Cut','Gum bleed','Epistaxis','Others'],),
          MRowTextRadioWidget(title: 'Anti-coagulant at the time of Bleed',onChanged: (val){},options: ['Nil','Don’t Know','OAC','Heparin','UFH','LMWH'],),
          MrowTextTextFieldWidget(title: 'INR/APTT at time of Bleed',onChanged: (val){},),
          MRowTextCheckBox(title: 'I4.3 Other complications',result: (val){
            if(val.contains('Others')){
              setState(() {
                isOthers = true;
              });
            }else{
              setState(() {
                isOthers = false;
              });
            }
          },list: ['Other thrombotic complications','Acute Pulmonary Edema','Cardiogenic Shock','Infective Endocarditis','Others'],),
          isOthers ? MTextField(label: 'If Others specify:',onChanged: (val){},): Container(),
          MrowTextTextFieldWidget(title: 'I5 Any other relevant information/ remarks:',onChanged: (val){},),
          //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormI2);},),
            FormI2()

        ],)
      ],),
    );
  }
}
