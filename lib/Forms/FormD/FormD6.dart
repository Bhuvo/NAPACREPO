import 'package:flutter/cupertino.dart';
import 'package:npac/Forms/FormD/Model/FormD6Model.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MSmallText.dart';
import 'package:npac/utils/navigator_utils.dart';

class FormD6 extends StatefulWidget {
    final bool? isEnabled;
    final Rx<FormD6Model>? formD6Model;
    const FormD6({super.key, this.isEnabled, this.formD6Model});

  @override
  State<FormD6> createState() => _FormD6State();
}

class _FormD6State extends State<FormD6> {

    List<String> aortaSelectedList = [];

    @override
  void initState() {
   widget.formD6Model?.value.dilated ?? false ? aortaSelectedList.add('Dilated') : null;
   widget.formD6Model?.value.aneurysm ?? false ? aortaSelectedList.add('Aneurysm') : null;
   widget.formD6Model?.value.coarctation ?? false ? aortaSelectedList.add('Coarctation') : null;
   widget.formD6Model?.value.stenosis ?? false ? aortaSelectedList.add('Stenotic') : null;
   widget.formD6Model?.value.dissection ?? false ? aortaSelectedList.add('Dissection') : null;
   widget.formD6Model?.value.aortaOthers ?? false ? aortaSelectedList.add('Others') : null;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MText(text: 'D9. AORTOPATHY ECHO PAGE',),
        Space(),
        MRowTextCheckBox(enabled :widget.isEnabled,title: 'D9.1 Aorta',selectedlist: aortaSelectedList,result: (val){
            val.contains('Dilated') ? widget.formD6Model?.value.dilated = true : widget.formD6Model?.value.dilated = false;
            val.contains('Aneurysm') ? widget.formD6Model?.value.aneurysm = true : widget.formD6Model?.value.aneurysm = false;
            val.contains('Coarctation') ? widget.formD6Model?.value.coarctation = true : widget.formD6Model?.value.coarctation = false;
            val.contains('Stenotic') ? widget.formD6Model?.value.stenosis = true : widget.formD6Model?.value.stenosis = false;
            val.contains('Others') ? widget.formD6Model?.value.aortaOthers = true : widget.formD6Model?.value.aortaOthers = false;
            // aortaSelectedList = val;

        },list: ['Dilated','Aneurysm','Coarctation','Stenotic','Others'],isneedDivider: false,),
        widget.formD6Model?.value.aortaOthers ?? false ?MTextField(label: 'If Others Specify',initalValue: widget.formD6Model?.value.aortaOthersSpecify,enabled:widget.isEnabled,onChanged: (val){
            widget.formD6Model?.value.aortaOthersSpecify = val;
        },) : Container(),
        MRowTextRadioWidget(enabled :widget.isEnabled,title: 'Location of abnormality:',initialValue: widget.formD6Model?.value.locationOfAbnormality,onChanged: (val){
            widget.formD6Model?.value.locationOfAbnormality = val;
        },options: ['Aortic Root','Ascending aorta','Aortic arch','Descending Aorta','Abdominal Aorta'],),
        MTextField(enabled :widget.isEnabled,label: 'Additional Details of abnormality',initalValue: widget.formD6Model?.value.detailsOfAbnormality,onChanged: (val){
            widget.formD6Model?.value.detailsOfAbnormality = val;
        },),
        Space(),
        MSmallText(text: 'Aortic Dimensions',),
        Space(),
        MSmallText(text: 'First Visit',),
        Space(),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,initialValue: widget.formD6Model?.value.annulus1Visit.toString(),title: 'D9.2 Annulus',onChanged: (val){
            widget.formD6Model?.value.annulus1Visit = num.tryParse(val ??'');
        },isneedDivider: false,),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.3 Aortic Sinus',initialValue: widget.formD6Model?.value.aorticSinus1Visit.toString(),onChanged: (val){
            widget.formD6Model?.value.aorticSinus1Visit = num.tryParse(val);
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.4 ST Junction',initialValue: widget.formD6Model?.value.sTJunction1Visit.toString(),onChanged: (val){
            widget.formD6Model?.value.sTJunction1Visit = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.5 Asc Aorta',initialValue: widget.formD6Model?.value.ascAorta1Visit.toString(),onChanged: (val){
            widget.formD6Model?.value.ascAorta1Visit = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.6 Arch of Aorta',initialValue: widget.formD6Model?.value.archAorta1Visit.toString(),onChanged: (val){
            widget.formD6Model?.value.archAorta1Visit = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.7 Desc thoracic aorta',initialValue: widget.formD6Model?.value.thoracicAorta1Visit.toString(),onChanged: (val){
            widget.formD6Model?.value.thoracicAorta1Visit = num.tryParse(val ??'');
        },),

        Space(),
        MSmallText(text: 'AN Revisit 1',),
        Space(),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,initialValue: widget.formD6Model?.value.annulusANrevisit1.toString(),title: 'D9.2 Annulus',onChanged: (val){
            widget.formD6Model?.value.annulusANrevisit1 = num.tryParse(val ??'');
        },isneedDivider: false,),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.3 Aortic Sinus',initialValue:widget.formD6Model?.value.aorticSinusANrevisit1.toString(),onChanged: (val){
            widget.formD6Model?.value.aorticSinusANrevisit1 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,initialValue: widget.formD6Model?.value.sTJunctionANrevisit1.toString(),title: 'D9.4 ST Junction',onChanged: (val){
            widget.formD6Model?.value.sTJunctionANrevisit1 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,initialValue: widget.formD6Model?.value.ascAortaANrevisit1.toString(),title: 'D9.5 Asc Aorta',onChanged: (val){
            widget.formD6Model?.value.ascAortaANrevisit1 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.6 Arch of Aorta',initialValue: widget.formD6Model?.value.archAortaANrevisit1.toString(),onChanged: (val){
            widget.formD6Model?.value.archAortaANrevisit1 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.7 Desc thoracic aorta',initialValue: widget.formD6Model?.value.thoracicAortaANrevisit1.toString(),onChanged: (val){
            widget.formD6Model?.value.thoracicAortaANrevisit1 = num.tryParse(val ??'');
        },),

        Space(),
        MSmallText(text: 'AN Revisit 2',),
        Space(),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.2 Annulus',initialValue: widget.formD6Model?.value.annulusANrevisit2.toString(),onChanged: (val){
            widget.formD6Model?.value.annulusANrevisit2 = num.tryParse(val ??'');
        },isneedDivider: false,),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.3 Aortic Sinus',initialValue: widget.formD6Model?.value.aorticSinusANrevisit2.toString(),onChanged: (val){
            widget.formD6Model?.value.aorticSinusANrevisit2 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.4 ST Junction',initialValue: widget.formD6Model?.value.sTJunctionANrevisit2.toString(),onChanged: (val){
            widget.formD6Model?.value.sTJunctionANrevisit2 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.5 Asc Aorta',initialValue: widget.formD6Model?.value.ascAortaANrevisit2.toString(),onChanged: (val){
            widget.formD6Model?.value.ascAortaANrevisit2 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.6 Arch of Aorta',initialValue: widget.formD6Model?.value.archAortaANrevisit2.toString(),onChanged: (val){
            widget.formD6Model?.value.archAortaANrevisit2 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.7 Desc thoracic aorta',initialValue: widget.formD6Model?.value.thoracicAortaANrevisit2.toString(),onChanged: (val){
            widget.formD6Model?.value.thoracicAortaANrevisit2 = num.tryParse(val ??'');
        },),

        Space(),
        MSmallText(text: 'Peripartum',),
        Space(),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.2 Annulus',initialValue: widget.formD6Model?.value.annulusPeripartum.toString(),onChanged: (val){
            widget.formD6Model?.value.annulusPeripartum = num.tryParse(val ??'');
        },isneedDivider: false,),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.3 Aortic Sinus',initialValue: widget.formD6Model?.value.aorticSinusPeripartum.toString(),onChanged: (val){
            widget.formD6Model?.value.aorticSinusPeripartum = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.4 ST Junction',initialValue: widget.formD6Model?.value.sTJunctionPeripartum.toString(),onChanged: (val){
            widget.formD6Model?.value.sTJunctionPeripartum = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.5 Asc Aorta',initialValue:widget.formD6Model?.value.ascAortaPeripartum.toString(),onChanged: (val){
            widget.formD6Model?.value.ascAortaPeripartum = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.6 Arch of Aorta',initialValue: widget.formD6Model?.value.archAortaPeripartum.toString(),onChanged: (val){
            widget.formD6Model?.value.archAortaPeripartum = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.7 Desc thoracic aorta',initialValue: widget.formD6Model?.value.thoracicAortaPeripartum.toString(),onChanged: (val){
            widget.formD6Model?.value.thoracicAortaPeripartum = num.tryParse(val ??'');
        },),

        Space(),
        MSmallText(text: 'PN Revisit 1',),
        Space(),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.2 Annulus',initialValue: widget.formD6Model?.value.annulusFollowup1.toString(),onChanged: (val){
            widget.formD6Model?.value.annulusFollowup1 = num.tryParse(val ??'');
        },isneedDivider: false,),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.3 Aortic Sinus',initialValue:widget.formD6Model?.value.aorticSinusPeripartum.toString(),onChanged: (val){
            widget.formD6Model?.value.aorticSinusFollowup1 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.4 ST Junction',initialValue: widget.formD6Model?.value.sTJunctionFollowup1.toString(),onChanged: (val){
            widget.formD6Model?.value.sTJunctionFollowup1 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.5 Asc Aorta',initialValue: widget.formD6Model?.value.ascAortaFollowup1.toString(),onChanged: (val){
            widget.formD6Model?.value.ascAortaFollowup1 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.6 Arch of Aorta',initialValue: widget.formD6Model?.value.archAortaFollowup1.toString(),onChanged: (val){
            widget.formD6Model?.value.archAortaFollowup1 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.7 Desc thoracic aorta',initialValue: widget.formD6Model?.value.thoracicAortaFollowup1.toString(),onChanged: (val){
            widget.formD6Model?.value.thoracicAortaFollowup1 = num.tryParse(val ??'');
        },),
        Space(),

        Space(),
        MSmallText(text: 'PN Revisit 2',),
        Space(),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.2 Annulus',initialValue: widget.formD6Model?.value.annulusFollowup2.toString(),onChanged: (val){
            widget.formD6Model?.value.annulusFollowup2 = num.tryParse(val ??'');
        },isneedDivider: false,),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.3 Aortic Sinus',initialValue: widget.formD6Model?.value.aorticSinusFollowup2.toString(),onChanged: (val){
            widget.formD6Model?.value.aorticSinusFollowup2 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.4 ST Junction',initialValue: widget.formD6Model?.value.sTJunctionFollowup2.toString(),onChanged: (val){
            widget.formD6Model?.value.sTJunctionFollowup2 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.5 Asc Aorta',initialValue:widget.formD6Model?.value.ascAortaFollowup2.toString(),onChanged: (val){
            widget.formD6Model?.value.ascAortaFollowup2 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.6 Arch of Aorta',initialValue:widget.formD6Model?.value.archAortaFollowup2.toString(),onChanged: (val){
            widget.formD6Model?.value.archAortaFollowup2 = num.tryParse(val ??'');
        },isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.7 Desc thoracic aorta',initialValue: widget.formD6Model?.value.thoracicAortaFollowup2.toString(),onChanged: (val){
            widget.formD6Model?.value.thoracicAortaFollowup2 = num.tryParse(val ??'');
        },),
        // Space(),
        MRowTextRadioWidget(title: 'Other relevant echo findings:',initialValue: widget.formD6Model?.value.othersRelevantEchoFindings,onChanged: (val){
          widget.formD6Model?.value.othersRelevantEchoFindings = val;
        },),

        // Text('Desc thoracic aorta'),
        // Space(),
        // MrowTextTextFieldWidget(title: 'D9.2 Annulus',onChanged: (val){},isneedDivider: false,),
        // MrowTextTextFieldWidget(title: 'D9.3 Aortic Sinus',onChanged: (val){},isneedDivider: false),
        // MrowTextTextFieldWidget(title: 'D9.4 ST Junction',onChanged: (val){},isneedDivider: false),
        // MrowTextTextFieldWidget(title: 'D9.5 Asc Aorta',onChanged: (val){},isneedDivider: false),
        // MrowTextTextFieldWidget(title: 'D9.6 Arch of Aorta',onChanged: (val){},isneedDivider: false),
        // MrowTextTextFieldWidget(title: 'D9.7 Desc thoracic aorta',onChanged: (val){},),
      ],);
  }
}
