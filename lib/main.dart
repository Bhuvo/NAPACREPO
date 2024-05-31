import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:npac/common_widget/radio_button_list.dart';
import 'package:npac/contoller/form1Controller.dart';
import 'package:npac/utils/theme_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool widget1 = false;
  String widget1String ='';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.primary,
        title: Center(child: Text('INCLUSION CRITERIA CHECKLIST (FORM A)')),
      ),
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
                      return   Column(
                        children: [
                          isExpanded
                              ? Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${controller.form.value.form1List![index].heading}'),
                              MRadioButtonList(options: controller.form.value.form1List![index].options,onChanged: (Stringvalue,boolvalue){
                                setState(() {
                                  widget1String = '';
                                });
                                setState(() {
                                  widget1 = boolvalue;
                                  widget1String = Stringvalue;
                                });
                              },selectedValue:widget1String ,),
                            ],
                          )
                              : Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${controller.form.value.form1List![index].heading} ${widget1String} '),
                              Checkbox(value: widget1, onChanged: (value) {}),
                            ],
                          ),
                        ],
                      );
                    },
                    ),

                    // Column(
                    //   children: [
                    //     isExpanded
                    //         ? Column(crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text('A7'),
                    //             MRadioButtonList(options: _options,onChanged: (Stringvalue,boolvalue){
                    //               setState(() {
                    //                 widget1String = '';
                    //               });
                    //               setState(() {
                    //                 widget1 = boolvalue;
                    //                 widget1String = Stringvalue;
                    //               });
                    //             },selectedValue:widget1String ,),
                    //           ],
                    //         )
                    //         : Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Text('A7. ${widget1String} '),
                    //               Checkbox(value: widget1, onChanged: (value) {}),
                    //             ],
                    //           ),
                    //     isExpanded ?  Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //       Text('A8. Heart disease as per inclusion criteria'),
                    //         MRadioButtonList(),
                    //     ],): Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text('A8. Heart disease as per inclusion criteria'),
                    //         Checkbox(value: true, onChanged: (value) {}),
                    //       ],
                    //     ),
                    //     isExpanded ?  Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text('A9. Consented for the study'),
                    //         MRadioButtonList(),
                    //       ],):   Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text('A9. Consented for the study'),
                    //         Checkbox(value: true, onChanged: (value) {}),
                    //       ],
                    //     ),
                    //   ],
                    // ),
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

// isExpanded ?  Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('A8. Heart disease as per inclusion criteria'),
//                               MRadioButtonList(),
//                             ],): Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('A8. Heart disease as per inclusion criteria'),
//                               Checkbox(value: true, onChanged: (value) {}),
//                             ],
//                           ),
//                           isExpanded ?  Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('A9. Consented for the study'),
//                               MRadioButtonList(),
//                             ],):   Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('A9. Consented for the study'),
//                               Checkbox(value: true, onChanged: (value) {}),
//                             ],
//                           ),




//Column(
//        children: [
//          Padding(
//            padding: const EdgeInsets.all(15),
//            child: Card(child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Column(
//                children: [
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: [
//                    Text('For all patients (Tick theapplicable)'),
//                    IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_up_rounded))
//                  ],
//                ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('A7. Antenatal '),
//                     Checkbox(value: true, onChanged: (value){}),
//                   ],
//                 ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text('A8. Heart disease as per inclusion criteria'),
//                      Checkbox(value: true, onChanged: (value){}),
//                    ],
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//                      Text('A9. Consented for the study'),
//                      Checkbox(value: true, onChanged: (value){}),
//                    ],
//                  ),
//              ],),
//            ),),
//          )
//        ],
//      )
