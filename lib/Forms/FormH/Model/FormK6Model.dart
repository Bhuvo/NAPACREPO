class FormK6Model {
  int? fetalOutcomeId;
  int? doctorId;
  int? patientId;
  int? formId;
  String? fetalMiscarriage;
  String? fetalMiscarriageTime;
  String? fetalLossAnteIntra;
  String? fetalLoss;
  String? fetalLossTime;
  String? fetalGestAge;
  String? fetalGestAgeTime;
  String? fetalLowBirthWeight;
  String? lowBirthWeightTime;
  String? neonatalIcuAdmit;
  String? neonatalIcuAdmitTime;
  String? earlyNeonatalDeath;
  String? earlyNeonatalDeathTime;
  String? lateNeonatalDeath;
  String? lateNeonatalDeathTime;
  String? congAnomalies;
  String? congAnomaliesTime;
  String? verifiedBy;

  FormK6Model(
      {this.fetalOutcomeId,
        this.doctorId,
        this.patientId,
        this.formId,
        this.fetalMiscarriage,
        this.fetalMiscarriageTime,
        this.fetalLossAnteIntra,
        this.fetalLoss,
        this.fetalLossTime,
        this.fetalGestAge,
        this.fetalGestAgeTime,
        this.fetalLowBirthWeight,
        this.lowBirthWeightTime,
        this.neonatalIcuAdmit,
        this.neonatalIcuAdmitTime,
        this.earlyNeonatalDeath,
        this.earlyNeonatalDeathTime,
        this.lateNeonatalDeath,
        this.lateNeonatalDeathTime,
        this.congAnomalies,
        this.congAnomaliesTime,
        this.verifiedBy});

  FormK6Model.fromJson(Map<String, dynamic> json) {
    fetalOutcomeId = json['FetalOutcomeId'];
    doctorId = json['DoctorId'];
    patientId = json['PatientId'];
    formId = json['FormId'];
    fetalMiscarriage = json['FetalMiscarriage'];
    fetalMiscarriageTime = json['FetalMiscarriageTime'];
    fetalLossAnteIntra = json['FetalLossAnteIntra'];
    fetalLoss = json['FetalLoss'];
    fetalLossTime = json['FetalLossTime'];
    fetalGestAge = json['FetalGestAge'];
    fetalGestAgeTime = json['FetalGestAgeTime'];
    fetalLowBirthWeight = json['FetalLowBirthWeight'];
    lowBirthWeightTime = json['LowBirthWeightTime'];
    neonatalIcuAdmit = json['NeonatalIcuAdmit'];
    neonatalIcuAdmitTime = json['NeonatalIcuAdmitTime'];
    earlyNeonatalDeath = json['EarlyNeonatalDeath'];
    earlyNeonatalDeathTime = json['EarlyNeonatalDeathTime'];
    lateNeonatalDeath = json['LateNeonatalDeath'];
    lateNeonatalDeathTime = json['LateNeonatalDeathTime'];
    congAnomalies = json['CongAnomalies'];
    congAnomaliesTime = json['CongAnomaliesTime'];
    verifiedBy = json['VerifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FetalOutcomeId'] = this.fetalOutcomeId;
    data['DoctorId'] = this.doctorId;
    data['PatientId'] = this.patientId;
    data['FormId'] = this.formId;
    data['FetalMiscarriage'] = this.fetalMiscarriage;
    data['FetalMiscarriageTime'] = this.fetalMiscarriageTime;
    data['FetalLossAnteIntra'] = this.fetalLossAnteIntra;
    data['FetalLoss'] = this.fetalLoss;
    data['FetalLossTime'] = this.fetalLossTime;
    data['FetalGestAge'] = this.fetalGestAge;
    data['FetalGestAgeTime'] = this.fetalGestAgeTime;
    data['FetalLowBirthWeight'] = this.fetalLowBirthWeight;
    data['LowBirthWeightTime'] = this.lowBirthWeightTime;
    data['NeonatalIcuAdmit'] = this.neonatalIcuAdmit;
    data['NeonatalIcuAdmitTime'] = this.neonatalIcuAdmitTime;
    data['EarlyNeonatalDeath'] = this.earlyNeonatalDeath;
    data['EarlyNeonatalDeathTime'] = this.earlyNeonatalDeathTime;
    data['LateNeonatalDeath'] = this.lateNeonatalDeath;
    data['LateNeonatalDeathTime'] = this.lateNeonatalDeathTime;
    data['CongAnomalies'] = this.congAnomalies;
    data['CongAnomaliesTime'] = this.congAnomaliesTime;
    data['VerifiedBy'] = this.verifiedBy;
    return data;
  }
}
