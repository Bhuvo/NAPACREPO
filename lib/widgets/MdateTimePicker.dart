

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:npac/common_widget/MTextField.dart';
import 'package:npac/utils/theme_utils.dart';


class MDateTimePicker extends StatefulWidget {
  final String? label;
  final DateTime? initial;
  final DateTime start, end;
  final Function(DateTime)? onChanged;
  final String? Function(DateTime?)? validator;
  final String? hintDateFormat;
  final bool showTime;
  final bool? enabled;


  const MDateTimePicker({
    this.label,
    this.onChanged,
    this.initial,
    this.validator,
    this.showTime = false,
    required this.start,
    required this.end,
    this.hintDateFormat,
    Key? key, this.enabled,
  }) : super(key: key);

  @override
  MDateTimePickerState createState() => MDateTimePickerState();
}

class MDateTimePickerState extends State<MDateTimePicker> {
  DateTime value = DateTime.now();
  @override
  void initState() {
    super.initState();
    if (widget.initial != null) {
      value = widget.initial ?? widget.start;
    } else {
      value = widget.start;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Stack(
        children: [
          MTextField(
            enabled: widget.enabled ?? false,
              key: ValueKey(value),
              initalValue: DateFormat(widget.hintDateFormat ?? 'dd/MM/yyyy',).format(value),
              label: widget.label,
              readOnly: true,
              onTap: pickDate,
              validator: (_) => widget.validator?.call(value)
          ),
          Positioned(
            top: 0,
            bottom: 8,
            right: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    icon: Icon(
                      CupertinoIcons.calendar,
                      color: (widget.enabled ?? false)?context.primary : Colors.grey,
                    ),
                    onPressed: (widget.enabled ?? false)? pickDate : null,
                  ),
                ),
                if(widget.showTime)...[
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: pickTime,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        child: Text(
                          DateFormat('hh:mm a',).format(value),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        CupertinoIcons.time,
                        color: context.primary,
                      ),
                      onPressed: pickTime,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

  pickDate() async {
    DateTime? selected = await showDatePicker(
        context: context,
        initialDate: value,
        firstDate: widget.start,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        lastDate: widget.end);

    if (selected != null) {
      setState(() {
        value = DateTime(
          selected.year,
          selected.month,
          selected.day,
          value.hour,
          value.minute,
          value.second,
        );
      });

      widget.onChanged!(value);
    }
  }

  pickTime() async {
    TimeOfDay? selected = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.dialOnly,
      initialTime: TimeOfDay.fromDateTime(value),
    );

    if (selected != null) {
      setState(() {
        value = DateTime(
          value.year,
          value.month,
          value.day,
          selected.hour,
          selected.minute,
          value.second,
        );
      });

      widget.onChanged!(value);
    }
  }
}