import 'package:npac/Forms/FormI/Widget/ThreeTextField.dart';
import 'package:npac/Forms/FormI/Widget/YesNo.dart';
import 'package:npac/Forms/FormI/Widget/heading_wdiget.dart';
import 'package:npac/app/export.dart';

class FormI2 extends StatefulWidget {
  final bool? isEnabled;
  const   FormI2({super.key, this.isEnabled});

  @override
  State<FormI2> createState() => _FormI2State();
}

class _FormI2State extends State<FormI2> {
  String option = '';
  bool isSwitchingDone = false;
  List<String> selectedList =[];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          MText(text: 'G3. ANTICOAGULANT/ANTIPLATELET REGIMEN',),
          MRowTextRadioWidget(enabled:widget.isEnabled,title: 'G3.1 Indication of pre pregnancy anticoagulant therapy',options: ['prosthetic heart valve','VTE/APE','Atrial Fibrillation','APLAS','Others'],),
        MRowTextRadioWidget(enabled:widget.isEnabled,title: 'G3.2 Pre-Pregnancy Anticoagulant therapy',onChanged: (val){},options: ['ACITROM','WARFARIN'],),
        MrowTextTextFieldWidget(enabled:widget.isEnabled,title: 'Average INR',onChanged: (val){},type: MInputType.decimal,validator: (val){
         if(val!= null){
           if((int.tryParse(val) ?? 0) >0.20 && (int.tryParse(val) ?? 0) <15.9){
             return null;
           }else{
             return 'Average INR must be between 0.20 and 15.9';
           }
        }
         },),
        MRowTextRadioWidget(enabled:widget.isEnabled,title: 'ASPIRIN',onChanged: (val){},),
        MSmallText(text: 'G3.3 Current pregnancy Anticoagulation Therapy:',),
        Heading_widget(enabled:widget.isEnabled,title: '1st trimester 5-12 weeks',),
        MDivider(),
        Heading_widget(enabled:widget.isEnabled,title: '2nd trimester 13-24 weeks'),
        MDivider(),
        Heading_widget(enabled:widget.isEnabled,title: '3rd trimester 25- 36 weeks',),
          MDivider(),
          Heading_widget(enabled:widget.isEnabled,title: 'Peripartum  >36 weeks',),
          MDivider(),
          Heading_widget(enabled:widget.isEnabled,title: 'Intrapartum',),
          MDivider(),
          Heading_widget(enabled:widget.isEnabled,title: 'Postpartum(1st week)',),
          MDivider(),
          Heading_widget(enabled:widget.isEnabled,title: 'Follow up(After 1 week)',),
          Space(),
          MDivider(),
          Space(),
          MSmallText(text: 'Details of Anti-coagulation switching',),
          Space(),
          MRowTextRadioWidget(title: 'Switching done',onChanged: (val){
            val =='Yes' ? isSwitchingDone = true : isSwitchingDone = false;
            setState(() {});
          },),
          isSwitchingDone ? Column(children: [
          MRowTextCheckBox(title: 'Time of switching',result: (val){
            val.contains('6th week') ? selectedList.add('6th week') : null;
            val.contains('13th week') ? selectedList.add('13th week') : null;
            val.contains('36th week') ? selectedList.add('36th week') : null;
            val.contains('Before Delviery') ? selectedList.add('Before Delviery') : null;
            val.contains('Post Delviery') ? selectedList.add('Post Delviery') : null;
            setState(() {});
          },list: ['6th week','13th week','36th week','Before Delviery','Post Delviery'],),
            selectedList.contains('6th week') ?MRowTextRadioWidget(enabled:widget.isEnabled,title: '6th week AC switch',onChanged: (val){},options: ['OAC to LMWH','OAC to UFH'],): Container(),
            selectedList.contains('13th week')?MRowTextRadioWidget(enabled:widget.isEnabled,title: '13th week AC switch',onChanged: (val){},options: ['LMWH to OAC','UFH to OAC'],): Container(),
            selectedList.contains('36th week') ? MRowTextRadioWidget(enabled:widget.isEnabled,title: '36th week AC switch',onChanged: (val){},options: ['OAC to LMWH','OAC to LMWH'],):Container(),
            selectedList.contains('Before Delviery') ?MRowTextRadioWidget(enabled:widget.isEnabled,title: 'Before Delviery (LMWH/ bolus UFH to UFH infusion)',onChanged: (val){},) : Container(),
            selectedList.contains('Post Delviery') ? Column(
              children: [
                MRowTextRadioWidget(enabled:widget.isEnabled,title: 'Post Delviery (UFH to OAC)',onChanged: (val){},),
                MTextField(enabled: widget.isEnabled,label: 'start Date (PN day)',onChanged: (val){},validator: (val){
                  if(val != null){
                    if((int.tryParse(val) ?? 0) >0 && (int.tryParse(val) ?? 0) <20){
                      return null;
                    }else{
                      return 'start Date (PN day) must be between 1 and 20';
                    }
                  }
                },)
              ],
            ): Container(),
        ],): Container(),
          YesNo(enabled: widget.isEnabled,title: 'Vitamin K',widget:ThreeTextField(enabled:widget.isEnabled,title: 'If yes specify,',text1: 'Dose',text3: 'Time of use:',text2:'Indication:',text2type: MInputType.text,onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},) ,),
          YesNo(enabled: widget.isEnabled,title: 'Trenaxa',widget:ThreeTextField(enabled:widget.isEnabled,title: 'If yes specify,',text1: 'Dose',text3: 'Time of use:',text2:'Indication:',text2type: MInputType.text,onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},) ,),
          YesNo(enabled: widget.isEnabled,title: 'Protamine',widget:ThreeTextField(enabled:widget.isEnabled,title: 'If yes specify,',text1: 'Dose',text3: 'Time of use:',text2:'Indication:',text2type: MInputType.text,onText1Changed: (val){},onText2Changed: (val){},onText3Changed: (val){},) ,),

          //MFilledButton(text: 'submit',onPressed: (){context.push(Routes.Home);},)
      ],);
  }
}
