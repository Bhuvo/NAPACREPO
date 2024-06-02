import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MCheckBox extends StatefulWidget {
  final String? title;
  final Function(bool?)? onChanged;
  const MCheckBox({super.key, this.title, this.onChanged});

  @override
  State<MCheckBox> createState() => _MCheckBoxState();
}

class _MCheckBoxState extends State<MCheckBox> {
  bool boolValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.title ?? ''),
        Checkbox(
          value: boolValue,
          onChanged:(value) {
            widget.onChanged!(value);
            setState(() {
              boolValue = value!;
            });
          }
        )
      ],
    );
  }
}
