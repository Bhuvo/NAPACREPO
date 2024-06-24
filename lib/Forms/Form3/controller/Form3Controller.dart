
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:npac/API/api.dart';
import 'package:npac/Forms/Form3/Model/Form3Model.dart';
import 'package:http/http.dart' as http;
import 'package:npac/Forms/Form3/Model/RegistrationPregnancyModel.dart';
import 'package:npac/app/export.dart';

class Form3Controller extends GetxController{

 // Rx<RegistrationModel> registrationModelData = RegistrationModel().obs;


  Future<RegistrationModel> getRegistrationData(BuildContext context ,int patientId)async{
   // patientId = 7954;
    var response = await http.get(Uri.parse('${Api.baseUrl}${Api.getRegistration}$patientId'),headers: apiHeader);
    if(response.statusCode==200){
      var result = RegistrationModel.fromJson(jsonDecode(response.body));
     // registrationModelData.value = result;
     // print(jsonEncode(result));
      context.showSnackBar('Data loaded successfully');
      return result;
    }else{
      context.showSnackBar('Error while getting register form data');
      print('Error while getting register form data');
      // print(response.body);
    }
    return RegistrationModel();
  }

  Future<List<RegistrationPregnancyModel>> getRegistrationPregnancydata(BuildContext context ,int patientId)async{
   // patientId = 7954;
    var response = await http.get(Uri.parse('${Api.baseUrl}${Api.getRegistrationPregnancy}$patientId'));
    if(response.statusCode==200){
      var result = jsonDecode(response.body);
      List<RegistrationPregnancyModel> list = result.map<RegistrationPregnancyModel>((json) => RegistrationPregnancyModel.fromJson(json)).toList();
     // print(jsonEncode(result));
      context.showSnackBar('Data loaded successfully');
      return list;
    }else{
      context.showSnackBar('Error while getting register form data');
      print('Error while getting register form data');
    }
    return [];
  }

  void registerForm(BuildContext context ,RegistrationModel data,List<RegistrationPregnancyModel> pregnancyData,int patientId) async{
    var bo ={
      "TNPHDR_No_Id": '7997',
      "Heartdisease_diagnosis_Time": "During Present Pregnancy",
      "Chronological_age_at_Diagnosis": "2",
      "Gest_age_at_Diagnosis": "14",
      "NYHA_Class": "Class I",
      "Prior_Cardiac_Event": "Yes",
      "Heart_Failure": "Yes",
      "Heart_Failure_Hospitalization": "Yes",
      "Prior_Cardiac_Arrhythmia": "Yes",
      "Arrhthymias_AF": 'true',
      "Arrhthymias_AT": 'true',
      "Arrhthymias_SVT": 'true',
      "Arrhthymias_VT_VF": 'true',
      "Arrhthymias_Others": 'null',
      "Arrhthymias_Others_Specify": "Text",
      "Prior_Cardiac_Arrhythmia_Hospitalization": "Yes",
      "Other_Prior_Cardiac": "Minor Bleed",
      "Other_Prior_Cardiac_Others_Specify": "text",
      "Other_Prior_Cardiac_Hospitalization": "Yes",
      "Prior_Cardiac_Procedures": "Yes",
      "Procedure_Name": "Name",
      "Procedure_MonthandYear": "6 Months 2 Yrs",
      "Procedure_Antenatal": "Yes",
      "Prior_Anticoagulant_Use": "Yes",
      "Prior_Cardiac_Drugs_Use": "Yes",
      "Prior_NonCardiac_Medications": "Yes",
      "RiskFactors": "Yes",
      "Diabetes": "Yes",
      "HTN": "Yes",
      "Psych_Illness": "Yes",
      "Alcohol": "Yes",
      "Smoking": "Current",
      "Anemia": "Yes",
      "Chewing_Tobacco": "Yes",
      "Hypothyroid": "Yes",
      "Hyperthyroid": "Yes",
      "Epilepsy": "Yes",
      "HIV": "Yes",
      "Autoimmune": "Yes",
      "Risk_Factors_Others": "Yes",
      "Risk_Factors_Others_Specify": "text",
      "previous_pregnancy_flag": "Yes"
    };
    //print(patientId);
    data.tNPHDRNoId = patientId;
    var dat = removeNulls(data.toJson());
    var response =await http.post(Uri.parse('${Api.baseUrl}${Api.registerForm}').replace(queryParameters: dat));
    if(response.statusCode==200){
      await registerPregnancyForm(context ,pregnancyData,patientId);
     // context.showSnackBar('pregnancy Data loaded successfully');
    }else{
      context.showSnackBar('Data loaded failed');
      // print(response.body);
    }
  }

  Future<void> registerPregnancyForm(BuildContext context ,List<RegistrationPregnancyModel> data,int patientId) async{
    List<Map<String, dynamic>> dataList = [];
    for(int i=0;i<data.length;i++){
      data[i].tNPHDRNoId = patientId;
     // dataList.add(removeNulls(data[i].toJson()));
    }

    for (var item in data) {
      item.tNPHDRNoId = patientId;
      dataList.add(removeNulls(item.toJson()));
    }

    print(dataList);
    // Flatten the list of maps into a single map
    Map<String, String> queryParams = {};
    for (var item in dataList) {
      item.forEach((key, value) {
        queryParams[key] = value.toString();
      });
    }

    var response =await http.post(Uri.parse('${Api.baseUrl}${Api.registerPregnancyForm}').replace(queryParameters: queryParams));
    if(response.statusCode==200){
      //print(response.body);
      await getRegistrationData(context,patientId);
      await getRegistrationPregnancydata(context,patientId);
      context.showSnackBar('pregnancy Data loaded successfully');

    }else{
      //print(response.body);
      context.showSnackBar('pregnancy Data loaded failed');
    }
  }

  Future<void> deletePregnancy(BuildContext context ,int id) async{
    var  response =await http.post(Uri.parse('${Api.baseUrl}${Api.deletePregnancyForm}$id'));
    if(response.statusCode==200){
     // print(response.body);
      context.showSnackBar('pregnancy Data deleted successfully');
    }else{
      //print(response.body);
      context.showSnackBar('pregnancy Data deleted failed');
    }
  }


}