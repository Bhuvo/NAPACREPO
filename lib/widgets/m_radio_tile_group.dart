import 'package:flutter/material.dart';
import 'package:foode/utils/theme_utils.dart';

import '../pages/shared/filter/sort_filter_view.dart';

class MRadioTileGroup<T> extends StatelessWidget {
  final bool? isSearch;
  final SortFilterType? sortvalue ;
 //final searchsort? searchsortvalue;
 final T? value;
  final Function(T?)? onChanged;
  final List<T> items;
  final Widget Function(T) builder;
  const MRadioTileGroup({Key? key, required this.items, this.onChanged, this.value, required this.builder, this.sortvalue,  this.isSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  print(items);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: items.map((e) => RadioListTile<T>(
        value: e,
        groupValue: value,
        onChanged: onChanged,
        title: Transform.translate(
            offset: const Offset(-8, 0),
            child: DefaultTextStyle(
                style: context.titleSmall!.copyWith(color: '$e' == '$sortvalue' ? context.primary : Colors.grey),
                child: builder(e))),
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),

      )).toList(),
    );
  }
}
