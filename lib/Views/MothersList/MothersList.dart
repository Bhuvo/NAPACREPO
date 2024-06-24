import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:npac/Views/MothersList/MotherListController.dart';
import 'package:npac/Views/MothersList/MotherListModel.dart';
import 'package:npac/app/export.dart';
import 'package:npac/utils/theme_utils.dart';
import 'package:npac/widgets/loading_widget.dart';

class MothersList extends StatefulWidget {
  const MothersList({super.key});

  @override
  State<MothersList> createState() => _MothersListState();
}

class _MothersListState extends State<MothersList> {
  Rx<bool> isLoading = false.obs;
  RxList<MotherListModel> motherList = <MotherListModel>[].obs;
  MotherListController controller = Get.put(MotherListController());

  @override
  void initState() {
    getdelay();
    super.initState();
  }

  void getdelay()async{
    isLoading.value = true;
    controller.getHiveMotherList();
   // await controller.getMotherList(10);
    await Future.delayed(Duration(seconds: 1));
    motherList.value = List.from(controller.motherlist);
    isLoading.value = false;
   // print('object$motherList');
  }

  void search(String query){
    query = query.trim();
    if(query.isEmpty){
      setState(() {
        motherList.clear();
        motherList.addAll(controller.motherlist);
      });
      return;
    }
    setState(() {
      motherList.value =controller.motherlist.map((element) => element.toString().toLowerCase().contains(query) ?? false ? element : null).whereType<MotherListModel>().toList();
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
            child: Obx(()=>isLoading.value ? Center(child: LoadingWidget()) : ListView(
                children: motherList.value.map((e) {
               return InkWell(
                 onTap: (){
                   context.push(Routes.MothersDetails, {'data': e});
                 },
                 child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${e.patientfullname}${e.patientid}'),
                                Text(e.tNPHDRNo ??''),
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(e.tNPHDRNo ??''),
                            //     Text(e.patientid??''),
                            //   ],
                            // ),
                          ],),
                      ),),
               );
                }
                ).toList(),
              ),
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