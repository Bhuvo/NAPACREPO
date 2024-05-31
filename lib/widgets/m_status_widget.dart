import 'package:flutter/material.dart';

class MStatusWidget extends StatelessWidget {
  final String text;
  final Color color;
  const MStatusWidget(this.text, {Key? key, this.color = Colors.amber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Text(text.toUpperCase(), style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700),),
    );
  }
}
