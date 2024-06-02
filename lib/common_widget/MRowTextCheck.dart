import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/common_widget/MTextField.dart';
import 'package:npac/widgets/MdateTimePicker.dart';
import 'package:npac/widgets/SheetUP.dart';

class MRowTextCheck extends StatefulWidget {
  final bool? checkboxvalue;
  final String? title;
  final String? subtitle;
  final Function(bool?)? onChanged;
  const MRowTextCheck({super.key, this.checkboxvalue, this.title, this.subtitle, this.onChanged});

  @override
  State<MRowTextCheck> createState() => _MRowTextCheckState();
}

class _MRowTextCheckState extends State<MRowTextCheck> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title ?? ''),
                Checkbox(value: widget.checkboxvalue ?? false, onChanged: widget.onChanged),
                ],
              ),
            ),
            // Checkbox(value: widget.checkboxvalue, onChanged: (value) {}),
          ],
        ),
        Divider(thickness: 1,height: 3,),
      ],
    );
  }
}
