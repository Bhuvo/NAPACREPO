import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class MSmallText extends StatelessWidget {
  final String? text;
  const MSmallText({super.key,  this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: Text(text ?? '')),
      ],
    );
  }
}
