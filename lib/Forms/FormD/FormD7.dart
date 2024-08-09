import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormD/Model/FormD7Model.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextRadioWidget.dart';
import 'package:npac/utils/navigator_utils.dart';

class FormD7 extends StatefulWidget {
  final bool? isEnabled;
  final Rx<FormD7Model>? formD7Model;
  const FormD7({super.key, this.isEnabled, this.formD7Model});

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
          MrowTextTextFieldWidget(enabled:widget.isEnabled,initialValue: widget.formD7Model?.value.lVIDd1revisit.toString(),title: 'D10.1 LVIDd/LVIDs (mm)',onChanged: (val){
            widget.formD7Model?.value.lVIDd1revisit = num.parse(val);
          },isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.2 LVEF (%)',initialValue: widget.formD7Model?.value.lVEF1revisit.toString(),onChanged: (val){
            widget.formD7Model?.value.lVEF1revisit = num.parse(val);
          },isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.3 RV TAPSE (mm)',initialValue: widget.formD7Model?.value.rVTAPSE1revisit.toString(),onChanged: (val){
            widget.formD7Model?.value.rVTAPSE1revisit = num.parse(val);
          },isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.4 RV S’ (cm/sec)',initialValue: widget.formD7Model?.value.rVs1revisit.toString(),onChanged: (val){
            widget.formD7Model?.value.rVs1revisit = num.parse(val);
          }),

          Space(),
          MSmallText(text: 'AN Revisit 1',),
          Space(),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.1 LVIDd/LVIDs (mm)',initialValue: widget.formD7Model?.value.lVIDdANrevisit1.toString(),onChanged: (val){
            widget.formD7Model?.value.lVIDdANrevisit1 = num.parse(val);
          },isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.2 LVEF (%)',initialValue: widget.formD7Model?.value.lVEFANrevisit1.toString(),onChanged: (val){
            widget.formD7Model?.value.lVEFANrevisit1 = num.parse(val);
          },isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.3 RV TAPSE (mm)',initialValue: widget.formD7Model?.value.rVTAPSEANrevisit1.toString(),onChanged: (val){
            widget.formD7Model?.value.rVTAPSEANrevisit1 = num.parse(val);
          },isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.4 RV S’ (cm/sec)',initialValue: widget.formD7Model?.value.rVsANrevisit1.toString(),onChanged: (val){
            widget.formD7Model?.value.rVsANrevisit1 = num.parse(val);
          }),

          Space(),
          MSmallText(text: 'AN Revisit 2',),
          Space(),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.1 LVIDd/LVIDs (mm)',initialValue: widget.formD7Model?.value.lVIDdANrevisit2.toString(),onChanged: (val){
            widget.formD7Model?.value.lVIDdANrevisit2 = num.parse(val);
          },isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.2 LVEF (%)',initialValue: widget.formD7Model?.value.lVEFANrevisit2.toString(),onChanged: (val){
            widget.formD7Model?.value.lVEFANrevisit2 = num.parse(val);
          },isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.3 RV TAPSE (mm)',initialValue: widget.formD7Model?.value.rVTAPSEANrevisit2.toString(),onChanged: (val){
            widget.formD7Model?.value.rVTAPSEANrevisit2 = num.parse(val);
          },isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.4 RV S’ (cm/sec)',initialValue: widget.formD7Model?.value.rVsANrevisit2.toString(),onChanged: (val){
            widget.formD7Model?.value.rVsANrevisit2 = num.parse(val);
          }),

          Space(),
          MSmallText(text: 'Peripartum',),
          Space(),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.1 LVIDd/LVIDs (mm)',initialValue: widget.formD7Model?.value.lVIDdPeripartum.toString(),onChanged: (val){
            widget.formD7Model?.value.lVIDdPeripartum = num.parse(val);
          },isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.2 LVEF (%)',initialValue:widget.formD7Model?.value.lVEFPeripartum.toString(),onChanged: (val){
            widget.formD7Model?.value.lVEFPeripartum = num.parse(val);
          },isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.3 RV TAPSE (mm)',initialValue: widget.formD7Model?.value.rVTAPSEPeripartum.toString(),onChanged: (val){
            widget.formD7Model?.value.rVTAPSEPeripartum = num.parse(val);
          },isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.4 RV S’ (cm/sec)',initialValue: widget.formD7Model?.value.rVsPeripartum.toString(),onChanged: (val){
            widget.formD7Model?.value.rVsPeripartum = num.parse(val);
          }),

          Space(),
          MSmallText(text: 'PN Revisit 1',),
          Space(),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.1 LVIDd/LVIDs (mm)',initialValue: widget.formD7Model?.value.lVIDdFollowUp1.toString(),onChanged: (val){
            widget.formD7Model?.value.lVIDdFollowUp1 = num.parse(val);
          },isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.2 LVEF (%)',initialValue:widget.formD7Model?.value.lVEFFollowUp1.toString(),onChanged: (val){
            widget.formD7Model?.value.lVEFFollowUp1 = num.parse(val);
          },isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.3 RV TAPSE (mm)',initialValue: widget.formD7Model?.value.rVTAPSEFollowUp1.toString(),onChanged: (val){
            widget.formD7Model?.value.rVTAPSEFollowUp1 = num.parse(val);
          },isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.4 RV S’ (cm/sec)',initialValue: widget.formD7Model?.value.rVsFollowUp1.toString(),onChanged: (val){
            widget.formD7Model?.value.rVsFollowUp1 = num.parse(val);
          }),
          Space(),
          MSmallText(text: 'PN Revisit 2',),
          Space(),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.1 LVIDd/LVIDs (mm)',initialValue: widget.formD7Model?.value.lVIDdFollowUp2.toString(),onChanged: (val){
            widget.formD7Model?.value.lVIDdFollowUp2 = num.parse(val);
          },isneedDivider: false,),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.2 LVEF (%)',initialValue: widget.formD7Model?.value.lVEFFollowUp2.toString(),onChanged: (val){
            widget.formD7Model?.value.lVEFFollowUp2 = num.parse(val);
          },isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.3 RV TAPSE (mm)',initialValue: widget.formD7Model?.value.rVTAPSEFollowUp2.toString(),onChanged: (val){
            widget.formD7Model?.value.rVTAPSEFollowUp2 = num.parse(val);
          },isneedDivider: false),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'D10.4 RV S’ (cm/sec)',initialValue: widget.formD7Model?.value.rVsFollowUp2.toString(),onChanged: (val){
            widget.formD7Model?.value.rVsFollowUp2 = num.parse(val);
          }),
          Space(),

          MRowTextRadioWidget(enabled:widget.isEnabled,title: 'D10.5 LV Hypertrophy',initialValue: widget.formD7Model?.value.lVHypertrophy,onChanged: (val){
            // val =='Yes' ?isHypertrophy =true : isHypertrophy= false;
            widget.formD7Model?.value.lVHypertrophy = val;
            setState(() {
            });},isneedDivider: false,),
          widget.formD7Model?.value.lVHypertrophy == 'Yes' ? Column(children: [
            MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'IVS (mm)',initialValue: widget.formD7Model?.value.lVHypertrophyIVS.toString(),onChanged: (val){
              widget.formD7Model?.value.lVHypertrophyIVS = num.parse(val);
            },isneedDivider: false,),
            MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'Post Wall (mm)',initialValue: widget.formD7Model?.value.lVHypertrophyPostWall.toString(),onChanged: (val){
              widget.formD7Model?.value.lVHypertrophyPostWall = num.parse(val);
            },isneedDivider: false,),
            MRowTextRadioWidget(enabled:widget.isEnabled,title: 'SAM',initialValue: widget.formD7Model?.value.lVHypertrophySAM,onChanged: (val){
              widget.formD7Model?.value.lVHypertrophySAM = val;
            },isneedDivider: false,),
          ],): Container(),
          MDivider(),
          Space(),

          MRowTextRadioWidget(enabled:widget.isEnabled,title: 'D10.6 LVOT Obstruction :',initialValue: widget.formD7Model?.value.lVOTObstruction,onChanged: (val){
            // val =='Yes' ?isObstruction =true : isObstruction= false;
            widget.formD7Model?.value.lVOTObstruction = val;
            setState(() {

            });},isneedDivider: false,),
          widget.formD7Model?.value.lVOTObstruction == 'Yes' ?  Column(children: [
            MSmallText(text: ' LVOT gradient (mmHg)',),
            MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'Resting Gradient',initialValue: widget.formD7Model?.value.lVOTGradientResting.toString(),onChanged: (val){
              widget.formD7Model?.value.lVOTGradientResting = num.parse(val);
            },isneedDivider: false,),
            MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'Provoked gradient:',initialValue:widget.formD7Model?.value.lVOTGradientProvoked.toString(),onChanged: (val){
              widget.formD7Model?.value.lVOTGradientProvoked = num.parse(val);
            },),
          ],): Container(),
          MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'Other relevant echo findings:',initialValue: widget.formD7Model?.value.otherRelevantEchoFindings,onChanged: (val){
            widget.formD7Model?.value.otherRelevantEchoFindings = val;
          },),
          //MFilledButton(text: 'Next',onPressed: (){ context.push(Routes.FormD8);}),

        ],
      );
  }
}
