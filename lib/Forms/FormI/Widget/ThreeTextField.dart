import 'package:npac/app/export.dart';

class ThreeTextField extends StatelessWidget {
  final String title;
  final bool? enabled;
  final bool? isneedDivider;
  final bool? isOptionNeeded;
  final bool? isonlyDose;
  final String? text1;
  final String? text2;
  final String? text3;
  final MInputType? text1type;
  final MInputType? text2type;
  final MInputType? text3type;
  final Function(String)? onOptionChanged;
  final Function(String)? onText1Changed;
  final Function(String)? onText2Changed;
  final Function(String)? onText3Changed;
  const ThreeTextField({super.key, required this.title, this.isOptionNeeded, this.onOptionChanged, this.isneedDivider, this.text1, this.text2, this.text3, this.onText1Changed, this.onText2Changed, this.onText3Changed, this.text1type, this.text2type, this.text3type, this.isonlyDose, this.enabled});

  @override
  Widget build(BuildContext context) {
    return MRowTextWidget(title: title,
      widget: Column(
        children: [
          (isOptionNeeded ?? false) ?  MRowTextRadioWidget(enabled: enabled,options: ['IV Inf','IV Bolus','Subcutaneous'],onChanged: (val){},isneedDivider:isneedDivider ?? true ,) : Container(),
      MTextField(enabled: enabled,label: text1 ??'Dose',onChanged: onText1Changed,type:text1type ?? MInputType.numeric,),
          (isonlyDose ?? false) ? Container(): MTextField(enabled: enabled,label: text2 ?? 'INR',onChanged: onText2Changed,type:text2type?? MInputType.numeric),
          (isonlyDose ?? false) ? Container(): MTextField(enabled: enabled,label: text3 ??'Period',onChanged: onText3Changed,type:text3type?? MInputType.numeric),
    ],),);
  }
}
