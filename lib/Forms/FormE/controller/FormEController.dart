
import 'dart:convert';

import 'package:get/get.dart';
import 'package:npac/API/api.dart';
import 'package:npac/Forms/CommonModelController/EchoImage/EchoImageModel.dart';
import 'package:npac/Forms/FormE/FormEModel/AntiBodiesList.dart';
import 'package:npac/Forms/FormE/FormEModel/FormEModel.dart';
import 'package:http/http.dart' as http;
import 'package:npac/app/export.dart';

class FormEController extends GetxController{

  Rx<FormEModel> formEModelData = FormEModel().obs;
  RxList<AntibioticsList> antiBodiesListData= <AntibioticsList>[].obs;
  RxList<EchoImageModel> otherImage = <EchoImageModel>[].obs;


  Future<FormEModel> getMTPData(BuildContext context,int patientId)async{
    var body= {
      "PatientId": patientId
    };
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.getMTP}'),headers: apiHeader,body: jsonEncode(body));
    if(response.statusCode==200){
      var result = FormEModel.fromJson(jsonDecode(response.body));
      // print(result.abortType);
      context.showSnackBar('MTP data fetched successfully');
      return result;
    }else{
      context.showSnackBar('Error while fetching MTP data');
      print(response.body);
    }
    return FormEModel();
  }

  Future<void> saveData(BuildContext context ,FormEModel data, int patientId)async{
    data.doctorId =2;
    data.patientId = patientId;
    var bo ={
      "PatientId": 7992,//int
      "DoctorId": 2,//int
      "AbortType": "Spontaneous",//string
      "VisitDate": "14/06/2024",//string
      "PeriodOfGestation": "1",//string or
      "IndicationForMtp": "Maternal",//string or varchar
      "GestationWeek": "Less than 12 weeks",//string or varchar
      "MethodAdoptedForMtp": "Medical",//string or varchar
      "MethodSuctionEvacuation": true,//bit or boolean
      "MethodDilationCurettage": true,//bit or boolean
      "MethodDilationEvacuation": null,//bit or boolean
      "MethodHysterotomy": null,//bit or boolean
      "MethodMifepristone": true,//bit or boolean
      "MethodMisoprostol": true,//bit or boolean
      "MethodDinoprostone": true,//bit or boolean
      "MethodMechanical": null,//bit or boolean
      "MethodOxytocin": null, //bit or boolean
      "ModeOfAnesthesiaAnalgesia": "Regional",//string or varchar
      "AntibioticProphylaxis": "Yes",//string or varchar
      "AntibioticProphylaxisDetails": "H5 Antibiotic Prophylaxis",//string or varchar
      "ContraceptionAdvisedAfterMtp": "Yes",//string or varchar
      "ContraceptionAdvisedValue": "Others",//string or varchar
      "ContraceptionAdvisedValueOthers": "Barrier method",//string or varchar
      "OutcomeAndComplication": "Cardiac",//string or varchar
      "ObstetricOutcome": "Perforation",//string or varchar
      "MaternalDeathFourTwo": "Non-Cardiac",//string or varchar
      "DeathSummary": null,//string or varchar
      "MaternalDeathFourTwoValue": "Yes",//string or varchar
      "MaternalDeathFourTwoDetails": "11",//string or varchar
      "ResuscitatedCardiacArrest": "Yes",//string or varchar
      "ResuscitatedCardiacArrestDetails": "12",//string or varchar
      "NewOnsetHF": "Yes",//string or varchar
      "NewOnsetHFDetails": "13",//string or varchar
      "NewSustainedCardiacArrhythmia": "Yes",//string or varchar
      "NewSustainedCardiacArrhythmiaDetails": "14",//string or varchar
      "CVAStroke": "Yes",//string or varchar
      "CVAStrokeDetails": "15",//string or varchar
      "ProstheticValveThrombosis": "Yes",//string or varchar
      "ProstheticValveThrombosisDetails": "16",//string or varchar
      "SystemicThromboembolism": "Yes",//string or varchar
      "SystemicThromboembolismDetails": "17",//string or varchar
      "VenousThromboembolism": "Yes",//string or varchar
      "VenousThromboembolismDetails": "18",//string or varchar
      "BleedingMajorMinor": "Obstetric",//string or varchar
      "BleedingMajorMinorValue": "Yes",//string or varchar
      "BleedingMajorMinorDetails": "19",//string or varchar
      "InfectiveEndocarditis": "Yes",//string or varchar
      "InfectiveEndocarditisDetails": "20",//string or varchar
      "AorticDissection": "Yes",//string or varchar
      "AorticDissectionDetails": "21",//string or varchar
      "AcuteCoronarySyndrome": "Yes",//string or varchar
      "AcuteCoronarySyndromeDetails": "22",//string or varchar
      "UrgentCardiacIntervention": "Yes",//string or varchar
      "UrgentCardiacInterventionDetails": "23",//string or varchar
      "MaternalDeathOneEightZero": "Yes",//string or varchar
      "MaternalDeathOneEightZeroDetails": "24",//string or varchar
      "UrgentUnplannedCardiacHospitalization": "Yes",//string or varchar
      "UrgentUnplannedCardiacHospitalizationDetails": "25",//string or varchar
      "DeclineInNyhaClass": "Yes",//string or varchar
      "DeclineInNyhaClassDetails": "26",//string or varchar
      "ElectiveCardiacIntervention": "Yes",//string or varchar
      "ElectiveCardiacInterventionDetails": "27",//string or varchar
      "ICUStayDuration": "Yes",//string or varchar
      "ICUStayDurationDetails": "28",//string or varchar
      "OtherComplications": "Other Complications/Outcome",//string or varchar
      "CIOrPISignature": "Test doctor",//string or varchar
      "TotalHospitalStayDuration": "7 days",//string or varchar
      "AdditionalDetails": "H9.Mention if any additional details:",//string or varchar
      "MifepristoneDose": "3",//string or varchar
      "MisoprostolDose": "4"//string or varchar
    };
    var fin =removeNulls(data.toJson());
    // print(jsonEncode(fin));
    // print(jsonEncode(data));
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.saveMTP}',),headers: {'Content-Type': 'application/json'},body:jsonEncode(fin));
    if(response.statusCode == 200){
      // print(response.body);
      context.showSnackBar('MTP data saved successfully');
      await getMTPData(context,patientId);
  }else{
      context.showSnackBar('Error while saving MTP data');
      print('Error while saving MTP data');
    }
    }

  Future<void> getAntibiotics(BuildContext context,int patientId) async {
    var response = await http.post(
      Uri.parse('${Api.baseUrl}${Api.getAntibiotics}'),
      headers: apiHeader,
      body: jsonEncode({
        "PatientId": patientId,
      }),
    );
    if (response.statusCode == 200) {
      // print(response.body);
      List<dynamic> responseBody = jsonDecode(response.body);
      antiBodiesListData.value = responseBody.map((data) => AntibioticsList.fromJson(data)).toList();
    } else {
      // print(response.body);
      context.showSnackBar('Error while fetching Antibodies data');
    }
  }

  Future<void> saveAntibiotics(BuildContext context, String name, String purpose, String gestWeeks, String durationInDays,int? id,int patientId)async{
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.saveAntibiotics}'),headers: apiHeader,body: jsonEncode({
      "AbId": id,
      "PatientId": patientId,
      "DoctorId": 2,
      "Name": name,
      "Purpose": purpose,
      "GestWeeks": gestWeeks,
      "DurationInDays": durationInDays
    }));
    if(response.statusCode == 200){
      context.showSnackBar('Antibiotics data saved successfully');
      getAntibiotics(context,patientId);
    }else{
      context.showSnackBar('Error while saving Antibodies data');
    }
  }

  Future<void> deleteAntibiotics(BuildContext context,int id,int patientId)async{
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.deleteAntibiotics}$id'),headers: apiHeader);
    if(response.statusCode == 200){
      context.showSnackBar('Antibiotics data deleted successfully');
      await getAntibiotics(context,patientId);
    }else{
      context.showSnackBar('Error while deleting Antibodies data');
    }
  }



}