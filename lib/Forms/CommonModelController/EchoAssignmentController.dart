import 'dart:convert';

import 'package:get/get.dart';
import 'package:npac/API/api.dart';
import 'package:http/http.dart' as http;
import 'package:npac/app/export.dart';

class EchoAssignmentController extends GetxController{

  Rx<EchoAssignmentModel> EchoAssignmentData = EchoAssignmentModel().obs;

  Future<void> getEcoAssignmentData(int patientId,int FormId)async{
    var body ={
      "PatientId":patientId,
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


  Future<bool> uploadEchoAssignment(int patientId,int FormId,EchoAssignmentModel model)async{
    model.patientId = patientId;
    model.formId = FormId;
    model.doctorId = 2;
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.uploadEchoAssignment}'),body: jsonEncode(model),headers: apiHeader);
    //print(response.body);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      EchoAssignmentData.value = EchoAssignmentModel.fromJson(jsonData);
      await getEcoAssignmentData(patientId,FormId);
      return true;
      //print(jsonData);
    }else{
      print('Error while uploading Echo Assignment data');
    }
    return false;
  }
}