import 'package:npac/Forms/FormH/Controller/FormKController.dart';
import 'package:npac/Forms/FormH/Model/FormK5Model.dart';
import 'package:npac/app/export.dart';

class FormH5 extends StatefulWidget {
  final bool? enabled;
  final  Rx<FormK5Model>? formK5Data;
  const FormH5({super.key, this.enabled, this.formK5Data});

  @override
  State<FormH5> createState() => _FormH5State();
}

class _FormH5State extends State<FormH5> {

  // FormKController controller = Get.put(FormKController());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MText(text: 'K8.3 Secondary outcome – Obstetric',),
        Space(),
        MRowTextRadioWidget(enabled : widget.enabled,title: 'Mode of delivery',initialValue: widget.formK5Data?.value.obsModeOfDelivery,onChanged: (val){
          widget.formK5Data?.value.obsModeOfDelivery = val ;
        },options: ['Normal VD','Assisted VD','Failed VD converted to LSCS ','LSCS'],),
        // MSmallText(text: 'Secondary outcome – Obstetric',),
        // Space(),
        FormH3Common(enabled : widget.enabled,title: '8.3.1. Gestational Diabetes Mellitus',radioInitialValue: widget.formK5Data?.value.obstetricGdm,TextField1InitialValue: widget.formK5Data?.value.obstetricGdmTime,TypeInitialValue: widget.formK5Data?.value.obstetricGdmValues,radioiOnChanged: (val){
          widget.formK5Data?.value.obstetricGdm = val ;
        },TextField1OnChanged:(val){
          widget.formK5Data?.value.obstetricGdmTime = val ;
        } ,TypeOnchanged: (val){
          widget.formK5Data?.value.obstetricGdmValues = val ;
        },),
        FormH3Common(enabled : widget.enabled,title: '8.3.2.a HDP - Gestational Hypertension',radioInitialValue: widget.formK5Data?.value.obstetricGht,TextField1InitialValue: widget.formK5Data?.value.obstetricGhtTime,TypeInitialValue: widget.formK5Data?.value.obstetricGhtValues,radioiOnChanged: (val){
          widget.formK5Data?.value.obstetricGht = val ;
        },TextField1OnChanged:(val){
          widget.formK5Data?.value.obstetricGhtTime = val ;
        } ,TypeOnchanged: (val){
          widget.formK5Data?.value.obstetricGhtValues = val ;
        },),
        FormH3Common(enabled : widget.enabled,title: '8.3.2.b HDP - Pre-eclampsia',radioInitialValue: widget.formK5Data?.value.obstetricPreecla,TextField1InitialValue: widget.formK5Data?.value.obstetricPreeclaTime,TypeInitialValue: widget.formK5Data?.value.obstetricPreeclaValues,radioiOnChanged: (val){
          widget.formK5Data?.value.obstetricPreecla = val ;
        },TextField1OnChanged:(val){
          widget.formK5Data?.value.obstetricPreeclaTime = val ;
        } ,TypeOnchanged: (val){
          widget.formK5Data?.value.obstetricPreeclaValues = val ;
        },),
        FormH3Common(enabled : widget.enabled,title: '8.3.2.c HDP - Eclampsia',radioInitialValue: widget.formK5Data?.value.obstetricEclampsia,TextField1InitialValue: widget.formK5Data?.value.obstetricEclampsiaTime,TypeInitialValue: widget.formK5Data?.value.obstetricEclampsiaValues,radioiOnChanged: (val){
          widget.formK5Data?.value.obstetricEclampsia = val ;
        },TextField1OnChanged:(val){
          widget.formK5Data?.value.obstetricEclampsiaTime = val ;
        } ,TypeOnchanged: (val){
          widget.formK5Data?.value.obstetricEclampsiaValues = val ;
        },),
        FormH3Common(enabled : widget.enabled,title: '8.3.2.d HDP - HELLP',radioInitialValue: widget.formK5Data?.value.obstetricHellp,TextField1InitialValue: widget.formK5Data?.value.obstetricHellpTime,TypeInitialValue: widget.formK5Data?.value.obstetricHellpValues,radioiOnChanged: (val){
          widget.formK5Data?.value.obstetricHellp = val ;
        },TextField1OnChanged:(val){
          widget.formK5Data?.value.obstetricHellpTime = val ;
        } ,TypeOnchanged: (val){
          widget.formK5Data?.value.obstetricHellpValues = val ;
        },),
      FormH3Common(enabled : widget.enabled,title: '8.3.3. Infection / Sepsis',radioInitialValue: widget.formK5Data?.value.obstetricSepsis,TextField1InitialValue: widget.formK5Data?.value.obstetricSepsisTime,TypeInitialValue: widget.formK5Data?.value.obstetricSepsisValues,radioiOnChanged: (val){
        widget.formK5Data?.value.obstetricSepsis = val ;
      },TextField1OnChanged:(val){
        widget.formK5Data?.value.obstetricSepsisTime = val ;
      } ,TypeOnchanged: (val){
        widget.formK5Data?.value.obstetricSepsisValues = val ;
      },),

      FormH3Common(enabled : widget.enabled,title: '8.3.4.a Near Miss -  Cardiopulmonary Resuscitation',radioInitialValue: widget.formK5Data?.value.obstetricCardres,TextField1InitialValue: widget.formK5Data?.value.obstetricCardresTime,TypeInitialValue: widget.formK5Data?.value.obstetricCardresValues,radioiOnChanged: (val){
        widget.formK5Data?.value.obstetricCardres = val ;
      },TextField1OnChanged:(val){
        widget.formK5Data?.value.obstetricCardresTime = val ;
      } ,TypeOnchanged: (val){
        widget.formK5Data?.value.obstetricCardresValues = val ;
      },),
      FormH3Common(enabled : widget.enabled,title: '8.3.4.b Near Miss - Intubation',radioInitialValue: widget.formK5Data?.value.obstetricIntubation,TextField1InitialValue: widget.formK5Data?.value.obstetricIntubationTime,TypeInitialValue: widget.formK5Data?.value.obstetricIntubationValues,radioiOnChanged: (val){
        widget.formK5Data?.value.obstetricIntubation = val ;
      },TextField1OnChanged:(val){
        widget.formK5Data?.value.obstetricIntubationTime = val ;
      } ,TypeOnchanged: (val){
        widget.formK5Data?.value.obstetricIntubationValues = val ;
      },),
      FormH3Common(enabled : widget.enabled,title: '8.3.4.c Near Miss - Inotrope',radioInitialValue: widget.formK5Data?.value.obstetricInotrope,TextField1InitialValue: widget.formK5Data?.value.obstetricInotropeTime,TypeInitialValue: widget.formK5Data?.value.obstetricInotropeValues,radioiOnChanged: (val){
        widget.formK5Data?.value.obstetricInotrope = val ;
      },TextField1OnChanged:(val){
        widget.formK5Data?.value.obstetricInotropeTime = val ;
      } ,TypeOnchanged: (val){
        widget.formK5Data?.value.obstetricInotropeValues = val ;
      },),
      FormH3Common(enabled : widget.enabled,title: '8.3.4.d Near Miss - pH < 7',radioInitialValue: widget.formK5Data?.value.obstetricPh,TextField1InitialValue: widget.formK5Data?.value.obstetricPhTime,TypeInitialValue: widget.formK5Data?.value.obstetricPhValues,radioiOnChanged: (val){
        widget.formK5Data?.value.obstetricPh = val ;
      },TextField1OnChanged:(val){
        widget.formK5Data?.value.obstetricPhTime = val ;
      } ,TypeOnchanged: (val){
        widget.formK5Data?.value.obstetricPhValues = val ;
      },),
      FormH3Common(enabled : widget.enabled,title: '8.3.4.e Near Miss - Oliguria',radioInitialValue: widget.formK5Data?.value.obstetricOliguria,TextField1InitialValue: widget.formK5Data?.value.obstetricOliguriaTime,radioiOnChanged: (val){
        widget.formK5Data?.value.obstetricOliguria = val ;
      },TextField1OnChanged:(val){
        widget.formK5Data?.value.obstetricOliguriaTime = val ;
      } ,TypeOnchanged: (val){
      },),
      FormH3Common(enabled : widget.enabled,title: '8.3.4.f Near Miss - Lactate > 4 mmol/L',radioInitialValue: widget.formK5Data?.value.obstetricLactate,TextField1InitialValue: widget.formK5Data?.value.obstetricLactateTime ,TypeInitialValue: widget.formK5Data?.value.obstetricLactateValues,radioiOnChanged: (val){
        widget.formK5Data?.value.obstetricLactate = val ;
      },TextField1OnChanged:(val){
        widget.formK5Data?.value.obstetricLactateTime = val ;
      } ,TypeOnchanged: (val){
        widget.formK5Data?.value.obstetricLactateValues = val ;
      },),

      FormH3Common(enabled : widget.enabled,title: '8.3.5.a PROM - < 24 hours',radioInitialValue: widget.formK5Data?.value.obstetricLessHrs,TextField1InitialValue: widget.formK5Data?.value.obstetricLessHrsTime,TypeInitialValue: widget.formK5Data?.value.obstetricLessHrsValues,radioiOnChanged: (val){
        widget.formK5Data?.value.obstetricLessHrs = val ;
      },TextField1OnChanged:(val){
        widget.formK5Data?.value.obstetricLessHrsTime = val ;
      } ,TypeOnchanged: (val){
        widget.formK5Data?.value.obstetricLessHrsValues = val ;
      },),
        FormH3Common(enabled : widget.enabled,title: '8.3.5.b PROM - > 24 hours',radioInitialValue: widget.formK5Data?.value.obstetricGrtHrs,TextField1InitialValue: widget.formK5Data?.value.obstetricGrtHrsTime,TypeInitialValue: widget.formK5Data?.value.obstetricGrtHrsValues,radioiOnChanged: (val){
        widget.formK5Data?.value.obstetricGrtHrs = val ;
        },TextField1OnChanged:(val){
        widget.formK5Data?.value.obstetricGrtHrsTime = val ;
        } ,TypeOnchanged: (val){
        widget.formK5Data?.value.obstetricGrtHrsValues = val ;
        },),
      FormH3Common(enabled : widget.enabled,title: '8.3.6. Preterm delivery (PROM, Labor, CS) Labor < 37 weeks ',radioInitialValue: widget.formK5Data?.value.obstetricProm,TextField1InitialValue: widget.formK5Data?.value.obstetricPromTime,TypeInitialValue: widget.formK5Data?.value.obstetricPromValues,radioiOnChanged: (val){
        widget.formK5Data?.value.obstetricProm = val ;
      },TextField1OnChanged:(val){
        widget.formK5Data?.value.obstetricPromTime = val ;
      } ,TypeOnchanged: (val){
        widget.formK5Data?.value.obstetricPromValues = val ;
      },),
      FormH3Common(enabled : widget.enabled,title: '8.3.7. Abruptio Placenta',radioInitialValue: widget.formK5Data?.value.obstetricAbrPlac,TextField1InitialValue: widget.formK5Data?.value.obstetricAbrPlacTime,TypeInitialValue: widget.formK5Data?.value.obstetricAbrPlacValues,radioiOnChanged: (val){
        widget.formK5Data?.value.obstetricAbrPlac = val ;
      },TextField1OnChanged:(val){
        widget.formK5Data?.value.obstetricAbrPlacTime = val ;
      } ,TypeOnchanged: (val){
        widget.formK5Data?.value.obstetricAbrPlacValues = val ;
      },),

      FormH3Common(enabled : widget.enabled,title: '8.3.8. Retained placenta',radioInitialValue: widget.formK5Data?.value.obstetricRetPlac,TextField1InitialValue: widget.formK5Data?.value.obstetricRetPlacTime,TypeInitialValue: widget.formK5Data?.value.obstetricRetPlacValues,radioiOnChanged: (val){
        widget.formK5Data?.value.obstetricRetPlac = val ;
      },TextField1OnChanged:(val){
        widget.formK5Data?.value.obstetricRetPlacTime = val ;
      } ,TypeOnchanged: (val){
        widget.formK5Data?.value.obstetricRetPlacValues = val ;
      },),

      FormH3Common(enabled : widget.enabled,title: '8.3.9. PPH > 500 ml',radioInitialValue: widget.formK5Data?.value.obstetricPph,TextField1InitialValue: widget.formK5Data?.value.obstetricPphTime,TypeInitialValue: widget.formK5Data?.value.obstetricPphValues,radioiOnChanged: (val){
        widget.formK5Data?.value.obstetricPph = val ;
      },TextField1OnChanged:(val){
        widget.formK5Data?.value.obstetricPphTime = val ;
      } ,TypeOnchanged: (val){
        widget.formK5Data?.value.obstetricPphValues = val ;
      },),
       // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormH6);},)
      ],);
  }
}
