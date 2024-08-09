import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class FormH3Common extends StatefulWidget {
  final String? title;
  final bool? enabled;
  final String? radioInitialValue ;
  final String? TextField1InitialValue ;
  final String? TypeInitialValue ;
  final Function(String)? radioiOnChanged;
  final Function(String)? TextField1OnChanged;
  final Function(String)? TypeOnchanged;
  const FormH3Common({super.key, this.title, this.radioiOnChanged, this.TextField1OnChanged, this.TypeOnchanged, this.enabled, this.radioInitialValue, this.TextField1InitialValue, this.TypeInitialValue,});
  @override
  State<FormH3Common> createState() => _FormH3CommonState();
}
class _FormH3CommonState extends State<FormH3Common> {
  bool isYes = false;

  bool isAn = false;
  bool isIP = false;
  bool isPA = false;

  @override
  Widget build(BuildContext context) {
  return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ((widget.title!= '') ||( widget.title != null)) ? Text(widget.title ?? '') : Container(),
        MRowTextRadioWidget(enabled: widget.enabled,title: widget.title,initialValue: widget.radioInitialValue,isneedDivider:isYes? false :true,onChanged:(val){
          if(val =='Yes'){
            setState(() {
              isYes = true;
            });
          }else{
            setState(() {
              isYes = false;
            });
          }
          widget.radioiOnChanged?.call(val);
        },),
        isYes? MRowTextRadioWidget(enabled: widget.enabled ,title: 'If yes, specify',initialValue: widget.TypeInitialValue,options: ['Antinaval' , 'Intra partum', 'Postanatal'],onChanged: (val){
          val== 'Antinaval' ? isAn = true : isAn = false;
          val== 'Intra partum' ? isIP = true : isIP = false;
          val== 'Postanatal' ? isPA = true : isPA = false;
          widget.TypeOnchanged?.call(val);
          setState(() {
          });
        },isneedDivider: false,): Container(),
        isYes && isAn? MTextField(enabled: widget.enabled,label: 'Antinaval Time(in Weeks)',initalValue: widget.TextField1InitialValue,onChanged:widget.TextField1OnChanged,): Container(),
        isYes && isIP ? MTextField(enabled: widget.enabled,label: 'Intra partum',initalValue: widget.TextField1InitialValue,onChanged:widget.TextField1OnChanged,): Container(),
        isYes && isPA? MTextField(enabled: widget.enabled,label: 'Postanatal Time(in days)',initalValue: widget.TextField1InitialValue,onChanged:widget.TextField1OnChanged,): Container(),
        // isYes? MTextField(enabled: widget.enabled,label: 'Time',onChanged:widget.TextField2OnChanged ,): Container(),
        isYes? MDivider(): Container(),
      ],);
  }
}
