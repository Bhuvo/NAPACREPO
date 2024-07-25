class FormMModel {
  int? id;
  int? doctorId;
  int? patientId;
  String? dateOfVisit;
  String? typeOfFollowup;
  String? nyhaSymptomsClass;
  String? ceDoneNotDone;
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
  String? reasonForHospitalization;
  String? contraceptionUsed;
  String? contraceptionUsedOthersValue;
  String? cardiacFollowup;
  String? specificTreatmentPlans;
  String? neonatalWeight;
  String? ecgEvaluation;
  String? ecgEvaluationValue;
  String? ecgEvaluationCong;
  String? adverseNeonatalOutcome;
  String? commentsOption;
  String? otherComments;

  FormMModel(
      {this.id,
        this.doctorId,
        this.patientId,
        this.dateOfVisit,
        this.typeOfFollowup,
        this.nyhaSymptomsClass,
        this.ceDoneNotDone,
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
        this.reasonForHospitalization,
        this.contraceptionUsed,
        this.contraceptionUsedOthersValue,
        this.cardiacFollowup,
        this.specificTreatmentPlans,
        this.neonatalWeight,
        this.ecgEvaluation,
        this.ecgEvaluationValue,
        this.ecgEvaluationCong,
        this.adverseNeonatalOutcome,
        this.commentsOption,
        this.otherComments});

  FormMModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    doctorId = json['DoctorId'];
    patientId = json['PatientId'];
    dateOfVisit = json['DateOfVisit'];
    typeOfFollowup = json['TypeOfFollowup'];
    nyhaSymptomsClass = json['NyhaSymptomsClass'];
    ceDoneNotDone = json['CeDoneNotDone'];
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
    reasonForHospitalization = json['ReasonForHospitalization'];
    contraceptionUsed = json['ContraceptionUsed'];
    contraceptionUsedOthersValue = json['ContraceptionUsedOthersValue'];
    cardiacFollowup = json['CardiacFollowup'];
    specificTreatmentPlans = json['SpecificTreatmentPlans'];
    neonatalWeight = json['NeonatalWeight'];
    ecgEvaluation = json['EcgEvaluation'];
    ecgEvaluationValue = json['EcgEvaluationValue'];
    ecgEvaluationCong = json['EcgEvaluationCong'];
    adverseNeonatalOutcome = json['AdverseNeonatalOutcome'];
    commentsOption = json['CommentsOption'];
    otherComments = json['OtherComments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['DoctorId'] = this.doctorId;
    data['PatientId'] = this.patientId;
    data['DateOfVisit'] = this.dateOfVisit;
    data['TypeOfFollowup'] = this.typeOfFollowup;
    data['NyhaSymptomsClass'] = this.nyhaSymptomsClass;
    data['CeDoneNotDone'] = this.ceDoneNotDone;
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
    data['ReasonForHospitalization'] = this.reasonForHospitalization;
    data['ContraceptionUsed'] = this.contraceptionUsed;
    data['ContraceptionUsedOthersValue'] = this.contraceptionUsedOthersValue;
    data['CardiacFollowup'] = this.cardiacFollowup;
    data['SpecificTreatmentPlans'] = this.specificTreatmentPlans;
    data['NeonatalWeight'] = this.neonatalWeight;
    data['EcgEvaluation'] = this.ecgEvaluation;
    data['EcgEvaluationValue'] = this.ecgEvaluationValue;
    data['EcgEvaluationCong'] = this.ecgEvaluationCong;
    data['AdverseNeonatalOutcome'] = this.adverseNeonatalOutcome;
    data['CommentsOption'] = this.commentsOption;
    data['OtherComments'] = this.otherComments;
    return data;
  }
}
