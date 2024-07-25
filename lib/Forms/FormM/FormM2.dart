import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormL/widget/ValueFunction.dart';
import 'package:npac/Forms/FormM/Model/FormMModel.dart';
import 'package:npac/app/export.dart';

class FormM2 extends StatefulWidget {
  final bool? enabled;
  final Rx<FormMModel>? formMData;
  final Rx<EchoAssignmentModel>? EchoAssignmentData;
  const FormM2({super.key, this.enabled, this.formMData, this.EchoAssignmentData});

  @override
  State<FormM2> createState() => _FormM2State();
}

class _FormM2State extends State<FormM2> {
  bool isWallAbnormal = false;
  bool isRVAbnormal = false;
  bool isOthers = false;
  bool isHospitalisations = false;
  bool isOther = false;
  bool isfollowup = false;

  bool isYes = false;
  bool hasHD = false;
  bool isAssignment = false;

  bool isGlobal=false;
  bool isRegional = false;
  List<String> GRSelectedList = [];
  RxList<String> MitralSelectedList = <String>[].obs;
  RxList<String> AorticSelectedList = <String>[].obs;
  List<String> TricuspidSelectedList = <String>[].obs;
  List<String> PulmonarySelectedList = <String>[].obs;
  List<String> PericardialOtherSelectedList = <String>[].obs;
  List<String> HypoSelectedList = <String>[].obs;


  @override
  void initState() {
    super.initState();
  }

  void getData() async{
    widget.EchoAssignmentData?.value.wallMotionHypoGlobal ?? false ? GRSelectedList.add('Global') : null ;
    widget.EchoAssignmentData?.value.wallMotionHypoRegional ?? false ? GRSelectedList.add('Regional') : null ;
    widget.EchoAssignmentData?.value.wallMotion == 'Abnormal' ? isWallAbnormal = true :null;
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        // MText(text: 'M8 ECHOCARDIOGRAPHIC ASSESSMENT',),
        // Space(),
        // MSmallText(text: 'Ventricular function ',),
        // Space(),
        // MRowTextRadioWidget(title: 'Wall Motion', options: List_items.NormalAbnormal,isneedDivider: false,onChanged: (val){
        //   if(val == 'Abnormal'){
        //     setState(() {
        //       isWallAbnormal = true;
        //     });
        //   }else{
        //     setState(() {
        //       isWallAbnormal = false;
        //     });
        //   }
        // },),
        // isWallAbnormal?MRowTextCheckBox(list: ['Hypo / akinesia','Global','Regional'],): Container(),
        // MDivider(),
      // MSmallText(text: 'M3 ECHOCARDIOGRAPHIC ASSESSMENT',),
      MSmallText(text: 'M3 ECHOCARDIOGRAPHIC ASSESSMENT',),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'Any significant change from previous echo',initialValue: widget.formMData?.value.significantChanges,onChanged: (val){
        val =='Yes' ? isAssignment = true : isAssignment = false;
        widget.formMData?.value.significantChanges = val;
        setState(() {});
      },isneedDivider: false,),
      Space(),
      widget.formMData?.value.significantChanges =='Yes' ? Column(children: [
        MSmallText(text: 'Ventricular function ',),
        Space(),
        MRowTextRadioWidget(enabled: widget.enabled,title: 'Wall Motion',initialValue: widget.EchoAssignmentData?.value.wallMotion, options: ['Normal','Hypokinesia','Akinesia'],isneedDivider: false,onChanged: (val){
          if(val != 'Normal'){
            setState(() {
              isWallAbnormal = true;
            });
          }else{
            setState(() {
              isWallAbnormal = false;
            });
          }
          widget.EchoAssignmentData?.value.wallMotion = val;
        },),
        isWallAbnormal?MRowTextCheckBox(enabled: widget.enabled,selectedlist: GRSelectedList,result: (val){
          val.contains('Global') ? widget.EchoAssignmentData?.value.wallMotionHypoGlobal = true : widget.EchoAssignmentData?.value.wallMotionHypoGlobal = false;
          val.contains('Regional') ? widget.EchoAssignmentData?.value.wallMotionHypoRegional = true : widget.EchoAssignmentData?.value.wallMotionHypoRegional = false;
          setState(() {});
        },list: ['Global','Regional'],): Container(),
        MDivider(),
        MSmallText(text: 'LV systolic function',),
        Space(),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'LVID Diastole(mm): ',initialValue: widget.EchoAssignmentData?.value.lVIDDiastole,onChanged: (val){
          widget.EchoAssignmentData?.value.lVIDDiastole = val;
        },type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'LVID Systole(mm) ',initialValue: widget.EchoAssignmentData?.value.lVIDSystole,onChanged: (val){
          widget.EchoAssignmentData?.value.lVIDSystole = val;
        },type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'EF% : ',initialValue: widget.EchoAssignmentData?.value.lVEfPercent,onChanged: (val){
          widget.EchoAssignmentData?.value.lVEfPercent = val;
        },type: MInputType.numeric,),
        MSmallText(text: 'Pulmonary pressures',),
        Space(),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'Tricuspid regurgitation TRPG (mmHg):',initialValue: '${widget.EchoAssignmentData?.value.trpg}',onChanged: (val){
          widget.EchoAssignmentData?.value.trpg = int.tryParse(val);
        },type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'Pulmonary regurgitation Peak PR (mmHg):',initialValue: '${widget.EchoAssignmentData?.value.peakPr}',onChanged: (val){
          widget.EchoAssignmentData?.value.peakPr = int.tryParse(val);
        },type: MInputType.numeric,),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'PAT(ms)',initialValue: '${widget.EchoAssignmentData?.value.pat}',onChanged: (val){
          widget.EchoAssignmentData?.value.pat = int.tryParse(val);
        },type: MInputType.numeric,),

        MRowTextRadioWidget(enabled: widget.enabled,title: 'RV systolic function ',initialValue: widget.EchoAssignmentData?.value.rvNormalAbnormal,onChanged: (val){
          widget.EchoAssignmentData?.value.rvNormalAbnormal= val;
        },options: List_items.NormalAbnormal,isneedDivider: false,),
        isRVAbnormal? MTextField(enabled: widget.enabled,label: 'TAPSE (mm)',initalValue: '${widget.EchoAssignmentData?.value.rvTapse}',onChanged: (val){
          widget.EchoAssignmentData?.value.rvTapse = val;
        },): Container(),
        isRVAbnormal? MTextField(enabled: widget.enabled,label: 'RV S’ (cm/sec)',initalValue:  '${widget.EchoAssignmentData?.value.rvRvs}',onChanged: (val){
          widget.EchoAssignmentData?.value.rvRvs = val;
        },): Container(),
        MDivider(),
        Space(),

        MText(text: 'Valve function',),
        Space(),
        ValueFunction(
          key: Key('Mitral ${MitralSelectedList}'),
          enabled:widget.enabled,
          title: 'Mitral',
          maininitialValue: widget.EchoAssignmentData?.value.mitral,
          isMVOA: true,
          radioInitialValue: widget.EchoAssignmentData?.value.mitralFunction
          ,MGInitialValue: '${widget.EchoAssignmentData?.value.mitralMVGradientMean}',
          PGInitialValue: '${widget.EchoAssignmentData?.value.mitralMVGradientPeak}',
          StenoticInitialValue: widget.EchoAssignmentData?.value.mitralStenoticValue
          ,regurgitantInitialValue: widget.EchoAssignmentData?.value.mitralRegurgitantValue
          ,selectedlist: MitralSelectedList,
          checkboxValue: (val){
            widget.EchoAssignmentData?.value.mitralStenotic = val;
            setState(() {
            });
          },checkboxValueRegurgitant: (val){
          widget.EchoAssignmentData?.value.mitralRegurgitant = val;
          setState(() {
          });
        },MG: (val){
          widget.EchoAssignmentData?.value.mitralMVGradientMean = int.tryParse(val);
          setState(() {
          });
        },PG: (val){
          widget.EchoAssignmentData?.value.mitralMVGradientPeak = int.tryParse(val);
          setState(() {
          });
        },mainValue: (val){
          widget.EchoAssignmentData?.value.mitral = val;
          setState(() {
          });
        },StenoticradioOnchange: (val){
          widget.EchoAssignmentData?.value.mitralStenoticValue = val;
          setState(() {
          });
        },RegurgitantradioOnchange: (val){
          widget.EchoAssignmentData?.value.mitralRegurgitantValue = val;
          setState(() {
          });
        },radioValue: (val){
          widget.EchoAssignmentData?.value.mitralFunction = val;
          setState(() {
          });
        },MVOA: (val){
          widget.EchoAssignmentData?.value.mitralMVGradientMean = int.tryParse(val);
          setState(() {
          });
        },
        ) ,

        Obx(()=> ValueFunction(key: Key('Aortic ${AorticSelectedList}'),enabled:widget.enabled,title: 'Aortic',radioInitialValue: widget.EchoAssignmentData?.value.aorticFunction
          ,MGInitialValue: '${widget.EchoAssignmentData?.value.aorticStenosisGradientMean}',
          PGInitialValue: '${widget.EchoAssignmentData?.value.aorticStenosisGradientPeak}',
          StenoticInitialValue: widget.EchoAssignmentData?.value.aorticStenoticValue
          ,regurgitantInitialValue: widget.EchoAssignmentData?.value.aorticRegurgitantValue
          ,selectedlist: AorticSelectedList,
          maininitialValue: widget.EchoAssignmentData?.value.aortic,
          isMVOA: false,
          mainValue: (val){
            widget.EchoAssignmentData?.value.aortic = val;
            setState(() {
            });
          },
          checkboxValue: (val){
            widget.EchoAssignmentData?.value.aorticStenotic = val;
            print('Aortic ${AorticSelectedList}');
            setState(() {
            });
          },checkboxValueRegurgitant: (val){
            widget.EchoAssignmentData?.value.aorticRegurgitant = val;
            setState(() {
            });
          },MG: (val){
            widget.EchoAssignmentData?.value.aorticStenosisGradientMean = int.tryParse(val);
            setState(() {
            });
          },PG: (val){
            widget.EchoAssignmentData?.value.aorticStenosisGradientPeak = int.tryParse(val);
            setState(() {
            });
          },RegurgitantradioOnchange: (val){
            widget.EchoAssignmentData?.value.aorticRegurgitantValue = val;
            setState(() {
            });
          },StenoticradioOnchange: (val){
            widget.EchoAssignmentData?.value.aorticStenoticValue = val;
            setState(() {
            });
          },radioValue: (val){
            widget.EchoAssignmentData?.value.aorticFunction = val;
            setState(() {
            });
          },),
        ),
        ValueFunction(key: Key('Tricuspid ${TricuspidSelectedList}'),enabled:widget.enabled,title: 'Tricuspid',
          radioInitialValue: widget.EchoAssignmentData?.value.tricuspidFunction
          ,MGInitialValue: '${widget.EchoAssignmentData?.value.tricuspidGradientMean}',
          PGInitialValue: '${widget.EchoAssignmentData?.value.tricuspidGradientPeak}',
          StenoticInitialValue: widget.EchoAssignmentData?.value.tricuspidStenoticValue
          ,regurgitantInitialValue: widget.EchoAssignmentData?.value.tricuspidRegurgitantValue
          ,selectedlist: TricuspidSelectedList,
          maininitialValue: widget.EchoAssignmentData?.value.tricuspid,
          mainValue: (val){
            widget.EchoAssignmentData?.value.tricuspid = val;
            setState(() {
            });
          },isMVOA:  false,
          checkboxValue: (val){
            widget.EchoAssignmentData?.value.tricuspidStenotic = val;
            setState(() {
            });
          },checkboxValueRegurgitant: (val){
            widget.EchoAssignmentData?.value.tricuspidRegurgitant = val;
            setState(() {
            });
          },MG: (val){
            widget.EchoAssignmentData?.value.tricuspidGradientMean = int.tryParse(val);
            setState(() {
            });
          },PG: (val){
            widget.EchoAssignmentData?.value.tricuspidGradientPeak = int.tryParse(val);
            setState(() {
            });
          },RegurgitantradioOnchange: (val){
            widget.EchoAssignmentData?.value.tricuspidRegurgitantValue = val;
            setState(() {
            });
          },StenoticradioOnchange: (val){
            widget.EchoAssignmentData?.value.tricuspidStenoticValue = val;
            setState(() {
            });
          },radioValue: (val){
            widget.EchoAssignmentData?.value.tricuspidFunction = val;
            setState(() {
            });
          },),
        ValueFunction(key: Key('Pulmonary ${PulmonarySelectedList}'),enabled:widget.enabled,title: 'Pulmonary',
          radioInitialValue: widget.EchoAssignmentData?.value.pulmonaryFunction,
          MGInitialValue: widget.EchoAssignmentData?.value.rvotObstructionGradientMean.toString(),
          PGInitialValue: widget.EchoAssignmentData?.value.rvotObstructionGradientPeak.toString(),
          StenoticInitialValue: widget.EchoAssignmentData?.value.pulmonaryStenoticValue
          ,regurgitantInitialValue: widget.EchoAssignmentData?.value.pulmonaryRegurgitantValue
          ,selectedlist: PulmonarySelectedList,
          maininitialValue: widget.EchoAssignmentData?.value.pulmonary,
          mainValue: (val){
            widget.EchoAssignmentData?.value.pulmonary = val;
            setState(() {
            });
          },
          checkboxValue: (val){
            widget.EchoAssignmentData?.value.pulmonaryStenotic = val;
            setState(() {
            });
          },checkboxValueRegurgitant: (val){
            widget.EchoAssignmentData?.value.pulmonaryRegurgitant = val;
            setState(() {
            });
          },MG: (val){
            widget.EchoAssignmentData?.value.rvotObstructionGradientMean = int.tryParse(val);
            setState(() {
            });
          },PG: (val){
            widget.EchoAssignmentData?.value.rvotObstructionGradientPeak =int.tryParse(val) ;
            setState(() {
            });
          },RegurgitantradioOnchange: (val){
            widget.EchoAssignmentData?.value.pulmonaryRegurgitantValue = val;
            setState(() {
            });
          },StenoticradioOnchange: (val){
            widget.EchoAssignmentData?.value.pulmonaryStenoticValue = val;
            setState(() {
            });
          },radioValue: (val){
            widget.EchoAssignmentData?.value.pulmonaryFunction = val;
            setState(() {
            });
          },),
        MRowTextRadioWidget(enabled: widget.enabled,title: 'Pericardial effusion ',initialValue: widget.EchoAssignmentData?.value.pericardialEffusion,onChanged: (val){
          widget.EchoAssignmentData?.value.pericardialEffusion = val;
          },options: ['Mild','Moderate','Massive','Tamponade','Others'],isneedDivider: false,),
        isOthers? MRowTextCheckBox(enabled: widget.enabled,title: 'Others',list: ['Vegetation','Thrombus'],isneedDivider: false,): Container(),
        MDivider(),

        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'Other salient echo details (if any):',onChanged: (val){},),

      ],): Container(),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'M4 Hospitalisations after discharge:',onChanged: (val){},),
      isHospitalisations ? MTextField(enabled: widget.enabled,label: 'If Yes, Reason',onChanged: (val){},): Container(),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'M5 Mode of Contraception used: ',onChanged: (val){
        if(val == 'Others'){
          setState(() {
            isOther = true;
          });
        }else{
          setState(() {
            isOther = true;
          });
        }
      },options: ['Nil','IUCD','OCP','Barrier method','Tubectomy','Others'],),
      isOther ? MTextField(enabled: widget.enabled,label: 'If Others, Specify:',onChanged: (val){},): Container(),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'M6 Follow up in Cardiology:',onChanged: (val){
        val =='Yes' ? isfollowup = true : isfollowup = false;
        setState(() {});
      },),
      isfollowup ?MRowTextRadioWidget(enabled: widget.enabled,title: 'Specific treatment plans: :',onChanged: (val){},): Container(),
      // MrowTextTextFieldWidget(title: 'M4 On Medications: (Kindly mention the drugs in the space provided below)',onChanged: (val){},),
      MSmallText(text: 'M7 NEONATAL OUTCOME',),
      // Space(),
      MrowTextTextFieldWidget(enabled: widget.enabled,title: 'M7.1 Neonatal weight (kg):',onChanged: (val){},),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'M7.2 Neonatal Echocardiography',options: ['Available','Not Available'],onChanged: (val){
        if(val == 'Available'){
          setState(() {
            isYes = true;
          });
        }else{
          setState(() {
            isYes = false;
          });
        }
      }, isneedDivider: false,),
      isYes ? MRowTextRadioWidget(enabled: widget.enabled,title: 'If Yes',onChanged: (val){
        val == 'Congestive Heart Failure' ? hasHD = true : hasHD = false;
        setState(() {});
      }, options: ['Normal','Congestive Heart Failure'],isneedDivider: false,): Container(),
      isYes && hasHD ? MTextField(enabled: widget.enabled,label:'If Congestive Heart Failure, specify',onChanged: (val){},): Container(),
      MDivider(),
      MRowTextRadioWidget(enabled: widget.enabled,title: 'M7.3 Adverse neonatal outcome: ',options: ['Neonatal death','Cardiac lesion','Nil'], onChanged: (val){},),
        MrowTextTextFieldWidget(enabled: widget.enabled,title: 'M8. Any other comments:',onChanged: (val){},),
      ],);
  }
}
