import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
export 'package:latlng/latlng.dart';

class MMarker extends StatelessWidget {
  final LatLng latLng;
  final Color? color, iconColor;
  final IconData? icon;
  final double iconSize, width, height;
  final Widget? child;
  const MMarker({Key? key,
    required this.latLng, this.child, this.color, this.icon, this.iconColor, this.iconSize = 24, this.width = 36, this.height = 36 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child ?? Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
        child: Icon(icon, color: iconColor ?? Colors.white, size: iconSize,),
    );
  }
}
