import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/common_widget/MCheckBox.dart';
 
class MRadioButtonList<T> extends StatefulWidget {
  final List<T>? options;
  final List<T>? CheckBoxOptions;
  final Function(String )? onChanged;
  final String? selectedValue;
  const MRadioButtonList({super.key, this.options, this.onChanged, this.selectedValue, this.CheckBoxOptions});

  @override
  State<MRadioButtonList> createState() => _MRadioButtonListState();
}

class _MRadioButtonListState extends State<MRadioButtonList> {
  String? _selectedOption;
  //final List<String> _options = ["Option 1", "Option 2", "Option 3", "Option 4"];
  List<String> manualOptions = ["Yes","No"];
  void _handleRadioValueChange(String? value) {
    widget.options == null || widget.options!.isEmpty  ? widget.onChanged!(value!) : widget.onChanged!(value!);
    setState(() {
      _selectedOption = value;
    });
  }
  int getindex(){
    if(widget.options!.contains(widget.selectedValue)){
      return widget.options!.indexOf(widget.selectedValue);
    }else{
      return 0;
    }
  }

  @override
  void initState() {
    _selectedOption =widget.selectedValue ?? '';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.options == null || widget.options!.isEmpty  ? ListView.builder(
      scrollDirection:Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: manualOptions.length,
      itemBuilder: (context, index) {
        return RadioListTile<String>(
          key: ValueKey(manualOptions[index]),
          title: Text(manualOptions[index]),
          value: manualOptions[index],
          groupValue: _selectedOption,
          onChanged: _handleRadioValueChange,
        );
      },
    ) : ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection:Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.options?.length,
      itemBuilder: (context, index) {
          return RadioListTile<String>(
          key: ValueKey(widget.options?[index]),
          title: Text(widget.options?[index]),
          // subtitle: widget.options?[index] == "Cardiomyopathy (Tick the applicable)" ?ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: widget.CheckBoxOptions?.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return MCheckBox(title: '${widget.CheckBoxOptions?[index]}',onChanged: (val){},); },
          // ): Container(),
          value: widget.options?[index],
          groupValue: _selectedOption,
          onChanged: _handleRadioValueChange,
        );
      },
    );
  }
}
