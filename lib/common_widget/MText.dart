import 'package:flutter/cupertino.dart';

class MText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const MText({super.key, this.text, this.fontSize, this.fontWeight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '',style: TextStyle(fontSize: fontSize ?? 14,color: color ?? CupertinoColors.black,fontWeight: fontWeight ?? FontWeight.bold),);
  }
}
