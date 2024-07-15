
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:npac/Forms/FormE/FormEModel/AntiBodiesList.dart';
import 'package:npac/Forms/FormE/controller/FormEController.dart';
import 'package:npac/Forms/FormN/widget/AntibioticsBody.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/theme_utils.dart';
import 'package:npac/widgets/loading_widget.dart';

class FormN3 extends StatefulWidget {
 final FormEController? controller;
 final int? patientId;
  const FormN3({super.key, this.controller, this.patientId});

  @override
  State<FormN3> createState() => _FormN3State();
}

class _FormN3State extends State<FormN3> {
  bool isLoading = false;
  int count = 1;
  RxList<AntibioticsList> antiBodiesList= <AntibioticsList>[].obs;

  @override
  void initState() {
    getMethod();
    super.initState();
  }
  void getMethod() async{
    setState(() {
      isLoading =true;
    });
    print('count in initState ${widget.controller?.antiBodiesListData.length}and ${antiBodiesList.length} and $count');
    antiBodiesList.value = widget.controller!.antiBodiesListData;
    if(widget.controller?.antiBodiesListData.length != null && widget.controller!.antiBodiesListData.length > 0){
      count = widget.controller?.antiBodiesListData.length ?? 1;
    }else{
      count = 1;
    }
    print('count in initState ${widget.controller?.antiBodiesListData.length}and ${antiBodiesList.length} and $count');
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      isLoading =false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? LoadingWidget() :Column(children: [
        Row(
          children: [
            MText(text: 'Antibiotics Used (incl IE prophylaxis)',),
          ],
        ),
        Space(),
        Obx(()=> ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              for(int i = 1; i <= count; i++)   antiBodiesList.length > 0 ?AntibioticsBody(key: ValueKey('AntibioticsBody${widget.controller?.antiBodiesListData[i-1].abId}'),index: i,patientId: widget.patientId,controller: widget.controller,data: antiBodiesList[i-1],onChanged: (e){
                setState(() {
                  antiBodiesList[i-1].name = e['Name'];
                  antiBodiesList[i-1].purpose = e['Purpose'];
                  antiBodiesList[i-1].gestWeeks = e['GestWeeks'];
                  antiBodiesList[i-1].durationInDays = e['DurationInDays'];
                });
              },onDelete: (){
                widget.controller?.deleteAntibiotics(context, antiBodiesList[i-1].abId ?? 0, widget.patientId ?? 0);
                setState(() {
                count--;
              });},): Container(),
            ],
          ),
        ),

       // AntibioticsBody(index: 1,)
      MFilledButton(text: 'ADD',onPressed: ()async{
        print('count $count');
        if(count <=1){
          count++;
          antiBodiesList.clear();
          print(antiBodiesList.length);
          antiBodiesList.add(AntibioticsList());
          print(antiBodiesList.length);
        }else{
         await widget.controller?.saveAntibiotics(context, antiBodiesList[count-2].name ?? '', antiBodiesList[count-2].purpose ?? '', antiBodiesList[count-2].gestWeeks ?? '', antiBodiesList[count-2].durationInDays ?? '', null, widget.patientId ?? 0);
         await widget.controller?.getAntibiotics(context, widget.patientId ?? 0);
          count = widget.controller?.antiBodiesListData.length ?? 1;
          antiBodiesList.value = widget.controller!.antiBodiesListData;
          setState(() {});
        }
        setState(() {});
      },),
      Space(),
      // MDivider()
      // Space(),
      // MFilledButton(text: 'Submit',onPressed: (){context.push(Routes.Home);},)
      ],);
  }
}
