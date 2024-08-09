class Api{
  static const String baseUrl = "http://npac.timesmed.in/";

  static const String login = "Login/Login?";
  static const String getNpacNumber = "TNPHDR/GetTNPHDRNO";


  static const String getStateList = "Baselinedata/LoadState";
  static const String getDistrict= "Baselinedata/LoadCity?state_id=";
  static const String getTaluk= "Baselinedata/LoadTaluk?city_id=";
  static const String getVillage= "Baselinedata/LoadLocation?Taluk_id=";


  static const String registerForm= "Registration_Details/Save_Registration_Pre_Pregnancy?";
  static const String getRegistration= "Registration_Details/Get_Registration_Pre_Pregnancy?PatientId=";
  static const String getRegistrationPregnancy= "Registration_Details/Get_Registration_Previous_Pregnancy_List?PatientId=";
  static const String registerPregnancyForm= "Registration_Details/Save_Registration_Previous_Pregnancy?";
  static const String deletePregnancyForm= "Registration_Details/Delete_Prev_Pregnancy?prev_preg_details_id=";

  static const String motherList= "patient/Get_Patient_List_Show_API?Doctor_id=";
  static const  String registerPatient ='Baselinedata/Save_Baselinedata?';
  static const  String updatePatient ='Baselinedata/Save_Baselinedata_Alone?';
  static const  String getBaseLineData ='Baselinedata/Get_Patient_Data?Patient_id=';

  static const String saveMTP ='VRAPI/SaveAbortionMTPForm';
  static const String getMTP ='VRAPI/GetMtpFormDetails';
  static const String getAntibiotics ='VRAPI/GetMtpAntibioticsDetails';
  static const String saveAntibiotics ='VRAPI/SaveMtpAntiBioticsDetails';
  static const String deleteAntibiotics ='VRAPI/DeleteAntibioticDetails?AbId=';

  static const String getAntenatalVisitOne ='VRAPI/GetAntenatalVisitFormDetails';
  static const String updateAntenatalVisitOne ='VRAPI/SaveAntenatalVisitForm';
  static const String uploadEcho ='VRAPI/Save_Echo_Images';
  static const String getEcho ='VRAPI/Get_Echo_Images';
  static const String getOutcome='VRAPI/GetAntenatalOutcomeImages';
  static const String uploadOutcome='VRAPI/SaveAntenatalOutComeImages';


  static const String getEchoAssignment='VRAPI/GetEchoAssessmentDetails';
  static const String uploadEchoAssignment='VRAPI/SaveEchoAssessmentDetails';
  static const String getEchoImage='VRAPI/Get_Ecg_Images';
  static const String uploadEchoImage='VRAPI/Save_Ecg_Images';

  static const String getPostpartumFirstData='VRAPI/GetPostPartumFirstDetails';
  static const String UploadPostpartumFirst='VRAPI/SavePostPartumFirst';

  static const String getK1Data ='VRAPI/GetPeripartumVisitDetails';
  static const String getK2Data ='VRAPI/GetPeripartumDetails';
  static const String getK3Data ='VRAPI/GetPrimaryOutcomeDetails';
  static const String getK4Data ='VRAPI/GetMaternalOutcomeDetails';
  static const String getK5Data ='VRAPI/GetObsOutcomeDetails';
  static const String getK6Data ='VRAPI/GetFetalOutcomeDetails';
  static const String getK7Data ='VRAPI/GetFinalOutcomeDetails';

  static const String savek1Data ='VRAPI/SavePeripartumVisitDetails';
  static const String savek2Data ='VRAPI/SavePeripartumDetails';
  static const String savek3Data ='VRAPI/SavePrimaryOutcomeDetails';
  static const String savek4Data ='VRAPI/SaveMaternalOutcomeDetails';
  static const String savek5Data ='VRAPI/SaveObsOutcomeDetails';
  static const String savek6Data ='VRAPI/SaveFetalOutcomeDetails';
  static const String savek7Data ='VRAPI/SaveFinalOutcomeDetails';



}