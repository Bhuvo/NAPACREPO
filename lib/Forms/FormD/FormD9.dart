
import 'package:npac/app/export.dart';

class FormD9 extends StatefulWidget {
  const FormD9({super.key});

  @override
  State<FormD9> createState() => _FormD9State();
}

class _FormD9State extends State<FormD9> {
  bool isAdvice= false;
  bool isAdviceOther= false;

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MAppBar(title: 'D. FIRST VISIT PAGE (FORM D)')),

      body: MFormBody(Childrens: [
        const MText(text: 'D13. RISK ASSESSMENT AND TRIAGE',),
        const Space(),
        MRowTextCheckBox(title: 'D13.1 Baseline risk',result: (val){},list: const ['m WHO I','m WHO II','m WHO II-III','m WHO III ','m WHO IV'],),
        const MText(text: 'D13.2 CARPREG II SCORE: (Yes/NO) ',),
        const Space(),
        MRowTextRadioWidget(title: '1 Prior cardiac event/ arrhythmia',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '2 Baseline NYHA III / IV or Cyanosis',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '3 Mechanical prosthetic valves',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '4 Ventricular dysfunction',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '5 High Risk Lt sided valve disease LVOTO',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '6 Pulmonary Hypertension',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '7 CAD',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '8 High risk aortopathy',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '9 No Prior cardiac interventions',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '10 Late pregnancy assessment',onChanged: (val){}),

        const MText(text: 'D13.3 ZAHARA SCORE: (Yes/NO)',),
        const Space(),
        MRowTextRadioWidget(title: '1 History of arrhythmic events',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '2 Baseline NYHA III or IV',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '3 LVOT obstruction >50 mm Hg',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '4 Mechanical valve prosthesis',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '5 Cardiac drugs pre-pregnancy use',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '6 CCHD [repaired or unrepaired]',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '7 Moderate to severe sub pulmonic \nAV valve regurgitation',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '8 Moderate to severe systemic AV \nvalve regurgitation',onChanged: (val){}),

        const MText(text: 'D13.4 DEVI SCORE: (Yes/NO) ',),
        const Space(),
        MRowTextRadioWidget(title: '1 Prior cardiovascular event',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '2 Pulmonary hypertension',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '3 Severe mitral stenosis',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '4 Moderate mitral stenosis',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '5 Prosthetic heart valve',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '6 Mild mitral stenosis',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '7 Taking cardiac medications',onChanged: (val){}),

        const MText(text: 'D13.5 TNPHDR Risk category: (Yes/NO) ',),
        const Space(),
        MRowTextRadioWidget(title: '1 Low risk',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '2 High risk',onChanged: (val){}),

        const MText(text: 'D13.6 MPAC Risk category: (Yes/NO) ',),
        const Space(),
        MRowTextRadioWidget(title: '1 Low risk',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '1 Intermediate',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(title: '2 High risk',onChanged: (val){}),

        MRowTextRadioWidget(title: 'Any specific advice given in the visit: ',onChanged: (val){val=='Yes' ? setState(() {
          isAdvice = true;
        }): setState(() {
          isAdvice = false;
        });},isneedDivider: isAdvice ? false: true,),
        isAdvice ? MRowTextCheckBox(title: '',result: (val){
          if(val.contains('Others')) {
            setState(() {
              isAdviceOther = true;
            });
          }else{
            setState(() {
              isAdviceOther = false;
            });
          }
        },list: const ['Hospitalization','Advice intervention ','Obstetrics Intervention','Change of medication.','Cardiac Intervention ','Others'],): Container(),
        isAdviceOther ? MTextField(label: 'If others Specify',onChanged: (val){},): Container(),
        isAdviceOther? const MDivider(): Container(),
        const Space(),
        MrowTextDatePickerWidget(onChanged: (val){},title: 'Date of next follow up:',initialDate: DateTime.now(),),
        MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},)
      ],),

    );
  }
}