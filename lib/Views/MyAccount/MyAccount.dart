import 'package:flutter/material.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/theme_utils.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return MScaffold(
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
      body: SafeArea(child: Column(children: [

      ],),),
    );
  }
}
