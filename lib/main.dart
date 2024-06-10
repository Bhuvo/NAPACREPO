import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/Route/routes.dart';
import 'package:npac/app/app_scroll.dart';
import 'package:npac/theme/theme.dart';
import 'package:npac/Route/router.dart';
import 'package:npac/utils/navigator_utils.dart';
import 'package:npac/widgets/loading_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NPAC',
      scrollBehavior: const ScrollBehaviorModified(),
      debugShowCheckedModeBanner: false,
      theme: MTheme.lightTheme,
      darkTheme: MTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Routes.splash,
      onGenerateRoute: MRouter.onGenerateRoute,
    );
  }
}

class spalshScreen extends StatefulWidget {
  const spalshScreen({super.key});

  @override
  State<spalshScreen> createState() => _spalshScreenState();
}

class _spalshScreenState extends State<spalshScreen> {
  void load() async {
    ///Fake load
    await Future.delayed(const Duration(seconds: 1));
      context.push(Routes.login);
  }

  @override
  void initState() {
    load();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: LoadingWidget(),);
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
