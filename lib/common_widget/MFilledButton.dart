import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/utils/navigator_utils.dart';

class MFilledButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  const MFilledButton({super.key, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(width:  double.infinity, child: FilledButton(onPressed: onPressed, child: Text(text ?? '')))
    ;
  }
}
