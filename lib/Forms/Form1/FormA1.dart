import 'package:npac/app/export.dart';

class FormA1 extends StatefulWidget {
  const FormA1({super.key});

  @override
  State<FormA1> createState() => _FormA1State();
}

class _FormA1State extends State<FormA1> {
  bool isOne =false;
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'INCLUSION CRITERIA CHECKLIST (FORM A)',),
      body: MFormBody(Childrens: [
        MRowTextRadioWidget(title: 'For all patients (Tick the applicable)',onChanged: (val){
          if(val == 'Yes'){
            setState(() {
              isOne = true;
            });
          }else{
            setState(() {
              isOne = false;
            });
          }
        }),
        isOne ?  Column(children: [
          MRowTextRadioWidget(title: 'A7',options: ['Antenatal',  'Post-partum (Up to 6 weeks)','Postnatal (up to 5 months, only for peri-partum cardiomyopathy)'],onChanged: (val){}),
          MRowTextRadioWidget(title: 'A8. Heart disease as per inclusion criteria',onChanged: (val){},),
          MRowTextRadioWidget(title: 'A9. Consented for the study',onChanged: (val){},),
        ],): Container(),
        MFilledButton(text: 'SUBMIT',onPressed: (){context.push(Routes.Home);},)
      ],),
    );

  }
}
