import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:npac/API/api.dart';
import 'package:npac/Forms/CommonModelController/EchoImage/EchoImageModel.dart';


class OtherImageController extends GetxController{

  RxList<EchoImageModel> otherImage = <EchoImageModel>[].obs;

  Future<void> getOtherImage(int patientId , int formId,String type)async{
    otherImage.clear();
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.getEchoImage}').replace(queryParameters: {
      'PatientId':'$patientId',
      'FormId':'$formId',
      'Type' : type
    }));

    if(response.statusCode == 200){
      List< EchoImageModel > echo = response.body.isNotEmpty ? (jsonDecode(response.body) as List).map((e) => EchoImageModel.fromJson(e)).toList() : [];
      // EchoImage.value = EchoImageModel.fromJson(jsonDecode(response.body));
      otherImage.value = echo;
      // print('echo image : ${response.body}');
    }else{
      print('Error while fetching echo images');
    }
  }

  Future<void> uploadOtherImage(int patientId , int formId,String type)async{
    FilePicker picker = FilePicker.platform;
    FilePickerResult? result = await picker.pickFiles(type: FileType.image);
    if(result == null){
      return;
    }
    var response = await http.MultipartRequest('POST',Uri.parse('${Api.baseUrl}${Api.uploadEchoImage}'));
    response.fields.addAll({
      'PatientId':'$patientId',
      'FormId':'$formId'
    });

    response.files.add(await http.MultipartFile.fromPath(
      'Files',
      result.files.single.path ?? '',
      filename: '${result.files.single.name}',
    ));

    var results = await response.send();
    if(results.statusCode == 200){
      await getOtherImage(patientId,formId,type);
      print('Request sent successfully');
    }else{
      print('Failed to send request: ${results.statusCode}${results.stream.toString()}');
    }

  }
}