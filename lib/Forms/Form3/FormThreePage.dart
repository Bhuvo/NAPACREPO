import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/common_widget/MAppBar.dart';
import 'package:npac/common_widget/MFormBody.dart';
import 'package:npac/common_widget/MRowTextRadioWidget.dart';
import 'package:npac/common_widget/MTextField.dart';
import 'package:npac/common_widget/MrowTextDatePicker.dart';
import 'package:npac/common_widget/MrowTextTextfieldWidget.dart';
import 'package:npac/utils/navigator_utils.dart';
import 'package:npac/widgets/m_scaffold.dart';

class FormThreePage extends StatefulWidget {
  const FormThreePage({super.key});

  @override
  State<FormThreePage> createState() => _FormThreePageState();
}

class _FormThreePageState extends State<FormThreePage> {
  bool isYes = false;
  bool isPriorRisk =false;

  List<String> cOneList =['During present Pregnancy','During past Pregnancy' , 'Not during pregnancy'];
  List<String> cTwoOne = ['Class I', 'Class II', 'Class III', 'Class IV'];
  List<String> YesNoDetails = ['Yes', 'No' ,'Details NA' ];
  List<String> Arrhthymia =['AF', 'AT', 'Other SVT(AVRT/AVNRT', 'VT/ VF'];
  List<String> OtheCardiacEvents =['CVA/TIA','PVT','Other Thrombotic/ Embolic Manifestation','Major Bleed ','Minor Bleed','Hemoptysis','Cerebral Abscess','CVT','Other'];
List<String> currentEXNever =['Current', 'EX', 'Never'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MScaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MAppBar(title: 'REGISTRATION DETAILS-REGISTRATION PAGE (FORM C)',)),
      body: MFormBody(Childrens: [
        MrowTextDatePickerWidget( onChanged: (val){},title: 'C.1 FIRST DIAGNOSIS OF HEART DISEASE (Time at which the heart disease was first diagnosed)',initialDate: DateTime.now(),),
        MRowTextRadioWidget(onChanged: (val){}, title: 'C.1.1 Time of heart disease diagnosis with pregnancy:', options: cOneList,),
        MrowTextTextFieldWidget(title: 'C.1.2 Chronological age at diagnosis of HD (inyears):',initialValue: '34',type: MInputType.numeric,onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'C.1.2 Gestational age at detection of HD (only if diagnosedduring current pregnancy): ',initialValue: '34',type: MInputType.numeric,onChanged: (val){},),
        MrowTextTextFieldWidget(title: 'C.2 PRE-PREGNANCY CARDIAC / NON-CARDIAC DISEASE DETAILS (includes details before present pregnancy)',initialValue: '34',type: MInputType.numeric,onChanged: (val){},),
        MRowTextRadioWidget(onChanged: (val){}, title: 'C2.1 Pre-Pregnancy NYHA Class: ', options: cTwoOne,),
        MRowTextRadioWidget(onChanged: (val){}, title: 'C2.2 Prior Cardiac Event:  ',),
        MRowTextRadioWidget(onChanged: (val){}, title: 'C2.2.1 Heart Failure ',options: YesNoDetails,),
        MRowTextRadioWidget(onChanged: (val){}, title: 'Required Hospitalization: '),
        MRowTextRadioWidget(onChanged: (val){}, title: 'C2.2.2 Prior Cardiac Arrhythmia:',options: YesNoDetails,),
        MRowTextRadioWidget(onChanged: (val){if(val == 'yes' ){setState(() {
          isYes = true;
        }); }else{
          setState(() {
            isYes = false;
          });
        }
          }, title: 'Details of Arrhthymia:'),
        if(isYes)MRowTextRadioWidget(onChanged: (val){}, title: '',options: Arrhthymia,) ,
        MRowTextRadioWidget(onChanged: (val){}, title: 'Required Hospitalization: '),
        MRowTextRadioWidget(onChanged: (val){}, title: 'C2.2.3 Other priorcardiac events/complications',options: OtheCardiacEvents,),
        MRowTextRadioWidget(onChanged: (val){}, title: 'C2.3 *Prior cardiac procedures(interventions/surgery) done',options: YesNoDetails,),
        MrowTextTextFieldWidget(title: 'C2.3.1 Name of the Procedure:',initialValue: 'Name',onChanged: (val){},),
        MrowTextDatePickerWidget( onChanged: (val){},title: 'C2.3.2 Month and Year of the Procedure',initialDate: DateTime.now(),),
        MRowTextRadioWidget(onChanged: (val){}, title: 'C2.4 Prior Anticoagulant use: ',options: YesNoDetails,),
        MRowTextRadioWidget(onChanged: (val){}, title: 'C2.5 Prior Cardiac drugs use (other than OAC): ',options: YesNoDetails,),
        MRowTextRadioWidget(onChanged: (val){}, title: 'C2.6 Prior non-cardiac medications: ',options: YesNoDetails,),
        MRowTextRadioWidget(onChanged: (val){if(val == 'yes' ){setState(() {
          isPriorRisk = true;
        }); }else{
          setState(() {
            isPriorRisk = false;
          });
        }}, title: 'C2.7 Prior risk factors: ',),
        isPriorRisk ? Column(children: [ MRowTextRadioWidget(onChanged: (val){}, title: 'C2.7.1 Diabetes: ',),
          MRowTextRadioWidget(onChanged: (val){}, title: 'C2.7.2 HTN '),
          MRowTextRadioWidget(onChanged: (val){}, title: 'C2.7.3 Psych illness '),
          MRowTextRadioWidget(onChanged: (val){}, title: 'C2.7.4 Alcoho '),
          MRowTextRadioWidget(onChanged: (val){}, title: 'C2.7.5 Smoking',options: currentEXNever,),
          MRowTextRadioWidget(onChanged: (val){}, title: 'C2.7.6 Anemia'),
          MRowTextRadioWidget(onChanged: (val){}, title: 'C2.7.7 Chewing Tobacco'),
          MRowTextRadioWidget(onChanged: (val){}, title: 'C2.7.8 Hypothyroid'),
          MRowTextRadioWidget(onChanged: (val){}, title: 'C2.7.9 Hyperthyroid'),
          MRowTextRadioWidget(onChanged: (val){}, title: 'C2.7.10 Epilepsy'),
          MRowTextRadioWidget(onChanged: (val){}, title: 'C2.7.11 HIV'),
          MRowTextRadioWidget(onChanged: (val){}, title: 'C2.7.12 Autoimmune'),
          MrowTextTextFieldWidget(title: 'Others',initialValue: '34',onChanged: (val){},),],) :Container(),
        FilledButton(onPressed: (){context.push(Routes.Form3Two);}, child: Text('Next'))
      ],),

    ));
  }
}
