import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MFormBody extends StatelessWidget {
 final List<Widget> Childrens;
  const MFormBody({super.key, required this.Childrens});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
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
