import 'package:flutter/material.dart';
import 'package:npac/app/export.dart';

class AntibioticsBody extends StatefulWidget {
  final int? index;
  final Function(Map<String, String>)? onChanged;
  final Function()? onDelete;
  const AntibioticsBody({super.key, this.onChanged, this.index, this.onDelete});

  @override
  State<AntibioticsBody> createState() => _AntibioticsBodyState();
}

class _AntibioticsBodyState extends State<AntibioticsBody> {
  Map<String , String> detailsMap = {};
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return !isExpanded ? Column(
      children: [
        Space(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MText(text: 'Antibiotics Details ${widget.index}',),
            IconButton(onPressed: (){
              setState(() {
                isExpanded = !isExpanded;
              });
            }, icon: Icon(Icons.arrow_drop_down_sharp,))
          ],),
      ],
    ): Column(
      children: [
        // Space(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          MText(text: 'Antibiotics Details ${widget.index}',),
          IconButton(onPressed: (){setState(() {
            isExpanded = !isExpanded;
          });}, icon: Icon(Icons.arrow_drop_up_sharp,))
        ],),
        Row(mainAxisAlignment: MainAxisAlignment.end,children: [IconButton(onPressed:widget.onDelete, icon: Icon(Icons.delete))],),
        MrowTextTextFieldWidget(title: 'Name',onChanged: (val){setState(() {
          detailsMap['Name'] = val;
        });
          widget.onChanged?.call(detailsMap);
          },isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'Trimester of use',onChanged: (val){
          setState(() {
            detailsMap['Trimester of use'] = val;
          });
          widget.onChanged?.call(detailsMap);
        },isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'Purpose',onChanged: (val){
          setState(() {
            detailsMap['Purpose'] = val;
          });
          widget.onChanged?.call(detailsMap);
        },isneedDivider: false,),
        MrowTextTextFieldWidget(title: 'No of days',onChanged: (val){setState(() {
          detailsMap['No of days'] = val;
        });
        widget.onChanged?.call(detailsMap);
        },type: MInputType.numeric,isneedDivider: false,),
        MDivider(),
      ],
    );
  }
}
