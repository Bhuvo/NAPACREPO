import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormD/Model/FormDR4Model.dart';
import 'package:npac/Forms/FormD/widget/ValveD7.dart';
import 'package:npac/app/export.dart';

class FormD4 extends StatefulWidget {
  final bool? isEnabled;
  final Rx<FormDR4Model>? formDR4Model;
  const FormD4({super.key, this.isEnabled, this.formDR4Model});

  @override
  State<FormD4> createState() => _FormD4State();
}

class _FormD4State extends State<FormD4> {


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MText(text: 'D7 PROSTHETIC VALVE ECHO PAGE',),
      Space(),
      Row(
        children: [
          Flexible(child: MText(text: 'ECHOCARDIOGRAPHIC ASSESSMENT AND FOLLOW UP',)),
        ],
      ),
      MRowTextCheckBox(title: 'Valve replaced',enabled: widget.isEnabled,result: (val){
        val.contains('Mitral') ? widget.formDR4Model?.value.mitral = true : widget.formDR4Model?.value.mitral = false;
        val.contains('Aortic') ?  widget.formDR4Model?.value.aortic = true :  widget.formDR4Model?.value.aortic = false;
        val.contains('Tricuspid') ? widget.formDR4Model?.value.tricuspid = true : widget.formDR4Model?.value.tricuspid = false;
        val.contains('Pulmonary') ? widget.formDR4Model?.value.pulmonary = true : widget.formDR4Model?.value.pulmonary = false;
        // widget.result?.call(val);
        print(val);
        setState(() {});
      }
        ,list: ['Mitral','Aortic','Tricuspid','Pulmonary'],),

      MText(text: 'First Visit',),
      Space(),
      valveD7(
        key: ValueKey('bool value ${widget.formDR4Model?.value.mitral},${widget.formDR4Model?.value.aortic},${widget.formDR4Model?.value.tricuspid},${widget.formDR4Model?.value.pulmonary}'),
        mitralBool: widget.formDR4Model?.value.mitral,
        aorticBool: widget.formDR4Model?.value.aortic,
        tricuspidBool: widget.formDR4Model?.value.tricuspid,
        pulmonaryBool: widget.formDR4Model?.value.pulmonary,
        result: (val){
          (val?? []).contains('Mitral') ? widget.formDR4Model?.value.mitral = true : widget.formDR4Model?.value.mitral = false;
          (val?? []).contains('Aortic') ? widget.formDR4Model?.value.aortic = true : widget.formDR4Model?.value.aortic = false;
          (val?? []).contains('Tricuspid') ? widget.formDR4Model?.value.tricuspid = true : widget.formDR4Model?.value.tricuspid = false;
          (val?? []).contains('Pulmonary') ? widget.formDR4Model?.value.pulmonary = true : widget.formDR4Model?.value.pulmonary = false;

        },

        isEnabled:widget.isEnabled,
        meanMitralInitial: widget.formDR4Model?.value.mGFVMitral.toString(),
         meanAorticInitial: widget.formDR4Model?.value.mGFVAortic.toString(),
         meanTricuspidInitial: widget.formDR4Model?.value.mGFVTricuspid.toString(),
         meanPulmonaryInitial: widget.formDR4Model?.value.mGFVPulmonary.toString(),

         peakMitralInitial: widget.formDR4Model?.value.pGFVMitral.toString(),
        peakAorticInitial: widget.formDR4Model?.value.pGFVAortic.toString(),
        peakTricuspidInitial: widget.formDR4Model?.value.pGFVTricuspid.toString(),
        peakPulmonaryInitial: widget.formDR4Model?.value.pGFVPulmonary.toString(),

        normalDiscMitralInitial: widget.formDR4Model?.value.nDMFVMitral.toString(),
        normalDiscAorticInitial: widget.formDR4Model?.value.nDMFVAortic.toString(),
        normalDiscTricuspidInitial: widget.formDR4Model?.value.nDMFVTricuspid.toString(),
        normalDiscPulmonaryInitial: widget.formDR4Model?.value.nDMFVPulmonary.toString(),

        visibleThrombusMitralInitial: widget.formDR4Model?.value.vTFVMitral.toString(),
        visibleThrombusAorticInitial: widget.formDR4Model?.value.vTFVAortic.toString(),
        visibleThrombusTricuspidInitial: widget.formDR4Model?.value.vTFVTricuspid.toString(),
        visibleThrombusPulmonaryInitial: widget.formDR4Model?.value.vTFVPulmonary.toString(),

        mitralDiscBool:widget.formDR4Model?.value.nDMFVMitral,
        aorticDiscBool:widget.formDR4Model?.value.nDMFVAortic,
        tricuspidDiscBool:widget.formDR4Model?.value.nDMFVTricuspid,
        pulmonaryDiscBool:widget.formDR4Model?.value.nDMFVPulmonary,

        mitralVTBool:widget.formDR4Model?.value.vTFVMitral,
        aorticVTBool:widget.formDR4Model?.value.vTFVAortic,
        tricuspidVTBool:widget.formDR4Model?.value.vTFVTricuspid,
        pulmonaryVTBool:widget.formDR4Model?.value.vTFVPulmonary,

        mitralDiscBoolOnchange: (val){
          widget.formDR4Model?.value.nDMFVMitral =val;
          setState(() {});
        },
        aorticDiscBoolOnchange: (val){
          widget.formDR4Model?.value.nDMFVAortic =val ;
          setState(() {});
        },
        tricuspidDiscBoolOnchange: (val){
          widget.formDR4Model?.value.nDMFVTricuspid= val;
          setState(() {});
        },
        pulmonaryDiscBoolOnchange: (val){
          widget.formDR4Model?.value.nDMFVPulmonary= val;
          setState(() {});
        },

        mitralVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTFVMitral= val;
          setState(() {});
        },
        aorticVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTFVAortic= val;
          setState(() {});
        },
        tricuspidVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTFVTricuspid= val;
          setState(() {});
        },
        pulmonaryVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTFVPulmonary= val;
          setState(() {});
        },



        meanMitralOnchange:(val){
          widget.formDR4Model?.value.mGFVMitral = int.tryParse(val ??'');
          setState(() {});
        },
        meanAorticOnchange:(val){
          widget.formDR4Model?.value.mGFVAortic = int.tryParse(val ??'');
          setState(() {});
        },
        meanTricuspidOnchange:(val){
          widget.formDR4Model?.value.mGFVTricuspid = int.tryParse(val ??'');
          setState(() {});
        },
        meanPulmonaryOnchange:(val){
          widget.formDR4Model?.value.mGFVPulmonary = int.tryParse(val ??'');
          setState(() {});
        },

        peakMitralOnchange:(val){
          widget.formDR4Model?.value.pGFVMitral = int.tryParse(val ??'');
          setState(() {});
        },
        peakAorticOnchange:(val){
          widget.formDR4Model?.value.pGFVAortic = int.tryParse(val ??'');
          setState(() {});
        },
        peakTricuspidOnchange:(val){
          widget.formDR4Model?.value.pGFVTricuspid = int.tryParse(val ??'');
          setState(() {});
        },
        peakPulmonaryOnchange:(val){
          widget.formDR4Model?.value.pGFVPulmonary = int.tryParse(val ??'');
          setState(() {});
        },

        normalDiscMitralOnchange:(val){
          widget.formDR4Model?.value.nDMFVMitral = val;
          setState(() {});
        },
        normalDiscAorticOnchange:(val){
          widget.formDR4Model?.value.nDMFVAortic = val;
          setState(() {});
        },
        normalDiscTricuspidOnchange:(val){
          widget.formDR4Model?.value.nDMFVTricuspid = val;
          setState(() {});
        },
        normalDiscPulmonaryOnchange:(val){
          widget.formDR4Model?.value.nDMFVPulmonary = val;
          setState(() {});
        },

        visibleThrombusMitralOnchange:(val){
          widget.formDR4Model?.value.vTFVMitral = val;
          setState(() {});
        },
        visibleThrombusAorticOnchange:(val){
          widget.formDR4Model?.value.vTFVAortic = val;
          setState(() {});
        },
        visibleThrombusTricuspidOnchange:(val){
          widget.formDR4Model?.value.vTFVTricuspid = val;
          setState(() {});
        },
        visibleThrombusPulmonaryOnchange:(val){
          widget.formDR4Model?.value.vTFVPulmonary = val;
          setState(() {});
        },


      ),

      MText(text: 'Antenatal revisit 1',),
      Space(),
      valveD7(
        key: ValueKey('bool value Antenatal revisit 1${widget.formDR4Model?.value.mitral},${widget.formDR4Model?.value.aortic},${widget.formDR4Model?.value.tricuspid},${widget.formDR4Model?.value.pulmonary}'),
        mitralBool: widget.formDR4Model?.value.mitral,
        aorticBool: widget.formDR4Model?.value.aortic,
        tricuspidBool: widget.formDR4Model?.value.tricuspid,
        pulmonaryBool: widget.formDR4Model?.value.pulmonary,
        result: (val){
          (val?? []).contains('Mitral') ? widget.formDR4Model?.value.mitral = true : widget.formDR4Model?.value.mitral = false;
          (val?? []).contains('Aortic') ? widget.formDR4Model?.value.aortic = true : widget.formDR4Model?.value.aortic = false;
          (val?? []).contains('Tricuspid') ? widget.formDR4Model?.value.tricuspid = true : widget.formDR4Model?.value.tricuspid = false;
          (val?? []).contains('Pulmonary') ? widget.formDR4Model?.value.pulmonary = true : widget.formDR4Model?.value.pulmonary = false;
          setState(() {});
        },
        isEnabled:widget.isEnabled,

        mitralDiscBool: widget.formDR4Model?.value.nDMAN1Mitral,
        aorticDiscBool: widget.formDR4Model?.value.nDMAN1Aortic,
        tricuspidDiscBool: widget.formDR4Model?.value.nDMAN1Tricuspid,
        pulmonaryDiscBool: widget.formDR4Model?.value.nDMAN1Pulmonary,

        mitralVTBool: widget.formDR4Model?.value.vTAN1Mitral,
        aorticVTBool: widget.formDR4Model?.value.vTAN1Aortic,
        tricuspidVTBool: widget.formDR4Model?.value.vTAN1Tricuspid,
        pulmonaryVTBool: widget.formDR4Model?.value.vTAN1Pulmonary,

        meanMitralInitial: widget.formDR4Model?.value.mGAN1Mitral.toString(),
        meanAorticInitial: widget.formDR4Model?.value.mGAN1Aortic.toString(),
        meanTricuspidInitial: widget.formDR4Model?.value.mGAN1Tricuspid.toString(),
        meanPulmonaryInitial: widget.formDR4Model?.value.mGAN1Pulmonary.toString(),

        peakMitralInitial: widget.formDR4Model?.value.pGAN1Mitral.toString(),
        peakAorticInitial: widget.formDR4Model?.value.pGAN1Aortic.toString(),
        peakTricuspidInitial: widget.formDR4Model?.value.pGAN1Tricuspid.toString(),
        peakPulmonaryInitial: widget.formDR4Model?.value.pGAN1Pulmonary.toString(),

        normalDiscMitralInitial: widget.formDR4Model?.value.nDMFVMitralSpecify.toString(),
        normalDiscAorticInitial: widget.formDR4Model?.value.nDMAN1AorticSpecify.toString(),
        normalDiscTricuspidInitial: widget.formDR4Model?.value.nDMAN1TricuspidSpecify.toString(),
        normalDiscPulmonaryInitial: widget.formDR4Model?.value.nDMAN1PulmonarySpecify.toString(),

        visibleThrombusMitralInitial: widget.formDR4Model?.value.vTAN1MitralSpecify.toString(),
        visibleThrombusAorticInitial: widget.formDR4Model?.value.vTAN1AorticSpecify.toString(),
        visibleThrombusTricuspidInitial: widget.formDR4Model?.value.vTAN1TricuspidSpecify.toString(),
        visibleThrombusPulmonaryInitial: widget.formDR4Model?.value.vTAN1PulmonarySpecify.toString(),


        mitralDiscBoolOnchange: (val){
          widget.formDR4Model?.value.nDMAN1Mitral = val;
          setState(() {});
        },
        aorticDiscBoolOnchange: (val){
          widget.formDR4Model?.value.nDMAN1Aortic = val;
          setState(() {});
        },
        tricuspidDiscBoolOnchange: (val){
          widget.formDR4Model?.value.nDMAN1Tricuspid = val;
          setState(() {});
        },
        pulmonaryDiscBoolOnchange: (val){
          widget.formDR4Model?.value.nDMAN1Pulmonary = val;
          setState(() {});
        },

        mitralVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTAN1Mitral = val;
          setState(() {});
        },
        aorticVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTAN1Aortic = val;
          setState(() {});
        },
        tricuspidVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTAN1Tricuspid = val;
          setState(() {});
        },
        pulmonaryVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTAN1Pulmonary = val;
          setState(() {});
        },



        meanMitralOnchange:(val){
          widget.formDR4Model?.value.mGAN1Mitral = int.tryParse(val ?? '');
          setState(() {});
        },
        meanAorticOnchange:(val){
          widget.formDR4Model?.value.mGAN1Aortic = int.tryParse(val ?? '');
          setState(() {});
        },
        meanTricuspidOnchange:(val){
          widget.formDR4Model?.value.mGAN1Tricuspid = int.tryParse(val ?? '');
          setState(() {});
        },
        meanPulmonaryOnchange:(val){
          widget.formDR4Model?.value.mGAN1Pulmonary = int.tryParse(val ?? '');
          setState(() {});
        },

        peakMitralOnchange:(val){
          widget.formDR4Model?.value.pGAN1Mitral = int.tryParse(val ?? '');
          setState(() {});
        },
        peakAorticOnchange:(val){
          widget.formDR4Model?.value.pGAN1Aortic = int.tryParse(val ?? '');
          setState(() {});
        },
        peakTricuspidOnchange:(val){
          widget.formDR4Model?.value.pGAN1Tricuspid = int.tryParse(val ?? '');
          setState(() {});
        },
        peakPulmonaryOnchange:(val){
          widget.formDR4Model?.value.pGAN1Pulmonary = int.tryParse(val ?? '');
          setState(() {});
        },

        normalDiscMitralOnchange:(val){
          widget.formDR4Model?.value.nDMFVMitralSpecify = val;
          setState(() {});
        },
        normalDiscAorticOnchange:(val){
          widget.formDR4Model?.value.nDMFVAorticSpecify = val;
          setState(() {});
        },
        normalDiscTricuspidOnchange:(val){
          widget.formDR4Model?.value.nDMFVTricuspidSpecify = val;
          setState(() {});
        },
        normalDiscPulmonaryOnchange:(val){
          widget.formDR4Model?.value.nDMFVPulmonarySpecify = val;
          setState(() {});
        },

        visibleThrombusMitralOnchange:(val){
          widget.formDR4Model?.value.vTFVMitralSpecify = val;
          setState(() {});
        },
        visibleThrombusAorticOnchange:(val){
          widget.formDR4Model?.value.vTFVAorticSpecify = val;
          setState(() {});
        },
        visibleThrombusTricuspidOnchange:(val){
          widget.formDR4Model?.value.vTFVTricuspidSpecify = val;
          setState(() {});
        },
        visibleThrombusPulmonaryOnchange:(val){
          widget.formDR4Model?.value.vTFVPulmonarySpecify = val;
          setState(() {});
        },

      ),
      MText(text: 'Antenatal revisit 2',),
      Space(),
      valveD7(
        key: ValueKey('bool value Antenatal revisit 2 ${widget.formDR4Model?.value.mitral},${widget.formDR4Model?.value.aortic},${widget.formDR4Model?.value.tricuspid},${widget.formDR4Model?.value.pulmonary}'),

        isEnabled:widget.isEnabled,
        mitralBool: widget.formDR4Model?.value.mitral,
        aorticBool: widget.formDR4Model?.value.aortic,
        tricuspidBool: widget.formDR4Model?.value.tricuspid,
        pulmonaryBool: widget.formDR4Model?.value.pulmonary,
        result: (val){
          (val?? []).contains('Mitral') ? widget.formDR4Model?.value.mitral = true : widget.formDR4Model?.value.mitral = false;
          (val?? []).contains('Aortic') ? widget.formDR4Model?.value.aortic = true : widget.formDR4Model?.value.aortic = false;
          (val?? []).contains('Tricuspid') ? widget.formDR4Model?.value.tricuspid = true : widget.formDR4Model?.value.tricuspid = false;
          (val?? []).contains('Pulmonary') ? widget.formDR4Model?.value.pulmonary = true : widget.formDR4Model?.value.pulmonary = false;
        },


          mitralDiscBool: widget.formDR4Model?.value.nDMAN2Mitral,
          aorticDiscBool: widget.formDR4Model?.value.nDMAN2Aortic,
          tricuspidDiscBool: widget.formDR4Model?.value.nDMAN2Tricuspid,
          pulmonaryDiscBool: widget.formDR4Model?.value.nDMAN1Pulmonary,

        mitralVTBool: widget.formDR4Model?.value.vTAN2Mitral,
        aorticVTBool: widget.formDR4Model?.value.vTAN2Aortic,
        tricuspidVTBool: widget.formDR4Model?.value.vTAN2Tricuspid,
        pulmonaryVTBool: widget.formDR4Model?.value.vTAN2Pulmonary,

        meanMitralInitial: widget.formDR4Model?.value.mGAN2Mitral.toString(),
        meanAorticInitial: widget.formDR4Model?.value.mGAN2Aortic.toString(),
        meanTricuspidInitial: widget.formDR4Model?.value.mGAN2Tricuspid.toString(),
        meanPulmonaryInitial: widget.formDR4Model?.value.mGAN2Pulmonary.toString(),

        peakMitralInitial: widget.formDR4Model?.value.pGAN2Mitral.toString(),
        peakAorticInitial: widget.formDR4Model?.value.pGAN2Aortic.toString(),
        peakTricuspidInitial: widget.formDR4Model?.value.pGAN2Tricuspid.toString(),
        peakPulmonaryInitial: widget.formDR4Model?.value.pGAN2Pulmonary.toString(),

        normalDiscMitralInitial: widget.formDR4Model?.value.nDMFVMitralSpecify,
        normalDiscAorticInitial: widget.formDR4Model?.value.nDMFVAorticSpecify,
        normalDiscTricuspidInitial: widget.formDR4Model?.value.nDMFVTricuspidSpecify,
        normalDiscPulmonaryInitial: widget.formDR4Model?.value.nDMFVPulmonarySpecify,

        visibleThrombusMitralInitial: widget.formDR4Model?.value.vTFVMitralSpecify,
        visibleThrombusAorticInitial: widget.formDR4Model?.value.vTFVAorticSpecify,
        visibleThrombusTricuspidInitial: widget.formDR4Model?.value.vTFVTricuspidSpecify,
        visibleThrombusPulmonaryInitial: widget.formDR4Model?.value.vTFVPulmonarySpecify,

         mitralDiscBoolOnchange: (val){
           widget.formDR4Model?.value.nDMAN2Mitral = val;
           setState(() {});
         },
         aorticDiscBoolOnchange: (val){
           widget.formDR4Model?.value.nDMAN2Aortic = val;
           setState(() {});
         },
         tricuspidDiscBoolOnchange: (val){
           widget.formDR4Model?.value.nDMAN2Tricuspid = val;
           setState(() {});
         },
         pulmonaryDiscBoolOnchange: (val){
           widget.formDR4Model?.value.nDMAN2Pulmonary = val;
           setState(() {});
         },
        mitralVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTAN2Mitral = val;
          setState(() {});
        },
        aorticVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTAN2Aortic = val;
          setState(() {});
        },
        tricuspidVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTAN2Tricuspid = val;
          setState(() {});
        },
        pulmonaryVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTAN2Pulmonary = val;
          setState(() {});
        },


        meanMitralOnchange: (val){
          widget.formDR4Model?.value.mGAN2Mitral = int.tryParse(val ??'');
          setState(() {});
        },
        meanAorticOnchange: (val){
          widget.formDR4Model?.value.mGAN2Aortic = int.tryParse(val ??'');
          setState(() {});
        },
        meanTricuspidOnchange: (val){
          widget.formDR4Model?.value.mGAN2Tricuspid = int.tryParse(val ??'');
          setState(() {});
        },
        meanPulmonaryOnchange: (val){
          widget.formDR4Model?.value.mGAN2Pulmonary = int.tryParse(val ??'');
          setState(() {});
        },


        peakMitralOnchange: (val){
          widget.formDR4Model?.value.pGAN2Mitral = int.tryParse(val ??'');
          setState(() {});
        },
        peakAorticOnchange: (val){
          widget.formDR4Model?.value.pGAN2Aortic = int.tryParse(val ??'');
          setState(() {});
        },
        peakTricuspidOnchange: (val){
          widget.formDR4Model?.value.pGAN2Tricuspid = int.tryParse(val ??'');
          setState(() {});
        },
        peakPulmonaryOnchange: (val){
          widget.formDR4Model?.value.pGAN2Pulmonary = int.tryParse(val ??'');
          setState(() {});
        },

        normalDiscMitralOnchange: (val){
          widget.formDR4Model?.value.nDMFVMitralSpecify = val;
          setState(() {});
        },
        normalDiscAorticOnchange: (val){
          widget.formDR4Model?.value.nDMFVAorticSpecify = val;
          setState(() {});
        },
        normalDiscTricuspidOnchange: (val){
          widget.formDR4Model?.value.nDMFVTricuspidSpecify = val;
          setState(() {});
        },
        normalDiscPulmonaryOnchange: (val){
          widget.formDR4Model?.value.nDMFVPulmonarySpecify = val;
          setState(() {});
        },

        visibleThrombusMitralOnchange: (val){
          widget.formDR4Model?.value.vTFVMitralSpecify = val;
          setState(() {});
        },
        visibleThrombusAorticOnchange: (val){
          widget.formDR4Model?.value.vTFVAorticSpecify = val;
          setState(() {});
        },
        visibleThrombusTricuspidOnchange: (val){
          widget.formDR4Model?.value.vTFVTricuspidSpecify = val;
          setState(() {});
        },
        visibleThrombusPulmonaryOnchange: (val){
          widget.formDR4Model?.value.vTFVPulmonarySpecify = val;
          setState(() {});
        },


      ),

      // MSmallText(text: 'D7.1 Mean gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.2 Peak gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.3 Normal disc movement (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.4 Visible thrombus (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),

      // MSmallText(text: 'D7.1 Mean gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.2 Peak gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.3 Normal disc movement (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.4 Visible thrombus (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),

      MText(text: 'Peripartum',),
      Space(),
      valveD7(
        key: ValueKey('bool value Peripartum ${widget.formDR4Model?.value.mitral},${widget.formDR4Model?.value.aortic},${widget.formDR4Model?.value.tricuspid},${widget.formDR4Model?.value.pulmonary}'),
        mitralBool: widget.formDR4Model?.value.mitral,
        aorticBool: widget.formDR4Model?.value.aortic,
        tricuspidBool: widget.formDR4Model?.value.tricuspid,
        pulmonaryBool: widget.formDR4Model?.value.pulmonary,
        result: (val){
          (val?? []).contains('Mitral') ? widget.formDR4Model?.value.mitral = true : widget.formDR4Model?.value.mitral = false;
          (val?? []).contains('Aortic') ? widget.formDR4Model?.value.aortic = true : widget.formDR4Model?.value.aortic = false;
          (val?? []).contains('Tricuspid') ? widget.formDR4Model?.value.tricuspid = true : widget.formDR4Model?.value.tricuspid = false;
          (val?? []).contains('Pulmonary') ? widget.formDR4Model?.value.pulmonary = true : widget.formDR4Model?.value.pulmonary = false;
        setState(() {});
        },

        isEnabled:widget.isEnabled,

        mitralDiscBool: widget.formDR4Model?.value.nDMPeriMitral,
        aorticDiscBool: widget.formDR4Model?.value.nDMPeriAortic,
        tricuspidDiscBool: widget.formDR4Model?.value.nDMPeriTricuspid,
        pulmonaryDiscBool: widget.formDR4Model?.value.nDMPeriPulmonary,

       mitralVTBool: widget.formDR4Model?.value.vTPeriMitral,
        aorticVTBool: widget.formDR4Model?.value.vTPeriAortic,
        tricuspidVTBool: widget.formDR4Model?.value.vTPeriTricuspid,
        pulmonaryVTBool: widget.formDR4Model?.value.vTPeriPulmonary,

        meanMitralInitial: widget.formDR4Model?.value.mGPeriMitral.toString(),
        meanAorticInitial: widget.formDR4Model?.value.mGPeriAortic.toString(),
        meanTricuspidInitial: widget.formDR4Model?.value.mGPeriTricuspid.toString(),
        meanPulmonaryInitial: widget.formDR4Model?.value.mGPeriPulmonary.toString(),


        peakMitralInitial: widget.formDR4Model?.value.pGPeriMitral.toString(),
        peakAorticInitial: widget.formDR4Model?.value.pGPeriAortic.toString(),
        peakTricuspidInitial: widget.formDR4Model?.value.pGPeriTricuspid.toString(),
        peakPulmonaryInitial: widget.formDR4Model?.value.pGPeriPulmonary.toString(),

         normalDiscMitralInitial: widget.formDR4Model?.value.nDMPeriMitralSpecify.toString(),
        normalDiscAorticInitial: widget.formDR4Model?.value.nDMPeriAorticSpecify.toString(),
        normalDiscTricuspidInitial: widget.formDR4Model?.value.nDMPeriTricuspidSpecify.toString(),
        normalDiscPulmonaryInitial: widget.formDR4Model?.value.nDMPeriPulmonarySpecify.toString(),

        visibleThrombusMitralInitial: widget.formDR4Model?.value.vTPeriMitralSpecify.toString(),
        visibleThrombusAorticInitial: widget.formDR4Model?.value.vTPeriAorticSpecify.toString(),
        visibleThrombusTricuspidInitial: widget.formDR4Model?.value.vTPeriTricuspidSpecify.toString(),
        visibleThrombusPulmonaryInitial: widget.formDR4Model?.value.vTPeriPulmonarySpecify.toString(),

        mitralDiscBoolOnchange:(val){
          widget.formDR4Model?.value.nDMPeriMitral = val;
          setState(() {});
        },
        aorticDiscBoolOnchange:(val){
          widget.formDR4Model?.value.nDMPeriAortic = val;
          setState(() {});
        },
        tricuspidDiscBoolOnchange:(val){
          widget.formDR4Model?.value.nDMPeriTricuspid = val;
          setState(() {});
        },
        pulmonaryDiscBoolOnchange:(val){
          widget.formDR4Model?.value.nDMPeriPulmonary = val;
          setState(() {});
        },


        mitralVTBoolOnchange:(val){
          widget.formDR4Model?.value.vTPeriMitral = val;
          setState(() {});
        },
        aorticVTBoolOnchange:(val){
          widget.formDR4Model?.value.vTPeriAortic = val;
          setState(() {});
        },
        tricuspidVTBoolOnchange:(val){
          widget.formDR4Model?.value.vTPeriTricuspid = val;
          setState(() {});
        },
        pulmonaryVTBoolOnchange:(val){
          widget.formDR4Model?.value.vTPeriPulmonary = val;
          setState(() {});
        },

        meanMitralOnchange: (val){
          widget.formDR4Model?.value.mGPeriMitral = int.tryParse(val ?? '');
          setState(() {});
        },
        meanAorticOnchange: (val){
          widget.formDR4Model?.value.mGPeriAortic = int.tryParse(val ?? '');
          setState(() {});
        },
        meanTricuspidOnchange: (val){
          widget.formDR4Model?.value.mGPeriTricuspid = int.tryParse(val ?? '');
          setState(() {});
        },
        meanPulmonaryOnchange: (val){
          widget.formDR4Model?.value.mGPeriPulmonary = int.tryParse(val ?? '');
          setState(() {});
        },

        peakMitralOnchange: (val){
          widget.formDR4Model?.value.pGPeriMitral = int.tryParse(val ?? '');
          setState(() {});
        },
        peakAorticOnchange: (val){
          widget.formDR4Model?.value.pGPeriAortic = int.tryParse(val ?? '');
          setState(() {});
        },
        peakTricuspidOnchange: (val){
          widget.formDR4Model?.value.pGPeriTricuspid = int.tryParse(val ?? '');
          setState(() {});
        },
        peakPulmonaryOnchange: (val){
          widget.formDR4Model?.value.pGPeriPulmonary = int.tryParse(val ?? '');
          setState(() {});
        },

        normalDiscMitralOnchange: (val){
          widget.formDR4Model?.value.nDMPeriMitralSpecify = val;
          setState(() {});
        },
        normalDiscAorticOnchange: (val){
          widget.formDR4Model?.value.nDMPeriAorticSpecify = val;
          setState(() {});
        },
        normalDiscTricuspidOnchange: (val){
          widget.formDR4Model?.value.nDMPeriTricuspidSpecify = val;
          setState(() {});
        },
        normalDiscPulmonaryOnchange: (val){
          widget.formDR4Model?.value.nDMPeriPulmonarySpecify = val;
          setState(() {});
        },


        visibleThrombusMitralOnchange: (val){
          widget.formDR4Model?.value.vTPeriMitralSpecify = val;
          setState(() {});
        },
        visibleThrombusAorticOnchange: (val){
          widget.formDR4Model?.value.vTPeriAorticSpecify = val;
          setState(() {});
        },
        visibleThrombusTricuspidOnchange: (val){
          widget.formDR4Model?.value.vTPeriTricuspidSpecify = val;
          setState(() {});
        },
        visibleThrombusPulmonaryOnchange: (val){
          widget.formDR4Model?.value.vTPeriPulmonarySpecify = val;
          setState(() {});
        },


      ),

      // MSmallText(text: 'D7.1 Mean gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.2 Peak gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.3 Normal disc movement (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.4 Visible thrombus (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),

      MText(text: 'Post Natal',),
      Space(),
      valveD7(
        key: ValueKey('bool value Post Natal ${widget.formDR4Model?.value.mitral},${widget.formDR4Model?.value.aortic},${widget.formDR4Model?.value.tricuspid},${widget.formDR4Model?.value.pulmonary}'),

        isEnabled:widget.isEnabled,
        mitralBool: widget.formDR4Model?.value.mitral,
        aorticBool: widget.formDR4Model?.value.aortic,
        tricuspidBool: widget.formDR4Model?.value.tricuspid,
        pulmonaryBool: widget.formDR4Model?.value.pulmonary,
        result: (val){
          (val?? []).contains('Mitral') ? widget.formDR4Model?.value.mitral = true : widget.formDR4Model?.value.mitral = false;
          (val?? []).contains('Aortic') ? widget.formDR4Model?.value.aortic = true : widget.formDR4Model?.value.aortic = false;
          (val?? []).contains('Tricuspid') ? widget.formDR4Model?.value.tricuspid = true : widget.formDR4Model?.value.tricuspid = false;
          (val?? []).contains('Pulmonary') ? widget.formDR4Model?.value.pulmonary = true : widget.formDR4Model?.value.pulmonary = false;
        },
        mitralDiscBool: widget.formDR4Model?.value.nDMPNMitral,
        aorticDiscBool: widget.formDR4Model?.value.nDMPNAortic,
        tricuspidDiscBool: widget.formDR4Model?.value.nDMPNTricuspid,
        pulmonaryDiscBool: widget.formDR4Model?.value.nDMPNPulmonary,

        mitralVTBool: widget.formDR4Model?.value.vTPNMitral,
        aorticVTBool: widget.formDR4Model?.value.vTPNAortic,
        tricuspidVTBool: widget.formDR4Model?.value.vTPNTricuspid,
        pulmonaryVTBool: widget.formDR4Model?.value.vTPNPulmonary,

        meanMitralInitial: widget.formDR4Model?.value.mGPNMitral.toString(),
         meanAorticInitial: widget.formDR4Model?.value.mGPNMitral.toString(),
         meanTricuspidInitial: widget.formDR4Model?.value.mGPNTricuspid.toString(),
         meanPulmonaryInitial: widget.formDR4Model?.value.mGPNPulmonary.toString(),

        peakMitralInitial: widget.formDR4Model?.value.pGPNMitral.toString(),
        peakAorticInitial: widget.formDR4Model?.value.pGPNMitral.toString(),
        peakTricuspidInitial: widget.formDR4Model?.value.pGPNTricuspid.toString(),
        peakPulmonaryInitial: widget.formDR4Model?.value.pGPNPulmonary.toString(),

        normalDiscMitralInitial: widget.formDR4Model?.value.nDMPNMitralSpecify.toString(),
        normalDiscAorticInitial: widget.formDR4Model?.value.nDMPNAorticSpecify.toString(),
        normalDiscTricuspidInitial: widget.formDR4Model?.value.nDMPNTricuspidSpecify.toString(),
        normalDiscPulmonaryInitial: widget.formDR4Model?.value.nDMPNPulmonarySpecify.toString(),

        visibleThrombusMitralInitial: widget.formDR4Model?.value.vTPNMitralSpecify.toString(),
        visibleThrombusAorticInitial: widget.formDR4Model?.value.vTPNAorticSpecify.toString(),
        visibleThrombusTricuspidInitial: widget.formDR4Model?.value.vTPNTricuspidSpecify.toString(),
        visibleThrombusPulmonaryInitial: widget.formDR4Model?.value.vTPNPulmonarySpecify.toString(),

        mitralDiscBoolOnchange: (val){
          widget.formDR4Model?.value.nDMPNMitral = val;
          setState(() {});
        },
        aorticDiscBoolOnchange: (val){
          widget.formDR4Model?.value.nDMPNAortic = val;
          setState(() {});
        },
        tricuspidDiscBoolOnchange: (val){
          widget.formDR4Model?.value.nDMPNTricuspid = val;
          setState(() {});
        },
        pulmonaryDiscBoolOnchange: (val){
          widget.formDR4Model?.value.nDMPNPulmonary = val;
          setState(() {});
        },

        mitralVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTPNMitral = val;
          setState(() {});
        },
        aorticVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTPNAortic = val;
          setState(() {});
        },
        tricuspidVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTPNTricuspid = val;
          setState(() {});
        },
        pulmonaryVTBoolOnchange: (val){
          widget.formDR4Model?.value.vTPNPulmonary = val;
          setState(() {});
        },

        meanMitralOnchange: (val){
          widget.formDR4Model?.value.mGPNMitral = int.tryParse(val ?? '');
          setState(() {});
        },
         meanAorticOnchange: (val){
          widget.formDR4Model?.value.mGPNMitral = int.tryParse(val ?? '');
          setState(() {});
         },
         meanTricuspidOnchange: (val){
          widget.formDR4Model?.value.mGPNTricuspid = int.tryParse(val ?? '');
          setState(() {});
         },
         meanPulmonaryOnchange: (val){
          widget.formDR4Model?.value.mGPNPulmonary = int.tryParse(val ?? '');
          setState(() {});
         },

        peakMitralOnchange: (val){
          widget.formDR4Model?.value.pGPNMitral = int.tryParse(val ?? '');
          setState(() {});
        },
        peakAorticOnchange: (val){
          widget.formDR4Model?.value.pGPNMitral = int.tryParse(val ?? '');
          setState(() {});
        },
        peakTricuspidOnchange: (val){
          widget.formDR4Model?.value.pGPNTricuspid = int.tryParse(val ?? '');
          setState(() {});
        },
        peakPulmonaryOnchange: (val){
          widget.formDR4Model?.value.pGPNPulmonary = int.tryParse(val ?? '');
          setState(() {});
        },

        normalDiscMitralOnchange: (val){
          widget.formDR4Model?.value.nDMPNMitralSpecify = val;
          setState(() {});
        },
        normalDiscAorticOnchange: (val){
          widget.formDR4Model?.value.nDMPNAorticSpecify = val;
          setState(() {});
        },
        normalDiscTricuspidOnchange: (val){
          widget.formDR4Model?.value.nDMPNTricuspidSpecify = val;
          setState(() {});
        },
        normalDiscPulmonaryOnchange: (val){
          widget.formDR4Model?.value.nDMPNPulmonarySpecify = val;
          setState(() {});
        },

        visibleThrombusMitralOnchange: (val){
          widget.formDR4Model?.value.vTPNMitralSpecify = val;
          setState(() {});
        },
        visibleThrombusAorticOnchange: (val){
          widget.formDR4Model?.value.vTPNAorticSpecify = val;
          setState(() {});
        },
        visibleThrombusTricuspidOnchange: (val){
          widget.formDR4Model?.value.vTPNTricuspidSpecify = val;
          setState(() {});
        },
        visibleThrombusPulmonaryOnchange: (val){
          widget.formDR4Model?.value.vTPNPulmonarySpecify = val;
          setState(() {});
        },

      ),

      // MSmallText(text: 'D7.1 Mean gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.2 Peak gradient (mmHg)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.3 Normal disc movement (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      // MSmallText(text: 'D7.4 Visible thrombus (Yes/No)',),
      // Space(),
      // TwoTextFields(isEnabled:widget.isEnabled,type1: MInputType.numeric,type2: MInputType.numeric,onChange1: (val){},onChange2: (val){},),
      MrowTextTextFieldWidget(title: 'Other relevant echo findings:',initialValue: widget.formDR4Model?.value.otherRelevantEchoFindings,onChanged: (val){
        widget.formDR4Model?.value.otherRelevantEchoFindings = val;
      },type: MInputType.text,),
     // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormD5);},)
    ],);
  }
}
