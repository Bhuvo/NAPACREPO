import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/common_widget/MTextField.dart';
import 'package:npac/widgets/MdateTimePicker.dart';
import 'package:npac/widgets/SheetUP.dart';

class MrowTextCheckWidget extends StatefulWidget {
  final bool checkboxvalue;
  final String? title;
  final String? subtitle;
  const MrowTextCheckWidget({super.key, required this.checkboxvalue, this.title, this.subtitle});

  @override
  State<MrowTextCheckWidget> createState() => _MrowTextCheckWidgetState();
}

class _MrowTextCheckWidgetState extends State<MrowTextCheckWidget> {
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
                  MDateTimePicker(start: DateTime.utc(1945), end: DateTime.now(),)
                 
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
