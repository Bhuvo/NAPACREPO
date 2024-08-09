import 'package:npac/Forms/FormH/Model/FormK2Model.dart';
import 'package:npac/app/export.dart';

class FormH2 extends StatefulWidget {
  final bool? enable;
  final Rx<FormK2Model>? formK2Data;
  const FormH2({super.key, this.enable, this.formK2Data});

  @override
  State<FormH2> createState() => _FormH2State();
}

class _FormH2State extends State<FormH2> {
  bool isPlan = false;
  // bool isFiveOneYes =false;
  bool isInduced = false;

  // bool isOxytocin =false;
  // bool isDinoprostone =false;
  // bool isMisoprosto =false;
  //
  // bool isBloodLoss = false;
  //
  // bool isObstetric = false;
  // bool isCardiac = false;
  // bool isAnelgesia = false;
  List<String> involvedList = <String>[].obs;
  List<String> labourInducedList = <String>[].obs;
  List<String> LSCSList = <String>[].obs;
  List<String> modeAnesthesiaList = <String>[].obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void getData()async{
    widget.formK2Data?.value.planMadeForDelivery == 'Yes' ? isPlan = true : isPlan = false;
    widget.formK2Data?.value.peripartumLabour == 'Induced' ? isInduced = true : isInduced = false;
    widget.formK2Data?.value.dPTCardiologist ?? false ? involvedList.add('Cardiologist') :null;
    widget.formK2Data?.value.dPTObstetrician ?? false ? involvedList.add('Obstetrician') :null;
    widget.formK2Data?.value.dPTAnesthetist ?? false ? involvedList.add('Anesthetist') :null;
    widget.formK2Data?.value.dPTMFM ?? false ? involvedList.add('MFM') :null;
    widget.formK2Data?.value.oxytocin ?? false ? labourInducedList.add('Oxytocin') :null;
    widget.formK2Data?.value.dinoprostone ?? false ? labourInducedList.add('Dinoprostone') :null;
    widget.formK2Data?.value.misoprostol ?? false ? labourInducedList.add('Misoprostol') :null;
    widget.formK2Data?.value.artificialRupture ?? false ? labourInducedList.add('Artificial rupture of Membrane') :null;
    widget.formK2Data?.value.foleys ?? false ? labourInducedList.add('Mechanical dilatation(Foleys)') :null;
    widget.formK2Data?.value.obstetricIndication ?? false ? LSCSList.add('Obstetric') :null;
    widget.formK2Data?.value.cardiacIndication ?? false ? LSCSList.add('Cardiac') :null;
    widget.formK2Data?.value.analgesiaEpidural ?? false ? modeAnesthesiaList.add('Epidural') :null;
  widget.formK2Data?.value.analgesiaParenteral ?? false ? modeAnesthesiaList.add('Parenteral') :null;
    widget.formK2Data?.value.analgesiaInhalational ?? false ? modeAnesthesiaList.add('Inhalational') :null;
    widget.formK2Data?.value.analgesiaIntrathecal ?? false ? modeAnesthesiaList.add('Intrathecal') :null;
    widget.formK2Data?.value.analgesiaCSE ?? false ? modeAnesthesiaList.add('CSE') :null;
    widget.formK2Data?.value.analgesiaDPE ?? false ? modeAnesthesiaList.add('DPE') :null;


  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MText(text: 'K7. Peripartum Details',),
       Space(),
       // MRowTextRadioWidget(title: 'K7. Peripartum Details (Ɵck applicable)',initialValue: widget.formK2Data?.value.per,onChanged: (val){
       //   val =='Yes' ? isdetails=true : isdetails=false;
       //   setState(() {
       //
       //   });
       // },),
       //  isdetails ?
         Column(children: [
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.1 Was there a delivery plan before delivery:',initialValue: widget.formK2Data?.value.planMadeForDelivery,onChanged: (val){
          if(val =='Yes'){
            setState(() {
              isPlan = true;
            });
          }else{
            setState(() {
              isPlan = false;
            });
          }
          widget.formK2Data?.value.planMadeForDelivery = val;
        },),
        isPlan? Column(children: [
          MrowTextTextFieldWidget(enabled : widget.enable,title: 'K7.1.1 At what gestational age was the delivery plan made(weeks):',initialValue: widget.formK2Data?.value.gAForDeliveryPlan,onChanged: (val){
            widget.formK2Data?.value.gAForDeliveryPlan = val;
          },type: MInputType.numeric,),
          MRowTextCheckBox(enabled : widget.enable,title: 'K7.1.2 Who were involved in the delivery plan:',selectedlist: involvedList,result: (val){
            val.contains('Cardiologist') ?widget.formK2Data?.value.dPTCardiologist = true : widget.formK2Data?.value.dPTCardiologist = false;
            val.contains('Obstetrician') ?widget.formK2Data?.value.dPTObstetrician = true : widget.formK2Data?.value.dPTObstetrician = false;
            val.contains('Anesthetist') ?widget.formK2Data?.value.dPTAnesthetist = true : widget.formK2Data?.value.dPTAnesthetist = false;
            val.contains('MFM') ?widget.formK2Data?.value.dPTMFM = true : widget.formK2Data?.value.dPTMFM = false;
            setState(() {});
          },list: ['Cardiologist','Obstetrician','Anesthetist','MFM'],),
          MRowTextRadioWidget(enabled : widget.enable,title: 'K7.1.3 What was the plan for delivery:',initialValue: widget.formK2Data?.value.deliveryPlan,onChanged: (val){
            widget.formK2Data?.value.deliveryPlan = val;
          },options: ['LSCS','Asst. Vagina'], isneedDivider: false,),
          MRowTextRadioWidget(enabled : widget.enable,title: 'K7.1.4 What was the plan for anesthesia:',initialValue: widget.formK2Data?.value.anesthesiaPlan,onChanged: (val){
            widget.formK2Data?.value.anesthesiaPlan = val;
          },options: ['GA','Regional'],),
        ],) : Container(),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.2.1 lie',initialValue: widget.formK2Data?.value.peripartumLie,onChanged: (val){
          widget.formK2Data?.value.peripartumLie = val;
        },options: ['Transverse','Oblique','Normal'],),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.2.2 Presentation: ',initialValue: widget.formK2Data?.value.peripartumPresentation,onChanged: (val){
          widget.formK2Data?.value.peripartumPresentation = val;
        },options: ['Breech','Cephalic'],),
        MrowTextTextFieldWidget(enabled : widget.enable,title: 'K7.2.3 Robsons classification & related parameters (I to X)',initialValue: widget.formK2Data?.value.robsonParamter,onChanged: (val){
          widget.formK2Data?.value.robsonParamter = val;
        },),
        MrowTextDatePickerWidget(enabled : widget.enable,title: 'K7.3 Date of delivery:',initialDate: stringToDate(widget.formK2Data?.value.dateOfDelivery ?? ''),onChanged: (val){
          widget.formK2Data?.value.dateOfDelivery = dateToString(val);
        },),
        MrowTextTextFieldWidget(enabled : widget.enable,title: 'K7.4 Gestational age at delivery:',initialValue: widget.formK2Data?.value.gestationalAgeDelivery,onChanged: (val){
          widget.formK2Data?.value.gestationalAgeDelivery = val;
        },type: MInputType.numeric,),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.5 Labour',initialValue: widget.formK2Data?.value.peripartumLabour,onChanged: (val){
          if(val =='Induced'){
            setState(() {
              isInduced = true;
            });
          }else{
            setState(() {
              isInduced = false;
            });
          }
          widget.formK2Data?.value.peripartumLabour = val;
        },options: ['Spontaneous','Induced'],isneedDivider: false,),
        isInduced ? MRowTextCheckBox(enabled : widget.enable,title: 'K7.5.1 How the labour was induced/ augmented',selectedlist: labourInducedList,result: (val) {
          val.contains('Oxytocin') ? widget.formK2Data?.value.oxytocin = true : widget.formK2Data?.value.oxytocin = false;
          val.contains('Dinoprostone') ? widget.formK2Data?.value.dinoprostone = true : widget.formK2Data?.value.dinoprostone = false;
          val.contains('Misoprostol') ? widget.formK2Data?.value.misoprostol = true : widget.formK2Data?.value.misoprostol = false;
          val.contains('Artificial rupture of Membrane') ? widget.formK2Data?.value.artificialRupture = true : widget.formK2Data?.value.artificialRupture = false;
          val.contains('Mechanical dilatation(Foleys)') ? widget.formK2Data?.value.foleys = true : widget.formK2Data?.value.foleys = false;
          setState(() {});
          // if(val.contains('Oxytocin')){
          //   setState(() {
          //     isOxytocin = true;
          //   });
          // }else{
          //   isOxytocin = false;
          // }
          // if(val.contains('Dinoprostone')){
          //   setState(() {
          //     isDinoprostone = true;
          //   });
          // }else{
          //   isDinoprostone= false;
          // }
          // if(val.contains('Misoprostol')){
          //   setState(() {
          //     isMisoprosto = true;
          //   });
          // }else{
          //   isMisoprosto = false;
          // }
        },isneedDivider: false,list: ['Oxytocin','Dinoprostone','Misoprostol','Artificial rupture of Membrane','Mechanical dilatation(Foleys)'],): Container(),
        //    widget.formK2Data?.value.oxytocin ?? false ? TwoTextFields(isEnabled : widget.enable,title1: 'Oxytocin Dose',title2: 'Oxytocin Duration', onChange1: (val){},onChange2: (val){},type1: MInputType.numeric,type2: MInputType.numeric,): Container(),
        // widget.formK2Data?.value.dinoprostone ?? false ?TwoTextFields(isEnabled : widget.enable,title1: 'Dinoprostone Dose',title2: 'Dinoprostone Duration', onChange1: (val){},onChange2: (val){},type1: MInputType.numeric,type2: MInputType.numeric,): Container(),
        // widget.formK2Data?.value.misoprostol ?? false ? TwoTextFields(isEnabled : widget.enable,title1: 'Misoprostol Dose',title2: 'Misoprostol Duration', onChange1: (val){},onChange2: (val){},type1: MInputType.numeric,type2: MInputType.numeric,): Container(),
           widget.formK2Data?.value.oxytocin ?? false ? MTextField(enabled : widget.enable,label: 'Oxytocin Dose',initalValue: widget.formK2Data?.value.oxytocinDose,onChanged: (val){
             widget.formK2Data?.value.oxytocinDose = val;
           },type: MInputType.numeric,): Container(),
           widget.formK2Data?.value.oxytocin ?? false ? MTextField(enabled : widget.enable,label: 'Oxytocin Duration',initalValue: widget.formK2Data?.value.oxytocinDuration,onChanged: (val){
             widget.formK2Data?.value.oxytocinDuration = val;
           }): Container(),
           widget.formK2Data?.value.dinoprostone ?? false ? MTextField(enabled : widget.enable,label: 'Dinoprostone Dose',initalValue: widget.formK2Data?.value.dinoprostoneDose,onChanged: (val){
             widget.formK2Data?.value.dinoprostoneDose = val;
           }): Container(),
           widget.formK2Data?.value.dinoprostone ?? false ? MTextField(enabled : widget.enable,label: 'Dinoprostone Duration',initalValue: widget.formK2Data?.value.dinoprostoneDuration,onChanged: (val){
             widget.formK2Data?.value.dinoprostoneDuration = val;
           }):  Container(),
           widget.formK2Data?.value.misoprostol ?? false ? MTextField(enabled : widget.enable,label: 'Misoprostol Dose',initalValue: widget.formK2Data?.value.misoprostolDose,onChanged: (val){
             widget.formK2Data?.value.misoprostolDose = val;
           }) : Container(),
           widget.formK2Data?.value.misoprostol ?? false ? MTextField(enabled : widget.enable,label: 'Misoprostol Duration',initalValue: widget.formK2Data?.value.misoprostolDuration,onChanged: (val){
             widget.formK2Data?.value.misoprostolDuration = val;
           }) : Container(),
        MDivider(),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.6 Mode of delivery',initialValue: widget.formK2Data?.value.modeOfDelivery,onChanged: (val){
          widget.formK2Data?.value.modeOfDelivery = val;
        },options: ['Emergency LSCS','Elective LSCS','Vaginal','Assisted vaginal'],),
           widget.formK2Data?.value.modeOfDelivery != 'Vaginal' && widget.formK2Data?.value.modeOfDelivery != 'Assisted vaginal'&& widget.formK2Data?.value.modeOfDelivery != null ?MRowTextCheckBox(enabled : widget.enable,title: 'K7.6.1 Indications for LSCS',selectedlist: LSCSList,list: ['Obstetric','Cardiac'],isneedDivider: false,result: (val){
          val.contains('Obstetric') ? widget.formK2Data?.value.obstetricIndication = true : widget.formK2Data?.value.obstetricIndication = false;
          val.contains('Cardiac') ? widget.formK2Data?.value.cardiacIndication = true : widget.formK2Data?.value.cardiacIndication = false;
          // val.contains('Obstetric') ? isObstetric = true : isObstetric = false;
          // val.contains('Cardiac') ? isCardiac = true : isCardiac = false;
          setState(() {});
        }): Container(),
           widget.formK2Data?.value.obstetricIndication ?? false ? MRowTextRadioWidget(enabled : widget.enable,initialValue: widget.formK2Data?.value.obstetricIndicationValue,options: ['Failed induction ','Non-progression of labour'],onChanged: (val){
             widget.formK2Data?.value.obstetricIndicationValue = val;
           }, isneedDivider: false,) : Container(),
           widget.formK2Data?.value.cardiacIndication ?? false ? MrowTextTextFieldWidget(enabled : widget.enable,initialValue: widget.formK2Data?.value.caridacIndicationReason,title: 'Details: ',onChanged: (val){
             widget.formK2Data?.value.caridacIndicationReason = val;
           },): Container(),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.7 Type of Anesthesia',initialValue: widget.formK2Data?.value.typeOfAnesthesia,onChanged: (val){
          widget.formK2Data?.value.typeOfAnesthesia = val;
        },options: ['Spinal','Epi Spinal','Failed regional converted to GA','GA','Epidural','Others(including TAP block)'],),
        MrowTextTextFieldWidget(enabled : widget.enable,title: 'K7.7.1 Drug used:',initialValue: widget.formK2Data?.value.anesthesiaDrugUsed,onChanged: (val){
          widget.formK2Data?.value.anesthesiaDrugUsed = val;
        },),
        // MSmallText(text: 'K7.7.2 Labour anelgesia',),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.7.2 Labour analgesia provided: ',initialValue: widget.formK2Data?.value.labourAnalgesia, isneedDivider: false,onChanged: (val){
          // val =='Yes' ? isAnelgesia = true : isAnelgesia = false;
          widget.formK2Data?.value.labourAnalgesia = val;
          setState(() {});
        },),
        // MRowTextRadioWidget(title: 'Pain relief',onChanged: (val){},),
           widget.formK2Data?.value.labourAnalgesia == 'Yes'?  MRowTextCheckBox(enabled : widget.enable,title: 'Mode of analgesia ',selectedlist: modeAnesthesiaList,result: (val){
             val.contains('Epidural') ? widget.formK2Data?.value.analgesiaEpidural = true : widget.formK2Data?.value.analgesiaEpidural = false;
             val.contains('Parenteral') ? widget.formK2Data?.value.analgesiaParenteral = true : widget.formK2Data?.value.analgesiaParenteral = false;
             val.contains('Inhalational') ? widget.formK2Data?.value.analgesiaInhalational = true : widget.formK2Data?.value.analgesiaInhalational = false;
             val.contains('Intrathecal') ? widget.formK2Data?.value.analgesiaIntrathecal = true : widget.formK2Data?.value.analgesiaIntrathecal = false;
             val.contains('CSE') ? widget.formK2Data?.value.analgesiaCSE = true : widget.formK2Data?.value.analgesiaCSE = false;
             val.contains('DPE') ? widget.formK2Data?.value.analgesiaDPE = true : widget.formK2Data?.value.analgesiaDPE = false;
             setState(() {});
           },list: ['Epidural','Parenteral','Inhalational','Intrathecal','CSE','DPE'],isneedDivider: false,): Container(),
           widget.formK2Data?.value.labourAnalgesia == 'Yes'? MrowTextTextFieldWidget(enabled : widget.enable,title: 'Drug used',initialValue: widget.formK2Data?.value.analgesiaDrugUsed,isneedDivider: false,onChanged: (val){
             widget.formK2Data?.value.analgesiaDrugUsed = val;
           },): Container(),
        MDivider(),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.8 Blood loss (>500 ml ) : ',initialValue: widget.formK2Data?.value.bloodLoss,onChanged: (val){
          // if(val == 'Yes'){
          //   setState(() {
          //     isBloodLoss = true;
          //   });
          // }else{
          //   setState(() {
          //     isBloodLoss = false;
          //   });
          // }
          widget.formK2Data?.value.bloodLoss = val;
        },isneedDivider: false,),
           widget.formK2Data?.value.bloodLoss == 'Yes' ? MrowTextTextFieldWidget(enabled : widget.enable,title: 'Amount',initialValue: widget.formK2Data?.value.bloodLossAmount,onChanged: (val){
             widget.formK2Data?.value.bloodLossAmount = val;
           },): Container(),
        MDivider(),
        MRowTextRadioWidget(enabled : widget.enable,title: 'K7.9 Blood/PRBC Transfusion',initialValue: widget.formK2Data?.value.bloodTransfusion,onChanged: (val){
          widget.formK2Data?.value.bloodTransfusion = val;
        },),
      ],),
       // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH3);},)
      ],);
  }
}
