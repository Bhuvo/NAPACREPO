import 'package:flutter/cupertino.dart';

class MText extends StatelessWidget {
  final String? text;
  const MText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),);
  }
}
