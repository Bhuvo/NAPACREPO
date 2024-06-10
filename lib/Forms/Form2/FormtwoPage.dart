import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MAppBar.dart';
import 'package:npac/common_widget/MTextField.dart';
import 'package:npac/common_widget/MrowTextDatePicker.dart';
import 'package:npac/common_widget/MrowTextOptionPickerwidget.dart';
import 'package:npac/common_widget/MrowTextTextfieldWidget.dart';
import 'package:npac/widgets/m_scaffold.dart';
import 'package:npac/widgets/space.dart';

class FormTwoPage extends StatefulWidget {
  const FormTwoPage({super.key});

  @override
  State<FormTwoPage> createState() => _FormTwoPageState();
}

class _FormTwoPageState extends State<FormTwoPage> {
  bool isExpanded = false;
  List<String> item =['Home Maker','Manual Labour','Semi-skilled Labourer','Professional','Other'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MScaffold(
      appBar:PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MAppBar(title: 'BASELINE DATA- IDENTIFIER PAGE (FORM B)',)),
    body: ListView  (
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('For all patients (Tick theapplicable)'),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          icon: isExpanded
                              ? Icon(Icons.keyboard_arrow_up_rounded)
                              : Icon(Icons.keyboard_arrow_down_rounded))
                    ],
                  ),
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                     children: [
                       MrowTextTextFieldWidget(title: 'B1. Hospital/PIN number:',initialValue: '2344', onChanged: (val){}),
                       MrowTextTextFieldWidget(title: 'B2. Full name of the patient:',initialValue: '8687788', onChanged: (val){}),
                       MrowTextTextFieldWidget(title: 'B3. Name of the Husband/Guardian:',initialValue: 'Gobal',onChanged: (val){}),
                       MrowTextTextFieldWidget(title: 'B4. Age',initialValue: '23',onChanged:(val){} ,type: MInputType.numeric,),
                       MrowTextDatePickerWidget(title: 'B5. DOB:',initialDate: DateTime.now(),onChanged: (val){},),
                       MrowTextTextFieldWidget(title: 'B6. House/Flat name or number:',initialValue: 'flat 34',onChanged: (val){},),
                       MrowTextTextFieldWidget(title: 'B8. District',initialValue: 'Chennai',onChanged: (val){},),
                       MrowTextTextFieldWidget(title: 'B9. State:',initialValue: 'TamilNadu',onChanged: (val){},),
                       MrowTextTextFieldWidget(title: 'B10. Pin code',initialValue: '600001',onChanged: (val){},type: MInputType.numeric,),
                       MrowTextTextFieldWidget(title: 'B11. Village/city/town:',initialValue: 'Chennai',onChanged: (val){},),
                       MrowTextTextFieldWidget(title: 'B12. Patient’s mobile number: ',initialValue: '787565657',onChanged: (val){},type: MInputType.numeric,),
                       MrowTextTextFieldWidget(title: 'B14. Alternate mobile number to contact (relative) (10 digit):',initialValue: '787565657',onChanged: (val){},type: MInputType.numeric,),
                       MrowTextTextFieldWidget(title: 'B14. Name of the contact person/VNH/Asha worker: ',initialValue: 'bhuvan',onChanged: (val){},),
                       MrowTextTextFieldWidget(title: 'B14. Relationship: ',initialValue: 'friend',onChanged: (val){},),
                       MrowTextTextFieldWidget(title: 'B13.Patient’s alternate number:',initialValue: '787565657',onChanged: (val){},type: MInputType.numeric,),
                       MrowTextTextFieldWidget(title: 'B15 Total number of years of formal education:', initialValue: '33', onChanged: (val){},type: MInputType.numeric,),
                       MrowTextOptionPickerwidget(title: 'B16 Occupation of patient: ',initialvalue: 'Home Maker',options:item,onChanged:(val){},),
                       MrowTextTextFieldWidget(title: 'B17 Total number of years of formal education of husband: (Zero for Illiterates) ', initialValue: '33', onChanged: (val){},type: MInputType.numeric,),
                       MrowTextOptionPickerwidget(title: 'B18 Occupation of husband : ',initialvalue: 'Home Maker',options:item,onChanged:(val){},),
                       MrowTextOptionPickerwidget(title: 'B19 Socio-economic status: ',initialvalue: 'Home Maker',options:['Above poverty line ', 'Below poverty line'],onChanged:(val){},),
                       MrowTextTextFieldWidget(title: 'B20. Mention any additional details: ',initialValue: 'No',onChanged: (val){},),
                      Space(20),
                       FilledButton(onPressed: (){context.push(Routes.Home);}, child: Text('Submit'))
                       ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),

    ));
  }
}
