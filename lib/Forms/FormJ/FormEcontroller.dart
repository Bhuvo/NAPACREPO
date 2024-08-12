import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:npac/API/api.dart';
import 'package:npac/Forms/FormJ/FormEModel/FormEModel.dart';
import 'package:http/http.dart' as http;
import 'package:npac/app/export.dart';

class FormEcontroller extends GetxController{

  Rx<FormEModel> formEModel = FormEModel().obs;

  Future<void> getFormEData(String patientId,BuildContext context) async {
    var response = await http.get(Uri.parse('${Api.baseUrl}Current_Preg/Get_Form_E?PatientId=$patientId'));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      formEModel.value = FormEModel.fromJson(data);
      // context.showSnackBar('Form E data fetched successfully');
    }else{
      print(response.body);
      context.showSnackBar('Error fetching Form E data');
    }
  }
  
  Future<void> saveFormEData (String patientId,BuildContext context) async {
    formEModel.value.patientId = int.tryParse(patientId);
     var data = removeNulls(formEModel.toJson());
    var response = await http.post(Uri.parse('${Api.baseUrl}Current_Preg/Save_Form_E?PatientId=$patientId').replace(queryParameters: data),headers: {"Content-Type": "application/json"});
    if(response.statusCode == 200){
      context.showSnackBar('Form E data saved successfully');
    }else{
      print(response.body);
      context.showSnackBar('Error saving Form E data');
    }
  }
}