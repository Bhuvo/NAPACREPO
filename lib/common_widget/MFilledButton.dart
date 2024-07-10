import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/utils/navigator_utils.dart';
import 'package:npac/widgets/loading_widget.dart';

class MFilledButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final bool? isLoading;
  const MFilledButton({super.key, this.text, this.onPressed, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(width:  double.infinity, child: FilledButton(key:ValueKey('value$isLoading'),onPressed: (isLoading?? false) ? null :onPressed, child:(isLoading?? false) ?LoadingWidget() : Text(text ?? '')))
    ;
  }
}
