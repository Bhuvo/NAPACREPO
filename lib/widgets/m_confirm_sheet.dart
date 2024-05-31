import 'package:flutter/material.dart';
import 'package:foode/presentation/widgets/m_icon_button.dart';
import 'package:foode/utils/navigator_utils.dart';
import 'package:foode/utils/theme_utils.dart';

import 'space.dart';

showConfirmSheet(BuildContext context, {required List<Widget> children}) {
  return showModalBottomSheet(
      context: context,
      builder: (_) {
        return Transform.translate(
          offset: const Offset(0, -16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MIconButton(
                    icon: Icons.close_rounded,
                    onTap: () {
                      context.popDialog();
                    },
                    invert: true,
                    size: 36,
                    elevation: 2,
                  ),
                  const Space(24)
                ],
              ),
              Space(8),
              Padding(padding: EdgeInsets.symmetric(horizontal: 24,), child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
              ),)
            ],
          ),
        );
      });
}
