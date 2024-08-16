
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:npac/API/api.dart';
import 'package:npac/Forms/FormF/FormFModel/FormFModel.dart';
import 'package:http/http.dart' as http;
import 'package:npac/utils/navigator_utils.dart';
class FormFController extends GetxController{

  Rx<FormFModel> formFModel = FormFModel().obs;

  Future<void> getFormFData(String patientId,BuildContext context) async {
    var response = await http.get(Uri.parse('${Api.baseUrl}Current_Preg/Get_Form_F?PatientId=$patientId'));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      formFModel.value = FormFModel.fromJson(data);
      context.showSnackBar('Form F data fetched successfully');
    }else{
      print(response.body);
      context.showSnackBar('Error fetching Form F data');
    }
  }

}