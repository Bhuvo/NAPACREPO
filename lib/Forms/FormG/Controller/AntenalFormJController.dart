import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:npac/API/api.dart';
import 'package:npac/Forms/FormF/FormFModel/EchoImageModel.dart';
import 'package:http/http.dart' as http;
import 'package:npac/Forms/FormF/FormFModel/FormFModel.dart';
import 'package:npac/app/export.dart';

class AntenalFormJController extends GetxController{

  RxList<EchoImageModel> echoModel = <EchoImageModel>[].obs;
  Rx<EchoAssignmentModel> FormJEchoAssignmentData = EchoAssignmentModel().obs;
  Rx<FormFModel> FormJData = FormFModel().obs;
  Rx<bool> isLoading = false.obs;
  RxList<EchoImageModel> outCome = <EchoImageModel>[].obs;
  RxBool isOutComeUploadLoading = false.obs;
  RxBool isEcoLoading = false.obs;

  Future<void> getFormFData(BuildContext context,int patientId) async {
    isLoading.value = true;
    var bo ={
      "PatientId":7964,
      "Visit_No":2
    };
    var response = await http.post(
        Uri.parse('${Api.baseUrl}${Api.getAntenatalVisitOne}'),
        body: jsonEncode(bo),headers: apiHeader);

    if (response.statusCode == 200) {
      FormJData.value = FormFModel.fromJson(jsonDecode(response.body));
      // print(response.body);
      context.showSnackBar('FormF Data fetched successfully');
    } else {
      //print(response.body);
      print('Error while fetching FormF data');
    }

    isLoading.value = false;
  }

  Future<bool> upLoadData() async{
    FormJData.value.visitNo = 1;
    FormJData.value.patientId = 7964;
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.updateAntenatalVisitOne}'),body: jsonEncode(FormJData.value.toJson()),headers: apiHeader);

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
      "Visit_No":2
    };
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.getEcho}'),body: jsonEncode(body),headers: apiHeader);
    //print(response.body);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      echoModel.value = (jsonData as List).map((e) => EchoImageModel.fromJson(e)).toList().obs;
      print(echoModel.value.toString());
    }else{
      print('Error while fetching Echo data');
    }

  }

  Future<void> uploadEcho(BuildContext context) async{
    isEcoLoading.value = true;
    FilePicker picker = FilePicker.platform;
    FilePickerResult? result = await picker.pickFiles();
    if(result != null){
      File file = File(result.files.single.path!);
      var response = await http.MultipartRequest('POST',Uri.parse('${Api.baseUrl}${Api.uploadEcho}'));
      response.fields.addAll({
        'PatientId': '7964',
        'VisitNo' :'2',
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
        await getEcho();
        context.showSnackBar('Echo uploaded successfully');
        print('response ${results.stream.toString()}');
      } else {
        print('Echo uploaded failed');
        print('Failed to send request: ${results.statusCode}${results..stream.toString()}');
      }

    }
    isEcoLoading.value = false;
  }

  Future<void> getOutCome() async{
    var body ={
      "PatientId":7964,
      "Visit_No":2
    };
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.getOutcome}'),body: jsonEncode(body),headers: apiHeader);
    //print(response.body);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      outCome.value = (jsonData as List).map((e) => EchoImageModel.fromJson(e)).toList().obs;
      print(outCome.value.toString());
    }else{
      print('Error while fetching Echo data');
    }
  }

  Future<void> UploadOutCome(BuildContext context) async{
    isOutComeUploadLoading.value = true;
    FilePicker picker = FilePicker.platform;
    FilePickerResult? result = await picker.pickFiles();
    if(result != null){
      File file = File(result.files.single.path!);
      var response = await http.MultipartRequest('POST',Uri.parse('${Api.baseUrl}${Api.uploadOutcome}'));
      response.fields.addAll({
        'PatientId': '7964',
        'VisitNo' :'2',
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
        await getOutCome();
        context.showSnackBar('Outcome uploaded successfully');
        print('response ${results.stream.toString()}');
      } else {
        context.showSnackBar('Failed to Upload Outcome');
        print('Failed to send request: ${results.statusCode}${results..stream.toString()}');
      }

    }
    isOutComeUploadLoading.value = false;
  }
}