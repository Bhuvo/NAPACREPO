import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextCheckBox.dart';

class valueFunction extends StatefulWidget {
  final String? title;
  const valueFunction({super.key, this.title});

  @override
  State<valueFunction> createState() => _valueFunctionState();
}

class _valueFunctionState extends State<valueFunction> {
  bool isOther = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          MText(text: widget.title ??'Mitral',),
        ],
      ),
      Space(),
      MrowTextTextFieldWidget(title: 'I2.2 Valve size(mm)',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
      MrowTextTextFieldWidget(title: 'I2.3 Post-op gradient (mmHg)',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
      MRowTextCheckBox(title: 'I2.4 Type of valve',result: (val){
        if(val.contains('Other')) {
          setState(() {
            isOther = true;
          });
        } else {
          setState(() {
            isOther = false;
          });
        }
      },list: ['Bio prosthetic','Single tilting disc','Bi-leaflet','Other'],isneedDivider: false,),
      isOther ? MTextField(label: 'If Others specify:',onChanged: (val){},) : Container(),
      MRowTextRadioWidget(title: 'I2.5 Post op OAC', onChanged: (val){},options: ['Warfarin','Acitrom'],isneedDivider: false,),
      MRowTextRadioWidget(title: 'I2.5 Post op Aspirin ', onChanged: (val){},isneedDivider: false,),
      MDivider()
    ],);
  }
}
