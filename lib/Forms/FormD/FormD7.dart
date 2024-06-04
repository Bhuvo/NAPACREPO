import 'package:flutter/cupertino.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/navigator_utils.dart';

class FormD7 extends StatefulWidget {
  const FormD7({super.key});

  @override
  State<FormD7> createState() => _FormD7State();
}

class _FormD7State extends State<FormD7> {
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar:  PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MAppBar(title: 'D. FIRST VISIT PAGE (FORM D)',)),

      body: MFormBody(
        Childrens: [
          MText(text: 'D10. CARDIOMYOPATHY/HEART FAILURE ECHO PAGE',),
          Space(),

          MText(text: 'PARAMETERS ',),
          Space(),
          Text('LVIDd/LVIDs'),
          Space(),
          MrowTextTextFieldWidget(title: '1st Trimester',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(title: '2nd Trimester',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: '3rd Trimester',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: 'PERIPARTUM',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: 'PN',onChanged: (val){},),

          Space(),
          Text('LVEF (%)'),
          Space(),
          MrowTextTextFieldWidget(title: '1st Trimester',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(title: '2nd Trimester',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: '3rd Trimester',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: 'PERIPARTUM',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: 'PN',onChanged: (val){},),

          Space(),
          Text('RV TAPSE (mm)'),
          Space(),
          MrowTextTextFieldWidget(title: '1st Trimester',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(title: '2nd Trimester',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: '3rd Trimester',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: 'PERIPARTUM',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: 'PN',onChanged: (val){},),

          Space(),
          Text('RV Sa’ (mm)'),
          Space(),
          MrowTextTextFieldWidget(title: '1st Trimester',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(title: '2nd Trimester',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: '3rd Trimester',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: 'PERIPARTUM',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: 'PN',onChanged: (val){},),

          Space(),
          Text('Others'),
          Space(),
          MrowTextTextFieldWidget(title: '1st Trimester',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(title: '2nd Trimester',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: '3rd Trimester',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: 'PERIPARTUM',onChanged: (val){},isneedDivider: false),
          MrowTextTextFieldWidget(title: 'PN',onChanged: (val){},),
          Space(),
          Text('LV Hypertrophy '),
          Space(),
          MrowTextTextFieldWidget(title: 'IVS (mm)',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(title: 'PW (mm)',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(title: 'SAM (mm)',onChanged: (val){},isneedDivider: false,),
          Text('LVOT gradient:'),
          Space(),
          MrowTextTextFieldWidget(title: 'Resting Gradient',onChanged: (val){},isneedDivider: false,),
          MrowTextTextFieldWidget(title: 'Provoked gradient:',onChanged: (val){},),
          MrowTextTextFieldWidget(title: 'Other relevant echo findings:',onChanged: (val){},),
          MFilledButton(text: 'Next',onPressed: (){ context.push(Routes.FormD8);}),

        ],
      ),
    );
  }
}
