import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class ValueFunction extends StatefulWidget {
  final String? title;
  final bool? isMVOA ;
  final Function(String)? MVOA;
  final Function(String)? checkboxValue;
  final Function(String)? radioValue;
  final Function(String)? StenoticradioOnchange;
  final Function(String)? MG;
  final Function(String)? PG;
  final Function(String)? RegurgitantradioOnchange;
  const ValueFunction({super.key, this.title, this.checkboxValue, this.radioValue, this.StenoticradioOnchange, this.MG, this.PG, this.RegurgitantradioOnchange, this.isMVOA, this.MVOA});

  @override
  State<ValueFunction> createState() => _ValueFunctionState();
}

class _ValueFunctionState extends State<ValueFunction> {
  bool Regurgitant = false;
  bool Stenotic = false;


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MRowTextRadioWidget(title: widget.title ?? '',onChanged: widget.radioValue ,options: ['Normal'],isneedDivider: false,),
      MRowTextCheckBox(list: List_items.ValuFunction,
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
      Stenotic ?  MRowTextRadioWidget(title: 'Stenotic',onChanged: widget.StenoticradioOnchange,options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
      Regurgitant ?  MRowTextRadioWidget(title: 'Regurgitant',onChanged: widget.RegurgitantradioOnchange,options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
    (widget.isMVOA ?? false) ? MrowTextTextFieldWidget(title: 'MVOA(cm2):',onChanged:widget.MVOA,isneedDivider: false,) : Container(),
      MrowTextTextFieldWidget(title: 'Mean Gradient:',onChanged:widget.MG,isneedDivider: false,),
      MrowTextTextFieldWidget(title: 'Peak gradient:',onChanged:widget.PG,isneedDivider: false,),
       MDivider(),
      Space(),
    ],);
  }
}
