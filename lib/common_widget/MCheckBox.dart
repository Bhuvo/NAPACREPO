import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MCheckBox extends StatefulWidget {
  final String? title;
  final Function(bool?, String?)? onChanged;
  final bool? enabled;
  final bool? boolValue;
  const MCheckBox({super.key, this.title, this.onChanged, this.enabled, this.boolValue});

  @override
  State<MCheckBox> createState() => _MCheckBoxState();
}

class _MCheckBoxState extends State<MCheckBox> {
  bool boolValue = false;

  @override
  void initState() {
    boolValue = widget.boolValue ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: boolValue,
          onChanged:(widget.enabled ?? false)?(value) {
            widget.onChanged!(value, widget.title);
            setState(() {
              boolValue = value!;
            });
          } : null,
        ),
        Flexible(child: Text(widget.title ?? '')),
      ],
    );
  }
}
