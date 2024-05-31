import 'package:flutter/material.dart';
import 'package:foode/utils/theme_utils.dart';

class MarkerContainer extends StatelessWidget {
  final double  radius;
  final Widget? child;
  final Color? color;
  final bool showCircle;
  const MarkerContainer({Key? key, this.child, this.radius = 12, this.color, this.showCircle = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        if(showCircle)Transform.translate(
          offset: Offset(0, radius * 0.5),
          child: Container(
            width: radius,
            height: radius,
            decoration: BoxDecoration(
              color: context.primary.withOpacity(0.5),
              shape: BoxShape.circle
            ),
          ),
        ),
        ClipShadowPath(
          shadow: Shadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5
          ),
          clipper: CustomClipPath(radius: radius),
          child: Container(
            color: color,
            padding: EdgeInsets.only(bottom: radius),
            child: child,
          ),
        ),
      ],
    );
  }
}

enum CustomClipPathType { bottom, top }

class CustomClipPath extends CustomClipper<Path> {
  final double radius;
  final CustomClipPathType type;

  const CustomClipPath(
      {this.radius = 50, this.type = CustomClipPathType.bottom});

  @override
  Path getClip(Size size) {
    Path path = Path();
    final w = size.width;
    final h = size.height;
    if (type == CustomClipPathType.bottom) {

      path.moveTo(radius, 0);
      path.quadraticBezierTo(
          0, 0, 0, radius);
      path.lineTo(0,h - (radius * 2));
      path.quadraticBezierTo(0, h - (radius), radius, h - (radius));
      double c = w * 0.5;
      c -= radius * 0.05;
      path.lineTo(c - radius,h - (radius));
      path.quadraticBezierTo(c, h - (radius), c, h);
      path.lineTo(c + (radius * 0.1), h);
      c = (w * 0.5) + (radius * 0.05);
      path.quadraticBezierTo(c, h - (radius), c + radius, h - radius);
      path.lineTo(w - radius, h - radius);
      path.quadraticBezierTo(w, h - radius, w, h - (radius * 2));
      path.lineTo(w, radius);
      path.quadraticBezierTo(w, 0, w - radius, 0);
    } else {
      path.lineTo(0, h);
      path.lineTo(0, radius * 2);
      path.quadraticBezierTo(radius * 0.1, (radius * 1.1), radius, radius);
      path.lineTo(w - radius, radius);
      path.quadraticBezierTo(w - (radius * 0.1), (radius * 1.1), w, 0);
      path.lineTo(w, h);
      path.lineTo(0, h);
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ClipShadowPath extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  const ClipShadowPath({
    Key? key,
    required this.shadow,
    required this.clipper,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: clipper,
        shadow: shadow,
      ),
      child: ClipPath(child: child, clipper: clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}