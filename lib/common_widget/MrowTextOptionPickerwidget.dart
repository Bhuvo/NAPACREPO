import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/common_widget/MTextField.dart';
import 'package:npac/widgets/MdateTimePicker.dart';
import 'package:npac/widgets/SheetUP.dart';
import 'package:npac/widgets/space.dart';

class MrowTextOptionPickerwidget<T> extends StatefulWidget {
  final List<T>? options;
  final String? label;
  final String? title;
  final List<T>? initialSelectedValue;
  final bool? enabled;
  final T? initialvalue;
  final bool? isneedDivider;
  final Function(T)? onChanged;
  final Function(List<T>)? onSelectedList;
  const MrowTextOptionPickerwidget({super.key,this.title, this.initialvalue, this.options, this.onChanged, this.onSelectedList, this.initialSelectedValue, this.label, this.enabled, this.isneedDivider});

  @override
  State<MrowTextOptionPickerwidget<T>> createState() => _MrowTextOptionPickerwidgetState<T>();
}

class _MrowTextOptionPickerwidgetState<T> extends State<MrowTextOptionPickerwidget<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  SheetDown<T>(enabled: widget.enabled,initialSelectedValue: widget.initialSelectedValue ?? [],onSelectedList: widget.onSelectedList ?? (value){
                  },label: widget.label ??'Drugs List',
                    value: widget.initialvalue,
                    //label: 'Category',
                    onChanged:widget.onChanged ?? (value){
                      setState(() {
                        //widget.initialvalue = value;
                       // data.category = value;
                      });
                    },
                    itemLabel: (e) => e.toString(),
                    items: widget.options ?? [],
                  ),
                ],
              ),
            ),
            // Checkbox(value: widget.checkboxvalue, onChanged: (value) {}),
          ],
        ),
       widget.isneedDivider ?? true ? Divider(thickness: 1,height: 3,): Container(),
      ],
    );
  }
}
