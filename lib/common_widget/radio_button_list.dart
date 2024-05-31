import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MRadioButtonList<T> extends StatefulWidget {
  final List<T>? options;
  final Function(String , bool)? onChanged;
  final String? selectedValue;
  const MRadioButtonList({super.key, this.options, this.onChanged, this.selectedValue});

  @override
  State<MRadioButtonList> createState() => _MRadioButtonListState();
}

class _MRadioButtonListState extends State<MRadioButtonList> {
  String? _selectedOption;
  //final List<String> _options = ["Option 1", "Option 2", "Option 3", "Option 4"];
  List<String> manualOptions = ["Yes","No"];
  void _handleRadioValueChange(String? value) {
    widget.options == null || widget.options!.isEmpty  ? widget.onChanged!(value!, true) : widget.onChanged!(value!, true);
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
      shrinkWrap: true,
      itemCount: manualOptions.length,
      itemBuilder: (context, index) {
        return RadioListTile<String>(
          title: Text(manualOptions[index]),
          value: manualOptions[index],
          groupValue: _selectedOption,
          onChanged: _handleRadioValueChange,
        );
      },
    ) : ListView.builder(
      scrollDirection:Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.options?.length,
      itemBuilder: (context, index) {
        return RadioListTile<String>(
          title: Text(widget.options?[index]),
          value: widget.options?[index],
          groupValue: _selectedOption,
          onChanged: _handleRadioValueChange,
        );
      },
    );
  }
}
