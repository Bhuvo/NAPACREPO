import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class FromE2Common extends StatefulWidget {
  final String? title;
  final Function(String)? radioiOnChanged;
  final Function(String)? TextFieldOnChanged;

  const FromE2Common({super.key,  this.title,  this.radioiOnChanged, this.TextFieldOnChanged});

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
            MRowTextRadioWidget(isneedDivider:isYes? false :true,onChanged:(val){
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
      isYes? MTextField(label: 'Gest Age',onChanged:widget.TextFieldOnChanged ,): Container(),
      isYes? MDivider(): Container(),
    ],);
  }
}
