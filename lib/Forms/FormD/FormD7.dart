import 'package:flutter/cupertino.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextRadioWidget.dart';
import 'package:npac/utils/navigator_utils.dart';

class FormD7 extends StatefulWidget {
  final bool? isEnabled;
  const FormD7({super.key, this.isEnabled});

  @override
  State<FormD7> createState() => _FormD7State();
}

class _FormD7State extends State<FormD7> {

  bool isHypertrophy =false;
  bool isObstruction=false;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          MText(text: 'D10. CARDIOMYOPATHY/HEART FAILURE ECHO PAGE',),
          Space(),

          MText(text: 'PARAMETERS ',),
          Space(),
          MSmallText(text: 'First Visit',),
          Space(),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.1 LVIDd/LVIDs (mm)',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.2 LVEF (%)',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.3 RV TAPSE (mm)',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.4 RV S’ (cm/sec)',onChanged: (val){}),

          Space(),
          MSmallText(text: 'AN Revisit 1',),
          Space(),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.1 LVIDd/LVIDs (mm)',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.2 LVEF (%)',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.3 RV TAPSE (mm)',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.4 RV S’ (cm/sec)',onChanged: (val){}),

          Space(),
          MSmallText(text: 'AN Revisit 2',),
          Space(),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.1 LVIDd/LVIDs (mm)',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.2 LVEF (%)',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.3 RV TAPSE (mm)',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.4 RV S’ (cm/sec)',onChanged: (val){}),

          Space(),
          MSmallText(text: 'Peripartum',),
          Space(),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.1 LVIDd/LVIDs (mm)',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.2 LVEF (%)',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.3 RV TAPSE (mm)',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.4 RV S’ (cm/sec)',onChanged: (val){}),

          Space(),
          MSmallText(text: 'PN Revisit 1',),
          Space(),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.1 LVIDd/LVIDs (mm)',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.2 LVEF (%)',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.3 RV TAPSE (mm)',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.4 RV S’ (cm/sec)',onChanged: (val){}),
          Space(),
          MSmallText(text: 'PN Revisit 2',),
          Space(),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.1 LVIDd/LVIDs (mm)',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.2 LVEF (%)',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.3 RV TAPSE (mm)',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.4 RV S’ (cm/sec)',onChanged: (val){}),
          Space(),

          MRowTextRadioWidget(enabled:widget.isEnabled,title: 'D10.5 LV Hypertrophy',onChanged: (val){
            val =='Yes' ?isHypertrophy =true : isHypertrophy= false;
            setState(() {

            });},isneedDivider: false,),
          isHypertrophy ? Column(children: [
            MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'IVS (mm)',onChanged: (val){},isneedDivider: false,),
            MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'Post Wall (mm)',onChanged: (val){},isneedDivider: false,),
            MRowTextRadioWidget(enabled:widget.isEnabled,title: 'SAM',onChanged: (val){},isneedDivider: false,),
          ],): Container(),
          MDivider(),
          Space(),

          MRowTextRadioWidget(enabled:widget.isEnabled,title: 'D10.6 LVOT Obstruction :',onChanged: (val){
            val =='Yes' ?isObstruction =true : isObstruction= false;
            setState(() {

            });},isneedDivider: false,),
          isObstruction ?  Column(children: [
            MSmallText(text: ' LVOT gradient (mmHg)',),
            MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'Resting Gradient',onChanged: (val){},isneedDivider: false,),
            MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'Provoked gradient:',onChanged: (val){},),
          ],): Container(),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'Other relevant echo findings:',onChanged: (val){},),
          //MFilledButton(text: 'Next',onPressed: (){ context.push(Routes.FormD8);}),

        ],
      );
  }
}
