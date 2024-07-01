import 'package:flutter/material.dart';
import 'package:npac/app/export.dart';

class MRowTextDropDown extends StatefulWidget {
  final bool? isneedDivider;
  final MInputType? type;
  final String? title;
  final String? initialValue;
  final Function(String)? onChanged;
  final bool? enabled;
  final List<String>? items;
  const MRowTextDropDown({super.key, this.isneedDivider, this.type, this.title, this.initialValue, this.onChanged, this.enabled, this.items});

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
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space(),
                  Text(widget.title ?? ''),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    width: double.infinity,
                    child: DropdownButton<String>(focusColor: Colors.white,
                      borderRadius:  BorderRadius.circular(10),
                      hint: Text("Select an option"),padding: EdgeInsets.only(left: 10,right: 5),
                      value:selectedValue == '' ? null : selectedValue,
                      isExpanded: true,
                      underline: SizedBox.shrink(),
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
                  ),
                  Space()
                ],
              ),
            ),
            // Checkbox(value: widget.checkboxvalue, onChanged: (value) {}),
          ],
        ),
        (widget.isneedDivider ?? true) ? MDivider() : Container(),
      ],
    );;
  }
}
