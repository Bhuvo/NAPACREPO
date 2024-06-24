import 'package:npac/app/export.dart';

class ValueFunction extends StatefulWidget {
  final String? title;
  final String? radioInitialValue;
  final List<String>? selectedlist;
  final String? StenoticInitialValue;
  final String? regurgitantInitialValue;
  final String? MGInitialValue;
  final String? PGInitialValue;

  final Function(bool)? checkboxValue;
  final Function(bool)? checkboxValueRegurgitant;
  final Function(String)? radioValue;
  final Function(String)? StenoticradioOnchange;
  final Function(String)? MG;
  final Function(String)? PG;
  final Function(String)? RegurgitantradioOnchange;

  const ValueFunction({super.key, this.title, this.checkboxValue, this.radioValue, this.StenoticradioOnchange, this.MG, this.PG, this.RegurgitantradioOnchange, this.checkboxValueRegurgitant,  this.radioInitialValue, this.selectedlist,  this.StenoticInitialValue,  this.regurgitantInitialValue,  this.MGInitialValue,  this.PGInitialValue});

  @override
  State<ValueFunction> createState() => _ValueFunctionState();
}

class _ValueFunctionState extends State<ValueFunction> {
  bool Regurgitant = false;
  bool Stenotic = false;


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MRowTextRadioWidget(title: widget.title ?? '',initialValue: widget.radioInitialValue,onChanged: widget.radioValue ,options: List_items.NormalAbnormal,isneedDivider: false,),
      MRowTextCheckBox(selectedlist:widget.selectedlist,list: List_items.ValuFunction,
        result: (val){
          if(val.contains('Stenotic')){
            setState(() {
              Stenotic = true;
            });
            widget.checkboxValue?.call(true);
          }else{
            setState(() {
              Stenotic = false;
            });
            widget.checkboxValue?.call(false);
          }
          if(val.contains('Regurgitant')){
            setState(() {
              Regurgitant = true;
            });
            widget.checkboxValueRegurgitant?.call(true);
          }else{
            setState(() {
              Regurgitant = false;
            });
            widget.checkboxValueRegurgitant?.call(false);
          }

          // widget.StenoticradioOnchange;
        },isneedDivider: Stenotic ||Regurgitant ?false  : true,),
      Stenotic ?  MRowTextRadioWidget(title: 'Stenotic',initialValue: widget.StenoticInitialValue,onChanged: widget.StenoticradioOnchange,options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
      Stenotic ?  MrowTextTextFieldWidget(title: 'MG',initialValue: widget.MGInitialValue,onChanged:widget.MG,isneedDivider: false,) : Container(),
      Stenotic ?  MrowTextTextFieldWidget(title: 'PG',initialValue: widget.PGInitialValue,onChanged:widget.PG,isneedDivider: false,) : Container(),
      Regurgitant ?  MRowTextRadioWidget(title: 'Regurgitant',initialValue: widget.regurgitantInitialValue,onChanged: widget.RegurgitantradioOnchange,options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
      Stenotic ||Regurgitant ? MDivider(): Container(),
      Space(),
    ],);
  }
}
