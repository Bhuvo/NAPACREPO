import 'package:flutter/material.dart';

class FilledIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  const FilledIcon({Key? key,required this.icon, this.size = 48}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle
      ),
      child: Icon(icon, color: Colors.white, size: size * 0.6,),
    );
  }
}
