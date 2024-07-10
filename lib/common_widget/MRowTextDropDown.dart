import 'package:flutter/material.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MSmallText.dart';

class MRowTextDropDown extends StatefulWidget {
  final bool? isneedDivider;
  final MInputType? type;
  final String? title;
  final String? initialValue;
  final Function(String)? onChanged;
  final String Function(String?)? validator;
  final bool? enabled;
  final List<String>? items;
  const MRowTextDropDown({super.key, this.isneedDivider, this.type, this.title, this.initialValue, this.onChanged, this.enabled, this.items, this.validator});

  @override
  State<MRowTextDropDown> createState() => _MRowTextDropDownState();
}

class _MRowTextDropDownState extends State<MRowTextDropDown> {
   String selectedValue ='';
  //final List<String> items = ["Option 1", "Option 2", "Option 3", "Option 4"];
   List<String> items = List.generate(42, (index) => (index + 1).toString());
   @override
  void initState() {
    setState(() {
      selectedValue = widget.initialValue ?? '';
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Space(),
        MSmallText(text: widget.title ?? '',),
        Space(),
        DropdownButtonFormField<String>(focusColor: Colors.white,
          borderRadius:  BorderRadius.circular(10),
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.all(0),
          ),
          hint: Text("Select an option"),
          value:selectedValue == '' ? null : selectedValue,
          isExpanded: true,validator:widget.validator ?? (val){
          if(val == null) return 'Please select from DropDown';
         // return selectedValue == '' ?'Please select from DropDown' : null;
          },
          // underline: SizedBox.shrink(),
          // icon: Icon(Icons.arrow_drop_down),
          onChanged:(val){
          print(val);
          selectedValue = val!;
          widget.onChanged?.call(val);
          setState(() {});
          },
          items: widget.items != null ? widget.items?.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList() : items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Space(),
        (widget.isneedDivider ?? true) ? MDivider() : Container(),
      ],
    );;
  }
}
