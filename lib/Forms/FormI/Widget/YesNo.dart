import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class YesNo extends StatefulWidget {
  final String? title;
  final Function(String)? onDoseChanged;
  final Widget? widget;
  const YesNo({super.key, this.title, this.onDoseChanged, this.widget});

  @override
  State<YesNo> createState() => _YesNoState();
}

class _YesNoState extends State<YesNo> {
  bool isYes = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MRowTextRadioWidget(isneedDivider: false,title: widget.title?? '',onChanged: (val){
        if(val =='Yes'){
          setState(() {
            isYes = true;
          });
        }else{
          setState(() {
            isYes = false;
          });
        }
      },),
      widget.widget ??  (isYes? MTextField(label: 'Dose',onChanged: widget.onDoseChanged,type: MInputType.numeric,):Container()),
   MDivider()
    ],);
  }
}
