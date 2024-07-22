class FormFModel {
  int? antenatalId;
  int? visitNo;
  int? doctorId;
  int? patientId;
  String? visitDate;
  int? periodOfGestation;
  String? trimester;
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
  String? outComeIdentified;

  FormFModel(
      {this.antenatalId,
        this.visitNo,
        this.doctorId,
        this.patientId,
        this.visitDate,
        this.periodOfGestation,
        this.trimester,
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
        this.outComeIdentified});

  FormFModel.fromJson(Map<String, dynamic> json) {
    antenatalId = json['AntenatalId'];
    visitNo = json['VisitNo'];
    doctorId = json['DoctorId'];
    patientId = json['PatientId'];
    visitDate = json['VisitDate'];
    periodOfGestation = json['PeriodOfGestation'];
    trimester = json['Trimester'];
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
    outComeIdentified = json['OutComeIdentified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AntenatalId'] = this.antenatalId;
    data['VisitNo'] = this.visitNo;
    data['DoctorId'] = this.doctorId;
    data['PatientId'] = this.patientId;
    data['VisitDate'] = this.visitDate;
    data['PeriodOfGestation'] = this.periodOfGestation;
    data['Trimester'] = this.trimester;
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
    data['OutComeIdentified'] = this.outComeIdentified;
    return data;
  }
}
