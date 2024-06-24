import 'package:flutter/material.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/sheetDownSingle.dart';

class MrowTextSingleOption<T> extends StatefulWidget {
  final String? title;
  final String? lable;
  final bool? enabled;
  final List<T>? items;
  final  T? initialValue;
  final bool? isneedDivider;
  final Function(T)? onChanged;
  final Map<dynamic, dynamic>? data;
  final String Function(T)? itemLabel;

  const MrowTextSingleOption({super.key, this.title, this.isneedDivider, this.items, this.lable, this.onChanged, this.data,  this.itemLabel, this.initialValue, this.enabled});

  @override
  State<MrowTextSingleOption<T>> createState() => _MrowTextSingleOptionState<T>();
}

class _MrowTextSingleOptionState<T> extends State<MrowTextSingleOption<T>> {
 String Name ='';
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
                  SheetDown<T>(
                    enabled: widget.enabled,
                    value:widget.initialValue,
                    label: widget.lable,
                    onChanged: (value){
                      widget.onChanged?.call(value);
                      setState(() {
                       // Name =value.toString();
                        //Name =value;
                       // data.category = value;
                      });
                    },
                    itemLabel: widget.itemLabel ??  (item) => item.toString(),
                    items:widget.items ?? [],
                  ),
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
