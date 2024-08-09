
import 'package:npac/Forms/FormD/Model/FormD9Model.dart';
import 'package:npac/Forms/FormN/widget/MN1body.dart';
import 'package:npac/app/export.dart';

class FormD9 extends StatefulWidget {
  final bool? isEnabled;
  final Rx<FormD9Model>? formD9Model;
  const FormD9({super.key, this.isEnabled, this.formD9Model});

  @override
  State<FormD9> createState() => _FormD9State();
}

class _FormD9State extends State<FormD9> {
  bool isAdvice= false;
  bool isAdviceOther= false;
  bool isEchocardiogramAbnormal = false;
  bool isAnomalyAbnormal = false;
  List<String> selectedAdvice = [];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MRowTextRadioWidget( enabled: widget.isEnabled,title: 'D 11. Fetal echocardiogram',initialValue: widget.formD9Model?.value.fetalEchocardiogram,onChanged: (val){
        // if(val== 'Abnormal'){
      //   setState(() {
      //     isEchocardiogramAbnormal = true;
      //   });
      // }else{
      //   setState(() {
      //     isEchocardiogramAbnormal = false;
      //   });
      // }
      //    widget.formD9Model?.update((value) {
      //      value?.fetalEchocardiogram  = val;
      //    });
        widget.formD9Model?.value.fetalEchocardiogram = val;
      },isneedDivider:false,options: ['Normal','Abnormal','Not done'],),
      widget.formD9Model?.value.fetalEchocardiogram == 'Abnormal' ? MrowTextTextFieldWidget(enabled: widget.isEnabled, title: 'If abnormal details:',initialValue: widget.formD9Model?.value.fetalEchocardiogramAbnormal,onChanged: (val){
        widget.formD9Model?.value.fetalEchocardiogramAbnormal = val;
      },isneedDivider: false,) : Container(),
      MDivider(),
      MRowTextRadioWidget(enabled: widget.isEnabled, title: 'D 12. Fetal anomaly scan',initialValue: widget.formD9Model?.value.fetalAnomalyScan,onChanged: (val){
        if(val== 'Abnormal'){
        setState(() {
          isAnomalyAbnormal = true;
        });
      }else{
        setState(() {
          isAnomalyAbnormal = false;
        });
      }
        widget.formD9Model?.value.fetalAnomalyScan = val;
      },isneedDivider:false,options: ['Normal','Abnormal','Not done'],),
      widget.formD9Model?.value.fetalAnomalyScan == 'Abnormal' ? MrowTextTextFieldWidget( enabled: widget.isEnabled,title: 'If abnormal details:',initialValue: widget.formD9Model?.value.fetalAnomalyScanAbnormal,onChanged: (val){
        widget.formD9Model?.value.fetalAnomalyScanAbnormal = val;
      },isneedDivider:  false,) : Container(),
      MDivider(),
      const MText(text: 'D13. RISK ASSESSMENT AND TRIAGE',),
        const Space(),
        MRowTextCheckBox(enabled: widget.isEnabled,title: 'D13.1 Baseline risk',result: (val){},list: const ['m WHO I','m WHO II','m WHO II-III','m WHO III ','m WHO IV'],),
        const MText(text: 'D13.2 CARPREG II SCORE: (Yes/NO) ',),
        const Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '1 Prior cardiac event/ arrhythmia',initialValue: widget.formD9Model?.value.carpreg21,onChanged: (val){
          widget.formD9Model?.value.carpreg21 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '2 Baseline NYHA III / IV or Cyanosis',initialValue: widget.formD9Model?.value.carpreg22,onChanged: (val){
          widget.formD9Model?.value.carpreg22 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '3 Mechanical prosthetic valves',initialValue: widget.formD9Model?.value.carpreg23,onChanged: (val){
          widget.formD9Model?.value.carpreg23 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '4 Ventricular dysfunction',initialValue: widget.formD9Model?.value.carpreg24,onChanged: (val){
          widget.formD9Model?.value.carpreg24 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '5 High Risk Lt sided valve disease LVOTO',initialValue: widget.formD9Model?.value.carpreg25,onChanged: (val){
          widget.formD9Model?.value.carpreg25 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '6 Pulmonary Hypertension',initialValue: widget.formD9Model?.value.carpreg26,onChanged: (val){
          widget.formD9Model?.value.carpreg26 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '7 CAD',initialValue: widget.formD9Model?.value.carpreg27,onChanged: (val){
          widget.formD9Model?.value.carpreg27 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '8 High risk aortopathy',initialValue: widget.formD9Model?.value.carpreg28,onChanged: (val){
          widget.formD9Model?.value.carpreg28 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '9 No Prior cardiac interventions',initialValue: widget.formD9Model?.value.carpreg29,onChanged: (val){
          widget.formD9Model?.value.carpreg29 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '10 Late pregnancy assessment',initialValue: widget.formD9Model?.value.carpreg210,onChanged: (val){
          widget.formD9Model?.value.carpreg210 = val;
        }),

        const MText(text: 'D13.3 ZAHARA SCORE: (Yes/NO)',),
        const Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '1 History of arrhythmic events',initialValue: widget.formD9Model?.value.zaharascore1,onChanged: (val){
          widget.formD9Model?.value.zaharascore1 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '2 Baseline NYHA III or IV',initialValue: widget.formD9Model?.value.zaharascore2,onChanged: (val){
          widget.formD9Model?.value.zaharascore2 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '3 LVOT obstruction >50 mm Hg',initialValue: widget.formD9Model?.value.zaharascore3,onChanged: (val){
          widget.formD9Model?.value.zaharascore3 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '4 Mechanical valve prosthesis',initialValue: widget.formD9Model?.value.zaharascore4,onChanged: (val){
          widget.formD9Model?.value.zaharascore4 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '5 Cardiac drugs pre-pregnancy use',initialValue: widget.formD9Model?.value.zaharascore5,onChanged: (val){
          widget.formD9Model?.value.zaharascore5 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '6 CCHD [repaired or unrepaired]',initialValue: widget.formD9Model?.value.zaharascore6,onChanged: (val){
          widget.formD9Model?.value.zaharascore6 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '7 Moderate to severe sub pulmonic \nAV valve regurgitation',initialValue: widget.formD9Model?.value.zaharascore7,onChanged: (val){
          widget.formD9Model?.value.zaharascore7 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '8 Moderate to severe systemic AV \nvalve regurgitation',initialValue: widget.formD9Model?.value.zaharascore8,onChanged: (val){
          widget.formD9Model?.value.zaharascore8 = val;
        }),

        const MText(text: 'D13.4 DEVI SCORE: (Yes/NO) ',),
        const Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '1 Prior cardiovascular event',initialValue: widget.formD9Model?.value.deviscore1,onChanged: (val){
          widget.formD9Model?.value.deviscore1 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '2 Pulmonary hypertension',initialValue: widget.formD9Model?.value.deviscore2,onChanged: (val){
          widget.formD9Model?.value.deviscore2 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '3 Severe mitral stenosis',initialValue: widget.formD9Model?.value.deviscore3,onChanged: (val){
          widget.formD9Model?.value.deviscore3 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '4 Moderate mitral stenosis',initialValue: widget.formD9Model?.value.deviscore4,onChanged: (val){
          widget.formD9Model?.value.deviscore4 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '5 Prosthetic heart valve',initialValue: widget.formD9Model?.value.deviscore5,onChanged: (val){
          widget.formD9Model?.value.deviscore5 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '6 Mild mitral stenosis',initialValue: widget.formD9Model?.value.deviscore6,onChanged: (val){
          widget.formD9Model?.value.deviscore6 = val;
        },isneedDivider: false,),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: '7 Taking cardiac medications',initialValue: widget.formD9Model?.value.deviscore7,onChanged: (val){
          widget.formD9Model?.value.deviscore7 = val;
        }),

        // const MText(text: 'D13.5 MPAC 4 Risk category: (Yes/NO) ',),
        // const Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'D13.5 MPAC 3 Risk category',initialValue: widget.formD9Model?.value.mPAC3RiskCategory,onChanged: (val){
          widget.formD9Model?.value.mPAC3RiskCategory = val;
        },options: ['Low risk','Intermediate','High risk'],isneedDivider: false,),
        // MRowTextRadioWidget(enabled: widget.isEnabled,title: '2 High risk',onChanged: (val){}),

        // const MText(text: 'D13.6 MPAC 3 Risk category: (Yes/NO) ',),
        // const Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'D13.6 MPAC 4 Risk category ',initialValue: widget.formD9Model?.value.mPAC4RiskCategory,onChanged: (val){
          widget.formD9Model?.value.mPAC4RiskCategory = val;
        },options: ['low risk','High risk','Moderate risk','Very high risk'],isneedDivider: false,),
        // MRowTextRadioWidget(enabled: widget.isEnabled,title: '1 Intermediate',onChanged: (val){},isneedDivider: false,),
        // MRowTextRadioWidget(enabled: widget.isEnabled,title: '2 High risk',onChanged: (val){}),

        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'D14 Any specific advice given in the visit: ',initialValue: widget.formD9Model?.value.specificAdvice,onChanged: (val){
        //   val=='Yes' ? setState(() {
        //   isAdvice = true;
        // }): setState(() {
        //   isAdvice = false;
        // });
          widget.formD9Model?.value.specificAdvice = val;
          setState(() {});
          },isneedDivider: isAdvice ? false: true,),
      widget.formD9Model?.value.specificAdvice == 'Yes' ? MRowTextCheckBox(enabled: widget.isEnabled,selectedlist: selectedAdvice,result: (val){
          if(val.contains('Others')) {
            setState(() {
              isAdviceOther = true;
            });
          }else{
            setState(() {
              isAdviceOther = false;
            });
          }
          val.contains('Hospitalization') ?widget.formD9Model?.value.hospitalization = true:widget.formD9Model?.value.hospitalization = false;
          val.contains('Change of medication') ?widget.formD9Model?.value.changeOfMedication = true:widget.formD9Model?.value.changeOfMedication = false;
          val.contains('Obstetrics Intervention') ?widget.formD9Model?.value.obstetricsIntervention = true:widget.formD9Model?.value.obstetricsIntervention = false;
          val.contains('Cardiac Intervention ') ?widget.formD9Model?.value.cardiacIntervention = true:widget.formD9Model?.value.cardiacIntervention = false;
          val.contains('Others') ?widget.formD9Model?.value.specificAdviceOthers = true:widget.formD9Model?.value.specificAdviceOthers = false;
        },list: const ['Hospitalization','Change of medication','Obstetrics Intervention','Change of medication.','Cardiac Intervention ','Others'],): Container(),
      widget.formD9Model?.value.specificAdviceOthers  ?? false ? MTextField(enabled: widget.isEnabled,label: 'If others Specify',onChanged: (val){},): Container(),
      widget.formD9Model?.value.specificAdviceOthers ?? false ? const MDivider(): Container(),
        const Space(),
        MSmallText(text: 'D15 Details of medications advised/ being used: ',),
          MN1Body(isEnable: widget.isEnabled,title: 'Drugs',visitNo: 4,options: List_items.Drugs,drugMap: (e){
        print('Value from map $e');
      },),
        MrowTextDatePickerWidget(enabled: widget.isEnabled,onChanged: (val){
          widget.formD9Model?.value.dateOfNextFollowUp = dateToString(val);
    },title: 'D15 Date of next follow up:',initialDate: stringToDate(widget.formD9Model?.value.dateOfNextFollowUp ?? ''),),
      //  MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},)
      ],);
  }
}
