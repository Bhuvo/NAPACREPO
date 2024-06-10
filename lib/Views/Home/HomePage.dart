import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/app/export.dart';
import 'package:npac/common_widget/MSmallText.dart';
import 'package:npac/utils/theme_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      // bottomNavigationBar: CircleNavBar(
      //   onTap: (val){
      //     setState(() {
      //       index = val;
      //     });
      //   },
      //   activeIcons:  [
      //     Icon(Icons.person, color: context.primary),
      //     Icon(Icons.home, color: context.primary),
      //     Icon(Icons.favorite, color: context.primary),
      //   ],
      //   inactiveIcons: [
      //     Icon(Icons.person, color:  Colors.red.shade100.withOpacity(1)),
      //     Icon(Icons.home, color:  Colors.red.shade100.withOpacity(1)),
      //     Icon(Icons.favorite, color:  Colors.red.shade100.withOpacity(1)),
      //   ],
      //   color: Colors.white,
      //   circleColor: Colors.red.shade100.withOpacity(1),
      //   height: 60,
      //   circleWidth: 60,
      //
      //   // tabCurve: ,
      //   padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      //   cornerRadius: const BorderRadius.only(
      //     topLeft: Radius.circular(8),
      //     topRight: Radius.circular(8),
      //     bottomRight: Radius.circular(24),
      //     bottomLeft: Radius.circular(24),
      //   ),
      //   shadowColor: context.primary,
      //   circleShadowColor: context.primary,
      //   elevation: 10,
      //   // gradient: LinearGradient(
      //   //   begin: Alignment.topRight,
      //   //   end: Alignment.bottomLeft,
      //   //   colors: [ Colors.blue, Colors.red ],
      //   // ),
      //   // circleGradient: LinearGradient(
      //   //   begin: Alignment.topRight,
      //   //   end: Alignment.bottomLeft,
      //   //   colors: [ Colors.blue, Colors.red ],
      //   // ),
      //   activeIndex: index,tabDurationMillSec:  1000,
      // ),
      appBar: AppBar(
        backgroundColor:context.primary,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          MText(fontSize: 18,text: 'user Name',color: Colors.white),
          Row(
            children: [
              MText(text: 'user Name',fontWeight:FontWeight.normal,color: Colors.white,),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down),color: Colors.white)
            ],
          ),
          ],),
        ),
     actions: [IconButton(onPressed: (){context.push(Routes.EditProfile);}, icon: Icon(Icons.person),color: Colors.white),],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              InkWell(
                hoverColor: Colors.transparent,
                onTap: (){context.push(Routes.MothersList);},
                child: Card(child: Column( mainAxisAlignment: MainAxisAlignment.center,children: [
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Mothers List'),
                  Icon(Icons.handshake_outlined),
                ],
                            )
                ],),),
              ),
              InkWell(
                hoverColor: Colors.transparent,
                onTap: (){context.push(Routes.Form3One);},
                child: Card(child: Column( mainAxisAlignment: MainAxisAlignment.center,children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Add Mother'),
                      Icon(Icons.add),
                    ],
                  )
                ],),),
              )
            ],
            ),
            MText(text: 'Forms By sections',),
          Space(),
          FilledButton(onPressed: (){context.push(Routes.Form1);}, child: Text('Form A')),
          Space(),
          FilledButton(onPressed: (){context.push(Routes.Form2);}, child: Text('Form B')),
          Space(),
          FilledButton(onPressed: (){context.push(Routes.Form3One);}, child: Text('Form C')),
          Space(),
          FilledButton(onPressed: (){context.push(Routes.FormD1);}, child: Text('Form D')),
          Space(),
          FilledButton(onPressed: (){context.push(Routes.FormE1);}, child: Text('Form E')),
          Space(),
          FilledButton(onPressed: (){context.push(Routes.FormF1);}, child: Text('Form F')),
          Space(),
          FilledButton(onPressed: (){context.push(Routes.FormG1);}, child: Text('Form G')),
          Space(),
          FilledButton(onPressed: (){context.push(Routes.FormH1);}, child: Text('Form H')),
            Space(),
            FilledButton(onPressed: (){context.push(Routes.FormI1);}, child: Text('Form I')),
            Space(),
            FilledButton(onPressed: (){context.push(Routes.FormJ1);}, child: Text('Form J')),
            Space(),
            FilledButton(onPressed: (){context.push(Routes.FormK1);}, child: Text('Form K')),
            Space(),
            FilledButton(onPressed: (){context.push(Routes.FormL1);}, child: Text('Form L')),
            Space(),
            FilledButton(onPressed: (){context.push(Routes.FormM1);}, child: Text('Form M')),
            Space(),
            FilledButton(onPressed: (){context.push(Routes.FormN1);}, child: Text('Form N')),
            Space(80),
        ],),
      ),
    );
  }
}
