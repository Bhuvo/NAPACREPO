
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:npac/app/export.dart';
import 'package:npac/model/DistrictModel.dart';
import 'package:npac/model/StateModel.dart';
import 'package:npac/model/TalukModel.dart';
import 'package:npac/model/VillageModel.dart';

class Form2Controller extends GetxController{
  RxList<StateModel> stateList = <StateModel>[].obs;
  RxList<DistrictModel> districtList = <DistrictModel>[].obs;
  RxList<TalukModel> talukList = <TalukModel>[].obs;
  RxList<VillageModel> villageList = <VillageModel>[].obs;


  Future<void> getStateList() async{
    var response = await http.get(Uri.parse('${Api.baseUrl}${Api.getStateList}'));
    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body) as List;
      var result = jsonResponse.map((e) => StateModel.fromJson(e)).toList();
      stateList.value = result;
    }else{
      print('Error occurred while fetching state list');
    }
  }

  Future<void> getDistrict(int id) async{
    var response = await http.get(Uri.parse('${Api.baseUrl}${Api.getDistrict}$id'));
    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body) as List;
      var result = jsonResponse.map((e) => DistrictModel.fromJson(e)).toList();
      districtList.value = result;
      //print(districtList.value);
    }else{
      print('Error occurred while fetching state list');
    }
  }

  Future<void> getTaluk(int id) async{
    var response = await http.get(Uri.parse('${Api.baseUrl}${Api.getTaluk}$id'));
    //print('${Api.baseUrl}${Api.getTaluk}$id');
    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body) as List;
      var result = jsonResponse.map((e) => TalukModel.fromJson(e)).toList();
      talukList.value = result;
    }else{
      print('Error occurred while fetching state list');
    }

  }
  Future<void> getVilliage(int id) async{
    var response = await http.get(Uri.parse('${Api.baseUrl}${Api.getVillage}$id'));
    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body) as List;
      var result = jsonResponse.map((e) => VillageModel.fromJson(e)).toList();
      villageList.value = result;
    }else{
      print('Error occurred while fetching state list');
    }
  }


}