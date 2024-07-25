class FormLModel {
  int? id;
  int? doctorId;
  int? patientId;
  String? dateOfVisit;
  String? nyhaSymptomsClass;
  int? clinicalSignWeight;
  int? clinicalSignHR;
  int? clinicalSignSp;
  int? clinicalSignBp;
  String? clinicalSignCcf;
  String? clinicalSignCyanosis;
  String? clinicalSignCardiacMurmur;
  String? ecgDate;
  String? ecgNormalAbnormal;
  String? significantChanges;
  String? hospitalisationAfterDischarge;
  String? hospitalizationDate;
  String? reasonForHospitalization;
  String? postpartumContraception;
  String? cardiacReferral;
  String? neonatalOutcome;
  String? neonatalOutcomeOptions;
  String? neonatalWeight;
  String? causeOfDeath;
  String? ecgEvaluation;
  String? ecgEvaluationValue;
  String? adverseNeonatalOutcome;
  String? otherComments;
  String? nextFollowUpDate;

  FormLModel(
      {this.id,
        this.doctorId,
        this.patientId,
        this.dateOfVisit,
        this.nyhaSymptomsClass,
        this.clinicalSignWeight,
        this.clinicalSignHR,
        this.clinicalSignSp,
        this.clinicalSignBp,
        this.clinicalSignCcf,
        this.clinicalSignCyanosis,
        this.clinicalSignCardiacMurmur,
        this.ecgDate,
        this.ecgNormalAbnormal,
        this.significantChanges,
        this.hospitalisationAfterDischarge,
        this.hospitalizationDate,
        this.reasonForHospitalization,
        this.postpartumContraception,
        this.cardiacReferral,
        this.neonatalOutcome,
        this.neonatalOutcomeOptions,
        this.neonatalWeight,
        this.causeOfDeath,
        this.ecgEvaluation,
        this.ecgEvaluationValue,
        this.adverseNeonatalOutcome,
        this.otherComments,
        this.nextFollowUpDate});

  FormLModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    doctorId = json['DoctorId'];
    patientId = json['PatientId'];
    dateOfVisit = json['DateOfVisit'];
    nyhaSymptomsClass = json['NyhaSymptomsClass'];
    clinicalSignWeight = json['ClinicalSignWeight'];
    clinicalSignHR = json['ClinicalSignHR'];
    clinicalSignSp = json['ClinicalSignSp'];
    clinicalSignBp = json['ClinicalSignBp'];
    clinicalSignCcf = json['ClinicalSignCcf'];
    clinicalSignCyanosis = json['ClinicalSignCyanosis'];
    clinicalSignCardiacMurmur = json['ClinicalSignCardiacMurmur'];
    ecgDate = json['EcgDate'];
    ecgNormalAbnormal = json['EcgNormalAbnormal'];
    significantChanges = json['SignificantChanges'];
    hospitalisationAfterDischarge = json['HospitalisationAfterDischarge'];
    hospitalizationDate = json['HospitalizationDate'];
    reasonForHospitalization = json['ReasonForHospitalization'];
    postpartumContraception = json['PostpartumContraception'];
    cardiacReferral = json['CardiacReferral'];
    neonatalOutcome = json['NeonatalOutcome'];
    neonatalOutcomeOptions = json['NeonatalOutcomeOptions'];
    neonatalWeight = json['NeonatalWeight'];
    causeOfDeath = json['CauseOfDeath'];
    ecgEvaluation = json['EcgEvaluation'];
    ecgEvaluationValue = json['EcgEvaluationValue'];
    adverseNeonatalOutcome = json['AdverseNeonatalOutcome'];
    otherComments = json['OtherComments'];
    nextFollowUpDate = json['NextFollowUpDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['DoctorId'] = this.doctorId;
    data['PatientId'] = this.patientId;
    data['DateOfVisit'] = this.dateOfVisit;
    data['NyhaSymptomsClass'] = this.nyhaSymptomsClass;
    data['ClinicalSignWeight'] = this.clinicalSignWeight;
    data['ClinicalSignHR'] = this.clinicalSignHR;
    data['ClinicalSignSp'] = this.clinicalSignSp;
    data['ClinicalSignBp'] = this.clinicalSignBp;
    data['ClinicalSignCcf'] = this.clinicalSignCcf;
    data['ClinicalSignCyanosis'] = this.clinicalSignCyanosis;
    data['ClinicalSignCardiacMurmur'] = this.clinicalSignCardiacMurmur;
    data['EcgDate'] = this.ecgDate;
    data['EcgNormalAbnormal'] = this.ecgNormalAbnormal;
    data['SignificantChanges'] = this.significantChanges;
    data['HospitalisationAfterDischarge'] = this.hospitalisationAfterDischarge;
    data['HospitalizationDate'] = this.hospitalizationDate;
    data['ReasonForHospitalization'] = this.reasonForHospitalization;
    data['PostpartumContraception'] = this.postpartumContraception;
    data['CardiacReferral'] = this.cardiacReferral;
    data['NeonatalOutcome'] = this.neonatalOutcome;
    data['NeonatalOutcomeOptions'] = this.neonatalOutcomeOptions;
    data['NeonatalWeight'] = this.neonatalWeight;
    data['CauseOfDeath'] = this.causeOfDeath;
    data['EcgEvaluation'] = this.ecgEvaluation;
    data['EcgEvaluationValue'] = this.ecgEvaluationValue;
    data['AdverseNeonatalOutcome'] = this.adverseNeonatalOutcome;
    data['OtherComments'] = this.otherComments;
    data['NextFollowUpDate'] = this.nextFollowUpDate;
    return data;
  }
}
