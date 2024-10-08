import 'package:npac/app/export.dart';

class FormH6Common extends StatefulWidget {
  final String? title;
  final bool? enabled;
  final String? radioInitialValue;
  final String? TextField1InitialValue;
  final Function(String)? radioiOnChanged;
  final Function(String)? TextFieldOnChanged;
  const FormH6Common({super.key, this.title, this.enabled, this.radioiOnChanged, this.TextFieldOnChanged, this.radioInitialValue, this.TextField1InitialValue});

  @override
  State<FormH6Common> createState() => _FormH6CommonState();
}

class _FormH6CommonState extends State<FormH6Common> {
  bool isYes = false;

  bool isAn = false;
  bool isIP = false;
  bool isPA = false;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ((widget.title!= '') ||( widget.title != null)) ? Text(widget.title ?? '') : Container(),
        MRowTextRadioWidget(enabled: widget.enabled,initialValue: widget.radioInitialValue,title: widget.title,isneedDivider:isYes? false :true,onChanged:(val){
          if(val =='Yes'){
            setState(() {
              isYes = true;
            });
          }else{
            setState(() {
              isYes = false;
            });
          }
          widget.radioiOnChanged;
        },),
        // isYes? MRowTextRadioWidget(enabled: widget.enabled ,title: 'If yes, specify',options: ['AN' , 'IP', 'PA'],onChanged: (val){
        //   val== 'AN' ? isAn = true : isAn = false;
        //   val== 'IP' ? isIP = true : isIP = false;
        //   val== 'PA' ? isPA = true : isPA = false;
        //   setState(() {
        //   });
        // },isneedDivider: false,): Container(),
        // isYes && isAn? MTextField(enabled: widget.enabled,label: 'AN Time(in Weeks)',onChanged:widget.TextField1OnChanged ,): Container(),
        // isYes && isIP ? MTextField(enabled: widget.enabled,label: 'IP Time(in days)',onChanged:widget.TextField1OnChanged ,): Container(),
        // isYes && isPA? MTextField(enabled: widget.enabled,label: 'PA',onChanged:widget.TextField1OnChanged ,): Container(),
         isYes? MTextField(enabled: widget.enabled,initalValue: widget.TextField1InitialValue,label: 'Time',onChanged:widget.TextFieldOnChanged ,): Container(),
        isYes? MDivider(): Container(),
      ],);
  }
}
