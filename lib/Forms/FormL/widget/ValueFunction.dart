import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class ValueFunction extends StatefulWidget {
  final String? title;
  final bool? isMVOA ;
  final bool? enabled;
  final Function(String)? MVOA;
  final Function(String)? checkboxValue;
  final Function(String)? radioValue;
  final Function(String)? StenoticradioOnchange;
  final Function(String)? MG;
  final Function(String)? PG;
  final Function(String)? RegurgitantradioOnchange;
  const ValueFunction({super.key, this.title, this.checkboxValue, this.radioValue, this.StenoticradioOnchange, this.MG, this.PG, this.RegurgitantradioOnchange, this.isMVOA, this.MVOA, this.enabled});

  @override
  State<ValueFunction> createState() => _ValueFunctionState();
}

class _ValueFunctionState extends State<ValueFunction> {
  bool Regurgitant = false;
  bool Stenotic = false;
  bool isAbnormal = false;


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MRowTextRadioWidget(enabled: widget.enabled,title: widget.title ?? '',onChanged: (val){
        val =='Abnormal' ? isAbnormal = true : isAbnormal = false;
        widget.radioValue?.call(val);
        setState(() {});
      } ,options: List_items.NormalAbnormal,isneedDivider: false,),
      isAbnormal?  Column(children: [
       MRowTextCheckBox(enabled: widget.enabled,list: List_items.ValuFunction,
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
             widget.checkboxValue;
           },isneedDivider: false),
       Stenotic ?  MRowTextRadioWidget(enabled: widget.enabled,title: 'Stenotic',onChanged: widget.StenoticradioOnchange,options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
       (widget.isMVOA ?? false) && Stenotic ? MrowTextTextFieldWidget(enabled: widget.enabled,title: 'MVOA(cm2):',onChanged:widget.MVOA,isneedDivider: false,) : Container(),
        Stenotic ?MrowTextTextFieldWidget(enabled: widget.enabled,title: 'Mean Gradient:',onChanged:widget.MG,isneedDivider: false,): Container(),
        Stenotic ? MrowTextTextFieldWidget(enabled: widget.enabled,title: 'Peak gradient:',onChanged:widget.PG,isneedDivider: false,):Container(),
        Regurgitant ?  MRowTextRadioWidget(enabled: widget.enabled,title: 'Regurgitant',onChanged: widget.RegurgitantradioOnchange,options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),

      ],): Container(),
       MDivider(),
      Space(),
    ],);
  }
}
