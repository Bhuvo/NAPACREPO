import 'package:get/get.dart';
import 'package:npac/Forms/CommonModelController/EchoAssignmentModel.dart';
import 'package:npac/Forms/FormM/Model/FormMModel.dart';
import 'package:http/http.dart' as http;
import 'package:npac/API/api.dart';
import 'dart:convert';

import 'package:npac/app/export.dart';

class FormMController extends GetxController{

  Rx<FormMModel> formMData = FormMModel().obs;
  Rx<EchoAssignmentModel> FormLEchoAssignmentData = EchoAssignmentModel().obs;


  Future<void> getPostpartumSecondData() async {
    var response = await http.get(Uri.parse('${Api.baseUrl}/${Api.getPostpartumFirstData}').replace(queryParameters: {
      'PatientId': '7964'
    }));

    if(response.statusCode == 200){
      formMData.value = FormMModel.fromJson(jsonDecode(response.body));
    }else{
      // print(response.body);
      print('Error While Feteching FormL data');
    }
  }

  Future<bool> UploadPostpartumsecondData()async{
    formMData.value.patientId = 7964;
    formMData.value.doctorId=2;
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.UploadPostpartumFirst}'),body: jsonEncode(formMData),headers: apiHeader);
    if(response.statusCode == 200){
      print('FormL data uploaded successfully');
      return true;
      // formLData.value = FormLModel.fromJson(jsonDecode(response.body));
    }else{
      print(response.body);
      print('Error while Uploading FormL data');
    }
    return false;
  }

}