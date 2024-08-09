import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormD/Model/FormD5Model.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MRowTextCheckBox.dart';
import 'package:npac/common_widget/MSmallText.dart';
import 'package:npac/utils/navigator_utils.dart';

class FormD5 extends StatefulWidget {
  final bool? isEnabled;
  final  Rx<FormD5Model>? formD5Model;
  const FormD5({super.key, this.isEnabled, this.formD5Model});

  @override
  State<FormD5> createState() => _FormD5State();
}

class _FormD5State extends State<FormD5> {
  bool isAbnormal = false;
  bool isCoarctation = false;
  String Defect = '';

  bool isASD = false;
  bool isVSD = false;
  bool isPDA = false;
  bool isAPW = false;
  bool isAVSD = false;

  String Mitral ='';
  String Tricuspid ='';
  String Pulmonary ='';
  String Aortic ='';

  bool isHypoplas = false;
  bool isRVOTO = false;
  bool isAnatomyAbnormal = false;

  bool isLVOT =false;
  bool isSub =false;

  List<String> defectSelectedList = [];
  List<String> asdDefectSelectedList = [];
  List<String> vsdDefectSelectedList = [];
  List<String> morphologicSelectedList = [];
  List<String> rvotSelectedList = [];
  List<String> lvotLocationSelectedList = [];
  List<String> coronarySelectedList = [];

  @override
  void initState() {
    widget.formD5Model?.value.defectASD ?? false ? defectSelectedList.add('ASD') : null;
    widget.formD5Model?.value.defectVSD ?? false ? defectSelectedList.add('VSD') : null;
    widget.formD5Model?.value.defectPDA ?? false ? defectSelectedList.add('PDA') : null;
    widget.formD5Model?.value.defectAPW ?? false ? defectSelectedList.add('APW') : null;
    widget.formD5Model?.value.defectAVSD ?? false ? defectSelectedList.add('AVSD') : null;

    widget.formD5Model?.value.defectASDPrimium ?? false ? asdDefectSelectedList.add('Primum') : null;
    widget.formD5Model?.value.defectASDSecundum ?? false ? asdDefectSelectedList.add('Secundum') : null;
    widget.formD5Model?.value.defectASDSinusVenosus ?? false ? asdDefectSelectedList.add('Sinus Venosus') : null;
    widget.formD5Model?.value.defectASDOthers ?? false ? asdDefectSelectedList.add('Others') : null;

    widget.formD5Model?.value.defectVSDPerimembranous ?? false ? vsdDefectSelectedList.add('Perimembranous') : null;
    widget.formD5Model?.value.defectVSDOutlet ?? false ? vsdDefectSelectedList.add('Outlet') : null;
    widget.formD5Model?.value.defectVSDInlet ?? false ? vsdDefectSelectedList.add('Inlet') : null;
    widget.formD5Model?.value.defectVSDOthers ?? false ? vsdDefectSelectedList.add('Others') : null;
    widget.formD5Model?.value.defectVSDMuscular ?? false ? vsdDefectSelectedList.add('Muscular') : null;

    widget.formD5Model?.value.morphologicLA ?? false ? morphologicSelectedList.add('Morphologic LA') : null;
    widget.formD5Model?.value.morphologicLV ?? false ? morphologicSelectedList.add('Morphologic LV') : null;
    widget.formD5Model?.value.morphologicRA ?? false ? morphologicSelectedList.add('Morphologic RA') : null;
    widget.formD5Model?.value.morphologicRV ?? false ? morphologicSelectedList.add('Morphologic RV') : null;

    widget.formD5Model?.value.rVOTInfundibular ?? false ? rvotSelectedList.add('Infundibular') : null;
    widget.formD5Model?.value.rVOTValvar ?? false ? rvotSelectedList.add('Valvar') : null;
    widget.formD5Model?.value.rVOTDCRV   ?? false ? rvotSelectedList.add('DCRV') : null;

   widget.formD5Model?.value.locationValvular ?? false ? lvotLocationSelectedList.add('Valvular') : null;
   widget.formD5Model?.value.locationSubValvular ?? false ? lvotLocationSelectedList.add('Sub Valvular') : null;
   widget.formD5Model?.value.locationSupraValvular ?? false ? lvotLocationSelectedList.add('Supra Valvular') : null;

   widget.formD5Model?.value.anomalousOrigin ?? false ? coronarySelectedList.add('Anomalous origin') : null;
   widget.formD5Model?.value.anomalousCourse ?? false ? coronarySelectedList.add('Anomalous course') : null;

   setState(() {});
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MText(text: 'D8 CONGENITAL HEART DISEASE ECHO PAGE',),
        Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.situs, onChanged: (val){
          widget.formD5Model?.value.situs = val;
        },options:['Solitus','Inversus','Ambiguous'],title: 'D8.1 Situs',),
        MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.position, onChanged: (val){
          widget.formD5Model?.value.position = val;
        },options:['Dextrocardia','Levocardia','Mesocardia'],title: 'D8.2 Position',),
        MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.aVConnection,onChanged: (val){
          widget.formD5Model?.value.aVConnection = val;
        },options:List_items.AVConnection,title: 'D8.3 AV connection',),
        MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.vAConnection, onChanged: (val){
          widget.formD5Model?.value.vAConnection = val;
        },options:List_items.AVConnection,title: 'D8.4 VA connection',),
        MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.pulmonaryVenousConnections,onChanged: (val){
          widget.formD5Model?.value.pulmonaryVenousConnections = val;
        },options:['Normal','Partial anomalous','Total anomalous'],title: 'D8.5 Pulmonary venous connections',),
        MRowTextRadioWidget(enabled: widget.isEnabled, initialValue: widget.formD5Model?.value.systemicVenousConnections,onChanged: (val){
        //   if(val =='Abnormal'){
        //   setState(() {
        //     isAbnormal = true;
        //   });
        // }else{
        //   setState(() {
        //     isAbnormal = false;
        //   });
        // }
          widget.formD5Model?.value.systemicVenousConnections = val;
    },options:List_items.NormalAbnormal,title: 'D8.6 Systemic venous connections ',),
      widget.formD5Model?.value.systemicVenousConnections == 'Abnormal' ? MTextField(enabled: widget.isEnabled,initalValue: widget.formD5Model?.value.systemicVenousConnectionsAbnormal,onChanged: (val){
        widget.formD5Model?.value.systemicVenousConnectionsAbnormal = val;
      },label: 'If abnormal, specify',):Container(),
      MRowTextCheckBox(enabled: widget.isEnabled, selectedlist:defectSelectedList ,result: (val){setState(() {
        val.contains('ASD') ? {widget.formD5Model?.value.defectASD = true,
        // widget.formD5Model?.value.defectASD =true,
          // print(widget.formD5Model?.value.defectASD)
        } : widget.formD5Model?.value.defectASD = false;
        val.contains('VSD') ? widget.formD5Model?.value.defectVSD = true : widget.formD5Model?.value.defectVSD = false;
        val.contains('PDA') ? widget.formD5Model?.value.defectPDA = true : widget.formD5Model?.value.defectPDA  = false;
        val.contains('APW') ? widget.formD5Model?.value.defectAPW = true : widget.formD5Model?.value.defectAPW = false;
        val.contains('AVSD') ? widget.formD5Model?.value.defectAVSD = true : widget.formD5Model?.value.defectAVSD = false;
      });},list:['ASD','VSD','PDA','APW','AVSD'],title: 'D8.7 Defect',isneedDivider: false,),
      widget.formD5Model?.value.defectASD ?? false ?  Column(
          children: [
            // MRowTextCheckBox()
            MSmallText(text: 'ASD Details',),
            MrowTextTextFieldWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.defectASDSize.toString(),onChanged: (val){
              widget.formD5Model?.value.defectASDSize = int.tryParse(val);
            },title: 'Size(mm)',isneedDivider: false,type: MInputType.numeric,),
            MRowTextCheckBox(enabled: widget.isEnabled,selectedlist: asdDefectSelectedList,result: (val){
              val.contains('Secundum') ? widget.formD5Model?.value.defectASDSecundum = true : widget.formD5Model?.value.defectASDSecundum = false;
              val.contains('Primum') ? widget.formD5Model?.value.defectASDPrimium = true : widget.formD5Model?.value.defectASDPrimium = false;
              val.contains('Sinus Venosus') ? widget.formD5Model?.value.defectASDSinusVenosus = true : widget.formD5Model?.value.defectASDSinusVenosus = false;
              val.contains('Others') ? widget.formD5Model?.value.defectASDOthers = true : widget.formD5Model?.value.defectASDOthers = false;
              setState(() {});
            },list:['Secundum','Primum','Sinus Venosus','Others'],title: 'Location of the defect'),
          ],
        ): Container(),
      widget.formD5Model?.value.defectVSD ?? false ?  Column(
          children: [
            MSmallText(text: 'VSD Details',),
            MrowTextTextFieldWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.defectVSDSize.toString(),onChanged: (val){
              widget.formD5Model?.value.defectVSDSize = int.tryParse(val);
            },title: 'Size(mm)',isneedDivider: false,type: MInputType.numeric,),
            MRowTextCheckBox(enabled: widget.isEnabled,selectedlist: vsdDefectSelectedList,result: (val){
              val.contains('Perimembranous') ? widget.formD5Model?.value.defectVSDPerimembranous = true : widget.formD5Model?.value.defectVSDPerimembranous = false;
              val.contains('Outlet') ? widget.formD5Model?.value.defectVSDOutlet = true : widget.formD5Model?.value.defectVSDOutlet = false;
              val.contains('Inlet') ? widget.formD5Model?.value.defectVSDInlet = true : widget.formD5Model?.value.defectVSDInlet = false;
              val.contains('Muscular') ? widget.formD5Model?.value.defectVSDMuscular = true : widget.formD5Model?.value.defectVSDMuscular = false;
              val.contains('Others') ? widget.formD5Model?.value.defectVSDOthers = true : widget.formD5Model?.value.defectVSDOthers = false;
              setState(() {});
            },list:['Perimembranous','Outlet','Inlet','Muscular','Others'],title: 'Location of the defect'),
          ],
        ): Container(),
      widget.formD5Model?.value.defectPDA ?? false  ?  Column(
          children: [
            MSmallText(text: 'PDA Details',),
            MrowTextTextFieldWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.defectPDASize.toString(),onChanged: (val){
              widget.formD5Model?.value.defectPDASize = int.tryParse(val);
            },title: 'Size(mm)',type: MInputType.numeric,),
          ],
        ): Container(),
      widget.formD5Model?.value.defectAPW ?? false ?  Column(
          children: [
            MSmallText(text: 'APW Details',),
            MrowTextTextFieldWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.defectAPWSize.toString(),onChanged: (val){
              widget.formD5Model?.value.defectAPWSize = int.tryParse(val);
            },title: 'Size(mm)',type: MInputType.numeric,),
          ],
        ): Container(),
      widget.formD5Model?.value.defectAVSD ?? false ?  Column(
          children: [
            MSmallText(text: 'AVSD Details',),
            MrowTextTextFieldWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.defectAVSDSize.toString(),onChanged: (val){
              widget.formD5Model?.value.defectAVSDSize = int.tryParse(val);
            },title: 'Size(mm)',type: MInputType.numeric,),
          ],
        ): Container(),
        MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.chamberDescription, onChanged: (val){
          widget.formD5Model?.value.chamberDescription = val;
        },options:['Normal','Common Atria','Single Ventricle'],title: 'D8.8 Chamber Description: ',),
        MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.hypoplasticChambers,onChanged: (val){
          // val =='Yes'?isHypoplas =true:isHypoplas =false;
          widget.formD5Model?.value.hypoplasticChambers = val;
          setState(() {});
        },isneedDivider: false,title: 'D8.9 HypoPlastic Chamber:',),
      widget.formD5Model?.value.hypoplasticChambers == 'Yes'? MRowTextCheckBox(enabled: widget.isEnabled,selectedlist: morphologicSelectedList,list: List_items.HypoplasticChamber,result: (val){
        val.contains('Morphologic LA') ? widget.formD5Model?.value.morphologicLA = true : widget.formD5Model?.value.morphologicLA = false;
        val.contains('Morphologic LV') ? widget.formD5Model?.value.morphologicLV = true : widget.formD5Model?.value.morphologicLV = false;
        val.contains('Morphologic RA') ? widget.formD5Model?.value.morphologicRA = true : widget.formD5Model?.value.morphologicRA = false;
        val.contains('Morphologic RV') ? widget.formD5Model?.value.morphologicRV = true : widget.formD5Model?.value.morphologicRV = false;
        setState(() {});
      },isneedDivider: false,):Container(),
        MDivider(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'D8.10 RVOT',initialValue: widget.formD5Model?.value.rVOT,onChanged: (val){
          // if(val == 'RVOTO'){
          //   setState(() {
          //     isRVOTO = true;
          //   });
          // }else{
          //   setState(() {
          //     isRVOTO = false;
          //   });
          // }
          widget.formD5Model?.value.rVOT = val;
          setState(() {});
        },options: ['Normal','RVOTO'],isneedDivider: false,),
      widget.formD5Model?.value.rVOT == 'RVOTO'? MRowTextCheckBox(enabled: widget.isEnabled,selectedlist: rvotSelectedList,result: (val){
        val.contains('Infundibular') ? widget.formD5Model?.value.rVOTInfundibular = true : widget.formD5Model?.value.rVOTInfundibular = false;
        val.contains('Valvar') ? widget.formD5Model?.value.rVOTValvar = true : widget.formD5Model?.value.rVOTValvar = false;
        val.contains('DCRV') ? widget.formD5Model?.value.rVOTDCRV = true : widget.formD5Model?.value.rVOTDCRV = false;
        setState(() {});
      },list: ['Infundibular','Valvar','DCRV'],isneedDivider: false,): Container(),
        MDivider(),
        MRowTextRadioWidget(enabled: widget.isEnabled,title: 'D8.12 LVOT Obstruction:',initialValue: widget.formD5Model?.value.lVOTObstruction,onChanged: (val){
          // val=='Yes' ?isLVOT= true : isLVOT = false;
          widget.formD5Model?.value.lVOTObstruction = val;
          setState(() {});
        },),
      widget.formD5Model?.value.lVOTObstruction == 'Yes' ?MrowTextTextFieldWidget(enabled: widget.isEnabled,title: 'Peak Gradient(mm of Hg)',initialValue: widget.formD5Model?.value.lVOTObstructionPeakGradient.toString(),onChanged: (val){
        widget.formD5Model?.value.lVOTObstructionPeakGradient = int.parse(val);
      },isneedDivider: false,): Container(),
      widget.formD5Model?.value.lVOTObstruction == 'Yes' ?MrowTextTextFieldWidget(enabled: widget.isEnabled,title: 'Mean Gradient(mm of Hg)',initialValue: widget.formD5Model?.value.lVOTObstructionMeanGradient.toString(),onChanged: (val){
        widget.formD5Model?.value.lVOTObstructionMeanGradient = int.parse(val);
      },isneedDivider: false,):Container(),
      widget.formD5Model?.value.lVOTObstruction == 'Yes' ? MRowTextCheckBox(enabled: widget.isEnabled,selectedlist: lvotLocationSelectedList,title: 'Location',result: (val){
        val.contains('Valvular') ? widget.formD5Model?.value.locationValvular = true : widget.formD5Model?.value.locationValvular = false;
        val.contains('Supra Valvular') ? widget.formD5Model?.value.locationSupraValvular = true : widget.formD5Model?.value.locationSupraValvular = false;
        val.contains('Sub Valvular')  ? widget.formD5Model?.value.locationSubValvular = true : widget.formD5Model?.value.locationSubValvular = false;
        setState(() {});
        // val.contains('Sub Valvular')  ? isSub = true: isSub = false;
      },isneedDivider: false,list: ['Valvular','Supra Valvular','Sub Valvular'],): Container(),
      widget.formD5Model?.value.locationSubValvular ?? false ?MRowTextRadioWidget(enabled: widget.isEnabled,options: ['Fixed','Dynamic'],initialValue: widget.formD5Model?.value.locationSubValvularSpecify,onChanged: (val){
        widget.formD5Model?.value.locationSubValvularSpecify = val;
      },): Container(),
        MSmallText(text: 'D8.13 Valve morphology',),
        Space(),
        MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.vMMitralValve,onChanged: (val){setState(() {
          // Mitral = val;
          widget.formD5Model?.value.vMMitralValve = val;
        });},options:['Normal' ,'Parachute MV','Supra valvular fibrous ring','Others'],title: 'Mitral Valve',isneedDivider:false,),
       (widget.formD5Model?.value.vMMitralValve =='Others') ? MTextField(enabled: widget.isEnabled,initalValue: widget.formD5Model?.value.vMMitralValveOthers,onChanged: (val){
         widget.formD5Model?.value.vMMitralValveOthers = val;
       },label: 'others specify',):Container(),
        MDivider(),
        MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.vMTricuspidValve,onChanged: (val){setState(() {
          // Tricuspid = val;
          widget.formD5Model?.value.vMTricuspidValve = val;
        });},options:['Normal' ,'Ebstein','Atresia','Others'],title: 'Tricuspid Valve',isneedDivider:false,),
        (widget.formD5Model?.value.vMTricuspidValve =='Others') ? MTextField(onChanged: (val){
          widget.formD5Model?.value.vMTricuspidValveOthers = val;
        },initalValue: widget.formD5Model?.value.vMTricuspidValveOthers,label: 'others specify',):Container(),
         MDivider(),

        MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.vMPulmonaryValve, onChanged: (val){setState(() {
          // Pulmonary = val;
          widget.formD5Model?.value.vMPulmonaryValve = val;
        });},options:['Normal' ,'Hypoplasia','Atresia','Dooming','Absent','Others'],title: 'Pulmonary Valve',isneedDivider:false,),
        (widget.formD5Model?.value.vMPulmonaryValve =='Others') ? MTextField(enabled: widget.isEnabled,initalValue: widget.formD5Model?.value.vMPulmonaryValveOthers,onChanged: (val){
          widget.formD5Model?.value.vMPulmonaryValveOthers = val;
        },label: 'others specify',):Container(),
        MDivider(),

        MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.vMAorticValve,onChanged: (val){setState(() {
          // Aortic = val;
          widget.formD5Model?.value.vMAorticValve = val;
        });},options:['Normal' ,'Unicuspid','Bicuspid','Quadricuspid','Others'],title: 'Aortic Valve',isneedDivider:false,),
        (widget.formD5Model?.value.vMAorticValve =='Others') ? MTextField(enabled: widget.isEnabled,initalValue: widget.formD5Model?.value.vMAorticValveOthers,onChanged: (val){
          widget.formD5Model?.value.vMAorticValveOthers = val;
        },label: 'others specify',):Container(),
       MDivider(),

      MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.aorticRoot,onChanged: (val){
        widget.formD5Model?.value.aorticRoot = val;
      },options:['Normal','Dilated','Hypoplastic'],title: 'D8.14 Aortic root',),
      MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.aorticArch,onChanged: (val){
        widget.formD5Model?.value.aorticArch = val;
      },options:['Normal','Left sided','Right sided','Double'],title: 'D8.15 Aortic arch',),
      MRowTextRadioWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.coarctation,onChanged: (val){
      //   if(val =='Yes'){setState(() {
      //   isCoarctation = true;
      // });}else{
      //   setState(() {
      //     isCoarctation = false;
      //   });
      // }
        widget.formD5Model?.value.coarctation = val;
        },title: 'D8.16 Coarctation',isneedDivider: false),
        MDivider(),
      widget.formD5Model?.value.coarctation == 'Yes'? MrowTextTextFieldWidget(enabled: widget.isEnabled,initialValue: widget.formD5Model?.value.coarctationPeakGradient.toString(),onChanged: (val){
        widget.formD5Model?.value.coarctationPeakGradient = int.parse(val);
      },title: 'Peak Gradient (mmHg)'): Container(),
      MRowTextRadioWidget(enabled: widget.isEnabled,title: 'D8.17 Coronary anatomy',initialValue: widget.formD5Model?.value.coronaryAnatomy,options: List_items.NormalAbnormal,isneedDivider: false,onChanged: (val){
        // val =='Abnormal' ? isAnatomyAbnormal = true : isAnatomyAbnormal =false;
        widget.formD5Model?.value.coronaryAnatomy = val;
        setState(() {});
      },),
      widget.formD5Model?.value.coronaryAnatomy == 'Abnormal'? MRowTextCheckBox(enabled: widget.isEnabled,selectedlist: coronarySelectedList,result: (val){
        val.contains('Anomalous origin') ? widget.formD5Model?.value.anomalousOrigin = true : widget.formD5Model?.value.anomalousOrigin = false;
        val.contains('Anomalous course') ? widget.formD5Model?.value.anomalousCourse = true : widget.formD5Model?.value.anomalousCourse = false;
        setState(() {});
      },list: ['Anomalous origin','Anomalous course'],): Container(),
      widget.formD5Model?.value.coronaryAnatomy == 'Abnormal'? MTextField(enabled: widget.isEnabled,label: 'Details:',initalValue: widget.formD5Model?.value.coronaryAnatomyDetails,onChanged: (val){
        widget.formD5Model?.value.coronaryAnatomyDetails = val;
      },): Container(),
      MrowTextTextFieldWidget(enabled: widget.isEnabled,title: 'D8.18 Other relevant echo findings:',initialValue: widget.formD5Model?.value.otherRelevantEchoFindings,onChanged: (val){
        widget.formD5Model?.value.otherRelevantEchoFindings = val;
      }, ),
        //MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormD6);}),
      ],);
  }
}
