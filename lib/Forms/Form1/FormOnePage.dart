
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:npac/Forms/Form1/contoller/form1Controller.dart';
import 'package:npac/Forms/Form1/formOne.dart';
import 'package:npac/common_widget/MAppBar.dart';
import 'package:npac/common_widget/radio_button_list.dart';
import 'package:npac/utils/theme_utils.dart';

class FormOneUi extends StatefulWidget {
  const FormOneUi({super.key});

  @override
  State<FormOneUi> createState() => _FormOneUiState();
}

class _FormOneUiState extends State<FormOneUi> {

  bool isExpanded = false;
  final List<String> _options = ["Antenatal", "Post-partum (Up to 6 weeks)", "Postnatal (up to 5 months, only for peri-partum cardiomyopathy)"];

  form1Controller controller =Get.put(form1Controller());

  @override
  void initState() {
    controller.getForm1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: MAppBar(title: 'INCLUSION CRITERIA CHECKLIST (FORM A)',)),
      body: Column(
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
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.form.value.form1List!.length,itemBuilder: (context, index) {
                      return  FormOne(data: controller.form.value.form1List![index],isExpanded: isExpanded,);
                    },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}