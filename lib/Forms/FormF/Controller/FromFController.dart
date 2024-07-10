 import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:npac/API/api.dart';
import 'package:npac/Forms/FormF/FormFModel/EchoImageModel.dart';
import 'package:npac/Forms/FormF/FormFModel/FormFModel.dart';
import 'package:http/http.dart' as http;
import 'package:npac/app/export.dart';

class FormFController extends GetxController{

  Rx<FormFModel> FormIData = FormFModel().obs;
  Rx<bool> isLoading = false.obs;
  RxList<EchoImageModel> echoModel = <EchoImageModel>[].obs;
  RxList<EchoImageModel> outCome = <EchoImageModel>[].obs;
  RxBool isOutComeUploadLoading = false.obs;
  RxBool isEcoLoading = false.obs;

  Future<void> getFormFData(BuildContext context,int patientId) async {
    isLoading.value = true;
    var bo ={
      "PatientId":7964,
      "Visit_No":1
    };
      var response = await http.post(
          Uri.parse('${Api.baseUrl}${Api.getAntenatalVisitOne}'),
          body: jsonEncode(bo),headers: apiHeader);

      if (response.statusCode == 200) {
         FormIData.value = FormFModel.fromJson(jsonDecode(response.body));
       // print(response.body);
        context.showSnackBar('FormF Data fetched successfully');
      } else {
        //print(response.body);
        print('Error while fetching FormF data');
      }

    isLoading.value = false;
  }

  Future<bool> upLoadData() async{
    FormIData.value.visitNo = 1;
    FormIData.value.patientId = 7964;
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.updateAntenatalVisitOne}'),body: jsonEncode(FormIData.value.toJson()),headers: apiHeader);

    if(response.statusCode == 200){
      print(response.body);
      return true;
    }else{
      print('Error while uploading AntenatalVisitOne data');
    }
    return false;
  }

  Future<void> getEcho() async{
    var body ={
      "PatientId":7964,
      "Visit_No":1
    };
    print('getting Echo');
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.getEcho}'),body: jsonEncode(body),headers: apiHeader);
    //print(response.body);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      echoModel.value = (jsonData as List).map((e) => EchoImageModel.fromJson(e)).toList().obs;
      //print(echoModel.value.toString());
    }else{
      print('Error while fetching Echo data');
    }

  }

  Future<void> uploadEcho() async{
    isEcoLoading.value = true;
    FilePicker picker = FilePicker.platform;
    FilePickerResult? result = await picker.pickFiles();
    if(result != null){
      File file = File(result.files.single.path!);
      var response = await http.MultipartRequest('POST',Uri.parse('${Api.baseUrl}${Api.uploadEcho}'));
      response.fields.addAll({
        'PatientId': '7964',
        'VisitNo' :'1',
      });
      response.files.add( await http.MultipartFile.fromPath(
        'Files',
          file.path,
          filename: '${file.path.split('/').last}',
      ));
      var results = await response.send();
      //var results = await http.post(Uri.parse('${Api.baseUrl}${Api.uploadEcho}'),body: response.fields,headers: response.headers);
      print('${file.path.split('/').last}');
      if (results.statusCode == 200) {
        print('Request sent successfully');
        print('response ${results.stream.toString()}');
      } else {
        print('Failed to send request: ${results.statusCode}${results..stream.toString()}');
      }

    }
    isEcoLoading.value = false;
  }


  Future<void> getOutCome() async{
    var body ={
      "PatientId":7964,
      "Visit_No":1
    };
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.getOutcome}'),body: jsonEncode(body),headers: apiHeader);
    //print(response.body);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
       outCome.value = (jsonData as List).map((e) => EchoImageModel.fromJson(e)).toList();
       print(jsonData);
    }else{
      print('Error while fetching Echo data');
    }
  }

  Future<void> UploadOutCome() async{
    isOutComeUploadLoading.value = true;
    FilePicker picker = FilePicker.platform;
    FilePickerResult? result = await picker.pickFiles();
    if(result != null){
      File file = File(result.files.single.path!);
      var response = await http.MultipartRequest('POST',Uri.parse('${Api.baseUrl}${Api.uploadOutcome}'));
      response.fields.addAll({
        'PatientId': '7964',
        'VisitNo' :'1',
      });
      response.files.add( await http.MultipartFile.fromPath(
        'file',
        file.path,
        filename: '${file.path.split('/').last}',
      ));
      var results = await response.send();
      //var results = await http.post(Uri.parse('${Api.baseUrl}${Api.uploadEcho}'),body: response.fields,headers: response.headers);
      print('${file.path.split('/').last}');
      if (results.statusCode == 200) {
        print('Request sent successfully');
        getOutCome();
        print('response ${results.stream.toString()}');
      } else {
        print('Failed to send request: ${results.statusCode}${results..stream.toString()}');
      }

    }
    isOutComeUploadLoading.value = false;
  }

}