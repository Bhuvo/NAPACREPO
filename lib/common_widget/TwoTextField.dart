import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class TwoTextFields extends StatelessWidget {
  final bool? isEnabled;
  final String? title1;
  final String? title2;
  final String? title3;
  final String? title4;
  final MInputType ? type1;
  final MInputType ? type2;
  final MInputType ? type3;
  final MInputType ? type4;
  final Function(String)? onChange1;
  final Function(String)? onChange2;
  final Function(String)? onChange3;
  final Function(String)? onChange4;

  const TwoTextFields({super.key, this.title1, this.title2, this.type1, this.type2,  this.onChange1,  this.onChange2, this.isEnabled, this.title3, this.title4, this.type3, this.type4, this.onChange3, this.onChange4});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Space(),
      MTextField(enabled:isEnabled,label: title1 ?? 'Mitral',onChanged:onChange1,type:type1 ?? MInputType.text,) ,
      Space(),
      MTextField(enabled:isEnabled,label: title2 ?? 'Aortic',onChanged:onChange2,type:type2 ?? MInputType.text,),
     Space(),
      title3 ==null ? Container(): MTextField(enabled:isEnabled,label: title3 ?? 'tricuspid',onChanged:onChange3,type:type3 ?? MInputType.text,) ,
      Space(),
      title4 ==null ? Container():MTextField(enabled:isEnabled,label: title4 ?? 'pulmonary',onChanged:onChange4,type:type4 ?? MInputType.text,)
    ],);
  }
}
