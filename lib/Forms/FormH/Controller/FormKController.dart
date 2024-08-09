import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:npac/API/api.dart';
import 'package:npac/Forms/CommonModelController/EchoAssignmentModel.dart';
import 'package:npac/Forms/CommonModelController/EchoImage/EchoImageModel.dart';
import 'package:npac/Forms/FormH/Model/FormK1Model.dart';
import 'package:npac/Forms/FormH/Model/FormK2Model.dart';
import 'package:npac/Forms/FormH/Model/FormK3Model.dart';
import 'package:npac/Forms/FormH/Model/FormK4Model.dart';
import 'package:npac/Forms/FormH/Model/FormK5Model.dart';
import 'package:npac/Forms/FormH/Model/FormK6Model.dart';
import 'package:npac/Forms/FormH/Model/FormK7Model.dart';
import 'package:npac/app/export.dart';


class FormKController extends GetxController{

   RxInt patientId =7964.obs;
   RxInt formId =11.obs;
   RxInt docId =2.obs;
   RxBool isLoading = false.obs;
   RxBool isSubmitLoading = false.obs;

   Rx<FormK1Model> formK1Data = FormK1Model().obs;
   Rx<FormK2Model> formK2Data = FormK2Model().obs;
   Rx<FormK3Model> formK3Data = FormK3Model().obs;
   Rx<FormK4Model> formK4Data = FormK4Model().obs;
   Rx<FormK5Model> formK5Data = FormK5Model().obs;
   Rx<FormK6Model> formK6Data = FormK6Model().obs;
   Rx<FormK7Model> formK7Data = FormK7Model().obs;

   Rx<EchoAssignmentModel> formKEchoAssignmentData = EchoAssignmentModel().obs;
   RxList<EchoImageModel> EchoImage = <EchoImageModel>[].obs;
   RxList<EchoImageModel> otherImage = <EchoImageModel>[].obs;


   Future<bool> getFormKData() async {
     await getFormK1Data();
     await getFormK2Data();
     await getFormK3Data();
     await getFormK4Data();
     await getFormK5Data();
     await getFormK6Data();
     await getFormK7Data();
     return true;
   }

   Future<bool> saveFormKData() async{
     isSubmitLoading.value = true;
      await saveFormK1Data();
      await saveFormK2Data();
      await saveFormK3Data();
      await saveFormK4Data();
      await saveFormK5Data();
      await saveFormK6Data();
      await saveFormK7Data();
      await getFormKData();
      isSubmitLoading.value = false;
      return true;
   }

   Future<bool> getFormK1Data()async{
      var response = await http.get(Uri.parse('${Api.baseUrl}${Api.getK1Data}').replace(queryParameters: {
        'PatientId':'${patientId.value}',
         'FormId' : '${formId.value}'
      }));

      if(response.statusCode == 200){
        formK1Data.value = FormK1Model.fromJson(jsonDecode(response.body));
        print('K1 data Load successfully');
        return true;
      }else{
        print('K1 data Load failed ${response.body}');
        return false;
      }
   }

  Future<bool> getFormK2Data() async {
    var response = await http.get(Uri.parse('${Api.baseUrl}${Api.getK2Data}').replace(queryParameters: {
      'PatientId':'${patientId.value}',
      'FormId': '${formId.value}'
    }));

    if (response.statusCode == 200) {
      formK2Data.value = FormK2Model.fromJson(jsonDecode(response.body));
      print('K2 data Load successfully');
      return true;
    } else {
      print('K2 data Load failed ${response.body}');
      return false;
    } 
  }

  Future<bool> getFormK3Data() async {
    var response = await http.get(
        Uri.parse('${Api.baseUrl}${Api.getK3Data}').replace(queryParameters: {
          'PatientId':'${patientId.value}',
          'FormId': '${formId.value}'
        }));

    if (response.statusCode == 200) {
      formK3Data.value = FormK3Model.fromJson(jsonDecode(response.body));
      print('K3 data Load successfully');
      return true;
    } else {
      print('K3 data Load failed ${response.body}');
      return false;
    }
  }

  Future<bool> getFormK4Data() async {
    var response = await http.get(
        Uri.parse('${Api.baseUrl}${Api.getK4Data}').replace(queryParameters: {
          'PatientId':'${patientId.value}',
          'FormId': '${formId.value}'
        }));

    if (response.statusCode == 200) {
      formK4Data.value = FormK4Model.fromJson(jsonDecode(response.body));
      print('K4 data Load successfully');
      return true;
    } else {
      print('K4 data Load failed ${response.body}');
      return false;
    }
  }

  Future<bool> getFormK5Data() async {
    var response = await http.get(
        Uri.parse('${Api.baseUrl}${Api.getK5Data}').replace(queryParameters: {
          'PatientId':'${patientId.value}',
          'FormId': '${formId.value}'
        }));

    if (response.statusCode == 200) {
      formK5Data.value = FormK5Model.fromJson(jsonDecode(response.body));
      print('K5 data Load successfully');
      return true;
    } else {
      print('K5 data Load failed ${response.body}');
      return false;
    }
   }

  Future<bool> getFormK6Data() async {
    var response = await http.get(
        Uri.parse('${Api.baseUrl}${Api.getK6Data}').replace(queryParameters: {
          'PatientId':'${patientId.value}',
          'FormId': '${formId.value}'
        }));

    if (response.statusCode == 200) {
      formK6Data.value = FormK6Model.fromJson(jsonDecode(response.body));
      print('K6 data Load successfully');
      return true;
    } else {
      print('K6 data Load failed ${response.body}');
      return false;
    }
  }

  Future<bool> getFormK7Data() async {
    var response = await http.get(
        Uri.parse('${Api.baseUrl}${Api.getK7Data}').replace(queryParameters: {
          'PatientId':'${patientId.value}',
          'FormId': '${formId.value}'
        }));

    if (response.statusCode == 200) {
      formK7Data.value = FormK7Model.fromJson(jsonDecode(response.body));
      print(response.body);
      print(formK7Data.value.toJson());
      print('K7 data Load successfully');
      return true;
    } else {
      print('K7 data Load failed ${response.body}');
      return false;
    }
   }

   Future<bool> saveFormK1Data()async {
     formK1Data.value.patientId =patientId.value;
     formK1Data.value.formId = formId.value;
     formK1Data.value.doctorId = docId.value;
        var response = await http.post(Uri.parse('${Api.baseUrl}${Api.savek1Data}'),body: jsonEncode(formK1Data.value),headers: apiHeader);
        if(response.statusCode == 200){
          print('K1 data save successfully');

          return true;
        }else{
          print('K1 data save failed ${response.body}');
          return false;
        }
   }

   Future<bool> saveFormK2Data()async {
     formK2Data.value.patientId =patientId.value;
     formK2Data.value.formId = formId.value;
     formK2Data.value.doctorId = docId.value;
     // print(formK2Data.value.toJson());
     var response = await http.post(Uri.parse('${Api.baseUrl}${Api.savek2Data}'),body: jsonEncode(formK2Data.value),headers: apiHeader);
        if(response.statusCode == 200){
          print('K2 data save successfully');
          return true;
        }else{
          print('K2 data save failed ${response.body}');
          return false;
        }
   }

   Future<bool> saveFormK3Data() async{
     formK3Data.value.patientId =patientId.value;
     formK3Data.value.formId = formId.value;
     formK3Data.value.doctorId = docId.value;
        var response = await http.post(Uri.parse('${Api.baseUrl}${Api.savek3Data}'),body: jsonEncode(formK3Data.value),headers: apiHeader);
        if(response.statusCode == 200){
          print('K3 data save successfully');
          return true;
        }else{
          print('K3 data save failed ${response.body}');
          return false;
        }
   }

   Future<bool> saveFormK4Data() async{
     formK4Data.value.patientId =patientId.value;
     formK4Data.value.formId = formId.value;
     formK4Data.value.doctorId = docId.value;
     var response = await http.post(Uri.parse('${Api.baseUrl}${Api.savek4Data}'),body: jsonEncode(formK4Data.value),headers: apiHeader);
        if(response.statusCode == 200){
          print('K4 data save successfully');
          return true;
        }else{
          print('K4 data save failed ${response.body}');
          return false;
        }
   }

   Future<bool> saveFormK5Data() async{
     formK5Data.value.patientId =patientId.value;
     formK5Data.value.formId = formId.value;
     formK5Data.value.doctorId = docId.value;
     var response = await http.post(Uri.parse('${Api.baseUrl}${Api.savek5Data}'),body: jsonEncode(formK5Data.value),headers: apiHeader);
        if(response.statusCode == 200){
          print('K5 data save successfully');
          return true;
        }else{
          print('K5 data save failed ${response.body}');
          return false;
        }
   }

   Future<bool> saveFormK6Data() async{
     formK6Data.value.patientId =patientId.value;
     formK6Data.value.formId = formId.value;
     formK6Data.value.doctorId = docId.value;
     var response = await http.post(Uri.parse('${Api.baseUrl}${Api.savek6Data}'),body: jsonEncode(formK6Data.value),headers: apiHeader);
        if(response.statusCode == 200){
          print('K6 data save successfully');
          return true;
        }else{
          print('K6 data save failed ${response.body}');
          return false;
        }
   }

   Future<bool> saveFormK7Data() async{
     formK7Data.value.patientId =patientId.value;
     formK7Data.value.formId = formId.value;
     formK7Data.value.doctorId = docId.value;
     print(formK7Data.value.toJson());
     var response = await http.post(Uri.parse('${Api.baseUrl}${Api.savek7Data}'),body: jsonEncode(formK7Data.value),headers: apiHeader);
        if(response.statusCode == 200){
          print('K7 data save successfully');
          return true;
        }else{
          print('K7 data save failed ${response.body}');
          return false;
        }
   }



}