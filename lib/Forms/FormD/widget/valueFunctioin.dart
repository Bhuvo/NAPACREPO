import 'package:npac/app/export.dart';

class ValueFunction extends StatefulWidget {
  final String? title;
  final bool? isVelocity;
  final Function(String)? checkboxValue;
  final Function(String)? radioValue;
  final Function(String)? StenoticradioOnchange;
  final Function(String)? velocity;
  final Function(String)? MG;
  final Function(String)? PG;
  final Function(String)? RegurgitantradioOnchange;
  const ValueFunction({super.key, this.title, this.checkboxValue, this.radioValue, this.StenoticradioOnchange, this.MG, this.PG, this.RegurgitantradioOnchange, this.isVelocity, this.velocity});

  @override
  State<ValueFunction> createState() => _valueFunctioinState();
}

class _valueFunctioinState extends State<ValueFunction> {
  bool Regurgitant = false;
  bool Stenotic = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MRowTextRadioWidget(title: widget.title ?? '',onChanged: widget.radioValue ,options: ['Native','Prosthetic'],isneedDivider: false,),
      MRowTextRadioWidget(onChanged: widget.radioValue ,options: List_items.NormalAbnormal,isneedDivider: false,),
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
          widget.StenoticradioOnchange;
        },isneedDivider: Stenotic ||Regurgitant ?false  : true,),
      Stenotic ?  MRowTextRadioWidget(title: 'Stenotic',onChanged: widget.StenoticradioOnchange,options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
      (widget.isVelocity?? false) ? (Stenotic ?  MrowTextTextFieldWidget(title: 'AV peak velocity (m/s)',onChanged:widget.velocity,isneedDivider: false,) : Container()) : Container(),
      Stenotic ?  MrowTextTextFieldWidget(title: 'MG',onChanged:widget.MG,isneedDivider: false,) : Container(),
      Stenotic ?  MrowTextTextFieldWidget(title: 'PG',onChanged:widget.PG,isneedDivider: false,) : Container(),
      Regurgitant ?  MRowTextRadioWidget(title: 'Regurgitant',onChanged: widget.RegurgitantradioOnchange,options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
      Stenotic ||Regurgitant ? MDivider(): Container(),
      Space(),
    ],);
  }
}
