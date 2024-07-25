import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';

class ValueFunction extends StatefulWidget {
  final bool? isMVOA ;
  final Function(String)? MVOA;
  final String? title;
  final String? radioInitialValue;
  final String? maininitialValue;
  final Function(String)? mainValue;
  final String? gradient;
  final List<String>? selectedlist;
  final String? StenoticInitialValue;
  final String? regurgitantInitialValue;
  final String? MGInitialValue;
  final String? PGInitialValue;
  final bool? enabled;
  final Function(bool)? checkboxValue;
  final Function(bool)? checkboxValueRegurgitant;
  final Function(String)? radioValue;
  final Function(String)? StenoticradioOnchange;
  final Function(String)? MG;
  final Function(String)? PG;
  final Function(String)? RegurgitantradioOnchange;

  const ValueFunction({
    super.key, this.isMVOA, this.MVOA, this.title, this.radioInitialValue, this.maininitialValue, this.mainValue, this.gradient, this.selectedlist, this.StenoticInitialValue, this.regurgitantInitialValue, this.MGInitialValue, this.PGInitialValue, this.enabled, this.checkboxValue, this.checkboxValueRegurgitant, this.radioValue, this.StenoticradioOnchange, this.MG, this.PG, this.RegurgitantradioOnchange,});

  @override
  State<ValueFunction> createState() => _ValueFunctionState();
}

class _ValueFunctionState extends State<ValueFunction> {
  bool Regurgitant = false;
  bool Stenotic = false;
  bool isAbnormal = false;

  @override
  void initState() {
    isAbnormal = widget.radioInitialValue == 'Abnormal' ? true : false;
    widget.selectedlist!.contains('Stenotic')  ?Stenotic =  true : Stenotic = false;
    widget.selectedlist!.contains('Regurgitant') ? Regurgitant =true : Regurgitant =false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
    MRowTextRadioWidget(key : ValueKey('val${widget.title} ${widget.maininitialValue}'),title: '${widget.title}',options: ['Native','Prosthetic'],initialValue: widget.maininitialValue,enabled: widget.enabled,isneedDivider: false,onChanged: (val){
    widget.mainValue?.call(val);
    setState(() {});
    },),
    widget.maininitialValue == 'Native' ? Column(children: [
    MRowTextRadioWidget(key: ValueKey('val${widget.title} ${widget.radioInitialValue}'),enabled:widget.enabled,title: '${widget.title} Function' ?? '',initialValue: widget.radioInitialValue,onChanged: (val){
    val == 'Abnormal' ? isAbnormal = true : isAbnormal = false;
    widget.radioValue?.call(val);
    setState(() {});
    },options: List_items.NormalAbnormal,isneedDivider: false,),

      isAbnormal?  Column(
    key: ValueKey('val${widget.title} $isAbnormal'),
    children: [
       MRowTextCheckBox(key: ValueKey('val${widget.title} ${widget.selectedlist}'),enabled: widget.enabled,list: List_items.ValuFunction,
           result: (val){
             if(val.contains('Stenotic')){
    widget.checkboxValue?.call(true);
    setState(() {
                 Stenotic = true;
               });
             }else{
    widget.checkboxValue?.call(false);
               setState(() {
                 Stenotic = false;
               });
             }
             if(val.contains('Regurgitant')){
               widget.checkboxValueRegurgitant?.call(true);
               setState(() {
                 Regurgitant = true;
               });

             }else{
               widget.checkboxValueRegurgitant?.call(false);
               setState(() {
                 Regurgitant = false;
               });
             }
             widget.checkboxValue;
           },isneedDivider: false),
    Stenotic ?  MRowTextRadioWidget(enabled:widget.enabled,title: 'Stenotic',initialValue: widget.StenoticInitialValue,onChanged: widget.StenoticradioOnchange,options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
       (widget.isMVOA ?? false) && Stenotic ? MrowTextTextFieldWidget(enabled: widget.enabled,title: 'MVOA(cm2):',onChanged:widget.MVOA,isneedDivider: false,) : Container(),
    Stenotic ? MSmallText(text:widget.gradient ?? '',):Container(),
    Stenotic ?  MrowTextTextFieldWidget(enabled:widget.enabled,title: 'MG',initialValue: widget.MGInitialValue,onChanged:widget.MG,isneedDivider: false,) : Container(),
    Stenotic ?  MrowTextTextFieldWidget(enabled:widget.enabled,title: 'PG',initialValue: widget.PGInitialValue,onChanged:widget.PG,isneedDivider: false,) : Container(),
    Regurgitant ?  MRowTextRadioWidget(enabled:widget.enabled,title: 'Regurgitant',initialValue: widget.regurgitantInitialValue,onChanged: widget.RegurgitantradioOnchange,options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),

    ],): Container(),
       MDivider(),
      Space(),
    ],): Container(),

    ]);
  }
}
