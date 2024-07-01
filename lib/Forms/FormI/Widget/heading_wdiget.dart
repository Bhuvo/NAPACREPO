import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/app/export.dart';
import 'package:npac/Forms/FormI/Widget/ThreeTextField.dart';
import 'package:npac/Forms/FormI/Widget/YesNo.dart';

class Heading_widget extends StatefulWidget {
  final bool? enabled;
  final String? title;
  final Widget? switchingWidget;
  const Heading_widget({super.key, this.title, this.switchingWidget, this.enabled});

  @override
  State<Heading_widget> createState() => _Heading_widgetState();
}

class _Heading_widgetState extends State<Heading_widget> {
  String option = '';
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return !isExpanded? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MText(text: widget.title?? '1st trimester 5-12 weeks',),
          IconButton(onPressed: (){setState(() {
            isExpanded = !isExpanded;
          });}, icon: Icon(Icons.edit))
        ],
    ) :Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MText(text: widget.title?? '1st trimester 5-12 weeks',),
          IconButton(onPressed: (){setState(() {
            isExpanded = !isExpanded;
          });}, icon: Icon(Icons.save))
        ],
      ),
      Space(),
      ThreeTextField(enabled: widget.enabled,title: 'VKAs',onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},isonlyDose:widget.title =='Follow up' ? true : false ,),
      ThreeTextField(enabled: widget.enabled,title: 'ACITROM',onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},isonlyDose:widget.title =='Follow up' ? true : false ,),
      ThreeTextField(enabled: widget.enabled,title: 'WARFARIN',onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},isonlyDose:widget.title =='Follow up' ? true : false ,),
      MSmallText(text: 'Parenteral',),
      Space(),
      ThreeTextField(enabled: widget.enabled,title: 'Enoxaparin',text2: 'Anti XA level',onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},isonlyDose:widget.title =='Follow up' ? true : false ,),
      ThreeTextField(enabled: widget.enabled,title: 'Dalteparin',text2: 'Anti XA level',onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},isonlyDose:widget.title =='Follow up' ? true : false ,),
      ThreeTextField(enabled: widget.enabled,title: 'Fondaparinux',text2: 'Anti XA level',onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},isonlyDose:widget.title =='Follow up' ? true : false ,),

      // MRowTextRadioWidget(title: 'PARENTAL ANTI-COAGULANTS: ',onChanged: (val){},options: ['Given','Not Given'],),
      ThreeTextField(enabled: widget.enabled,title: 'UFH',isneedDivider: false,isOptionNeeded: true,onOptionChanged: (val){},onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},),
      // MRowTextRadioWidget(title: 'LMWH', options: ['FONDA','ENOX','DALTE'],onChanged: (val){
      //   setState(() {
      //     option = val;
      //   });
      // },isneedDivider: false,),
      // option != ''? ThreeTextField(title: option,text2: 'Anti XA level',isOptionNeeded: true,onOptionChanged: (val){},onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},isneedDivider: false,): Container(),
      // MDivider(),
      // Space(),
      YesNo(enabled: widget.enabled,title: 'ASPIRIN',onDoseChanged: (val){},),
      Row(
        children: [
          MText(text: 'Details of AC switching',),
        ],
      ),
      Space(),
      widget.switchingWidget ??MRowTextRadioWidget(title: 'Switching done',onChanged: (val){},),
      YesNo(enabled: widget.enabled,title: 'Vitamin K',widget:ThreeTextField(title: 'If yes specify,',text1: 'Dose',text3: 'Time of use:',text2:'Indication:',text2type: MInputType.text,onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},) ,),
      YesNo(enabled: widget.enabled,title: 'Trenaxa',widget:ThreeTextField(title: 'If yes specify,',text1: 'Dose',text3: 'Time of use:',text2:'Indication:',text2type: MInputType.text,onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},) ,),
      YesNo(enabled: widget.enabled,title: 'Protamine',widget:ThreeTextField(title: 'If yes specify,',text1: 'Dose',text3: 'Time of use:',text2:'Indication:',text2type: MInputType.text,onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},) ,),
    ],);
  }
}
