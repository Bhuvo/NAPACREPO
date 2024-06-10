import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class TwoTextFields extends StatelessWidget {
  final String? title1;
  final String? title2;
  final MInputType ? type1;
  final MInputType ? type2;
  final Function(String)? onChange1;
  final Function(String)? onChange2;

  const TwoTextFields({super.key, this.title1, this.title2, this.type1, this.type2,  this.onChange1,  this.onChange2});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Space(),
      MTextField(label: title1 ?? 'Mitral',onChanged:onChange1,type:type1 ?? MInputType.text,) ,
      Space(),
      MTextField(label: title2 ?? 'Aortic',onChanged:onChange2,type:type2 ?? MInputType.text,)
    ],);
  }
}
