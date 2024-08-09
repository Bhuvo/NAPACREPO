class FormK1Model {
  int? periId;
  int? doctorId;
  int? patientId;
  int? formId;
  String? dateOfAdmission;
  String? dateOfDischarge;
  String? nyhaSymptomsClass;
  String? mWhoClassification;
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

  FormK1Model(
      {this.periId,
        this.doctorId,
        this.patientId,
        this.formId,
        this.dateOfAdmission,
        this.dateOfDischarge,
        this.nyhaSymptomsClass,
        this.mWhoClassification,
        this.clinicalSignWeight,
        this.clinicalSignHR,
        this.clinicalSignSp,
        this.clinicalSignBp,
        this.clinicalSignCcf,
        this.clinicalSignCyanosis,
        this.clinicalSignCardiacMurmur,
        this.ecgDate,
        this.ecgNormalAbnormal,
        this.significantChanges});

  FormK1Model.fromJson(Map<String, dynamic> json) {
    periId = json['PeriId'];
    doctorId = json['DoctorId'];
    patientId = json['PatientId'];
    formId = json['FormId'];
    dateOfAdmission = json['DateOfAdmission'];
    dateOfDischarge = json['DateOfDischarge'];
    nyhaSymptomsClass = json['NyhaSymptomsClass'];
    mWhoClassification = json['MWhoClassification'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PeriId'] = this.periId;
    data['DoctorId'] = this.doctorId;
    data['PatientId'] = this.patientId;
    data['FormId'] = this.formId;
    data['DateOfAdmission'] = this.dateOfAdmission;
    data['DateOfDischarge'] = this.dateOfDischarge;
    data['NyhaSymptomsClass'] = this.nyhaSymptomsClass;
    data['MWhoClassification'] = this.mWhoClassification;
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
    return data;
  }
}
