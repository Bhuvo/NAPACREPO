import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/common_widget/radio_button_list.dart';
import 'package:npac/model/form1Model.dart';

class FormOne extends StatefulWidget {
  final Form1List data;
  final bool isExpanded;
   FormOne({super.key, required this.data, required this.isExpanded});

  @override
  State<FormOne> createState() => _FormOneState();
}

class _FormOneState extends State<FormOne> {
  bool widget1 = false;
  String widget1String ='';


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isExpanded
            ? Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${widget.data.heading}'),
            MRadioButtonList(key: ValueKey('${widget.data.heading}'),options: widget.data.options,onChanged: (Stringvalue){
              setState(() {
                widget1String = '';
              });
              setState(() {
               // widget1 = boolvalue;
                //widget1String = Stringvalue;
              });
            },selectedValue:widget1String ,),
          ],
        )
            : Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Text('${widget.data.heading} ${widget1String} '),
            Checkbox(value: widget1, onChanged: (value) {}),
          ],
        ),
      ],
    );
  }
}
