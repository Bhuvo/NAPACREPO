class BaseLineData {
  String? docid;
  int? patientid;
  String? patientfullname;
  String? guardian;
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
  String? mobilenumber;
  String? alternatemobilenumber;
  String? relativeRelation;
  String? relativename;
  String? relativemobilenumber;
  int? noofyeareducation;
  String? qualification;
  String? occupation;
  String? martialstatus;
  int? economicstatusValue;
  String? economicstatusClass;
  String? economicstatus;
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
  String? placeOfFirstReporting;
  String? whenSeenByTheCardiologist;
  String? contactPersonName;
  int? noofyeareducationHusband;
  String? occupationHusband;
  String? occupationPatientOthers;
  String? occupationHusbandOthers;
  String? relativeRelationOthers;
  String? additionalDetails;

  BaseLineData(
      {this.docid,
        this.patientid,
        this.patientfullname,
        this.guardian,
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
        this.alternatemobilenumber,
        this.relativeRelation,
        this.relativename,
        this.relativemobilenumber,
        this.noofyeareducation,
        this.qualification,
        this.occupation,
        this.martialstatus,
        this.economicstatusValue,
        this.economicstatusClass,
        this.economicstatus,
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
        this.placeOfFirstReporting,
        this.whenSeenByTheCardiologist,
        this.contactPersonName,
        this.noofyeareducationHusband,
        this.occupationHusband,
        this.occupationPatientOthers,
        this.occupationHusbandOthers,
        this.relativeRelationOthers,
        this.additionalDetails});

  BaseLineData.fromJson(Map<String, dynamic> json) {
    docid = json['docid'];
    patientid = json['patientid'];
    patientfullname = json['patientfullname'];
    guardian = json['Guardian'];
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
    mobilenumber = '${json['mobilenumber']}';
    alternatemobilenumber = '${json['alternatemobilenumber']}';
    relativeRelation = json['RelativeRelation'];
    relativename = json['relativename'];
    relativemobilenumber = '${json['relativemobilenumber']}';
    noofyeareducation = json['noofyeareducation'];
    qualification = json['Qualification'];
    occupation = json['occupation'];
    martialstatus = json['martialstatus'];
    economicstatusValue = json['economicstatus_value'];
    economicstatusClass = json['economicstatus_class'];
    economicstatus = json['economicstatus'];
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
    placeOfFirstReporting = json['Place_Of_First_Reporting'];
    whenSeenByTheCardiologist = json['When_Seen_By_The_Cardiologist'];
    contactPersonName = json['ContactPerson_Name'];
    noofyeareducationHusband = json['noofyeareducation_husband'];
    occupationHusband = json['occupation_husband'];
    occupationPatientOthers = json['occupation_patient_others'];
    occupationHusbandOthers = json['occupation_husband_others'];
    relativeRelationOthers = json['RelativeRelation_Others'];
    additionalDetails = json['Additional_Details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Doctor_Id'] = this.docid;
    data['patientid'] = '${this.patientid}';
    data['patientfullname'] = this.patientfullname;
    data['Guardian'] = this.guardian;
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
    data['mobilenumber'] = this.mobilenumber;
    data['alternatemobilenumber'] = this.alternatemobilenumber;
    data['RelativeRelation'] = this.relativeRelation;
    data['relativename'] = this.relativename;
    data['relativemobilenumber'] = this.relativemobilenumber;
    data['noofyeareducation'] = '${this.noofyeareducation}';
    data['Qualification'] = this.qualification;
    data['occupation'] = this.occupation;
    data['martialstatus'] = this.martialstatus;
    data['economicstatus_value'] = '${this.economicstatusValue}';
    data['economicstatus_class'] = this.economicstatusClass;
    data['economicstatus'] = this.economicstatus;
    data['Patient_Value'] = '${this.patientValue}';
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
    data['Place_Of_First_Reporting'] = this.placeOfFirstReporting;
    data['When_Seen_By_The_Cardiologist'] = this.whenSeenByTheCardiologist;
    data['ContactPerson_Name'] = this.contactPersonName;
    data['noofyeareducation_husband'] ='${this.noofyeareducationHusband}'; ;
    data['occupation_husband'] = this.occupationHusband;
    data['occupation_patient_others'] = this.occupationPatientOthers;
    data['occupation_husband_others'] = this.occupationHusbandOthers;
    data['RelativeRelation_Others'] = this.relativeRelationOthers;
    data['Additional_Details'] = this.additionalDetails;
    return data;
  }
}
