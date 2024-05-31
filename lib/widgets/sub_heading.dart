import 'package:flutter/material.dart';
import 'package:foode/utils/theme_utils.dart';

import 'space.dart';

class SubHeading extends StatelessWidget {
  final String heading;
  final bool trailingLine;
  final bool bottomLine;

  const SubHeading(this.heading, {Key? key, this.trailingLine = false, this.bottomLine = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = Padding(
      padding: const EdgeInsets.only(left: 24, top: 16, right: 24, bottom: 8),
      child: Text(
        heading,
        style: context.bodyMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 17, height: 1),
      ),
    );

    if(trailingLine){
      child = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          child,
          Expanded(child: Transform.translate(
              offset: const Offset(-12, 6),
              child: const Divider(thickness: 2,)))
        ],
      );
    }
    if(bottomLine){
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          child,
          const Space(8),
          const Divider()
        ],
      );
    }

    return child;
  }
}
