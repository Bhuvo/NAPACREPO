import 'package:flutter/material.dart';
import 'package:npac/app/export.dart';

class MN1Body extends StatefulWidget {
  final String? title;
  final String? textTitle;
  final bool? isEnable ;
  final List<String>? options;
  final Function(Map<String, String>)? drugMap ;
  const MN1Body({super.key, this.title, this.options, this.drugMap, this.textTitle, this.isEnable});

  @override
  State<MN1Body> createState() => _MN1BodyState();
}

class _MN1BodyState extends State<MN1Body> {
  List<String> drugList = [];
  Map<String, String> drugMap = {};
  bool isExpanded = false;
  List<String> wantText =['Statins','Vaccinations','Chronic Disease Medications','Other ARBs','Other ACEIs','Other diuretics','Other BB'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MText(text:widget.title ?? 'N1 PRE-PREGNANCY',),
          IconButton(onPressed: (){
            setState(() {
              isExpanded = !isExpanded;
            });
          }, icon: isExpanded ? Icon(Icons.save) : Icon(Icons.edit,))
        ],
      ),
        isExpanded?  Column(children: [
        Space(),
        MrowTextOptionPickerwidget(enabled: widget.isEnable,initialSelectedValue: drugList,onSelectedList: (e){
          setState(() {
            drugList = e;
          });
          print('Selected drug list $e');},title: widget.textTitle ?? 'DRUG',options:widget.options ?? [],),
        ListView(
          shrinkWrap: true,
          children:drugList.map((e) {
            return Column(
              children: [
                wantText.contains(e)?  MrowTextTextFieldWidget(title: 'Specify',type: MInputType.text,onChanged: (val){},isneedDivider: false,): Container(),
                MrowTextTextFieldWidget(enabled: widget.isEnable,title: '$e Dose',type: MInputType.numeric,onChanged: (val){
                  setState(() {
                    drugMap[e] = val;
                  });
                  widget.drugMap?.call(drugMap);
                },),
              ],
            );
          }).toList(),
        ),
      ],): Container(),

    ],);
  }
}
