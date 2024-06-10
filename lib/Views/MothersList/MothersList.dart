import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/Table%20Json/TestList.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/theme_utils.dart';

class MothersList extends StatefulWidget {
  const MothersList({super.key});

  @override
  State<MothersList> createState() => _MothersListState();
}

class _MothersListState extends State<MothersList> {
  List<String> motherList = [];
  @override
  void initState() {
    motherList = List.from(TestList.motherList);
    super.initState();
  }
  void search(String query){
    query = query.trim();
    if(query.isEmpty){
      setState(() {
        motherList.clear();
        motherList.addAll(TestList.motherList);
      });
      return;
    }
    setState(() {
      motherList =TestList.motherList.where((e) => e.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MScaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: context.primary,),
          child: IconButton(onPressed: (){context.push(Routes.Form3One);}, icon: Icon(Icons.add),color: Colors.white,)),
      body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
          MText(text: 'Mothers List',),
          Space(),
          MTextField(label: 'search by name or id',onChanged: (val){search(val);},autoFocus: false,),
          Expanded(
            child: ListView(
              children: motherList.map((e) {
                return  Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e ?? 'Name'),
                            Text('Id'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Phone'),
                            Text('Age'),
                          ],
                        ),
                      ],),
                  ),);
              }
              ).toList(),
            ),
          )
        ],),
      ),
    ),);
  }
}
// Card(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text('Name'),
// Text('Id'),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text('Phone'),
// Text('Age'),
// ],
// ),
// ],),
// ),)