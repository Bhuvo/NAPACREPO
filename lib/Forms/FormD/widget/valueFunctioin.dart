import 'package:npac/app/export.dart';

class ValueFunction extends StatefulWidget {
  final String? title;
 // final bool? isVelocity;
  final String? gradient;
  final bool? enabled;
  final Function(String)? checkboxValue;
  final Function(String)? radioValue;
  final Function(String)? StenoticradioOnchange;
  final Function(String)? velocity;
  final Function(String)? MG;
  final Function(String)? PG;
  final Function(String)? RegurgitantradioOnchange;
  const ValueFunction({super.key, this.title, this.checkboxValue, this.radioValue, this.StenoticradioOnchange, this.MG, this.PG, this.RegurgitantradioOnchange, this.velocity, this.gradient, this.enabled});

  @override
  State<ValueFunction> createState() => _valueFunctioinState();
}

class _valueFunctioinState extends State<ValueFunction> {
  bool Regurgitant = false;
  bool Stenotic = false;
  bool isNative = false;
  bool isabnormal = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MRowTextRadioWidget(enabled:widget.enabled,title: widget.title ?? '',onChanged: (val){
        val == 'Native' ? isNative = true : isNative = false;
        widget.radioValue?.call(val);
        setState(() {});
      } ,options: ['Native','Prosthetic'],isneedDivider: false,),
     isNative ? Column(children: [
      MRowTextRadioWidget(enabled:widget.enabled,title: 'Function value',onChanged:(val){
        val == 'Abnormal' ? isabnormal = true : isabnormal = false;
        //widget.radioValue?.call(val);
        setState(() {});
      } ,options: List_items.NormalAbnormal,isneedDivider: false,),
       isabnormal ?MRowTextCheckBox(enabled:widget.enabled,list: List_items.ValuFunction,
        result: (val){
          if(val.contains('Stenotic')){
            setState(() {
              Stenotic = true;
            });
          }else{
            setState(() {
              Stenotic = false;
            });
          }
          if(val.contains('Regurgitant')){
            setState(() {
              Regurgitant = true;
            });
          }else{
            setState(() {
              Regurgitant = false;
            });
          }
          widget.StenoticradioOnchange;
        },isneedDivider: Stenotic ||Regurgitant ?false  : true,) : Container(),
      Stenotic ?  MRowTextRadioWidget(enabled:widget.enabled,title: 'Stenotic',onChanged: widget.StenoticradioOnchange,options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
      // (widget.isVelocity?? false) ? (Stenotic ?  MrowTextTextFieldWidget(title: 'AV peak velocity (m/s)',onChanged:widget.velocity,isneedDivider: false,) : Container()) : Container(),
      Stenotic ? MSmallText(text:widget.gradient ?? '',):Container(),
      Stenotic ?  Space(): Container(),
      Stenotic ?  MrowTextTextFieldWidget(enabled:widget.enabled,title: 'MG',onChanged:widget.MG,isneedDivider: false,) : Container(),
      Stenotic ?  MrowTextTextFieldWidget(enabled:widget.enabled,title: 'PG',onChanged:widget.PG,isneedDivider: false,) : Container(),
      Regurgitant ?  MRowTextRadioWidget(enabled:widget.enabled,title: 'Regurgitant',onChanged: widget.RegurgitantradioOnchange,options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
      Stenotic ||Regurgitant ? MDivider(): Container(),
    ],):Container(),
      Space(),
    ],);
  }
}
