import 'package:flutter/material.dart';
import 'package:foode/presentation/widgets/space.dart';
import 'package:foode/utils/theme_utils.dart';

class RatingStar extends StatelessWidget {
  final double rating;
  final bool invert;
  const RatingStar({Key? key, required this.rating, this.invert = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final b = invert ? Colors.white : context.primary;
    final f = !invert ? Colors.white : context.primary;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: b
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, color: f, size: 12,),
          const Space(4),
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(color: f, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class RatingStars extends StatelessWidget {
  final double rating;
  final bool invert;
  const RatingStars({Key? key, required this.rating, this.invert = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final b = invert ? Colors.white : context.primary;
    final f = !invert ? Colors.white : context.primary;

    final int e =  rating.round();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(5, (i){
          return Icon(Icons.star_rounded, color: i < e ? context.iconColor : Colors.grey.shade300, size: 13, );
        }),
        Space(4),
        Text('${rating.toStringAsFixed(1)}', style: context.caption?.copyWith(color: context.iconColor),),
        Space(4),
       // Text('(546)', style: context.caption,),
      ],
    );
  }
}

