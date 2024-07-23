import 'package:npac/app/export.dart';

class ValueFunction extends StatefulWidget {
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

  const ValueFunction({super.key, this.title, this.checkboxValue, this.radioValue, this.StenoticradioOnchange, this.MG, this.PG, this.RegurgitantradioOnchange, this.checkboxValueRegurgitant,  this.radioInitialValue, this.selectedlist,  this.StenoticInitialValue,  this.regurgitantInitialValue,  this.MGInitialValue,  this.PGInitialValue, this.enabled, this.gradient, this.maininitialValue, this.mainValue});

  @override
  State<ValueFunction> createState() => _ValueFunctionState();
}

class _ValueFunctionState extends State<ValueFunction> {
  bool Regurgitant = false;
  bool Stenotic = false;
  bool isAbNormal = false;

  @override
  void initState() {
    isAbNormal = widget.radioInitialValue == 'Abnormal' ? true : false;
    widget.selectedlist!.contains('Stenotic')  ?Stenotic =  true : Stenotic = false;
     widget.selectedlist!.contains('Regurgitant') ? Regurgitant =true : Regurgitant =false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MRowTextRadioWidget(key : ValueKey('val${widget.title} ${widget.maininitialValue}'),title: '${widget.title}',options: ['Native','Prosthetic'],initialValue: widget.maininitialValue,enabled: widget.enabled,isneedDivider: false,onChanged: (val){
          widget.mainValue?.call(val);
          setState(() {});
        },),
     widget.maininitialValue == 'Native' ? Column(children: [
       MRowTextRadioWidget(key: ValueKey('val${widget.title} ${widget.radioInitialValue}'),enabled:widget.enabled,title: '${widget.title} Function' ?? '',initialValue: widget.radioInitialValue,onChanged: (val){
         val == 'Abnormal' ? isAbNormal = true : isAbNormal = false;

         widget.radioValue?.call(val);
         setState(() {});
       },options: List_items.NormalAbnormal,isneedDivider: false,),
       isAbNormal ? Column(
         key: ValueKey('val${widget.title} $isAbNormal'),
         children: [
           MRowTextCheckBox(key: ValueKey('val${widget.title} ${widget.selectedlist}'),enabled:widget.enabled,selectedlist:widget.selectedlist,list: List_items.ValuFunction,
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
             },isneedDivider:false,),
           Stenotic ?  MRowTextRadioWidget(enabled:widget.enabled,title: 'Stenotic',initialValue: widget.StenoticInitialValue,onChanged: widget.StenoticradioOnchange,options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
           Stenotic ? MSmallText(text:widget.gradient ?? '',):Container(),
           Stenotic ?  MrowTextTextFieldWidget(enabled:widget.enabled,title: 'MG',initialValue: widget.MGInitialValue,onChanged:widget.MG,isneedDivider: false,) : Container(),
           Stenotic ?  MrowTextTextFieldWidget(enabled:widget.enabled,title: 'PG',initialValue: widget.PGInitialValue,onChanged:widget.PG,isneedDivider: false,) : Container(),
           Regurgitant ?  MRowTextRadioWidget(enabled:widget.enabled,title: 'Regurgitant',initialValue: widget.regurgitantInitialValue,onChanged: widget.RegurgitantradioOnchange,options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
         ],
       ):Container(),
     ],): Container(),
     MDivider(),
     // Stenotic ||Regurgitant ? MDivider(): Container(),
      Space(),
    ],);
  }
}
