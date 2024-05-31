import 'package:flutter/material.dart';
import 'package:foode/utils/theme_utils.dart';

class CardWithTitle extends StatelessWidget {
  final EdgeInsets margin;
  final String title;
  final Widget child;
  final List<Widget> children;
  const CardWithTitle({Key? key, required this.title, required this.child,this.children = const [], this.margin = const EdgeInsets.all(0)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      surfaceTintColor: context.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 5),
            child: Text(title, style: context.titleMedium,),
          ),
          child,
          ...children
        ],
      ),
    );
  }
}
