import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:npac/API/api.dart';
import 'package:npac/Hive/Box.dart';
import 'package:npac/Views/MothersList/MotherListModel.dart';
import 'package:http/http.dart' as http;

class MotherListController extends GetxController {
  RxList<MotherListModel> motherlist = <MotherListModel>[].obs;

  void getHiveMotherList() async {
       Boxes.mothorlist?.values.forEach((element) {
          motherlist.add(element);
        });
  }

 static Future<void> getMotherList(int doctorID)async {
    var response = await http.get(Uri.parse('${Api.baseUrl}${Api.motherList}$doctorID'));
    if(response.statusCode == 200){
      var result = jsonDecode(response.body);
      await Boxes.mothorlist?.clear();
    await Boxes.mothorlist?.addAll(result.map<MotherListModel>((json) => MotherListModel.fromJson(json)).toList());
       // motherlist.value = result.map<MotherListModel>((json) => MotherListModel.fromJson(json)).toList();
        print('object$result');
    }else{
      print('Error occurred while fetching mother list');
    }

  }

}