class FormD1Model {
  int? cpAntenatalId;
  int? patientId;
  int? gestationalAgeAtEnrollment;
  String? firstVisitDate;
  String? conception;
  String? priorCardiacEvent;
  int? obstetricScoreG;
  int? obstetricScoreP;
  int? obstetricScoreL;
  int? obstetricScoreA;
  String? pregnancyType;
  String? pregnancyTypeOthers;
  String? lMP;
  String? eDD;
  String? whenFirstANVisitDone;
  String? whereFirstANVisitDone;
  bool? firstVisitGovt;
  bool? firstVisitPrivate;
  String? whenFirstVisitWithCardiacSupport;
  String? againstMedicalAdvice;
  String? anyAntenatalInterventionsDone;
  String? anyAntenatalInterventionsSpecify;
  String? nYHAClass;
  String? insertDate;

  FormD1Model(
      {this.cpAntenatalId,
        this.patientId,
        this.gestationalAgeAtEnrollment,
        this.firstVisitDate,
        this.conception,
        this.priorCardiacEvent,
        this.obstetricScoreG,
        this.obstetricScoreP,
        this.obstetricScoreL,
        this.obstetricScoreA,
        this.pregnancyType,
        this.pregnancyTypeOthers,
        this.lMP,
        this.eDD,
        this.whenFirstANVisitDone,
        this.whereFirstANVisitDone,
        this.firstVisitGovt,
        this.firstVisitPrivate,
        this.whenFirstVisitWithCardiacSupport,
        this.againstMedicalAdvice,
        this.anyAntenatalInterventionsDone,
        this.anyAntenatalInterventionsSpecify,
        this.nYHAClass,
        this.insertDate});

  FormD1Model.fromJson(Map<String, dynamic> json) {
    cpAntenatalId = json['Cp_Antenatal_Id'];
    patientId = json['PatientId'];
    gestationalAgeAtEnrollment = json['Gestational_Age_At_Enrollment'];
    firstVisitDate = json['First_Visit_Date'];
    conception = json['Conception'];
    priorCardiacEvent = json['Prior_Cardiac_Event'];
    obstetricScoreG = json['ObstetricScore_G'];
    obstetricScoreP = json['ObstetricScore_P'];
    obstetricScoreL = json['ObstetricScore_L'];
    obstetricScoreA = json['ObstetricScore_A'];
    pregnancyType = json['Pregnancy_Type'];
    pregnancyTypeOthers = json['Pregnancy_Type_Others'];
    lMP = json['LMP'];
    eDD = json['EDD'];
    whenFirstANVisitDone = json['When_First_AN_Visit_Done'];
    whereFirstANVisitDone = json['Where_First_AN_Visit_Done'];
    firstVisitGovt = json['FirstVisit_Govt'];
    firstVisitPrivate = json['FirstVisit_Private'];
    whenFirstVisitWithCardiacSupport =
    json['When_First_Visit_with_Cardiac_Support'];
    againstMedicalAdvice = json['Against_Medical_Advice'];
    anyAntenatalInterventionsDone = json['Any_Antenatal_Interventions_Done'];
    anyAntenatalInterventionsSpecify =
    json['Any_Antenatal_Interventions_Specify'];
    nYHAClass = json['NYHA_Class'];
    insertDate = json['Insert_Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Cp_Antenatal_Id'] = this.cpAntenatalId;
    data['PatientId'] = this.patientId;
    data['Gestational_Age_At_Enrollment'] = this.gestationalAgeAtEnrollment;
    data['First_Visit_Date'] = this.firstVisitDate;
    data['Conception'] = this.conception;
    data['Prior_Cardiac_Event'] = this.priorCardiacEvent;
    data['ObstetricScore_G'] = this.obstetricScoreG;
    data['ObstetricScore_P'] = this.obstetricScoreP;
    data['ObstetricScore_L'] = this.obstetricScoreL;
    data['ObstetricScore_A'] = this.obstetricScoreA;
    data['Pregnancy_Type'] = this.pregnancyType;
    data['Pregnancy_Type_Others'] = this.pregnancyTypeOthers;
    data['LMP'] = this.lMP;
    data['EDD'] = this.eDD;
    data['When_First_AN_Visit_Done'] = this.whenFirstANVisitDone;
    data['Where_First_AN_Visit_Done'] = this.whereFirstANVisitDone;
    data['FirstVisit_Govt'] = this.firstVisitGovt;
    data['FirstVisit_Private'] = this.firstVisitPrivate;
    data['When_First_Visit_with_Cardiac_Support'] =
        this.whenFirstVisitWithCardiacSupport;
    data['Against_Medical_Advice'] = this.againstMedicalAdvice;
    data['Any_Antenatal_Interventions_Done'] =
        this.anyAntenatalInterventionsDone;
    data['Any_Antenatal_Interventions_Specify'] =
        this.anyAntenatalInterventionsSpecify;
    data['NYHA_Class'] = this.nYHAClass;
    data['Insert_Date'] = this.insertDate;
    return data;
  }
}
