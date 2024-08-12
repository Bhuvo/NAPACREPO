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
                  context.push(Routes.FormD1, {'patientId' : data.tNPHDRNOID,});
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
                  context.push(Routes.FormF1,{'patientId': int.parse(data.patientid ?? ''),});
                },
                child: Card(
                  child: Center(child: Text('ANTENATAL REVISIT-1')),),
              ),
              InkWell(
                onTap: (){
                  context.push(Routes.FormG1,{'patientId': int.parse(data.patientid ?? ''),});
                },
                child: Card(
                  child: Center(child: Text('ANTENATAL REVISIT-2')),),
              ),
              InkWell(
                onTap: (){
                  context.push(Routes.FormH1,{'patientId': int.parse(data.patientid ?? ''),});
                },
                child: Card(
                  child: Center(child: Text('FORM K- PERIPARTUM VISIT FORM')),),
              ),
              InkWell(
                onTap: (){
                  context.push(Routes.FormL1, {'patientId': int.parse(data.patientid ?? ''),});
                },
                child: Card(
                  child: Center(child: Text('FORM L- FIRST POST PARTUM VISIT FORM')),),
              ),
              InkWell(
                onTap: (){
                  context.push(Routes.FormM1, {'patientId': int.parse(data.patientid ?? ''),});
                },
                child: Card(
                  child: Center(child: Text('FORM M- SECOND POST PARTUM VISIT FORM')),),
              ),
            ],
            ),
          )
        ],),
      ),
    );
  }
}
