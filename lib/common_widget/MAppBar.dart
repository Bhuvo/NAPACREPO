import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/utils/theme_utils.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      automaticallyImplyLeading: false,
      backgroundColor: context.primary,
      title: Center(child: Text(title)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
