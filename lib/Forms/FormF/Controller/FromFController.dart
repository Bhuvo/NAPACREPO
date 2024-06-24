 import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:npac/API/api.dart';
import 'package:npac/Forms/FormF/FormFModel/FormFModel.dart';
import 'package:http/http.dart' as http;
import 'package:npac/app/export.dart';

class FormFController extends GetxController{

  Rx<FormFModel> FormIData = FormFModel().obs;
  Rx<bool> isLoading = false.obs;


  Future<void> getFormFData(BuildContext context,int patientId) async {
    isLoading.value = true;
    var bo ={
      "PatientId":7964,
      "Visit_No":1
    };
    try {
      var response = await http.post(
          Uri.parse('${Api.baseUrl}${Api.getAntenatalVisitOne}'),
          body: jsonEncode(bo),headers: apiHeader);

      if (response.statusCode == 200) {
         FormIData.value = FormFModel.fromJson(jsonDecode(response.body));
        print(response.body);
        context.showSnackBar('FormI Data fetched successfully');
      } else {
        //print(response.body);
        print('Error while fetching FormI data');
      }
    } catch(e){
      print(e);
    }
    isLoading.value = false;
  }

}