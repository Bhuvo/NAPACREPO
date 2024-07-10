import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class FromE2Common extends StatefulWidget {
  final String? title;
  final Function(String)? radioiOnChanged;
  final Function(String)? TextFieldOnChanged;
  final bool? enabled;
  final String? radioInitialValue;
  final String? TextInitialValue;
  const FromE2Common({super.key,  this.title,  this.radioiOnChanged, this.TextFieldOnChanged, this.enabled, this.radioInitialValue, this.TextInitialValue});

  @override
  State<FromE2Common> createState() => _FromE2CommonState();
}

class _FromE2CommonState extends State<FromE2Common> {
  bool isYes = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            Text(widget.title ?? ''),
            MRowTextRadioWidget( initialValue:widget.radioInitialValue,enabled:widget.enabled ,isneedDivider:isYes? false :true,onChanged:(val){
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
      isYes? MTextField( initalValue:widget.TextInitialValue,label: 'Gestational Age',onChanged:widget.TextFieldOnChanged ,): Container(),
      isYes? MDivider(): Container(),
    ],);
  }
}
