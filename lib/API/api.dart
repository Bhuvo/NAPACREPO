class Api{
  static const String baseUrl = "http://npac.timesmed.in/";

  static const String login = "Login/Login?";

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

  static const String getAntenatalVisitOne ='VRAPI/GetAntenatalVisitFormDetails';



}