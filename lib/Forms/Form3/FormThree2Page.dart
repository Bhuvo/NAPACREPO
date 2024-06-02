import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MAppBar.dart';
import 'package:npac/common_widget/MFormBody.dart';
import 'package:npac/common_widget/MrowTextDatePicker.dart';
import 'package:npac/utils/navigator_utils.dart';
import 'package:npac/widgets/m_scaffold.dart';

class FormThree2Page extends StatefulWidget {
  const FormThree2Page({super.key});

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
    return SafeArea(child: MScaffold(
      appBar:PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MAppBar(title: 'C. REGISTRATION DETAILS-REGISTRATION PAGE (FORM C)',)),
      body:  MFormBody(Childrens: [
        MRowTextRadioWidget(title: 'C3. *PREVIOUS PREGNANCY DETAILS – If any \n Has there been any previous pregnancy: ',onChanged: (val){
          if(val == 'Yes'){
            setState(() {
              isPregnant = true;
            });
          }else{
            setState(() {
              isPregnant = false;
            });
          }
        },),
        isPregnant ? Column(children: [
          Space(),
          Text('C3.1 Previous Pregnancy 1', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          Space(),
          const Divider(thickness: 1,height: 3,),
          MRowTextRadioWidget(title: 'C3.1.1 Was the previous pregnancy continued Against Medical Advice:',onChanged: (val){},),
          MRowTextRadioWidget(title: 'C3.1.2 Conception:',onChanged: (val){},options: conception,),
          MRowTextRadioWidget(title: 'C3.1.3 Preconception Contraception',onChanged: (val){},),
          MrowTextDatePickerWidget(title: 'C3.1.4 Year of delivery/termination of previous pregnancy: ',onChanged: (val){},initialDate: DateTime.now(),),
          MRowTextRadioWidget(title: 'C3.1.5 Mode of Previous Pregnancy Delivery:',onChanged: (val){},options: mode,),
          MRowTextRadioWidget(title: 'C3.1.6 Previous pregnancy outcome:',onChanged: (val){},),
          Text('C3.1.7 Previous pregnancy neonatal outcome:'),
          MrowTextTextFieldWidget(title: 'Birth Weight (In Kgs): ',onChanged: (val){},type: MInputType.numeric,),
          MRowTextRadioWidget(title: 'Congenital anomaly:',onChanged: (val){}),
          MRowTextRadioWidget(title: 'Neonatal death: ',onChanged: (val){}),
          MRowTextRadioWidget(title: 'Neonatal complication: ',onChanged: (val){}),
          const Divider(thickness: 1,height: 3,),
          MRowTextRadioWidget(title: 'C3.1.8 Post delivery contraception use:',onChanged: (val){}),
        ],):Container(),
        FilledButton(onPressed: (){context.push(Routes.Form3Three);}, child: Text('Next'))
      ]),
    ));
  }
}
