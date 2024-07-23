import 'dart:convert';

import 'package:get/get.dart';
import 'package:npac/API/api.dart';
import 'package:http/http.dart' as http;
import 'package:npac/app/export.dart';

class EchoAssignmentController extends GetxController{

  Rx<EchoAssignmentModel> EchoAssignmentData = EchoAssignmentModel().obs;

  Future<void> getEcoAssignmentData(int FormId)async{
    var body ={
      "PatientId":7964,
      "FormId": FormId
    };
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.getEchoAssignment}'),body: jsonEncode(body),headers: apiHeader);
    //print(response.body);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      EchoAssignmentData.value = EchoAssignmentModel.fromJson(jsonData);
      // print(jsonData);
    }else{
      print('Error while fetching Echo Assignment data');
    }
  }


  Future<bool> uploadEchoAssignment(int FormId,EchoAssignmentModel model)async{
    model.patientId = 7964;
    model.formId = FormId;
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.uploadEchoAssignment}'),body: jsonEncode(model),headers: apiHeader);
    //print(response.body);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      EchoAssignmentData.value = EchoAssignmentModel.fromJson(jsonData);
      await getEcoAssignmentData(FormId);
      return true;
      //print(jsonData);
    }else{
      print('Error while fetching Echo Assignment data');
    }
    return false;
  }
}