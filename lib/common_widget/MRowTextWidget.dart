import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MTextField.dart';
import 'package:npac/widgets/MdateTimePicker.dart';
import 'package:npac/widgets/SheetUP.dart';

class MRowTextWidget extends StatefulWidget {
  final String? title;
  final Widget? widget;
  const MRowTextWidget({super.key,  this.title, this.widget});

  @override
  State<MRowTextWidget> createState() => _MRowTextWidgetState();
}

class _MRowTextWidgetState extends State<MRowTextWidget> {
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
                  widget.title =='' || widget.title == null ?Container(): Space(),
                  widget.widget ?? Container(),
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
                  // MDateTimePicker(start: DateTime.utc(1945), end: DateTime.now(),)
                ],
              ),
            ),
           // Checkbox(value: widget.checkboxvalue, onChanged: (value) {}),
          ],
        ),
        Divider(thickness: 1,height: 3,),
        Space(),
      ],
    );
  }
}
