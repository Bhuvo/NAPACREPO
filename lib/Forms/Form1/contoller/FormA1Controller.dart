import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:npac/app/export.dart';
import 'package:npac/model/BaseLineDataModel.dart';
import 'package:http/http.dart' as http;
import 'package:npac/API/api.dart';
class FormA1Controller extends GetxController{
  // Rx<BaseLineData>  formA1Data = BaseLineData().obs;
  Future<BaseLineData?> getBaseLineData(int patientId)async{
    patientId = 102;
    var response = await http.get(Uri.parse('${Api.baseUrl}${Api.getBaseLineData}$patientId'));
    if(response.statusCode == 200){
      var result = BaseLineData.fromJson(jsonDecode(response.body));
      return result;
    }else{
      print('Error while fetching baeLine Data');
      return null;
    }
  }

  void updateFormA1Data(BaseLineData data,BuildContext context)async{
    String url ='${Api.baseUrl}${Api.updatePatient}';
    data.docid = '10';
    data.rCHNO ='898498445686';
    var par =data.toJson();
    log(par.toString());
    var response = await http.post(
      Uri.parse(url).replace(queryParameters: par),);
    if (response.statusCode == 200) {
      print('Response data: ${response.body}');
      context.showSnackBar('${jsonDecode(response.body)["Message"]}');
    } else {
      log('Request failed with status: ${response.statusCode}${response
          .body}.');
      context.showSnackBar('Data upload failed');
    }
  }



  void createFormA1Data(BaseLineData data,BuildContext context)async{

    String appendValue ='Doctor_Id=10&RCH_NO=898499495696&Date_Of_Registration=13/06/2024&Date_Of_Referral=13/06/2024&Place_Of_First_Reporting=${data.placeOfFirstReporting}&When_Seen_By_The_Cardiologist=${data.whenSeenByTheCardiologist}&Antenatalorpostnatal=${data.antenatalorpostnatal}&HeartDisease=${data.heartDisease}&Consented=${data.consented}&pin_number=${data.pinNumber}&patientfullname=${data.patientfullname}&Guardian=${data.guardian}&age=${data.age}&dob=${data.dob}&stateid=31&district=1324&Taluk_id=18&villageid=4652&flatname=No 3/591&street_locality=Perumal kovil street&pincode=600026&mobilenumber=9556215635&alternatemobilenumber="9632587412"&ContactPerson_Name=theja&relativemobilenumber=9551963256&relativename=theja&RelativeRelation=Husband&RelativeRelation_Others=Yes&noofyeareducation=7&occupation=Home Maker&occupation_patient_others=test&noofyeareducation_husband=10&occupation_husband=Others&occupation_husband_others=test&Additional_Details=No';
   String app ='Doctor_Id=10&RCH_NO=848490455816&Date_Of_Registration=${data.dateOfRegistration}&Date_Of_Referral=${data.dateOfReferral}&Place_Of_First_Reporting=${data.placeOfFirstReporting}&When_Seen_By_The_Cardiologist=${data.whenSeenByTheCardiologist}&Antenatalorpostnatal=${data.antenatalorpostnatal}&HeartDisease=${data.heartDisease}&Consented=${data.consented}&pin_number=${data.pinNumber}&patientfullname=${data.patientfullname}&Guardian=${data.guardian}&age=${data.age}&dob=${data.dob}&stateid=${data.stateid}&district=${data.district}&Taluk_id=${data.talukId}&villageid=${data.villageid}&flatname=${data.flatname}&street_locality=${data.streetLocality}&pincode=${data.pincode}&mobilenumber=${data.mobilenumber}&alternatemobilenumber=${data.alternatemobilenumber}&ContactPerson_Name=${data.contactPersonName}&relativemobilenumber=${data.relativemobilenumber}&relativename=${data.relativename}&RelativeRelation=${data.relativeRelation}&noofyeareducation=${data.noofyeareducation}&occupation=${data.occupation}&noofyeareducation_husband=${data.noofyeareducationHusband}&occupationHusband=${data.occupationHusband}&Additional_Details=${data.additionalDetails}';
    String url ='${Api.baseUrl}${Api.registerPatient}';
    var params = {
      'patientfullname': 'test aravi',
      'Doctor_Id': '10',
      'RCH_NO': '898498495696',
      'Date_Of_Registration': '13/06/2024',
      'Date_Of_Referral': '13/06/2024',
      'Place_Of_First_Reporting': 'Hospital',
      'When_Seen_By_The_Cardiologist': 'last Week',
      'Antenatalorpostnatal': 'Antenatal',
      'HeartDisease': 'Yes',
      'Consented': 'Yes',
      'pin_number': '9454655',

      'Guardian': 'aravind',
      'age': '27',
      'dob': '24/07/1994',
      'stateid': '31',
      'district': '1324',
      'Taluk_id': '18',
      'villageid': '4652',
      'flatname': 'No 3/591',
      'street_locality': 'Perumal kovil street',
      'pincode': '600026',
      'mobilenumber': '9556215635',
      'alternatemobilenumber': '9632587412',
      'ContactPerson_Name': 'theja',
      'relativemobilenumber': '9551963256',
      'relativename': 'theja',
      'RelativeRelation': 'Husband',
      'RelativeRelation_Others': 'Yes',
      'noofyeareducation': '7',
      'occupation': 'Home Maker',
      'occupation_patient_others': 'test',
      'noofyeareducation_husband': '10',
      'occupation_husband': 'Others',
      'occupation_husband_others': 'test',
      'Additional_Details': 'No'
    };
     //data = await BaseLineData.fromJson(params);
    data.docid = '10';
    data.rCHNO ='898498445686';
    var par =data.toJson();
       log(par.toString());
      var response = await http.post(
          Uri.parse(url).replace(queryParameters: par),);
      if (response.statusCode == 200) {
        print('Response data: ${response.body}');
        context.showSnackBar('Data uploaded successfully');
      } else {
        log('Request failed with status: ${response.statusCode}${response
            .body}.');
        context.showSnackBar('Data upload failed');
      }
  }

}