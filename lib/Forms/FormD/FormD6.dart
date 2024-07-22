import 'package:flutter/cupertino.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MSmallText.dart';
import 'package:npac/utils/navigator_utils.dart';

class FormD6 extends StatefulWidget {
    final bool? isEnabled;
    const FormD6({super.key, this.isEnabled});

  @override
  State<FormD6> createState() => _FormD6State();
}

class _FormD6State extends State<FormD6> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MText(text: 'D9. AORTOPATHY ECHO PAGE',),
        Space(),
        MRowTextCheckBox(enabled :widget.isEnabled,title: 'D9.1 Aorta',result: (val){},list: ['Dilated','Aneurysm  ','Coarctation','Stenotic','Others'],isneedDivider: false,),
        MTextField(enabled :widget.isEnabled,label: 'Details',onChanged: (val){},),
        MRowTextRadioWidget(enabled :widget.isEnabled,title: 'Location of abnormality:',onChanged: (val){},options: ['Ascending aorta','Aortic arch','Descending Aorta','Aortic Root','Abdominal Aorta'],),
        Space(),
        MSmallText(text: 'Aortic Dimensions',),
        Space(),
        MSmallText(text: 'First Visit',),
        Space(),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.2 Annulus',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.3 Aortic Sinus',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.4 ST Junction',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.5 Asc Aorta',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.6 Arch of Aorta',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.7 Desc thoracic aorta',onChanged: (val){},),

        Space(),
        MSmallText(text: 'AN Revisit 1',),
        Space(),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.2 Annulus',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.3 Aortic Sinus',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.4 ST Junction',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.5 Asc Aorta',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.6 Arch of Aorta',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.7 Desc thoracic aorta',onChanged: (val){},),

        Space(),
        MSmallText(text: 'AN Revisit 2',),
        Space(),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.2 Annulus',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.3 Aortic Sinus',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.4 ST Junction',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.5 Asc Aorta',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.6 Arch of Aorta',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.7 Desc thoracic aorta',onChanged: (val){},),

        Space(),
        MSmallText(text: 'Peripartum',),
        Space(),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.2 Annulus',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.3 Aortic Sinus',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.4 ST Junction',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.5 Asc Aorta',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.6 Arch of Aorta',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.7 Desc thoracic aorta',onChanged: (val){},),

        Space(),
        MSmallText(text: 'PN Revisit 1',),
        Space(),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.2 Annulus',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.3 Aortic Sinus',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.4 ST Junction',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.5 Asc Aorta',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.6 Arch of Aorta',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.7 Desc thoracic aorta',onChanged: (val){},),
        Space(),

        Space(),
        MSmallText(text: 'PN Revisit 2',),
        Space(),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.2 Annulus',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.3 Aortic Sinus',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.4 ST Junction',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.5 Asc Aorta',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.6 Arch of Aorta',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(enabled :widget.isEnabled,title: 'D9.7 Desc thoracic aorta',onChanged: (val){},),
        Space(),

        MSmallText(text: 'Other relevant echo findings:',),
        Space(),
        MFilledButton(text: 'Add Echo',onPressed: (){}),

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
