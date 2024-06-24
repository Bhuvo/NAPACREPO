
import 'package:flutter/cupertino.dart';
import 'package:npac/utils/theme_utils.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CupertinoActivityIndicator(color: context.primary,);
  }
}

