

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:npac/common_widget/MTextField.dart';
import 'package:npac/utils/navigator_utils.dart';
import 'package:npac/utils/theme_utils.dart';

class SheetDown<T> extends StatelessWidget {
  final T? value;
  final List<T>? initialSelectedValue;
  final String? label;
  final ValueChanged<T>? onChanged;
  final List<T> items;
  final bool required;
  final bool? enabled;
  final String Function(T) itemLabel;
  final IconData Function(T)? itemIcon;
  final Function(List<T>)? onSelectedList;
  const SheetDown({super.key,this.label, this.itemIcon, required this.itemLabel, this.value, this.onChanged, required this.items, this.required = true, this.onSelectedList, this.initialSelectedValue, this.enabled});

  @override
  Widget build(BuildContext context) {
    IconData? icon;

    if(value != null){
      icon = itemIcon?.call(value as T);
    }

    return MTextField(enabled:enabled ?? true,
      required: required,
      prefixIcon: icon != null ? Icon(icon, color: context.dividerColor, size: 18,) : null,
      key: ValueKey('sheet_down::$label${value != null ? itemLabel(value as T) : ''}'),
      label: label,
      initalValue: value != null ? itemLabel(value as T) : null,
      suffixIcon: Icon(CupertinoIcons.chevron_forward, color: context.dividerColor,),
      readOnly: true,
      onTap: (){
        showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            constraints: BoxConstraints(maxHeight: context.height * 0.6),
            context: context, builder: (context) => _SheetDown(
            itemIcon: itemIcon, label: label, onChanged: onChanged,initialSelectedValue: initialSelectedValue,onSelectedList: onSelectedList,
            itemLabel: itemLabel, items: items));
      },
    );
  }
}

class _SheetDown<T> extends StatefulWidget {
  final String? label;
  final List<T>? initialSelectedValue;
  final IconData Function(T)? itemIcon;
  final String Function(T) itemLabel;
  final List<T> items;
  final ValueChanged<T>? onChanged;
  final Function(List<T>)? onSelectedList;
  const _SheetDown({super.key, this.label, this.itemIcon, required this.itemLabel, required this.items, this.onChanged, this.onSelectedList, this.initialSelectedValue});

  @override
  State<_SheetDown<T>> createState() => _SheetDownState<T>();
}

class _SheetDownState<T> extends State<_SheetDown<T>> {
  List<T> items = [];
  List<T> selectedItems = [];

  @override
  void initState() {
    selectedItems.addAll(widget.initialSelectedValue ?? []);
    items.addAll(widget.items);
    super.initState();
  }

  void search(String query){
    query = query.trim();
    if(query.isEmpty){
      setState(() {
        items.clear();
        items.addAll(widget.items);
      });
      return;
    }
    setState(() {
      items = widget.items.where((e) => widget.itemLabel(e).toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //   child: Text('Select a ${widget.label?.toLowerCase() ?? ''}', style: context.titleSmall?.copyWith(
        //     fontWeight: FontWeight.w700,
        //   ),),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: SearchBar(hintText: 'Search drug here',
            onChanged: search,
          ),
        ),
       selectedItems.isNotEmpty ? Container(
          height: 130,
          child: Card(
            elevation: 5,
            child: ListView(
              shrinkWrap: true,
              children: selectedItems.map((e) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.itemLabel(e), style: Theme.of(context).textTheme.bodyLarge),
                      IconButton(onPressed: (){setState(() {
                        selectedItems.remove(e);
                        widget.onSelectedList?.call(selectedItems);
                      });
                      print(selectedItems);}, icon: Icon(CupertinoIcons.xmark_circle,))
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ): Container(),
        Expanded(
          child: ListView(
            children: items.map((e){
              final icon = widget.itemIcon?.call(e);
              return ListTile(
                leading: icon != null ? Icon(icon, color: context.dividerColor, size: 18,) : null,
                title: Text(widget.itemLabel(e), style: context.bodyLarge,),
                onTap: (){
                  setState(() {
                    if(!selectedItems.contains(e)){
                      selectedItems.add(e);
                      widget.onSelectedList?.call(selectedItems);
                    }
                  });
                 // print(selectedItems);
                  //widget.onChanged?.call(e);
                  // context.pop();
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}