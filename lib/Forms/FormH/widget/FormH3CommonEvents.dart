import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MSmallText.dart';

class FormH3CommonEvents extends StatefulWidget {
  final String? title;
  final bool? enabled;
  final Function(String)? radioiOnChanged;
  final Function(String)? TextField1OnChanged;
  final Function(String)? TextField2OnChanged;
  const FormH3CommonEvents({super.key, this.title, this.enabled, this.radioiOnChanged, this.TextField1OnChanged, this.TextField2OnChanged});

  @override
  State<FormH3CommonEvents> createState() => _FormH3CommonEventsState();
}

class _FormH3CommonEventsState extends State<FormH3CommonEvents> {
  bool isYes = false;

  bool isAn = false;
  bool isIP = false;
  bool isPA = false;
   int count = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ((widget.title!= '') ||( widget.title != null)) ? MSmallText(text: widget.title ?? '',) : Container(),
        MRowTextRadioWidget(enabled: widget.enabled,isneedDivider:false,onChanged:(val){
          if(val =='Yes'){
            setState(() {
              isYes = true;
            });
          }else{
            setState(() {
              isYes = false;
            });
          }
          widget.radioiOnChanged;
        },),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,itemCount: count,
          itemBuilder: (BuildContext context, int index) {
            return isYes ?Column(children: [
              MSmallText(text: 'Event ${index+1}',),
              Space(),
              MRowTextRadioWidget(enabled: widget.enabled ,title: 'If yes, specify',options: ['AN' , 'IP', 'PA'],onChanged: (val){
                val== 'AN' ? isAn = true : isAn = false;
                val== 'IP' ? isIP = true : isIP = false;
                val== 'PA' ? isPA = true : isPA = false;
                setState(() {
                });
              },isneedDivider: false,),
              isYes && isAn? MTextField(enabled: widget.enabled,label: 'AN Time(in Weeks)',onChanged:widget.TextField1OnChanged ,): Container(),
              isYes && isIP ? MTextField(enabled: widget.enabled,label: 'IP',onChanged:widget.TextField1OnChanged ,): Container(),
              isYes && isPA? MTextField(enabled: widget.enabled,label: 'PA Time(in days)',onChanged:widget.TextField1OnChanged ,): Container(),
            ],): Container();
        },
        ),
        isYes ?FilledButton(onPressed: (){
          setState(() {
            count++;
          });
        }, child: Text('Add Events')): Container(),
        Space(),
        MDivider()
      ],
    );
  } 
}
