import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:npac/API/api.dart';
import 'package:npac/Forms/CommonModelController/EchoImage/EchoImageModel.dart';
import 'package:npac/Forms/FormD/Model/FormD1Model.dart';
import 'package:npac/Forms/FormD/Model/FormD2Model.dart';
import 'package:npac/Forms/FormD/Model/FormD3Model.dart';
import 'package:npac/Forms/FormD/Model/FormD4Model.dart';
import 'package:npac/Forms/FormD/Model/FormD5Model.dart';
import 'package:npac/Forms/FormD/Model/FormD6Model.dart';
import 'package:npac/Forms/FormD/Model/FormD7Model.dart';
import 'package:npac/Forms/FormD/Model/FormD9Model.dart';
import 'package:npac/Forms/FormD/Model/FormDR4Model.dart';
import 'package:npac/app/export.dart';

class FormDController extends GetxController{
  RxList<EchoImageModel> EchoImage = <EchoImageModel>[].obs;
  RxBool isDataLoading = false.obs;
  RxBool isDataSaved = false.obs;

  Rx<FormD1Model> formD1Model = FormD1Model().obs;
  Rx<FormD2Model> formD2Model = FormD2Model().obs;
  Rx<FormD3Model> formD3Model = FormD3Model().obs;
  Rx<FormD4Model> formD4Model = FormD4Model().obs;
  Rx<FormDR4Model> formDR4Model = FormDR4Model().obs;
  Rx<FormD5Model> formD5Model = FormD5Model().obs;
  Rx<FormD6Model> formD6Model = FormD6Model().obs;
  Rx<FormD7Model> formD7Model = FormD7Model().obs;
  Rx<FormD9Model> formD9Model = FormD9Model().obs;

  Future<void> saveFormD(String patientId,BuildContext context) async {
    isDataSaved.value = true;
    await saveFormD1Data(patientId,context);
    await saveFormD2Data(patientId,context);
    await saveFormD3Data(patientId,context);
    await saveFormD4Data(patientId,context);
    await saveFormDR4Data(patientId,context);
    await saveFormD5Data(patientId,context);
    await saveFormD6Data(patientId,context);
    await saveFormD7Data(patientId,context);
    await saveFormD9Data(patientId,context);
    isDataSaved.value = false;
  }


  Future<void> getFormD1Data(String patientId,BuildContext context) async {
    print('coming');
    var response = await http.get(Uri.parse('${Api.baseUrl}Current_Preg/GetAntenatal?PatientId=$patientId'));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      formD1Model.value = FormD1Model.fromJson(data);
      print(formD1Model.value.toJson());
      // context.showSnackBar('Form D1 data fetched successfully');
    }else{
      print(response.body);
      context.showSnackBar('Error fetching Form D1 data');
    }
  }

  Future<void> getFormD2Data(String patientId,BuildContext context) async {
    var response = await http.get(Uri.parse('${Api.baseUrl}Current_Preg/Get_Clinical_And_Baseline?PatientId=$patientId'));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      formD2Model.value = FormD2Model.fromJson(data);
      // context.showSnackBar('Form D2 data fetched successfully');
    }else{
      print(response.body);
      context.showSnackBar('Error fetching Form D2 data');
    }
  }

  Future<void> getFormD3Data(String patientId,BuildContext context) async {
    var response = await http.get(Uri.parse('${Api.baseUrl}Current_Preg/Get_CompleteDiagnosis?PatientId=$patientId'));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      formD3Model.value = FormD3Model.fromJson(data);
      // context.showSnackBar('Form D3 data fetched successfully');
    }else{
      print(response.body);
      context.showSnackBar('Error fetching Form D3 data');
    }
  }

  Future<void> getFormD4Data(String patientId,BuildContext context) async {
    var response = await http.get(Uri.parse('${Api.baseUrl}Current_Preg/Get_Echo?PatientId=$patientId'));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      formD4Model.value = FormD4Model.fromJson(data);
      // context.showSnackBar('Form D4 data fetched successfully');
    }else{
      print(response.body);
      context.showSnackBar('Error fetching Form D4 data');
    }
  }

  Future<void> getFormDR4Data(String patientId,BuildContext context) async {
    var response = await http.get(Uri.parse('${Api.baseUrl}Current_Preg/Get_Prosthetic_Valve?PatientId=$patientId'));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      formDR4Model.value = FormDR4Model.fromJson(data);
      // context.showSnackBar('Form DR4 data fetched successfully');
    }else{
      print(response.body);
      context.showSnackBar('Error fetching Form DR4 data');
    }
  }

  Future<void> getFormD5Data(String patientId,BuildContext context) async {
    var response = await http.get(Uri.parse('${Api.baseUrl}Current_Preg/Get_Congenital_Heart_Disease?PatientId=$patientId'));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      formD5Model.value = FormD5Model.fromJson(data);
      // context.showSnackBar('Form D5 data fetched successfully');
    }else{
      print(response.body);
      context.showSnackBar('Error fetching Form D6 data');
    }
  }

  Future<void> getFormD6Data(String patientId,BuildContext context) async {
    var response = await http.get(Uri.parse('${Api.baseUrl}Current_Preg/Get_Aortopathy?PatientId=$patientId'));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      formD6Model.value = FormD6Model.fromJson(data);
      // context.showSnackBar('Form D6 data fetched successfully');
    }else{
      print(response.body);
      context.showSnackBar('Error fetching Form D7 data');
    }
  }

  Future<void> getFormD7Data(String patientId,BuildContext context) async {
    var response = await http.get(Uri.parse('${Api.baseUrl}Current_Preg/Get_Cardiomyopath?PatientId=$patientId'));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      formD7Model.value = FormD7Model.fromJson(data);
      // context.showSnackBar('Form D7 data fetched successfully');
    }else{
      print(response.body);
      context.showSnackBar('Error fetching Form D9 data');
    }
  }

   Future<void> getFormD9Data(String patientId,BuildContext context) async {
     var response = await http.get(
         Uri.parse('${Api.baseUrl}Current_Preg/Get_Risk?PatientId=$patientId'));
     if (response.statusCode == 200) {
       var data = jsonDecode(response.body);
       formD9Model.value = FormD9Model.fromJson(data);
       // context.showSnackBar('Form D9 data fetched successfully');
     } else {
       print(response.body);
       context.showSnackBar('Error fetching Form D9 data');
     }
   }

   Future<void> saveFormD1Data(String patientId,BuildContext context) async {
    formD1Model.value.patientId = int.tryParse(patientId);
    var data = removeNulls(formD1Model.value.toJson());
     var response = await http.post(Uri.parse('${Api.baseUrl}Current_Preg/Save_Antenatal').replace(queryParameters: data),headers: {"Content-Type": "application/json"});
     if (response.statusCode == 200) {
       context.showSnackBar('Form D1 data saved successfully');
     } else {
       print(response.body);
       context.showSnackBar('Error saving Form D1 data');
     }
   }

   Future<void> saveFormD2Data(String patientId,BuildContext context) async {
     formD2Model.value.patientId = int.tryParse(patientId);
     var data = removeNulls(formD2Model.value.toJson());
     var response = await http.post(Uri.parse('${Api.baseUrl}Current_Preg/Save_Clinical_And_Baseline').replace(queryParameters: data),headers: {"Content-Type": "application/json"});
     if (response.statusCode == 200) {
       context.showSnackBar('Form D2 data saved successfully');
     } else {
       print(response.body);
       context.showSnackBar('Error saving Form D2 data');
     }
   }

   Future<void> saveFormD3Data(String patientId,BuildContext context) async {
     formD3Model.value.patientId = int.tryParse(patientId);
     var data = removeNulls(formD3Model.value.toJson());
        var response = await http.post(Uri.parse('${Api.baseUrl}Current_Preg/Save_CompleteDiagnosis').replace(queryParameters: data),headers: {"Content-Type": "application/json"});
     if (response.statusCode == 200) {
       context.showSnackBar('Form D3 data saved successfully');
     } else {
       print(response.body);
       context.showSnackBar('Error saving Form D3 data');
     }
   }
   Future<void> saveFormD4Data(String patientId,BuildContext context) async{
    formD4Model.value.patientId = int.tryParse(patientId);
    var data = removeNulls(formD4Model.value.toJson());
    var response = await http.post(Uri.parse('${Api.baseUrl}Current_Preg/Save_Echo').replace(queryParameters: data),headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      context.showSnackBar('Form D4 data saved successfully');
    } else {
      print(response.body);
      context.showSnackBar('Error saving Form D4 data');
    }
   }

   Future<void> saveFormDR4Data(String patientId,BuildContext context) async {
    formDR4Model.value.patientId = int.tryParse(patientId);
    var data = removeNulls(formDR4Model.value.toJson());
    var response = await http.post(Uri.parse('${Api.baseUrl}Current_Preg/Save_Prosthetic_Valve').replace(queryParameters: data),headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      context.showSnackBar('Form DR4 data saved successfully');
    } else {
      print(response.body);
      context.showSnackBar('Error saving Form DR4 data');
    }
   }
   Future<void> saveFormD5Data(String patientId,BuildContext context) async {
    formD5Model.value.patientId = int.tryParse(patientId);
    var data = removeNulls(formD5Model.value.toJson());
    var response = await http.post(Uri.parse('${Api.baseUrl}Current_Preg/Save_Congenital_Heart_Disease').replace(queryParameters: data),headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      context.showSnackBar('Form D5 data saved successfully');
    } else {
      print(response.body);
      context.showSnackBar('Error saving Form D5 data');
    }
   }
   Future<void> saveFormD6Data(String patientId,BuildContext context) async{
    formD6Model.value.patientId = int.tryParse(patientId);
    var data = removeNulls(formD6Model.value.toJson());
    var response = await http.post(Uri.parse('${Api.baseUrl}Current_Preg/Save_Aortopathy').replace(queryParameters: data),headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      context.showSnackBar('Form D6 data saved successfully');
    } else {
      print(response.body);
      context.showSnackBar('Error saving Form D6 data');
    }
   }

   Future<void> saveFormD7Data(String patientId,BuildContext context) async{
    formD7Model.value.patientId = int.tryParse(patientId);
    var data = removeNulls(formD7Model.value.toJson());
    var response = await http.post(Uri.parse('${Api.baseUrl}Current_Preg/Save_Cardiomyopath').replace(queryParameters: data),headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      context.showSnackBar('Form D7 data saved successfully');
    } else {
      print(response.body);
      context.showSnackBar('Error saving Form D7 data');
    }
   }
   Future<void> saveFormD9Data(String patientId,BuildContext context) async {
     formD9Model.value.patientId = int.tryParse(patientId);
     var data = removeNulls(formD9Model.value.toJson());
     var response = await http.post(Uri.parse('${Api.baseUrl}Current_Preg/Save_Risk').replace(queryParameters: data),headers: {"Content-Type": "application/json"});
     if (response.statusCode == 200) {
       context.showSnackBar('Form D9 data saved successfully');
     } else {
       print(response.body);
       context.showSnackBar('Error saving Form D9 data');
     }
   }

}