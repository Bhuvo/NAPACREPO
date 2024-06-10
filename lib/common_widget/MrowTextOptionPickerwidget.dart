import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/common_widget/MTextField.dart';
import 'package:npac/widgets/MdateTimePicker.dart';
import 'package:npac/widgets/SheetUP.dart';

class MrowTextOptionPickerwidget extends StatefulWidget {
  final List<String>? options;
  final String? label;
  final String? title;
  final List<String>? initialSelectedValue;
  final String? initialvalue;
  final Function(String)? onChanged;
  final Function(List<String>)? onSelectedList;
  const MrowTextOptionPickerwidget({super.key,this.title, this.initialvalue, this.options, this.onChanged, this.onSelectedList, this.initialSelectedValue, this.label});

  @override
  State<MrowTextOptionPickerwidget> createState() => _MrowTextOptionPickerwidgetState();
}

class _MrowTextOptionPickerwidgetState extends State<MrowTextOptionPickerwidget> {
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
                  Text(widget.title ?? ''),
                  SheetDown<String>(initialSelectedValue: widget.initialSelectedValue ?? [],onSelectedList: widget.onSelectedList ?? (value){
                  },label: widget.label ??'Drugs List',
                    value: widget.initialvalue,
                    //label: 'Category',
                    onChanged:widget.onChanged ?? (value){
                      setState(() {
                        //widget.initialvalue = value;
                       // data.category = value;
                      });
                    },
                    itemLabel: (e) => e,
                    items: widget.options ?? const [
                      'News/media',
                      'Sports',
                      'Government and politics',
                      'Music',
                      'Fashion',
                      'Entertainment',
                      'Digital creator/blogger/influencer',
                      'Gamer',
                      'Global business/brand/organization',
                      'Other'
                    ],
                  ),
                ],
              ),
            ),
            // Checkbox(value: widget.checkboxvalue, onChanged: (value) {}),
          ],
        ),
        Divider(thickness: 1,height: 3,),
      ],
    );
  }
}
