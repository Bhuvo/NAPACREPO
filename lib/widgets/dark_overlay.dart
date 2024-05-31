import 'package:flutter/material.dart';

class DarkOverlay extends StatelessWidget {
  final Widget child;
  final List<Widget>? children;
  final Alignment alignment, begin, end;
  final List<Color>? colors;
  const DarkOverlay({Key? key, required this.child, this.children, this.colors, this.alignment = Alignment.bottomCenter,
    this.begin = Alignment.bottomCenter,
    this.end = Alignment.topCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: alignment,
      children: [
        child,
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: colors?? [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                  Colors.transparent,
                ],
                begin: begin,
                end: end
            ),
          ),
        ),
        ...?children
      ],
    );
  }
}
