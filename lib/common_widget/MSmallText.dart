import 'package:flutter/cupertino.dart';

class MSmallText extends StatelessWidget {
  final String? text;
  const MSmallText({super.key,  this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '');
  }
}
