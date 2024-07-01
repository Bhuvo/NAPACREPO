import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class FormH3Common extends StatefulWidget {
  final String? title;
  final bool? enabled;
  final Function(String)? radioiOnChanged;
  final Function(String)? TextField1OnChanged;
  final Function(String)? TextField2OnChanged;
  const FormH3Common({super.key, this.title, this.radioiOnChanged, this.TextField1OnChanged, this.TextField2OnChanged, this.enabled,});
  @override
  State<FormH3Common> createState() => _FormH3CommonState();
}
class _FormH3CommonState extends State<FormH3Common> {
  bool isYes = false;

  @override
  Widget build(BuildContext context) {
  return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ((widget.title!= '') ||( widget.title != null)) ? Text(widget.title ?? '') : Container(),
        MRowTextRadioWidget(enabled: widget.enabled,isneedDivider:isYes? false :true,onChanged:(val){
          if(val =='Yes'){
            setState(() {
              isYes = true;
            });
          }else{
            setState(() {
              isYes = false;
            });
          }
          widget.radioiOnChanged;
        },),
        isYes? MTextField(enabled: widget.enabled,label: 'AN',onChanged:widget.TextField1OnChanged ,): Container(),
        isYes? MTextField(enabled: widget.enabled,label: 'IP',onChanged:widget.TextField1OnChanged ,): Container(),
        isYes? MTextField(enabled: widget.enabled,label: 'PA',onChanged:widget.TextField1OnChanged ,): Container(),
        isYes? MTextField(enabled: widget.enabled,label: 'Time (Gest. age / Postnatal day',onChanged:widget.TextField2OnChanged ,): Container(),
        isYes? MDivider(): Container(),
      ],);
  }
}
