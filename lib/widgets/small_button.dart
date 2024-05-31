import 'package:flutter/material.dart';

extension SmallTextButton on TextButton {
  Widget small(){
    return TextButton(onPressed: onPressed, style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      visualDensity: VisualDensity.compact,
      textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)
    ), child: child!,);
  }
}
extension SmallOutlinedButton on OutlinedButton {
  Widget small(){
    return OutlinedButton(onPressed: onPressed, style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      visualDensity: VisualDensity.compact,
      textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)
    ), child: child!,);
  }
}
extension SmallFilledButton on FilledButton {
  Widget small(){

    return FilledButton(onPressed: onPressed, style: FilledButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      visualDensity: VisualDensity.compact,
      textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)
    ), child: child!,);
  }
  Widget rounded({Color? color}){

    return FilledButton(onPressed: onPressed, style: FilledButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      visualDensity: VisualDensity.compact,
      backgroundColor: color ,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24)
      ),
      textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)
    ), child: child!,);
  }
}