import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormD/FormD4.dart';
import 'package:npac/Forms/FormI/FormI2.dart';
import 'package:npac/Forms/FormI/Widget/valueFunction.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextCheckBox.dart';
import 'package:npac/common_widget/MSmallText.dart';

class FormI1 extends StatefulWidget {
  final bool? isEnabled;
  final Function(bool)? isAnEcoagulant ;
  final Function(bool)? isAssessment ;

  const FormI1({super.key, this.isEnabled, this.isAnEcoagulant, this.isAssessment});

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
  bool isBleeding = false;
  bool isProsticvalve = false;

  bool isMitral = false;
  bool isAortic = false;
  bool isTricuspid = false;
  bool isPulmonary = false;

  bool isAnEcoagulant = false;
  bool isAssessment = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MText(text: 'FORM G-PROSTHETIC VALVE FORM',),
        Space(),
        MSmallText(text: 'G1 Pre-operative Diagnosis:',),
        Space(),
        MRowTextCheckBox(enabled:widget.isEnabled,title: 'Etiological diagnosis:',list: ['RHD','CHD','Degenerative','BCAV','Others'],result: (val){
          if(val.contains('Others')){
            setState(() {
              isDiagnosisOthers = true;
            });
          }else{
            setState(() {
              isDiagnosisOthers = false;
            });
          }
        }, isneedDivider: isDiagnosisOthers ?false: true,),
        isDiagnosisOthers ?MTextField(enabled:widget.isEnabled,label: 'If Others specify:',onChanged: (val){},):Container(),
        isDiagnosisOthers ? MDivider():Container(),
        MSmallText(text: 'G2 Baseline prosthetic valve details:',),
        Space(),
        MrowTextDatePickerWidget(enabled:widget.isEnabled,title: 'Date of valve replacement:',onChanged: (val){},),
        MRowTextCheckBox(enabled:widget.isEnabled,title: 'G2.1 Valve replaced.',result: (val){
         setState(() {
           isMitral = val.contains('Mitral');
           isAortic = val.contains('Aortic');
           isTricuspid = val.contains('Tricuspid');
           isPulmonary = val.contains('Pulmonary');
         });
        },list: ['Mitral','Aortic','Tricuspid','Pulmonary'],isneedDivider:isMitral || isAortic || isTricuspid || isPulmonary ? false: true,),
        Space(),

        isMitral ? valueFunction(isEnabled: widget.isEnabled,title: 'Mitral',): Container(),
        isAortic ?valueFunction(title: 'Aortic',) : Container(),
        isTricuspid ? valueFunction(title: 'Tricuspid',): Container(),
        isPulmonary ? valueFunction(title: 'Pulmonary',): Container(),
        Space(),
      MRowTextRadioWidget(enabled:widget.isEnabled,title: 'G2.5 Post op OAC', onChanged: (val){},options: ['Warfarin','Acitrom'],isneedDivider: false,),
      MRowTextRadioWidget(enabled:widget.isEnabled,title: 'G2.6 Post op Aspirin ', onChanged: (val){},isneedDivider: false,),
      Space(),
      MRowTextRadioWidget(enabled:widget.isEnabled,title: 'G3. AnEcoagulant Therapy:',onChanged: (val){
        val =='Yes' ? isAnEcoagulant= true : isAnEcoagulant = false;
        widget.isAnEcoagulant?.call(isAnEcoagulant);
        setState(() {});
      },isneedDivider: false,),
      // isAnEcoagulant ?  FormI2(isEnabled: widget.isEnabled,) : Container(),
      Space(),
      MRowTextRadioWidget(enabled:widget.isEnabled,title: 'G4 Echocardiographic Assessment',onChanged: (val){
        val =='Yes' ? isAssessment= true : isAssessment = false;
        widget.isAssessment?.call(isAssessment);
        setState(() {});
      },),
      // isAssessment ? FormD4(isEnabled: widget.isEnabled,) : Container(),
        MRowTextRadioWidget(enabled:widget.isEnabled,title: 'G5 Present Pregnancy Complications: :',onChanged: (val){
          val =='Yes' ?isAdmitted =true : isAdmitted= false;
          setState(() {});
        },isneedDivider:false,),
        isAdmitted ?MTextField(enabled:widget.isEnabled,label: 'Duration of hospitalization',onChanged: (val){},): Container(),
        MDivider(),
        // MSmallText(text: 'G5.1 Prosthetic Valve Thrombosis '),
        MRowTextRadioWidget(title: 'G5.1 Prosthetic Valve Thrombosis:',enabled: widget.isEnabled,onChanged: (val){
          if(val == 'Yes'){
            setState(() {
              isProsticvalve =true;
            });
          }else{
            setState(() {
              isProsticvalve =false;
            });
          }
        },isneedDivider: false,),
        Space(),
        // MRowTextRadioWidget(enabled:widget.isEnabled,title: 'PVT:',onChanged: (val){
        //   if(val == 'Yes'){
        //     setState(() {
        //       isPvt =true;
        //     });
        //   }else{
        //     setState(() {
        //       isPvt =false;
        //     });
        //   }
        // },isneedDivider:false,),
    // MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'INR/APTT at time of PVT',onChanged: (val){},),
      isProsticvalve ? Column(children: [
        MrowTextTextFieldWidget(title: 'INR/APTT at time of PVT:',enabled: widget.isEnabled,isneedDivider: false,onChanged: (val){},),
        MRowTextRadioWidget(enabled:widget.isEnabled,title: 'Time of Prosthetic Valve Thrombosis::',onChanged: (val){
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
        },isneedDivider: false,options: ['AN' , 'PN']),
        isAn ? MTextField(enabled:widget.isEnabled,label: 'Gest weeks:',onChanged: (val){},):Container(),
        isPn ? MTextField(enabled:widget.isEnabled,label: 'PN day',onChanged: (val){},):Container(),
        // MDivider(),
        MRowTextRadioWidget(enabled:widget.isEnabled,title: 'Anti-coagulant at PVT onset:',onChanged: (val){},isneedDivider: false,options: ['Nil','Don’t Know','Unfractionated Heparin','LMWH','OAC'],),
        MRowTextRadioWidget(enabled:widget.isEnabled,title: 'Thrombolysis done with',onChanged: (val){},isneedDivider: false,options: ['Not Done','SK','TNK'],),
        MRowTextRadioWidget(enabled:widget.isEnabled,title: 'Outcome of Lysis:',onChanged: (val){},isneedDivider: false,options: ['Success','Failure'],),
      ],): Container(),
        MDivider(),
        Space(),
        MRowTextRadioWidget(enabled:widget.isEnabled,title: 'G5.2 Bleeding Complications:',onChanged: (val){
          val =='Yes' ? isBleeding =true : isBleeding= false;
          setState(() {});
        },),
      isBleeding ?Column(children: [
          // MSmallText(text: 'Type of Bleed',),
          Space(),
        MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'INR/APTT at time of Bleed',onChanged: (val){},),
        MRowTextCheckBox(enabled:widget.isEnabled,title: 'Major',result: (val){},list: ['IC Bleed','Retroperitoneal','GIB','Others'],),
          MRowTextCheckBox(enabled:widget.isEnabled,title: 'Minor',result: (val){},list: ['Sub Cut','Gum bleed','Epistaxis','Others'],),
          MRowTextRadioWidget(enabled:widget.isEnabled,title: 'Anti-coagulant at the time of Bleed',onChanged: (val){},options: ['Nil','Don’t Know','Unfractionated Heparin','LMWH','OAC'],),
        ],) : Container(),
        MRowTextCheckBox(enabled:widget.isEnabled,title: 'G5.3 Other complications',result: (val){
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
        isOthers ? MTextField(enabled:widget.isEnabled,label: 'If Others specify:',onChanged: (val){},): Container(),
        MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'G5 Any other relevant information/ remarks:',onChanged: (val){},),
        //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormI2);},),
         // FormI2()
      ],);
  }
}
