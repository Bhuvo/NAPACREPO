import 'package:npac/app/export.dart';

class FormH2 extends StatefulWidget {
  const FormH2({super.key});

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

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'H. PERIPARTUM VISIT PAGE (FORM H)',),

      body: MFormBody(Childrens: [
        MRowTextRadioWidget(title: 'H5. PERIPARTUM DETAILS (tick applicable)',onChanged: (val){
          if(val =='Yes'){
            setState(() {
              isFiveOneYes = true;
            });
          }else{
            setState(() {
              isFiveOneYes = false;
            });
          }
        },),
        isFiveOneYes ? Column(children: [
         MRowTextRadioWidget(title: 'H5.1 Was there a delivery plan before delivery:',onChanged: (val){
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
           MrowTextTextFieldWidget(title: 'H5.1.1 At which gestational age was the plan made(weeks):',onChanged: (val){},type: MInputType.numeric,),
           MRowTextCheckBox(title: 'H5.1.2 Who were involved in the delivery plan:',result: (val){},list: ['Cardiologist','Obstetrician','Anesthetist','MFM'],),
           MRowTextRadioWidget(title: 'H5.1.3 What was the plan for delivery: ',onChanged: (val){},options: ['LSCS','Asst. Vagina'], isneedDivider: false,),
           MRowTextRadioWidget(title: 'Anesthesia:',onChanged: (val){},options: ['GA','Regional'],),
         ],) : Container(),
         MRowTextRadioWidget(title: 'H5.2 Presentation/lie',onChanged: (val){},options: ['Transverse','Oblique','Breech','Cephalic'],),
         MrowTextTextFieldWidget(title: 'H5.3 Robsons class:',onChanged: (val){},),
         MrowTextDatePickerWidget(title: 'H5.4 Date of delivery:',onChanged: (val){},),
         MrowTextTextFieldWidget(title: 'H5.5 Gestational age at delivery:',onChanged: (val){},type: MInputType.numeric,),
         MRowTextRadioWidget(title: 'H5.6 Labour',onChanged: (val){
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
          isInduced ? MRowTextCheckBox(title: 'H5.6.1 How the labour was induced/ augmented',result: (val) {
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
          isOxytocin? TwoTextFields(title1: 'Oxytocin Dose',title2: 'Oxytocin Duration', onChange1: (val){},onChange2: (val){},type1: MInputType.numeric,type2: MInputType.numeric,): Container(),
          isDinoprostone ?TwoTextFields(title1: 'Dinoprostone Dose',title2: 'Dinoprostone Duration', onChange1: (val){},onChange2: (val){},type1: MInputType.numeric,type2: MInputType.numeric,): Container(),
          isMisoprosto? TwoTextFields(title1: 'Misoprostol Dose',title2: 'Misoprostol Duration', onChange1: (val){},onChange2: (val){},type1: MInputType.numeric,type2: MInputType.numeric,): Container(),
          MDivider(),
            MRowTextRadioWidget(title: 'H5.7 Mode of delivery',onChanged: (val){},options: ['Vaginal','Assisted vaginal','LSCS','Emergency','Elective'],),
          MRowTextCheckBox(title: 'H5.7.1 Indications for LSCS',list: ['Obstetric','Cardiac'],isneedDivider: false,),
          MRowTextRadioWidget(options: ['Failed induction ','Non-progression of labour'],onChanged: (val){}, isneedDivider: false,),
          MrowTextTextFieldWidget(title: 'Details: ',onChanged: (val){},),
          MRowTextRadioWidget(title: 'H5.7.2 Type of Anesthesia',onChanged: (val){},options: ['Spinal','Epi Spina','Epidural','GA','TAP block','Failed regional converted to GA'],),
          MrowTextTextFieldWidget(title: 'H5.7.3 Drug used:',onChanged: (val){},),
          Row(
            children: [
              MSmallText(text: 'H5.7.4 Labour anelgesia',),
            ],
          ),
          Space(),
          MRowTextRadioWidget(title: 'Pain relief',onChanged: (val){},),
          MRowTextCheckBox(title: 'H5.7.5 Mode of analgesia ',result: (val){},list: ['Epidural','Parenteral','Inhalational','Intrathecal','CSE','DPE'],isneedDivider: false,),
          MrowTextTextFieldWidget(title: 'Drug used',onChanged: (val){},),
          MRowTextRadioWidget(title: 'H8 Blood loss (>500 ml ) : ',onChanged: (val){
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
          isBloodLoss ? MrowTextTextFieldWidget(title: 'Amount',onChanged: (val){},): Container(),
          MDivider(),
          MRowTextRadioWidget(title: 'H9 Blood Transfusion',onChanged: (val){},)

       ],): Container(),
        MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH3);},)


      ],),
    );
  }
}
