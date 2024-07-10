import 'package:npac/app/export.dart';

class SingleImage extends StatelessWidget {
  final String? URL;
  const SingleImage({super.key, this.URL});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(URL?.split('/').last ?? ''),
        Space(),
        Container(
            padding:  EdgeInsets.all(10),
            width: double.maxFinite,
            child: Image.network(URL ?? '')),

      ],);
  }
}
