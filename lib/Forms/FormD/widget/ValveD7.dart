import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextCheckBox.dart';

class valveD7 extends StatefulWidget {
  final bool? isEnabled;
  final bool? mitralBool;
  final bool? aorticBool;
  final bool? tricuspidBool;
  final bool? pulmonaryBool;
  final Function(List<String>?)? result;
  final String? mitralDiscBool;
  final String? aorticDiscBool;
  final String? tricuspidDiscBool;
  final String? pulmonaryDiscBool;
  final String? mitralVTBool;
  final String? aorticVTBool;
  final String? tricuspidVTBool;
  final String? pulmonaryVTBool;
  final String? meanMitralInitial;
  final String? meanAorticInitial;
  final String? meanTricuspidInitial;
  final String? meanPulmonaryInitial;
  final String? peakMitralInitial;
  final String? peakAorticInitial;
  final String? peakTricuspidInitial;
  final String? peakPulmonaryInitial;
  final String? normalDiscMitralInitial;
  final String? normalDiscAorticInitial;
  final String? normalDiscTricuspidInitial;
  final String? normalDiscPulmonaryInitial;
  final String? visibleThrombusMitralInitial;
  final String? visibleThrombusAorticInitial;
  final String? visibleThrombusTricuspidInitial;
  final String? visibleThrombusPulmonaryInitial;
  final Function(String?)? meanMitralOnchange;
  final Function(String?)? meanAorticOnchange;
  final Function(String?)? meanTricuspidOnchange;
  final Function(String?)? meanPulmonaryOnchange;
  final Function(String?)? peakMitralOnchange;
  final Function(String?)? peakAorticOnchange;
  final Function(String?)? peakTricuspidOnchange;
  final Function(String?)? peakPulmonaryOnchange;
  final Function(String?)? normalDiscMitralOnchange;
  final Function(String?)? normalDiscAorticOnchange;
  final Function(String?)? normalDiscTricuspidOnchange;
  final Function(String?)? normalDiscPulmonaryOnchange;
  final Function(String?)? visibleThrombusMitralOnchange;
  final Function(String?)? visibleThrombusAorticOnchange;
  final Function(String?)? visibleThrombusTricuspidOnchange;
  final Function(String?)? visibleThrombusPulmonaryOnchange;
  final Function(String?)? mitralDiscBoolOnchange;
  final Function(String?)? aorticDiscBoolOnchange;
  final Function(String?)? tricuspidDiscBoolOnchange;
  final Function(String?)? pulmonaryDiscBoolOnchange;
  final Function(String?)? mitralVTBoolOnchange;
  final Function(String?)? aorticVTBoolOnchange;
  final Function(String?)? tricuspidVTBoolOnchange;
  final Function(String?)? pulmonaryVTBoolOnchange;

    const valveD7({super.key, this.isEnabled, this.mitralBool, this.aorticBool, this.tricuspidBool, this.pulmonaryBool, this.meanMitralInitial, this.meanAorticInitial, this.meanTricuspidInitial, this.meanPulmonaryInitial, this.peakMitralInitial, this.peakAorticInitial, this.peakTricuspidInitial, this.peakPulmonaryInitial, this.normalDiscMitralInitial, this.normalDiscAorticInitial, this.normalDiscTricuspidInitial, this.normalDiscPulmonaryInitial, this.visibleThrombusMitralInitial, this.visibleThrombusAorticInitial, this.visibleThrombusTricuspidInitial, this.visibleThrombusPulmonaryInitial, this.meanMitralOnchange, this.meanAorticOnchange, this.meanTricuspidOnchange, this.meanPulmonaryOnchange,this.normalDiscMitralOnchange, this.normalDiscAorticOnchange, this.normalDiscTricuspidOnchange, this.normalDiscPulmonaryOnchange, this.visibleThrombusMitralOnchange, this.visibleThrombusAorticOnchange, this.visibleThrombusTricuspidOnchange, this.visibleThrombusPulmonaryOnchange, this.peakMitralOnchange, this.peakAorticOnchange, this.peakTricuspidOnchange, this.peakPulmonaryOnchange, this.mitralDiscBool, this.aorticDiscBool, this.tricuspidDiscBool, this.pulmonaryDiscBool, this.mitralVTBool, this.aorticVTBool, this.tricuspidVTBool, this.pulmonaryVTBool, this.mitralDiscBoolOnchange, this.aorticDiscBoolOnchange, this.tricuspidDiscBoolOnchange, this.pulmonaryDiscBoolOnchange, this.mitralVTBoolOnchange, this.aorticVTBoolOnchange, this.tricuspidVTBoolOnchange, this.pulmonaryVTBoolOnchange, this.result});

  @override
  State<valveD7> createState() => _valveD7State();
}

class _valveD7State extends State<valveD7> {
  bool mitral = false;
  bool aortic = false;
  bool tricuspid = false;
  bool pulmynary = false;
  bool isDisk = false;
  bool isVisible = false;
  List<String> selectedList = [];

  @override
  void initState() {
// print('hgvhgd');
//     if(widget.mitralBool ?? false){
//       selectedList.add('Mitral');
//       mitral = true;
//       // print(mitral);
//     }
    widget.mitralBool?? false ? {selectedList.add('Mitral'),
    mitral = true,
      // print('djvgdv');
    } : null;
    widget.aorticBool?? false ? {selectedList.add('Aortic'),
    aortic = true
    } : null;
    widget.tricuspidBool?? false ? {selectedList.add('Tricuspid'),
    tricuspid = true} : null;
    widget.pulmonaryBool?? false ? {selectedList.add('Pulmonary'),
    pulmynary = true} : null;
    // setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // MText(text: 'D7 PROSTHETIC VALVE ECHO FORM (INITIAL AND FOLLOW UP ASSESSMENT)',),
        // MRowTextCheckBox(title: 'Valve replaced',enabled: widget.isEnabled,result: (val){
        //   val.contains('Mitral') ? mitral = true : mitral = false;
        //   val.contains('Aortic') ? aortic = true : aortic = false;
        //   val.contains('Tricuspid') ? tricuspid = true : tricuspid = false;
        //   val.contains('Pulmonary') ? pulmynary = true : pulmynary = false;
        //   widget.result?.call(val);
        //   setState(() {});
        // }
        //   ,list: ['Mitral','Aortic','Tricuspid','Pulmonary'],),
        (mitral ||aortic || tricuspid || pulmynary )? Column(
        children: [
          MSmallText(text: 'D7.1 Mean gradient (mmHg)',),
          Space(),
          mitral? MTextField(label: 'Mitral',enabled: widget.isEnabled,initalValue: widget.meanMitralInitial,onChanged: widget.meanMitralOnchange,): Container(),
          aortic?  MTextField(enabled:widget.isEnabled,initalValue: widget.meanAorticInitial,onChanged: widget.meanAorticOnchange,label:'Aortic',): Container(),
          tricuspid?  MTextField(enabled:widget.isEnabled,initalValue: widget.meanTricuspidInitial,onChanged: widget.meanTricuspidOnchange,label:'Tricuspid',): Container(),
          pulmynary?MTextField(enabled:widget.isEnabled, initalValue: widget.meanPulmonaryInitial,onChanged: widget.meanPulmonaryOnchange,label:'Pulmonary',): Container(),
          MDivider(),
          // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
          MSmallText(text: 'D7.2 Peak gradient (mmHg)',),
          Space(),
          mitral? MTextField(label: 'Mitral',enabled: widget.isEnabled,initalValue: widget.peakMitralInitial,onChanged: widget.peakMitralOnchange,): Container(),
          aortic?  MTextField(enabled:widget.isEnabled,initalValue: widget.peakAorticInitial,onChanged: widget.peakAorticOnchange,label:'Aortic',): Container(),
          tricuspid?  MTextField(enabled:widget.isEnabled,initalValue: widget.peakTricuspidInitial,onChanged: widget.peakTricuspidOnchange,label:'Tricuspid',): Container(),
          pulmynary?MTextField(enabled:widget.isEnabled, initalValue: widget.peakPulmonaryInitial,onChanged: widget.peakPulmonaryOnchange,label:'Pulmonary',): Container(),
          MDivider(),
          // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
          // MSmallText(text: 'D7.3 Normal disc movement (Yes/No)',),
          // MRowTextRadioWidget(title: 'D7.3 Normal disc movement',isneedDivider: false,onChanged: (val){
          //   val == 'No' ? isDisk = true : isDisk = false;
          //   setState(() {});
          // },),
          MSmallText(text:'D7.3.1 Normal disc movement (mmHg)',),
          Space(),
          // isDisk ? Column(children: [
            mitral? Column(
              children: [
                MRowTextRadioWidget(title: 'Mitral (Yes/No)',initialValue:widget.mitralDiscBool,onChanged: widget.mitralDiscBoolOnchange,enabled: widget.isEnabled,isneedDivider: false,),
               widget.mitralDiscBool == 'No'? MTextField(label: 'Mitral',initalValue: widget.normalDiscMitralInitial, onChanged: widget.normalDiscMitralOnchange,enabled: widget.isEnabled,): Container(),
              ],
            ): Container(),
            aortic?  Column(
              children: [
                MRowTextRadioWidget(title: 'Aortic (Yes/No)',initialValue:widget.aorticDiscBool,onChanged: widget.aorticDiscBoolOnchange,enabled: widget.isEnabled,isneedDivider: false,),
                widget.aorticDiscBool== 'No' ?MTextField(enabled:widget.isEnabled,initalValue: widget.normalDiscAorticInitial,onChanged: widget.normalDiscAorticOnchange,label:'Aortic',) : Container(),
              ],
            ): Container(),
            tricuspid?  Column(
              children: [
                MRowTextRadioWidget(title: 'Tricuspid (Yes/No)',initialValue: widget.tricuspidDiscBool,onChanged: widget.tricuspidDiscBoolOnchange,enabled: widget.isEnabled,isneedDivider: false,),
                widget.tricuspidDiscBool == 'No'?MTextField(enabled:widget.isEnabled,initalValue: widget.normalDiscTricuspidInitial,onChanged: widget.normalDiscTricuspidOnchange,label:'Tricuspid',): Container(),
              ],
            ): Container(),
            pulmynary?Column(
              children: [
                MRowTextRadioWidget(title: 'Pulmonary (Yes/No)',initialValue: widget.pulmonaryDiscBool,onChanged: widget.pulmonaryDiscBoolOnchange,enabled: widget.isEnabled,isneedDivider: false,),
               widget.pulmonaryDiscBool == 'No' ? MTextField(enabled:widget.isEnabled,initalValue: widget.normalDiscPulmonaryInitial,onChanged: widget.normalDiscPulmonaryOnchange,label:'Pulmonary',) : Container(),
              ],
            ): Container(),
          // ],): Container(),
          MDivider(),
          // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
          // MSmallText(text: 'D7.4 Visible thrombus',),
          // Space(),
          // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
          // MRowTextRadioWidget(title: 'D7.4 Visible thrombus',isneedDivider: false,onChanged: (val){
          //   val == 'Yes' ? isVisible = true : isVisible = false;
          //   setState(() {});
          // },),
          MSmallText(text: 'D7.4 Visible thrombus',),
          Space(),
          // isVisible ? Column(children: [
           mitral? Column(
             children: [
               MRowTextRadioWidget(title: 'Mitral (Yes/No)',initialValue: widget.mitralVTBool,onChanged: widget.mitralVTBoolOnchange,enabled: widget.isEnabled,isneedDivider: false,),
               widget.mitralVTBool == 'Yes' ?MTextField(label: 'Mitral',initalValue: widget.visibleThrombusMitralInitial,onChanged: widget.visibleThrombusMitralOnchange,enabled: widget.isEnabled,): Container(),
             ],
           ): Container(),
           aortic?  Column(
             children: [
               MRowTextRadioWidget(title: 'Aortic (Yes/No)',initialValue:widget.aorticVTBool,onChanged: widget.aorticVTBoolOnchange,enabled: widget.isEnabled,isneedDivider: false,),
               widget.aorticVTBool == 'Yes' ? MTextField(enabled:widget.isEnabled,initalValue: widget.visibleThrombusAorticInitial,onChanged: widget.visibleThrombusAorticOnchange,label:'Aortic',) : Container(),
             ],
           ): Container(),
           tricuspid?  Column(
             children: [
               MRowTextRadioWidget(title: 'Tricuspid (Yes/No)',initialValue: widget.tricuspidVTBool,onChanged: widget.tricuspidVTBoolOnchange,enabled: widget.isEnabled,isneedDivider: false,),
              widget.tricuspidVTBool == 'Yes' ? MTextField(enabled:widget.isEnabled,initalValue: widget.visibleThrombusTricuspidInitial,onChanged: widget.visibleThrombusTricuspidOnchange,label:'Tricuspid',) : Container(),
             ],
           ): Container(),
           pulmynary?Column(
             children: [
               MRowTextRadioWidget(title: 'Pulmonary (Yes/No)',initialValue: widget.pulmonaryVTBool,onChanged: widget.pulmonaryVTBoolOnchange,enabled: widget.isEnabled,isneedDivider: false,),
               widget.pulmonaryVTBool == 'Yes' ?MTextField(enabled:widget.isEnabled,initalValue: widget.visibleThrombusPulmonaryInitial,onChanged: widget.visibleThrombusPulmonaryOnchange,label:'Pulmonary',) : Container(),
             ],
           ): Container(),
         // ],) : Container(),
          MDivider(),
        ],
      ): Container(),

      ],
    );
  }
}


