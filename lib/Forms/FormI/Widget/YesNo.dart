import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class YesNo extends StatefulWidget {
  final String? title;
  final bool? enabled;
  final Function(String)? onDoseChanged;
  final Function(String)? onChanged;
  final Widget? widget;
  final bool? isneedDivider;
  final List<String>? options;
  const YesNo({super.key, this.title, this.onDoseChanged, this.widget, this.isneedDivider,  this.options, this.onChanged, this.enabled});

  @override
  State<YesNo> createState() => _YesNoState();
}

class _YesNoState extends State<YesNo> {
  bool isYes = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MRowTextRadioWidget(enabled: widget.enabled,isneedDivider: false,title: widget.title?? '',options: widget.options ?? null,onChanged: (val){
        widget.onChanged?.call(val);
        if(val =='Yes' || val =='Others'){
          print('state yes $isYes');
          setState(() {
            isYes = true;
          });
        }else{
          print('state no $isYes');
          setState(() {
            isYes = false;
          });
        }
      },),
      (isYes ? widget.widget: Container()) ??  (isYes ? MTextField(enabled: widget.enabled,label: 'Dose',onChanged: widget.onDoseChanged,type: MInputType.numeric,):Container()),
      (widget.isneedDivider ?? true) ? MDivider() : Container(),
    ],);
  }
}
