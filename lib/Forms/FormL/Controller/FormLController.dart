import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:npac/API/api.dart';
import 'package:npac/Forms/CommonModelController/EchoAssignmentModel.dart';
import 'package:npac/Forms/FormL/FormLModel.dart';
import 'package:npac/app/export.dart';

class FormLController extends GetxController{

  Rx<FormLModel> formLData = FormLModel().obs;
  Rx<EchoAssignmentModel> FormLEchoAssignmentData = EchoAssignmentModel().obs;


  Future<void> getPostpartumFirstData() async {
      var response = await http.get(Uri.parse('${Api.baseUrl}/${Api.getPostpartumFirstData}').replace(queryParameters: {
        'PatientId': '7964'
      }));

      if(response.statusCode == 200){
        formLData.value = FormLModel.fromJson(jsonDecode(response.body));
      }else{
        // print(response.body);
        print('Error While Feteching FormL data');
      }
  }

  Future<bool> UploadPostpartumFirstData()async{
    formLData.value.patientId = 7964;
    formLData.value.doctorId=2;
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.UploadPostpartumFirst}'),body: jsonEncode(formLData),headers: apiHeader);
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