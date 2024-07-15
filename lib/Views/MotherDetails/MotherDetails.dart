import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Views/MothersList/MotherListModel.dart';
import 'package:npac/app/export.dart';

class MotherDetails extends StatelessWidget {
  final MotherListModel data;
  const MotherDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data.patientfullname ?? ''),
              Text(data.patientid ??''),
            ],
          ),
          Row(          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(data.moblienumber ?? ''),
              Text(data.tNPHDRNOID ??''),
            ],
          ),
          Flexible(
            child: GridView(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              InkWell(
                onTap: (){
                  context.push(Routes.Form1, {'isFromPatientDetails': true});
                },
                child: Card(
                  child: Center(child: Text('Identification Form')),),
              ),
              InkWell(
                onTap: (){
                  context.push(Routes.Form3One, {'isFromPatientDetails': true, 'data': data});
                },
                child: Card(
                  child: Center(child: Text('Register Form')),),
              ),
              InkWell(
                onTap: (){
                  context.push(Routes.FormD1 );
                },
                child: Card(
                  child: Center(child: Text('First visit Form')),),
              ),
              InkWell(
                onTap: (){
                  context.push(Routes.FormE1, {'isFromPatientDetails': true, 'data': data});
                },
                child: Card(
                  child: Center(child: Text('Abortions MTP Form')),),
              ),
              InkWell(
                onTap: (){
                  context.push(Routes.FormF1);
                },
                child: Card(
                  child: Center(child: Text('ANTENATAL REVISIT-1')),),
              ),
              InkWell(
                onTap: (){
                  context.push(Routes.FormG1);
                },
                child: Card(
                  child: Center(child: Text('ANTENATAL REVISIT-2')),),
              ),
              InkWell(
                onTap: (){
                  context.push(Routes.FormH1);
                },
                child: Card(
                  child: Center(child: Text('FORM K- PERIPARTUM VISIT FORM')),),
              ),
            ],
            ),
          )
        ],),
      ),
    );
  }
}
