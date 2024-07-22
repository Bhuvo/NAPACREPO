class BaseLineData {
  int? patientid;
  int? docid;
  String? patientfullname;
  String? guardian;
  String? guardianType;
  String? pinNumber;
  int? age;
  String? dob;
  String? flatname;
  String? streetLocality;
  String? talukId;
  String? district;
  String? stateid;
  String? villageid;
  int? pincode;
  int? aadharno;
  int? mobilenumber;
  String? relativeRelation;
  String? relativename;
  String? relativemobilenumber;
  int? noofyeareducation;
  String? occupation;
  String? economicstatus;
  String? economicstatusType;
  int? patientValue;
  String? activeflag;
  String? inserteddate;
  String? altereddate;
  String? insertBy;
  String? consentedFileName;
  String? tNPHDRNo;
  String? rCHNO;
  String? dateOfRegistration;
  String? antenatalorpostnatal;
  String? heartDisease;
  String? consented;
  String? dateOfReferral;
  String? dateOfEnrollment;
  String? noofyeareducationHusband;
  String? occupationHusband;
  String? occupationPatientOthers;
  String? occupationHusbandOthers;
  String? relativeRelationOthers;
  String? additionalDetails;
  String? healthCare;
  String? healthCarePersonName;
  String? healthCarePersonMoblieNo;
  String? healthCarePersonDesignation;
  String? rCHNOAvailable;

  BaseLineData(
      {this.patientid,
        this.patientfullname,
        this.guardian,
        this.guardianType,
        this.pinNumber,
        this.age,
        this.dob,
        this.flatname,
        this.streetLocality,
        this.talukId,
        this.district,
        this.stateid,
        this.villageid,
        this.pincode,
        this.aadharno,
        this.mobilenumber,
        this.relativeRelation,
        this.relativename,
        this.relativemobilenumber,
        this.noofyeareducation,
        this.occupation,
        this.economicstatus,
        this.economicstatusType,
        this.patientValue,
        this.activeflag,
        this.inserteddate,
        this.altereddate,
        this.insertBy,
        this.consentedFileName,
        this.tNPHDRNo,
        this.rCHNO,
        this.dateOfRegistration,
        this.antenatalorpostnatal,
        this.heartDisease,
        this.consented,
        this.dateOfReferral,
        this.dateOfEnrollment,
        this.noofyeareducationHusband,
        this.occupationHusband,
        this.occupationPatientOthers,
        this.occupationHusbandOthers,
        this.relativeRelationOthers,
        this.additionalDetails,
        this.healthCare,
        this.healthCarePersonName,
        this.healthCarePersonMoblieNo,
        this.healthCarePersonDesignation,
        this.rCHNOAvailable});

  BaseLineData.fromJson(Map<String, dynamic> json) {
    patientid = json['patientid'];
    patientfullname = json['patientfullname'];
    guardian = json['Guardian'];
    guardianType = json['Guardian_Type'];
    pinNumber = json['pin_number'];
    age = json['age'];
    dob = json['dob'];
    flatname = json['flatname'];
    streetLocality = json['street_locality'];
    talukId = json['Taluk_id'];
    district = json['district'];
    stateid = json['stateid'];
    villageid = json['villageid'];
    pincode = json['pincode'];
    aadharno = json['aadharno'];
    mobilenumber = json['mobilenumber'];
    relativeRelation = json['RelativeRelation'];
    relativename = json['relativename'];
    relativemobilenumber = json['relativemobilenumber'];
    noofyeareducation = json['noofyeareducation'];
    occupation = json['occupation'];
    economicstatus = json['economicstatus'];
    economicstatusType = json['economicstatus_type'];
    patientValue = json['Patient_Value'];
    activeflag = json['activeflag'];
    inserteddate = json['inserteddate'];
    altereddate = json['altereddate'];
    insertBy = json['insert_by'];
    consentedFileName = json['Consented_File_Name'];
    tNPHDRNo = json['TNPHDR_No'];
    rCHNO = json['RCH_NO'];
    dateOfRegistration = json['Date_Of_Registration'];
    antenatalorpostnatal = json['Antenatalorpostnatal'];
    heartDisease = json['HeartDisease'];
    consented = json['Consented'];
    dateOfReferral = json['Date_Of_Referral'];
    dateOfEnrollment = json['Date_Of_Enrollment'];
    noofyeareducationHusband = json['noofyeareducation_husband'];
    occupationHusband = json['occupation_husband'];
    occupationPatientOthers = json['occupation_patient_others'];
    occupationHusbandOthers = json['occupation_husband_others'];
    relativeRelationOthers = json['RelativeRelation_Others'];
    additionalDetails = json['Additional_Details'];
    healthCare = json['HealthCare'];
    healthCarePersonName = json['HealthCare_Person_Name'];
    healthCarePersonMoblieNo = json['HealthCare_Person_MoblieNo'];
    healthCarePersonDesignation = json['HealthCare_Person_Designation'];
    rCHNOAvailable = json['RCH_NO_Available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientid'] = '${this.patientid}';
    data['patientfullname'] = this.patientfullname;
    data['Guardian'] = this.guardian;
    data['Guardian_Type'] = this.guardianType;
    data['pin_number'] = this.pinNumber;
    data['age'] = '${this.age}';
    data['dob'] = this.dob;
    data['flatname'] = this.flatname;
    data['street_locality'] = this.streetLocality;
    data['Taluk_id'] = this.talukId;
    data['district'] = this.district;
    data['stateid'] = this.stateid;
    data['villageid'] = this.villageid;
    data['pincode'] = '${this.pincode}';
    data['aadharno'] = '${this.aadharno}';
    data['mobilenumber'] = '${this.mobilenumber}';
    data['RelativeRelation'] = this.relativeRelation;
    data['relativename'] = this.relativename;
    data['relativemobilenumber'] = this.relativemobilenumber;
    data['noofyeareducation'] = '${this.noofyeareducation}';
    data['occupation'] = this.occupation;
    data['economicstatus'] = this.economicstatus;
    data['economicstatus_type'] = this.economicstatusType;
    data['Patient_Value'] ='${this.patientValue}';
    data['activeflag'] = this.activeflag;
    data['inserteddate'] = this.inserteddate;
    data['altereddate'] = this.altereddate;
    data['insert_by'] = this.insertBy;
    data['Consented_File_Name'] = this.consentedFileName;
    data['TNPHDR_No'] = this.tNPHDRNo;
    data['RCH_NO'] = this.rCHNO;
    data['Date_Of_Registration'] = this.dateOfRegistration;
    data['Antenatalorpostnatal'] = this.antenatalorpostnatal;
    data['HeartDisease'] = this.heartDisease;
    data['Consented'] = this.consented;
    data['Date_Of_Referral'] = this.dateOfReferral;
    data['Date_Of_Enrollment'] = this.dateOfEnrollment;
    data['noofyeareducation_husband'] = this.noofyeareducationHusband;
    data['occupation_husband'] = this.occupationHusband;
    data['occupation_patient_others'] = this.occupationPatientOthers;
    data['occupation_husband_others'] = this.occupationHusbandOthers;
    data['RelativeRelation_Others'] = this.relativeRelationOthers;
    data['Additional_Details'] = this.additionalDetails;
    data['HealthCare'] = this.healthCare;
    data['HealthCare_Person_Name'] = this.healthCarePersonName;
    data['HealthCare_Person_MoblieNo'] = this.healthCarePersonMoblieNo;
    data['HealthCare_Person_Designation'] = this.healthCarePersonDesignation;
    data['RCH_NO_Available'] = this.rCHNOAvailable;
    return data;
  }
}
