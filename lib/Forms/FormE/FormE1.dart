import 'package:npac/app/export.dart';

class FormE1 extends StatefulWidget {
  const FormE1({super.key});

  @override
  State<FormE1> createState() => _FormE1State();
}

class _FormE1State extends State<FormE1> {
  bool isSurgicalMethod = false;
  bool isMedicalMethod = false;
  bool isMifepristone = false;
  bool isMisoprostol = false;
  bool isProphylaxis = false;
  bool isAdvised = false;
  bool isOtherAdvise = false;


  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MAppBar(title: 'E. ABORTION / MTP PAGE (FORM E)')),


      body: MFormBody(Childrens: [
        MRowTextRadioWidget(title: '',options: const ['Spontaneous', 'Induced'],onChanged: (val){},),
        MRowTextRadioWidget(title: 'E1 Indication for MTP: ',options: const ['Maternal', 'Fetal'],onChanged: (val){},),
        MRowTextRadioWidget(title: 'E2 Gestation at which MTP performed: ',options: const ['Less than 12 weeks', 'Between 12 to 20 weeks','After 20 week'],onChanged: (val){},),
        MRowTextRadioWidget(title: 'E3 Method adopted for MTP:',options: const ['Surgical', 'Medical'],onChanged: (val){
          if(val =='Surgical'){
            setState(() {
              isSurgicalMethod = true;
            });
          }else{
            setState(() {
              isSurgicalMethod = false;
            });
          }
          if(val =='Medical'){
            setState(() {
              isMedicalMethod = true;
            });
          }else{
            setState(() {
              isMedicalMethod = false;
            });
          }
        },isneedDivider:isMedicalMethod ||isSurgicalMethod ? false: true,),
        isSurgicalMethod ?const MRowTextCheckBox(list: ['Suction & evacuation','Dilatation & curettage','Dilatation & evacuation','Hysterotomy'],):
        isMedicalMethod? MRowTextCheckBox(list: const ['Mifepristone','Misoprostol','Dinoprostone','Mechanical method','Oxytocin'],isneedDivider: isMifepristone || isMisoprostol ? false : true,result:(val){
          if(val.contains('Mifepristone')){
            setState(() {
              isMifepristone = true;
            });
          }else{
            setState(() {
              isMifepristone = false;
            });
          }
          if(val.contains('Misoprostol')){
            setState(() {
              isMisoprostol = true;
            });
          }else{
            setState(() {
              isMisoprostol = false;
            });
          }
        },): Container(),
        isMifepristone? MTextField(label: 'Mifepristone (Total Dose)',onChanged: (val){},) : Container(),
        isMisoprostol? MTextField(label: 'Misoprostol (Total Dose)',onChanged: (val){},): Container(),
        isMifepristone || isMisoprostol ? const MDivider(): Container(),
        MRowTextRadioWidget(onChanged: (val){},title: 'E4 Mode of anesthesia / analgesia:',options: const ['Local','Regional','GA'],),
        MRowTextRadioWidget(onChanged: (val){if(val =='Yes'){
          setState(() {
            isProphylaxis = true;
          });
        }else{
          setState(() {
            isProphylaxis = false;
          });
        }
    },title: 'E4 Mode of anesthesia / analgesia:',isneedDivider:isProphylaxis? false: true,),
        isProphylaxis ? MTextField(label: 'If Yes details: ',onChanged: (val){},) : Container(),
        isProphylaxis? const MDivider(): Container(),
        // MRowTextRadioWidget(title: 'E6 Contraception advised after MTP/Abortion:',),
        MRowTextRadioWidget(title: 'E6 Contraception advised after MTP/Abortion:',onChanged: (val){if(val =='Yes'){
          setState(() {
            isAdvised = true;
          });
        }else{
          setState(() {
            isAdvised = false;
          });
        }
    },isneedDivider: isAdvised? false: true,),
        isAdvised ? MRowTextRadioWidget(options: const ['IUCD','OCP','Barrier method','Tubectomy','Others'],onChanged: (val){ if(val == 'Others'){
          setState(() {
            isOtherAdvise = true;
          });
        }else{setState(() {
          isOtherAdvise = false;
        });}},isneedDivider:isOtherAdvise? false: true,): Container(),
        isOtherAdvise? MTextField(label: 'If others please specify',onChanged: (val){},) : Container(),
        isOtherAdvise? const MDivider(): Container(),
        MRowTextRadioWidget(title: 'E7 Outcome and Complication:',onChanged: (val){},),
        MFilledButton(onPressed: (){},text: 'Next',)

      ],),
      );
  }
}
