import 'package:flutter/material.dart';
import 'package:foode/utils/navigator_utils.dart';
import 'package:foode/utils/theme_utils.dart';

class MIconButton extends StatelessWidget {
  final double size;
  final bool invert;
  final IconData? icon;
  final VoidCallback? onTap;
  final double elevation;
  final bool outlined;
  final Color? color;
  final double iconRatio;
  const MIconButton({Key? key, this.iconRatio = 0.65, this.color, this.size = 48,this.elevation = 0,this.outlined = false, this.invert = false, this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final f = invert ? (color ?? context.iconColor) : Colors.white;
    final b = !invert ? (color ?? context.iconColor) : Colors.white;
    final button = outlined? OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(size/6),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size/2)
            ),
            backgroundColor: b,
            elevation: elevation,
          side: BorderSide(color: f, width: size * 0.025)
        ),
        onPressed: onTap, child: Icon(icon, size: size * iconRatio, color: f,)) : FilledButton(
        style: FilledButton.styleFrom(
            padding: EdgeInsets.all(size/6),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size/2)
            ),
            backgroundColor: b,
            elevation: elevation
        ),
        onPressed: onTap, child: Icon(icon, size: size * iconRatio, color: f,));
    return SizedBox(
        width: size,
        height: size,
        child: button);
  }
}
