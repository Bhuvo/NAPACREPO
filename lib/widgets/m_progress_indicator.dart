import 'package:flutter/material.dart';
import 'package:foode/core/app_export.dart';
import 'package:foode/presentation/theme/theme.dart';
import 'package:foode/utils/theme_utils.dart';

class MProgressIndicator extends StatelessWidget {
  final double? value;
  const MProgressIndicator({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double w = constraints.biggest.width;

        return Container(
          height: context.theme.progressIndicatorTheme.linearMinHeight,
          width: w,
          decoration: BoxDecoration(
            color: context.theme.progressIndicatorTheme.linearTrackColor,
            borderRadius: MTheme.cardRadius
          ),
          alignment: Alignment.centerLeft,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: context.theme.progressIndicatorTheme.linearMinHeight,
            width: w * (value ?? 0),
            decoration: BoxDecoration(
                color: context.primary,
                borderRadius: MTheme.cardRadius
            ),
          ),
        );
      }
    );
  }
}
class MCircularProgressIndicator extends StatelessWidget {
  final double? value;
  const MCircularProgressIndicator({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scaleX: -1,
        child: CircularProgressIndicator(value: value, strokeWidth: 5,));
  }
}


