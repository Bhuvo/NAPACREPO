import 'package:flutter/cupertino.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextCheckBox.dart';

class valveD7 extends StatefulWidget {
  final bool? isEnabled;
  const valveD7({super.key, this.isEnabled});

  @override
  State<valveD7> createState() => _valveD7State();
}

class _valveD7State extends State<valveD7> {
  bool mitral = false;
  bool aortic = false;
  bool tricuspid = false;
  bool pulmynary = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MRowTextCheckBox(title: 'Valve replaced',enabled: widget.isEnabled,result: (val){
          val.contains('Mitral') ? mitral = true : mitral = false;
          val.contains('Aortic') ? aortic = true : aortic = false;
          val.contains('Tricuspid') ? tricuspid = true : tricuspid = false;
          val.contains('Pulmonary') ? pulmynary = true : pulmynary = false;
          setState(() {});
        }
          ,list: ['Mitral','Aortic','Tricuspid','Pulmonary'],),
        mitral ||aortic || tricuspid || pulmynary ? Column(
        children: [
          MSmallText(text: 'D7.1 Mean gradient (mmHg)',),
          Space(),
          mitral? MTextField(label: 'Mitral',enabled: widget.isEnabled,): Container(),
          aortic?  MTextField(enabled:widget.isEnabled,label:'Aortic',): Container(),
          tricuspid?  MTextField(enabled:widget.isEnabled,label:'Tricuspid',): Container(),
          pulmynary?MTextField(enabled:widget.isEnabled,label:'Pulmonary',): Container(),
          MDivider(),
          // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
          MSmallText(text: 'D7.2 Peak gradient (mmHg)',),
          Space(),
          mitral? MTextField(label: 'Mitral',enabled: widget.isEnabled,): Container(),
          aortic?  MTextField(enabled:widget.isEnabled,label:'Aortic',): Container(),
          tricuspid?  MTextField(enabled:widget.isEnabled,label:'Tricuspid',): Container(),
          pulmynary?MTextField(enabled:widget.isEnabled,label:'Pulmonary',): Container(),
          MDivider(),
          // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
          MSmallText(text: 'D7.3 Normal disc movement (Yes/No)',),
          Space(),
          mitral? MTextField(label: 'Mitral',enabled: widget.isEnabled,): Container(),
          aortic?  MTextField(enabled:widget.isEnabled,label:'Aortic',): Container(),
          tricuspid?  MTextField(enabled:widget.isEnabled,label:'Tricuspid',): Container(),
          pulmynary?MTextField(enabled:widget.isEnabled,label:'Pulmonary',): Container(),
          MDivider(),      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
          MSmallText(text: 'D7.4 Visible thrombus (Yes/No)',),
          // Space(),
          // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
          Space(),
          mitral? MTextField(label: 'Mitral',enabled: widget.isEnabled,): Container(),
          aortic?  MTextField(enabled:widget.isEnabled,label:'Aortic',): Container(),
          tricuspid?  MTextField(enabled:widget.isEnabled,label:'Tricuspid',): Container(),
          pulmynary?MTextField(enabled:widget.isEnabled,label:'Pulmonary',): Container(),
          MDivider(),
        ],
      ): Container(),

      ],
    );
  }
}


