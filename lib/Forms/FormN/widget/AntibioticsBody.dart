import 'package:flutter/material.dart';
import 'package:npac/Forms/FormE/FormEModel/AntiBodiesList.dart';
import 'package:npac/Forms/FormE/controller/FormEController.dart';
import 'package:npac/app/export.dart';

class AntibioticsBody extends StatefulWidget {
  final int? patientId;
  final AntibioticsList? data;
  final FormEController? controller;
  final int? index;
  final Function(Map<String, String>)? onChanged;
  final Function()? onDelete;
  const AntibioticsBody({super.key, this.onChanged, this.index, this.onDelete, this.data, this.controller, this.patientId});

  @override
  State<AntibioticsBody> createState() => _AntibioticsBodyState();
}

class _AntibioticsBodyState extends State<AntibioticsBody> {
  Map<String , String> detailsMap = {};
  bool isExpanded = false;
  bool isEdited = false;
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
            }, icon: Icon(Icons.edit,))
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
            widget.controller?.saveAntibiotics(context, detailsMap['Name']?? '', detailsMap['Purpose']??'', detailsMap['GestWeeks']??'', detailsMap['DurationInDays']??'', widget.data?.abId, widget.patientId!);
            isExpanded = !isExpanded;
          });}, icon: Icon(Icons.save,))
        ],),
        Row(mainAxisAlignment: MainAxisAlignment.end,children: [IconButton(onPressed:widget.onDelete, icon: Icon(Icons.delete))],),
        MrowTextTextFieldWidget(enabled: isExpanded,initialValue: widget.data?.name,title: 'Name',onChanged: (val){
          isEdited = true;
          setState(() {
          detailsMap['Name'] = val;
        });
          widget.onChanged?.call(detailsMap);
          },isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: isExpanded,title: 'Gest weeks of use',initialValue: widget.data?.gestWeeks,onChanged: (val){
          isEdited = true;
          setState(() {
            detailsMap['GestWeeks'] = val;
          });
          widget.onChanged?.call(detailsMap);
        },isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: isExpanded,title: 'Purpose',initialValue: widget.data?.purpose,onChanged: (val){
          isEdited = true;
          setState(() {
            detailsMap['Purpose'] = val;
          });
          widget.onChanged?.call(detailsMap);
        },isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: isExpanded,title: 'Duration In Days',initialValue: widget.data?.durationInDays,onChanged: (val){
          isEdited = true;
          setState(() {
          detailsMap['DurationInDays'] = val;
        });
        widget.onChanged?.call(detailsMap);
        },type: MInputType.numeric,isneedDivider: false,),
        MDivider(),
      ],
    );
  }
}
