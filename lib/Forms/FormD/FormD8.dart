import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormD/Model/FormD7Model.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/navigator_utils.dart';

class FormD8 extends StatefulWidget {
  final bool? isEnabled;
  final Rx<FormD7Model>? formD7Model;
  const FormD8({super.key, this.isEnabled, this.formD7Model});

  @override
  State<FormD8> createState() => _FormD8State();
}

class _FormD8State extends State<FormD8> {
  bool isEchocardiogramAbnormal = false;
  bool isAnomalyAbnormal = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MRowTextRadioWidget( enabled: widget.isEnabled,title: 'D 11. Fetal echocardiogram',onChanged: (val){if(val== 'Abnormal'){
          setState(() {
            isEchocardiogramAbnormal = true;
          });
        }else{
          setState(() {
            isEchocardiogramAbnormal = false;
          });
        }
        },isneedDivider:isEchocardiogramAbnormal? false: true,options: ['Normal','Abnormal','Not done'],),
        isEchocardiogramAbnormal ? MrowTextTextFieldWidget(enabled: widget.isEnabled, title: 'If abnormal details:',onChanged: (val){}) : Container(),

        MRowTextRadioWidget(enabled: widget.isEnabled, title: 'D 12. Fetal anomaly scan',onChanged: (val){if(val== 'Abnormal'){
          setState(() {
            isAnomalyAbnormal = true;
          });
        }else{
          setState(() {
            isAnomalyAbnormal = false;
          });
        }
        },isneedDivider:isAnomalyAbnormal? false: true,options: ['Normal','Abnormal','Not done'],),
        isAnomalyAbnormal ? MrowTextTextFieldWidget( enabled: widget.isEnabled,title: 'If abnormal details:',onChanged: (val){}) : Container(),
       // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormD9);},),
      ],);
  }
}
