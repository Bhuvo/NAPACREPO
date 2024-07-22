
import 'package:npac/app/export.dart';

class FormD9 extends StatefulWidget {
  final bool? isEnabled;
  const FormD9({super.key, this.isEnabled});

  @override
  State<FormD9> createState() => _FormD9State();
}

class _FormD9State extends State<FormD9> {
  bool isAdvice= false;
  bool isAdviceOther= false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        const MText(text: 'D13. RISK ASSESSMENT AND TRIAGE',),
        const Space(),
        MRowTextCheckBox(enabled: widget.isEnabled,title: 'D13.1 Baseline risk',result: (val){},list: const ['m WHO I','m WHO II','m WHO II-III','m WHO III ','m WHO IV'],),
        const MText(text: 'D13.2 CARPREG II SCORE: (Yes/NO) ',),
        const Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '1 Prior cardiac event/ arrhythmia',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '2 Baseline NYHA III / IV or Cyanosis',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '3 Mechanical prosthetic valves',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '4 Ventricular dysfunction',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '5 High Risk Lt sided valve disease LVOTO',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '6 Pulmonary Hypertension',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '7 CAD',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '8 High risk aortopathy',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '9 No Prior cardiac interventions',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '10 Late pregnancy assessment',onChanged: (val){}),

        const MText(text: 'D13.3 ZAHARA SCORE: (Yes/NO)',),
        const Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '1 History of arrhythmic events',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '2 Baseline NYHA III or IV',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '3 LVOT obstruction >50 mm Hg',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '4 Mechanical valve prosthesis',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '5 Cardiac drugs pre-pregnancy use',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '6 CCHD [repaired or unrepaired]',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '7 Moderate to severe sub pulmonic \nAV valve regurgitation',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '8 Moderate to severe systemic AV \nvalve regurgitation',onChanged: (val){}),

        const MText(text: 'D13.4 DEVI SCORE: (Yes/NO) ',),
        const Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '1 Prior cardiovascular event',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '2 Pulmonary hypertension',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '3 Severe mitral stenosis',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '4 Moderate mitral stenosis',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '5 Prosthetic heart valve',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '6 Mild mitral stenosis',onChanged: (val){},isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '7 Taking cardiac medications',onChanged: (val){}),

        // const MText(text: 'D13.5 MPAC 4 Risk category: (Yes/NO) ',),
        // const Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'D13.5 MPAC 3 Risk category',onChanged: (val){},options: ['Low risk','Intermediate','High risk'],isneedDivider: false,),
        // MRowTextRadioWidget(enabled: widget.isEnabled,title: '2 High risk',onChanged: (val){}),

        // const MText(text: 'D13.6 MPAC 3 Risk category: (Yes/NO) ',),
        // const Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'D13.6 MPAC 4 Risk category ',onChanged: (val){},options: ['low risk','High risk','Moderate risk','Very high risk'],isneedDivider: false,),
        // MRowTextRadioWidget(enabled: widget.isEnabled,title: '1 Intermediate',onChanged: (val){},isneedDivider: false,),
        // MRowTextRadioWidget(enabled: widget.isEnabled,title: '2 High risk',onChanged: (val){}),

        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'D14 Any specific advice given in the visit: ',onChanged: (val){val=='Yes' ? setState(() {
          isAdvice = true;
        }): setState(() {
          isAdvice = false;
        });},isneedDivider: isAdvice ? false: true,),
        isAdvice ? MRowTextCheckBox(enabled: widget.isEnabled,title: '',result: (val){
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
        isAdviceOther ? MTextField(enabled: widget.isEnabled,label: 'If others Specify',onChanged: (val){},): Container(),
        isAdviceOther? const MDivider(): Container(),
        const Space(),
        MrowTextDatePickerWidget(enabled: widget.isEnabled,onChanged: (val){},title: 'D15 Date of next follow up:',initialDate: DateTime.now(),),
      //  MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},)
      ],);
  }
}
