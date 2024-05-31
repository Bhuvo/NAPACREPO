import 'package:flutter/material.dart';
import 'package:foode/utils/navigator_utils.dart';
import 'package:foode/utils/theme_utils.dart';

class MBackButton extends StatelessWidget {
  final double size;
  final bool invert, outlined;

  const MBackButton({Key? key, this.size = 42, this.invert = false, this.outlined = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final f = invert ? context.iconColor : Colors.white;
    final b = !invert ? context.iconColor : Colors.white;

    final button = outlined? OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(size/6),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size/2)
            ),
            backgroundColor: b,
            // side: BorderSide(color: f, width: size * 0.025)
            side: BorderSide(color: Colors.grey.shade300, width: size * 0.025)
        ),
        onPressed: () => context.pop(), child: Icon(Icons.arrow_back, size: size * 0.65, color: f,)) : FilledButton(
        style: FilledButton.styleFrom(
            padding: EdgeInsets.all(size/6),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(size/2)
            ),
            backgroundColor: b,
        ),
        onPressed: () => context.pop(), child: Icon(Icons.arrow_back, size: size * 0.65, color: f,));
    return SizedBox(
        width: size,
        height: size,
        child: button);
  }
}
