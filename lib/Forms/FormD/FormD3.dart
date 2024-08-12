import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Forms/FormD/FormD4.dart';
import 'package:npac/Forms/FormD/FormD6.dart';
import 'package:npac/Forms/FormD/FormD7.dart';
import 'package:npac/Forms/FormD/Model/FormD4Model.dart';
// import 'package:npac/Forms/FormD/widget/valueFunctioin.dart';
import 'package:npac/Forms/FormL/FormL1.dart';
import 'package:npac/Forms/FormL/widget/ValueFunction.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MSmallText.dart';

class FormD3 extends StatefulWidget {
  final bool? enabled;
  final Rx<FormD4Model>? formD4Model;
  final Function(bool)? isMitralProsthetic;
  final Function(bool)? isAorticProsthetic;
  final Function(bool)? isTricuspidProsthetic;
  final Function(bool)? isPulmonaryProsthetic;
  final Function(bool)? isAortaAbnormal;
  const FormD3({super.key, this.enabled, this.isMitralProsthetic, this.isAorticProsthetic, this.isTricuspidProsthetic, this.isPulmonaryProsthetic, this.isAortaAbnormal, this.formD4Model});

  @override
  State<FormD3> createState() => _FormD3State();
}

class _FormD3State extends State<FormD3> {


  bool isOthers = false;
  bool isEffusion = false;
  bool isMitralStenotic = false;
  bool isMitralRegurgitant = false;
  bool isValueFunctionNormal = true;
  bool isNative = false;
  bool isabnormal = false;

  bool isMitralProsthetic = false;
  bool isAorticProsthetic = false;
  bool isTricuspidProsthetic = false;
  bool isPulmonaryProsthetic = false;
  bool isAortaAbnormal = false;

  RxList<String> MitralSelectedList = <String>[].obs;
  RxList<String> AorticSelectedList = <String>[].obs;
  List<String> TricuspidSelectedList = <String>[].obs;
  List<String> PulmonarySelectedList = <String>[].obs;
  List<String> otherSelectedList = <String>[].obs;

   @override
  void initState() {
     getData();
    super.initState();
  }
  void getData(){
    widget.formD4Model?.value.mitralStenotic ?? false  ? MitralSelectedList.add('Stenotic') :null;
    widget.formD4Model?.value.aorticStenotic ?? false  ? AorticSelectedList.add('Stenotic') :null;
    widget.formD4Model?.value.tricuspidStenotic ?? false  ? TricuspidSelectedList.add('Stenotic') :null;
    widget.formD4Model?.value.pulmonaryStenotic ?? false  ? PulmonarySelectedList.add('Stenotic') :null;
    widget.formD4Model?.value.mitralRegurgitant ?? false  ? MitralSelectedList.add('Regurgitant') :null;
    widget.formD4Model?.value.aorticRegurgitant ?? false  ? AorticSelectedList.add('Regurgitant') :null;
    widget.formD4Model?.value.tricuspidRegurgitant ?? false  ? TricuspidSelectedList.add('Regurgitant') :null;
    widget.formD4Model?.value.pulmonaryRegurgitant ?? false  ? PulmonarySelectedList.add('Regurgitant') :null;
    widget.formD4Model?.value.othersVegetation ?? false  ? otherSelectedList.add('Vegetation') :null;
    widget.formD4Model?.value.othersThrombusClot ?? false  ? otherSelectedList.add('Thrombus /clot') :null;
    widget.formD4Model?.value.othersMass ?? false  ? otherSelectedList.add('Mass') :null;

  }

  @override
  Widget build(BuildContext context) {
     print(widget.formD4Model?.value.echocardiographicAssessment);
     print(widget.formD4Model?.value.morphologicalLA);
    return Column(
      children: [
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
            widget.formD4Model?.value.echocardiographicAssessment = val;
          },initialValue: widget.formD4Model?.value.echocardiographicAssessment,options: List_items.NormalAbnormal,title: 'D6 ECHOCARDIOGRAPHIC ASSESSMENT',),
          MSmallText(text: 'D6.1 Chamber description'),
          Space(),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
            widget.formD4Model?.value.morphologicalLA = val;
          },initialValue: widget.formD4Model?.value.morphologicalLA,title: 'LA',options:List_items.NormalDilated,isneedDivider: false,),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
            widget.formD4Model?.value.morphologicalRA = val;
          },title: 'RA',initialValue: widget.formD4Model?.value.morphologicalRA,options:List_items.NormalDilated,isneedDivider: false,),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
            widget.formD4Model?.value.morphologicalLV = val;
          },title: 'LV',initialValue: widget.formD4Model?.value.morphologicalLV,options:List_items.NormalDilatedHypertrophic,isneedDivider: false,),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
            widget.formD4Model?.value.morphologicalRV = val;
          },title: 'RV',initialValue: widget.formD4Model?.value.morphologicalRV,options:List_items.NormalDilatedHypertrophic,isneedDivider: false,),
          MDivider(),
          MSmallText(text: 'D6.2 Ventricular function',),
        Space(),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
            widget.formD4Model?.value.wallMotion = val;
          },title: 'LV wall motion',initialValue: widget.formD4Model?.value.wallMotion,options: ['Normal','Global Hypokinesia','RWMA'],),
          MSmallText(text: 'LV systolic function',),
          Space(),
        MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
          widget.formD4Model?.value.lVSYSFunction = val;
        },initialValue: widget.formD4Model?.value.lVSYSFunction,options: ['Normal','Reduced'],title: '',isneedDivider: false,),
        MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){
          widget.formD4Model?.value.lVSYSFunction = val;
        },title: 'Systole (mm): ',initialValue: widget.formD4Model?.value.lVSYSFunction,isneedDivider: false,type: MInputType.numeric,),
          MrowTextTextFieldWidget( enabled: widget.enabled,onChanged: (val){
            widget.formD4Model?.value.lVSYSDiastoleMm = int.tryParse(val);
          },title: 'Diastole(mm):',initialValue: widget.formD4Model?.value.lVSYSDiastoleMm.toString(),isneedDivider: false,type: MInputType.numeric,),
          MrowTextTextFieldWidget( enabled: widget.enabled,onChanged: (val){
            widget.formD4Model?.value.lVSYSEF = val;
          },title: 'EF (%):' ,initialValue: widget.formD4Model?.value.lVSYSEF,type: MInputType.numeric,),
          MSmallText(text: 'RV systolic function',),
          Space(),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
            widget.formD4Model?.value.rVSYS = val;
          },initialValue: widget.formD4Model?.value.rVSYS,options:['Normal','Reduced'],title: '',isneedDivider: false,),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){
            widget.formD4Model?.value.rVSYSTAPSEMm = int.tryParse(val);
          },title: 'TAPSE (mm)',initialValue: widget.formD4Model?.value.rVSYSTAPSEMm.toString(),type: MInputType.numeric,isneedDivider: false,),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){
            widget.formD4Model?.value.rVSYSRVs = int.tryParse(val);
          },initialValue: widget.formD4Model?.value.rVSYSRVs.toString(),title: 'RV S (cm/sec)',type: MInputType.numeric,isneedDivider: false,),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){
            widget.formD4Model?.value.rVSYSRVFAC = int.tryParse(val);
          },title: 'RV FAC (%)',initialValue: widget.formD4Model?.value.rVSYSRVFAC.toString(),type: MInputType.numeric,),
          Space(),
          MRowTextRadioWidget(enabled: widget.enabled,title: 'D6.3 Valve: Morphology and Function',initialValue: widget.formD4Model?.value.valvularMorphology,isneedDivider: false,onChanged: (val){
            widget.formD4Model?.value.valvularMorphology = val;
            setState(() {
              val == 'Normal' ? isValueFunctionNormal = true : isValueFunctionNormal = false;
            });
          },options: List_items.NormalAbnormal,),

        !(widget.formD4Model?.value.valvularMorphology== 'Normal') ?Column(children: [

          ValueFunction(
            key: Key('Mitral ${MitralSelectedList}'),
            enabled:widget.enabled,
            title: 'Mitral',
            maininitialValue: widget.formD4Model?.value.mitral,
            isMVOA: true,
            radioInitialValue: widget.formD4Model?.value.mitralFunction
            ,MGInitialValue: '${widget.formD4Model?.value.mitralMVGradientMean}',
            PGInitialValue: '${widget.formD4Model?.value.mitralMVGradientPeak}',
            StenoticInitialValue: widget.formD4Model?.value.mitralStenoticValue
            ,regurgitantInitialValue: widget.formD4Model?.value.mitralRegurgitantValue
            ,selectedlist: MitralSelectedList,
            checkboxValue: (val){
              widget.formD4Model?.value.mitralStenotic = val;
              setState(() {
              });
            },checkboxValueRegurgitant: (val){
            widget.formD4Model?.value.mitralRegurgitant = val;
            setState(() {
            });
          },MG: (val){
            widget.formD4Model?.value.mitralMVGradientMean = int.tryParse(val);
            setState(() {
            });
          },PG: (val){
            widget.formD4Model?.value.mitralMVGradientPeak = int.tryParse(val);
            setState(() {
            });
          },mainValue: (val){
            widget.formD4Model?.value.mitral = val;
            widget.isMitralProsthetic?.call(isMitralProsthetic);
            setState(() {
            });
          },StenoticradioOnchange: (val){
            widget.formD4Model?.value.mitralStenoticValue = val;
            setState(() {
            });
          },RegurgitantradioOnchange: (val){
            widget.formD4Model?.value.mitralRegurgitantValue = val;
            setState(() {
            });
          },radioValue: (val){
            widget.formD4Model?.value.mitralFunction = val;
            setState(() {
            });
          },MVOA: (val){
            widget.formD4Model?.value.mitralMVGradientMean = int.tryParse(val);
            setState(() {
            });
          },
          ) ,

          Obx(()=> ValueFunction(key: Key('Aortic ${AorticSelectedList}'),enabled:widget.enabled,title: 'Aortic',radioInitialValue: widget.formD4Model?.value.aorticFunction
            ,MGInitialValue: '${widget.formD4Model?.value.aorticGradientMean}',
            PGInitialValue: '${widget.formD4Model?.value.aorticGradientPeak}',
            StenoticInitialValue: widget.formD4Model?.value.aorticStenoticValue
            ,regurgitantInitialValue: widget.formD4Model?.value.aorticRegurgitantValue
            ,selectedlist: AorticSelectedList,
            maininitialValue: widget.formD4Model?.value.aortic,
            isMVOA: false,
            mainValue: (val){
              widget.formD4Model?.value.aortic = val;
              widget.isAorticProsthetic?.call(isAorticProsthetic);
              setState(() {
              });
            },
            checkboxValue: (val){
              widget.formD4Model?.value.aorticStenotic = val;
              print('Aortic ${AorticSelectedList}');
              setState(() {
              });
            },checkboxValueRegurgitant: (val){
              widget.formD4Model?.value.aorticRegurgitant = val;
              setState(() {
              });
            },MG: (val){
              widget.formD4Model?.value.aorticGradientMean = int.tryParse(val);
              setState(() {
              });
            },PG: (val){
              widget.formD4Model?.value.aorticGradientPeak = int.tryParse(val);
              setState(() {
              });
            },RegurgitantradioOnchange: (val){
              widget.formD4Model?.value.aorticRegurgitantValue = val;
              setState(() {
              });
            },StenoticradioOnchange: (val){
              widget.formD4Model?.value.aorticStenoticValue = val;
              setState(() {
              });
            },radioValue: (val){
              widget.formD4Model?.value.aorticFunction = val;
              setState(() {
              });
            },),
          ),
          ValueFunction(key: Key('Tricuspid ${TricuspidSelectedList}'),enabled:widget.enabled,title: 'Tricuspid',
            radioInitialValue: widget.formD4Model?.value.tricuspidFunction
            ,MGInitialValue: '${widget.formD4Model?.value.tricuspidGradientMean}',
            PGInitialValue: '${widget.formD4Model?.value.tricuspidGradientPeak}',
            StenoticInitialValue: widget.formD4Model?.value.tricuspidStenoticValue
            ,regurgitantInitialValue: widget.formD4Model?.value.tricuspidRegurgitantValue
            ,selectedlist: TricuspidSelectedList,
            maininitialValue: widget.formD4Model?.value.tricuspid,
            mainValue: (val){
              widget.formD4Model?.value.tricuspid = val;
              widget.isTricuspidProsthetic?.call(isTricuspidProsthetic);
              setState(() {
              });
            },isMVOA:  false,
            checkboxValue: (val){
              widget.formD4Model?.value.tricuspidStenotic = val;
              setState(() {
              });
            },checkboxValueRegurgitant: (val){
              widget.formD4Model?.value.tricuspidRegurgitant = val;
              setState(() {
              });
            },MG: (val){
              widget.formD4Model?.value.tricuspidGradientMean = int.tryParse(val);
              setState(() {
              });
            },PG: (val){
              widget.formD4Model?.value.tricuspidGradientPeak = int.tryParse(val);
              setState(() {
              });
            },RegurgitantradioOnchange: (val){
              widget.formD4Model?.value.tricuspidRegurgitantValue = val;
              setState(() {
              });
            },StenoticradioOnchange: (val){
              widget.formD4Model?.value.tricuspidStenoticValue = val;
              setState(() {
              });
            },radioValue: (val){
              widget.formD4Model?.value.tricuspidFunction = val;
              setState(() {
              });
            },),
          ValueFunction(key: Key('Pulmonary ${PulmonarySelectedList}'),enabled:widget.enabled,title: 'Pulmonary',
            radioInitialValue: widget.formD4Model?.value.pulmonaryFunction,
            MGInitialValue: widget.formD4Model?.value.pulmonaryGradientMean.toString(),
            PGInitialValue: widget.formD4Model?.value.pulmonaryGradientPeak.toString(),
            StenoticInitialValue: widget.formD4Model?.value.pulmonaryStenoticValue
            ,regurgitantInitialValue: widget.formD4Model?.value.pulmonaryRegurgitantValue
            ,selectedlist: PulmonarySelectedList,
            maininitialValue: widget.formD4Model?.value.pulmonary,
            mainValue: (val){
              widget.formD4Model?.value.pulmonary = val;
              widget.isPulmonaryProsthetic?.call(isPulmonaryProsthetic);
              setState(() {
              });
            },
            checkboxValue: (val){
              widget.formD4Model?.value.pulmonaryStenotic = val;
              setState(() {
              });
            },checkboxValueRegurgitant: (val){
              widget.formD4Model?.value.pulmonaryRegurgitant = val;
              setState(() {
              });
            },MG: (val){
              widget.formD4Model?.value.pulmonaryGradientMean = int.tryParse(val);
              setState(() {
              });
            },PG: (val){
              widget.formD4Model?.value.pulmonaryGradientPeak =int.tryParse(val) ;
              setState(() {
              });
            },RegurgitantradioOnchange: (val){
              widget.formD4Model?.value.pulmonaryRegurgitantValue = val;
              setState(() {
              });
            },StenoticradioOnchange: (val){
              widget.formD4Model?.value.pulmonaryStenoticValue = val;
              setState(() {
              });
            },radioValue: (val){
              widget.formD4Model?.value.pulmonaryFunction = val;
              setState(() {
              });
            },),

          //  MRowTextRadioWidget(enabled: widget.enabled,title: 'Mitral',onChanged: (val ){
          //    val == 'Native' ? isNative = true : isNative = false;
          //    val == 'Prosthetic' ? isMitralProsthetic = true : isMitralProsthetic = false;
          //    widget.isMitralProsthetic?.call(isMitralProsthetic);
          //    setState(() {});
          //  },options: ['Native','Prosthetic'] ,isneedDivider: false,),
          // isNative ? MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val ){
          //   val == 'Abnormal' ? isabnormal = true : isabnormal = false;
          //   setState(() {});
          // },options: List_items.NormalAbnormal ,isneedDivider: false,) : Container(),
          // isabnormal? MRowTextCheckBox(enabled: widget.enabled,list: List_items.ValuFunction,
          //    result: (val){
          //      if(val.contains('Stenotic')){
          //        setState(() {
          //          isMitralStenotic = true;
          //        });
          //      }else{
          //        setState(() {
          //          isMitralStenotic = false;
          //        });
          //      }
          //      if(val.contains('Regurgitant')){
          //        setState(() {
          //          isMitralRegurgitant = true;
          //        });
          //      }else{
          //        setState(() {
          //          isMitralRegurgitant = false;
          //        });
          //      }
          //    },isneedDivider:false,): Container(),
          //  isMitralStenotic ?  MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val ){},options: List_items.MildModerateSevere,isneedDivider: false,) : Container(),
          //  isMitralStenotic ?  MrowTextTextFieldWidget(enabled: widget.enabled,title: 'MVOA (cm2) ',onChanged: (val ){},isneedDivider: false,) : Container(),
          //  isMitralStenotic ? MSmallText(text: 'MV Gradient (mm of Hg):',):Container(),
          //  isMitralStenotic ? Space():Container(),
          //  isMitralStenotic ?  MrowTextTextFieldWidget(enabled: widget.enabled,title: 'MG',onChanged: (val ){},isneedDivider: false,) : Container(),
          //  isMitralStenotic ?  MrowTextTextFieldWidget(enabled: widget.enabled,title: 'PG',onChanged: (val ){},isneedDivider: false,) : Container(),
          //  isMitralRegurgitant ?  MRowTextRadioWidget(enabled: widget.enabled,title: 'Regurgitant',onChanged: (val ){},options:List_items.MildModerateSevere,isneedDivider: false,) : Container(),
          //  MDivider(),
          //  ValueFunction(enabled: widget.enabled,title: 'Aortic',gradient: 'AV Gradient (mm of Hg):',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){
          //    val =='Prosthetic'?isAorticProsthetic = true:isAorticProsthetic = false;
          //    widget.isAorticProsthetic?.call(isAorticProsthetic);
          //    setState(() {});
          //  },),
          // MDivider(),
          // ValueFunction(enabled: widget.enabled,title: 'Tricuspid',gradient: 'TV Gradient:',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){
          //   val =='Prosthetic'?isTricuspidProsthetic = true:isTricuspidProsthetic = false;
          //   widget.isTricuspidProsthetic?.call(isTricuspidProsthetic);
          //   setState(() {});
          // },),
          // MDivider(),
          //  ValueFunction(enabled: widget.enabled,title: 'Pulmonary',gradient: 'PV Gradient:',checkboxValue: (val){},MG: (val){},PG: (val){},RegurgitantradioOnchange: (val){},StenoticradioOnchange: (val){},radioValue: (val){
          //    val =='Prosthetic'? isPulmonaryProsthetic = true:isPulmonaryProsthetic = false;
          //    widget.isPulmonaryProsthetic?.call(isPulmonaryProsthetic);
          //    setState(() {});
          //  },),
          MRowTextRadioWidget(enabled: widget.enabled,title: 'Valvular pathology:',initialValue: widget.formD4Model?.value.valvarPathology,onChanged: (val){
            val =='Others' ? setState(() {
              isOthers = true;
            }) : setState(() {
              isOthers = false;
            });
            widget.formD4Model?.value.valvarPathology = val;
          },isneedDivider: false,options: ['Rheumatic','Myxomatous','Bicuspid','Degenerative','Prolapse-flail','Dysplastic','Others'],)
         ],) : Container(),
          isOthers ?MTextField(enabled: widget.enabled,label: 'If Others Specify',initalValue: widget.formD4Model?.value.valvarPathologyOthers,onChanged: (val){
            widget.formD4Model?.value.valvarPathologyOthers = val;
          },) : Container(),
          Space(),
          MDivider(),
          Space(),
          MSmallText(text: 'D6.4 Pulmonary pressures/ Pulmonary hypotension:'),
          Space(),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){
            widget.formD4Model?.value.tricuspidTRPG = int.tryParse(val);
          },initialValue: widget.formD4Model?.value.tricuspidTRPG.toString(),title: 'Tricuspid regurgitation-TRPG (mmHg):',maxLength: 3,type: MInputType.numeric,),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){
            widget.formD4Model?.value.pAT = int.tryParse(val);
          },initialValue: widget.formD4Model?.value.pAT.toString(),title: 'PAT in msec:',maxLength: 3,type: MInputType.numeric,),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){
            widget.formD4Model?.value.estimatedRAPressure = int.tryParse(val);
          },title: 'Estimated RA Pressure(mmHg):',initialValue: widget.formD4Model?.value.estimatedRAPressure.toString(),maxLength: 3,type: MInputType.numeric,),
          MrowTextTextFieldWidget(enabled: widget.enabled, onChanged: (val){
            widget.formD4Model?.value.peakPulmonaryReg = int.tryParse(val);
          },title: 'Peak Pulmonary regurgitation (mmHg):',initialValue: widget.formD4Model?.value.peakPulmonaryReg.toString(),maxLength: 3,type: MInputType.numeric,),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
            widget.formD4Model?.value.pulmonaryHypertension = val;
          },title: 'Pulmonary Hypertension:',initialValue: widget.formD4Model?.value.pulmonaryHypertension,options: ['Nil', 'Mild','Moderate','Severe','Could not be estimated'],),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
            // if(val =='Effusion') { setState(() { isEffusion = true; }); }else{ setState(() { isEffusion = false; });}
            widget.formD4Model?.value.pericardium = val;
          },initialValue: widget.formD4Model?.value.pericardium,title: 'D6.5 Pericardium',options: ['Normal', 'Thickened','Effusion'],),
        widget.formD4Model?.value.pericardium == 'Effusion' ?MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
          widget.formD4Model?.value.pericardiumEffusion = val;
        },initialValue: widget.formD4Model?.value.pericardiumEffusion,title: 'Effusion',options: ['Mild', 'Moderate','Severe'],): Container(),
          MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){
            val =='Abnormal' ? isAortaAbnormal = true : isAortaAbnormal= false;
            widget.isAortaAbnormal?.call(isAortaAbnormal);
            widget.formD4Model?.value.aorta = val;
            setState(() {});
          },initialValue: widget.formD4Model?.value.aorta,title: 'D6.6 Aorta',options: List_items.NormalAbnormal,),
          MRowTextCheckBox(title: 'D6.7 Others:',enabled: widget.enabled,result: (val){
            val.contains('Vegetation') ? widget.formD4Model?.value.othersVegetation = true : widget.formD4Model?.value.othersVegetation = false;
            val.contains('Thrombus /clot') ? widget.formD4Model?.value.othersThrombusClot = true : widget.formD4Model?.value.othersThrombusClot = false;
            val.contains('Mass') ? widget.formD4Model?.value.othersMass = true : widget.formD4Model?.value.othersMass = false;
            setState(() {});
          },list: ['Vegetation','Thrombus /clot','Mass'],),
          // MRowTextRadioWidget(enabled: widget.enabled,onChanged: (val){},title: 'l D6.7 Others:',options: ['Normal', 'Slight','Moderate','Severe'],),
          MrowTextTextFieldWidget( enabled: widget.enabled,onChanged: (val){
            widget.formD4Model?.value.otherRelevantEchoFindings = val;
          },initialValue: widget.formD4Model?.value.otherRelevantEchoFindings,title: 'D6.8 Other relevant echo findings::',),
          //MFilledButton(text: 'Next', onPressed: (){context.push(Routes.FormD4);},),
        // isMitralProsthetic || isAorticProsthetic || isTricuspidProsthetic || isPulmonaryProsthetic ?Column(
        //   children: [
        //     FormD4(),
        //     FormL1(),
        //   ],
        // ) : Container(),
        // isAortaAbnormal ? FormD6(): Container(),
        ],);
  }
}
