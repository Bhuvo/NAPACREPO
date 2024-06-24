import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MFormBody extends StatelessWidget {
 final List<Widget> Childrens;
  const MFormBody({super.key, required this.Childrens});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: kIsWeb? const EdgeInsets.only(left: 150,right: 150): const EdgeInsets.all(15),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                // padding: kIsWeb? const EdgeInsets.only(left: 40,right: 150):null,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children:Childrens,
              ),
            ),
          ),
        )
      ],
    );
  }
}
