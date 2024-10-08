import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/common_widget/MTextField.dart';
import 'package:npac/widgets/MdateTimePicker.dart';
import 'package:npac/widgets/SheetUP.dart';
import 'package:npac/widgets/space.dart';

class MrowTextDatePickerWidget extends StatefulWidget {
  final String? title;
  final DateTime? initialDate;
  final Function(DateTime)? onChanged;
  final bool? isneedDivider;
  final bool? enabled;
  final String? Function(DateTime?)? validate;
  const MrowTextDatePickerWidget({super.key, this.title, this.onChanged, this.initialDate, this.isneedDivider= true, this.enabled, this.validate,});

  @override
  State<MrowTextDatePickerWidget> createState() => _MrowTextDatePickerWidgetState();
}

class _MrowTextDatePickerWidgetState extends State<MrowTextDatePickerWidget> {
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
                  // SheetDown<String>(
                  //   //value: data.category,
                  //   label: 'Category',
                  //   onChanged: (value){
                  //     setState(() {
                  //      // data.category = value;
                  //     });
                  //   },
                  //   itemLabel: (e) => e,
                  //   items: const [
                  //     'News/media',
                  //     'Sports',
                  //     'Government and politics',
                  //     'Music',
                  //     'Fashion',
                  //     'Entertainment',
                  //     'Digital creator/blogger/influencer',
                  //     'Gamer',
                  //     'Global business/brand/organization',
                  //     'Other'
                  //   ],
                  // ),
                  MDateTimePicker(enabled:widget.enabled,start: DateTime.utc(1950), end: DateTime.now(),onChanged:(val){
                    widget.onChanged!.call(val);
                    setState(() {});
                  },initial:widget.initialDate,validator: widget.validate,)

                ],
              ),
            ),
            // Checkbox(value: widget.checkboxvalue, onChanged: (value) {}),
          ],
        ),
        (widget.isneedDivider ?? true) ? Divider(thickness: 1,height: 3,) : Container(),
      ],
    );
  }
}
