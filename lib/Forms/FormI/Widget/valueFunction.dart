import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextCheckBox.dart';

class valueFunction extends StatefulWidget {
  final bool? isEnabled;
  final String? title;
  const valueFunction({super.key, this.title, this.isEnabled});

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
      MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'G2.2 Valve size(mm)',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
      MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'G2.3 Post-op gradient (mmHg)',onChanged: (val){},type: MInputType.numeric,isneedDivider: false,),
      MRowTextCheckBox(enabled:widget.isEnabled,title: 'G2.4 Type of valve',result: (val){
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
      isOther ? MTextField(enabled:widget.isEnabled,label: 'If Others specify:',onChanged: (val){},) : Container(),
      MDivider()
    ],);
  }
}
