import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/common_widget/MTextField.dart';
import 'package:npac/widgets/MdateTimePicker.dart';
import 'package:npac/widgets/SheetUP.dart';

class MrowTextTextFieldWidget extends StatefulWidget {
  final bool? isneedDivider;
  final MInputType? type;
  final String? title;
  final String? initialValue;
  final Function(String)? onChanged;
  const MrowTextTextFieldWidget({super.key,this.title,this.onChanged, this.initialValue, this.type, this.isneedDivider = true});

  @override
  State<MrowTextTextFieldWidget> createState() => _MrowTextTextFieldWidgetState();
}

class _MrowTextTextFieldWidgetState extends State<MrowTextTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title ?? ''),
                 MTextField(onChanged: widget.onChanged,initalValue:widget.initialValue ?? '',type: widget.type ?? MInputType.text ,)
                ],
              ),
            ),
            // Checkbox(value: widget.checkboxvalue, onChanged: (value) {}),
          ],
        ),
       (widget.isneedDivider ?? true) ? Divider(thickness: 1,height: 3,) : Container(),
      ],
    );
  }
}
