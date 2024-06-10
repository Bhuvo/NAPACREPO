import 'package:flutter/material.dart';
import 'package:npac/app/export.dart';

class EditProfile extends StatelessWidget {
   EditProfile({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      appBar: MAppBar(title: 'Edit profile',),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key:  formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Space(40),
                  Center(child: Container(height: 100,width: 100,decoration: BoxDecoration(shape: BoxShape.circle,image: DecorationImage(image: NetworkImage('https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?auto=compress&cs=tinysrgb&w=600'),fit: BoxFit.cover ),)),),
                  Space(10),
                  MrowTextTextFieldWidget(title: 'Name',onChanged: (val){},type: MInputType.text,isneedDivider: false,),
                  Space(10),
                  MrowTextTextFieldWidget(title: 'ID',onChanged: (val){},type: MInputType.text,isneedDivider: false,),
                  Space(10),
                  MrowTextTextFieldWidget(title: 'Age',onChanged: (val){},type: MInputType.text,isneedDivider: false,),
                  Space(10),
                  MrowTextTextFieldWidget(title: 'Phone',onChanged: (val){},type: MInputType.phone,isneedDivider: false,),
                  Space(),
                  MFilledButton(text: 'Save',onPressed: (){
                   if(formKey.currentState!.validate()){
                     print('done');
                   }
                  }),
              
                ],),
            ),
          ),
        ),),
    );
  }
}
