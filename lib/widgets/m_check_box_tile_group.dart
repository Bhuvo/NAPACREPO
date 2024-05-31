import 'package:flutter/material.dart';
import 'package:foode/core/app_export.dart';
import 'package:foode/model/cuisine.dart';
import 'package:foode/presentation/pages/search/search_result_controller.dart';
import 'package:foode/utils/theme_utils.dart';

class MCheckBoxTileGroup<T> extends StatefulWidget {
  search_result_controller? controller;
   MCheckBoxTileGroup({
    Key? key,
    this.title,
    required this.items,
    required this.onChanged,
    required this.builder,
    this.controller
  }) : super(key: key);

  final Widget? title;
  final List<T> items;
  final ValueChanged<List<T>> onChanged;
  final Widget Function(T) builder;

  @override
  _MCheckBoxTileGroupState<T> createState() => _MCheckBoxTileGroupState<T>();
}

class _MCheckBoxTileGroupState<T> extends State<MCheckBoxTileGroup<T>> {
  final List<T> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.title != null) widget.title!,
          const SizedBox(height: 8),
          ...widget.items.map(
            (e) =>  ListTile(
                leading: Transform.scale(
                  scale: 0.8,
                  child: Checkbox(

                    value: widget.controller?.Cuisineslist.contains(e),
                    onChanged: (value) {
                      if (value == true) {
                        print(e);
                        widget.controller?.Cuisineslist.add(e as Cuisine);
                      } else {
                        widget.controller?.Cuisineslist.remove(e as Cuisine);
                      }
                      widget.onChanged(_selectedItems);
                      setState(() {});
                    },
                  ),
                ),
                onTap: (){
                  final value = !widget.controller!.Cuisineslist.contains(e);
                  if (value == true) {
                    widget.controller?.Cuisineslist.add(e as Cuisine);
                  } else {
                    widget.controller?.Cuisineslist.remove(e as Cuisine);
                  }
                  widget.onChanged(_selectedItems);
                  setState(() {});
                },
                title: DefaultTextStyle(
                    style: context.titleSmall!.copyWith(color: widget.controller!.Cuisineslist.contains(e) ? context.titleSmall?.color : Colors.grey),
                    child: Transform.translate(
                        offset: Offset(-8, 0),
                        child: widget.builder(e))),
                visualDensity: VisualDensity.compact,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              ),

          ),
        ],
      ),
    );
  }
}