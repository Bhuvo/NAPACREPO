import 'package:npac/app/export.dart';

class FormH2 extends StatefulWidget {
  final bool? enable;
  const FormH2({super.key, this.enable});

  @override
  State<FormH2> createState() => _FormH2State();
}

class _FormH2State extends State<FormH2> {
  bool isPlan = false;
  bool isFiveOneYes =false;
  bool isInduced = false;

  bool isOxytocin =false;
  bool isDinoprostone =false;
  bool isMisoprosto =false;

  bool isBloodLoss = false;

  bool isObstetric = false;
  bool isCardiac = false;
  bool isAnelgesia = false;

  bool isdetails = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MText(text: 'K7. Peripartum Details',),
       Space(),
       MRowTextRadioWidget(title: 'K7. Peripartum Details (Ɵck applicable)',onChanged: (val){
         val =='Yes' ? isdetails=true : isdetails=false;
         setState(() {

         });
       },),
        isdetails ? Column(children: [
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.1 Was there a delivery plan before delivery:',onChanged: (val){
          if(val =='Yes'){
            setState(() {
              isPlan = true;
            });
          }else{
            setState(() {
              isPlan = false;
            });
          }
        },),
        isPlan? Column(children: [
          MrowTextTextFieldWidget(enabled : widget.enable,title: 'K7.1.1 At which gestational age was the plan made(weeks):',onChanged: (val){},type: MInputType.numeric,),
          MRowTextCheckBox(enabled : widget.enable,title: 'K7.1.2 Who were involved in the delivery plan:',result: (val){},list: ['Cardiologist','Obstetrician','Anesthetist','MFM'],),
          MRowTextRadioWidget(enabled : widget.enable,title: 'K7.1.3 What was the plan for delivery: ',onChanged: (val){},options: ['LSCS','Asst. Vagina'], isneedDivider: false,),
          MRowTextRadioWidget(enabled : widget.enable,title: 'K7.1.4 What was the plan for anesthesia:',onChanged: (val){},options: ['GA','Regional'],),
        ],) : Container(),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.2.1 lie',onChanged: (val){},options: ['Transverse','Oblique','Normal'],),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.2.2 Presentation: ',onChanged: (val){},options: ['Breech','Cephalic'],),
        MrowTextTextFieldWidget(enabled : widget.enable,title: 'K7.2.3 Robsons classifica:on & related parameters (I to X)',onChanged: (val){},),
        MrowTextDatePickerWidget(enabled : widget.enable,title: 'K7.3 Date of delivery:',onChanged: (val){},),
        MrowTextTextFieldWidget(enabled : widget.enable,title: 'K7.4 Gestational age at delivery:',onChanged: (val){},type: MInputType.numeric,),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.5 Labour',onChanged: (val){
          if(val =='Induced'){
            setState(() {
              isInduced = true;
            });
          }else{
            setState(() {
              isInduced = false;
            });
          }
        },options: ['Spontaneous','Induced'],),
        isInduced ? MRowTextCheckBox(enabled : widget.enable,title: 'K7.5.1 How the labour was induced/ augmented',result: (val) {
          if(val.contains('Oxytocin')){
            setState(() {
              isOxytocin = true;
            });
          }else{
            isOxytocin = false;
          }
          if(val.contains('Dinoprostone')){
            setState(() {
              isDinoprostone = true;
            });
          }else{
            isDinoprostone= false;
          }
          if(val.contains('Misoprostol')){
            setState(() {
              isMisoprosto = true;
            });
          }else{
            isMisoprosto = false;
          }
        },isneedDivider: false,list: ['Oxytocin','Dinoprostone','Misoprostol','Artificial rupture of Membrane','Mechanical dilatation(Foleys)'],): Container(),
        isOxytocin? TwoTextFields(isEnabled : widget.enable,title1: 'Oxytocin Dose',title2: 'Oxytocin Duration', onChange1: (val){},onChange2: (val){},type1: MInputType.numeric,type2: MInputType.numeric,): Container(),
        isDinoprostone ?TwoTextFields(isEnabled : widget.enable,title1: 'Dinoprostone Dose',title2: 'Dinoprostone Duration', onChange1: (val){},onChange2: (val){},type1: MInputType.numeric,type2: MInputType.numeric,): Container(),
        isMisoprosto? TwoTextFields(isEnabled : widget.enable,title1: 'Misoprostol Dose',title2: 'Misoprostol Duration', onChange1: (val){},onChange2: (val){},type1: MInputType.numeric,type2: MInputType.numeric,): Container(),
        MDivider(),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.6 Mode of delivery',onChanged: (val){},options: ['Vaginal','Assisted vaginal','LSCS','Emergency','Elective'],),
        MRowTextCheckBox(enabled : widget.enable,title: 'K7.6.1 Indications for LSCS',list: ['Obstetric','Cardiac'],isneedDivider: false,result: (val){
          val.contains('Obstetric') ? isObstetric = true : isObstetric = false;
          val.contains('Cardiac') ? isCardiac = true : isCardiac = false;
          setState(() {});
        }),
        isObstetric ? MRowTextRadioWidget(enabled : widget.enable,options: ['Failed induction ','Non-progression of labour'],onChanged: (val){}, isneedDivider: false,) : Container(),
        isCardiac? MrowTextTextFieldWidget(enabled : widget.enable,title: 'Details: ',onChanged: (val){},): Container(),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.7 Type of Anesthesia',onChanged: (val){},options: ['Spinal','Epi Spina','Epidural','GA','Failed regional converted to GA','Others(including TAP block)'],),
        MrowTextTextFieldWidget(enabled : widget.enable,title: 'K7.7.1 Drug used:',onChanged: (val){},),
        // MSmallText(text: 'K7.7.2 Labour anelgesia',),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.7.2 Labour anelgesia', isneedDivider: false,onChanged: (val){
          val =='Yes' ? isAnelgesia = true : isAnelgesia = false;
          setState(() {});
        },),
        // MRowTextRadioWidget(title: 'Pain relief',onChanged: (val){},),
        isAnelgesia?  MRowTextCheckBox(enabled : widget.enable,title: 'Mode of analgesia ',result: (val){},list: ['Epidural','Parenteral','Inhalational','Intrathecal','CSE','DPE'],isneedDivider: false,): Container(),
        isAnelgesia? MrowTextTextFieldWidget(enabled : widget.enable,title: 'Drug used', isneedDivider: false,onChanged: (val){},): Container(),
        MDivider(),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.8 Blood loss (>500 ml ) : ',onChanged: (val){
          if(val == 'Yes'){
            setState(() {
              isBloodLoss = true;
            });
          }else{
            setState(() {
              isBloodLoss = false;
            });
          }
        },isneedDivider: false,),
        isBloodLoss ? MrowTextTextFieldWidget(enabled : widget.enable,title: 'Amount',onChanged: (val){},): Container(),
        MDivider(),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.9 Blood/PRBC Transfusion',onChanged: (val){},),
      ],): Container(),
       // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH3);},)
      ],);
  }
}
