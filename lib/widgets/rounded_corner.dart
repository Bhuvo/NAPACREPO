import 'package:flutter/material.dart';
import 'package:foode/presentation/theme/theme.dart';

class RoundedCorner extends StatelessWidget {
  final Widget child;
  final BorderRadius? radius;
  const RoundedCorner({Key? key, required this.child, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? MTheme.cardRadius,
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
