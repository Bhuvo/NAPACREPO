import 'dart:convert';

import 'package:npac/Forms/FormN/DrugModel/DrugModel.dart';
import 'package:npac/Forms/FormN/DrugModel/UserDrugModel.dart';
import 'package:npac/app/export.dart';
import 'package:http/http.dart' as http;

class Form3DrugController extends GetxController{

    RxList<DrugModel> drugList = <DrugModel>[].obs;
    RxList<UserDrugModel> UserdrugList = <UserDrugModel>[].obs;

    Future<void> getDrug()async{
      var response = await http.get(Uri.parse('http://npac.timesmed.in/Baselinedata/SearchDrug?Param='),headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body) as List;
        drugList.value = jsonResponse.map((e) => DrugModel.fromJson(e)).toList();
        print(drugList.value);
      }else{
        print(response.body);
      }
    }

    Future<void> getUserDrug(int visitNo)async{
      var response = await http.get(Uri.parse('http://npac.timesmed.in/Baselinedata/Get_DrugList?Visit_No=$visitNo&PatientId=7965'),headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body) as List;
        UserdrugList.value = jsonResponse.map((e) => UserDrugModel.fromJson(e)).toList();
        print(UserdrugList.value);
      }else{
        print(response.body);
      }
    }

    Future<void> uploadDrug(int visitNo,UserDrugModel data)async{
      data.visitNo = visitNo;
      data.tNPHDRNoId=7965;
      var response = await http.post(Uri.parse('http://npac.timesmed.in/Baselinedata/Save_Prescription').replace(queryParameters: data.toJson()),headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if(response.statusCode == 200){
        getUserDrug(visitNo);
        print(' upload done');
        // print(response.body);
      }else{
        print(' upload not done');
        print(response.body);
      }
    }

    Future<void> deleteDrug(int visitNo,int prescription_id)async{
      var response = await http.get(Uri.parse('http://npac.timesmed.in/Baselinedata/DeleteDrug?prescription_id=$prescription_id'),headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      if(response.statusCode == 200){
        getUserDrug(visitNo);
        print(' delete done');
        // print(response.body);
      }else{
        print(' delete not done');
        print(response.body);
      }
    }
}