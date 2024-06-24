import 'package:flutter/cupertino.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/navigator_utils.dart';

class FormD6 extends StatefulWidget {
  const FormD6({super.key});

  @override
  State<FormD6> createState() => _FormD6State();
}

class _FormD6State extends State<FormD6> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        MText(text: 'D9. AORTOPATHY ECHO PAGE',),
        Space(),
        MRowTextCheckBox(title: 'Aorta',result: (val){},list: ['Dilated','Aneurysm  ','Coarctation','Stenotic','Others'],isneedDivider: false,),
        MTextField(label: 'Details',onChanged: (val){},),
        MDivider(),
        Space(),
        MText(text: 'Aortic Dimensions',),
        Space(),
        Text('Annulus'),
        Space(),
        MrowTextTextFieldWidget(title: '1st Trimester',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: '2nd Trimester',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: '3rd Trimester',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: 'PERIPARTUM',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: 'PN',onChanged: (val){},),

        Space(),
        Text('Sinus'),
        Space(),
        MrowTextTextFieldWidget(title: '1st Trimester',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: '2nd Trimester',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: '3rd Trimester',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: 'PERIPARTUM',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: 'PN',onChanged: (val){},),

        Space(),
        Text('STJ'),
        Space(),
        MrowTextTextFieldWidget(title: '1st Trimester',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: '2nd Trimester',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: '3rd Trimester',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: 'PERIPARTUM',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: 'PN',onChanged: (val){},),

        Space(),
        Text('Asc Aorta'),
        Space(),
        MrowTextTextFieldWidget(title: '1st Trimester',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: '2nd Trimester',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: '3rd Trimester',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: 'PERIPARTUM',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: 'PN',onChanged: (val){},),

        Space(),
        Text('Arch'),
        Space(),
        MrowTextTextFieldWidget(title: '1st Trimester',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: '2nd Trimester',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: '3rd Trimester',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: 'PERIPARTUM',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: 'PN',onChanged: (val){},),

        Space(),
        Text('Desc thoracic aorta'),
        Space(),
        MrowTextTextFieldWidget(title: '1st Trimester',onChanged: (val){},isneedDivider: false,),
        MrowTextTextFieldWidget(title: '2nd Trimester',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: '3rd Trimester',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: 'PERIPARTUM',onChanged: (val){},isneedDivider: false),
        MrowTextTextFieldWidget(title: 'PN',onChanged: (val){},),

        MrowTextTextFieldWidget( title: 'Other relevant echo findings:',onChanged: (val){}),
       // MFilledButton(text: 'Next',onPressed: (){context.push(Routes.FormD7);}),
      ],);
  }
}
