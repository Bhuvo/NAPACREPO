class FormK4Model {
  int? matOutcomeId;
  int? doctorId;
  int? patientId;
  int? formId;
  String? secondaryMaternalDeath;
  String? secondaryMaternalDeathValues;
  String? secondaryMaternalDeathTime;
  String? secCardiacHospitalization;
  String? secCardiacHospitalizationValues;
  String? secCardiacHospitalizationTime;
  String? secNyhaClass;
  String? secNyhaClassValues;
  String? secNyhaClassTime;
  String? secEci;
  String? secEciValues;
  String? secEciTime;

  String? secIcuStay;
  String? secIcuStayValues;
  String? secIcuStayTime;
  String? secIcuStayDays;
  String? secIcuStayDaysValues;
  String? secIcuStayDaysTime;
  String? verifiedBy;

  FormK4Model(
      {this.matOutcomeId,
        this.doctorId,
        this.patientId,
        this.formId,
        this.secondaryMaternalDeath,
        this.secondaryMaternalDeathValues,
        this.secondaryMaternalDeathTime,
        this.secCardiacHospitalization,
        this.secCardiacHospitalizationValues,
        this.secCardiacHospitalizationTime,
        this.secNyhaClass,
        this.secNyhaClassValues,
        this.secNyhaClassTime,
        this.secEci,
        this.secEciValues,
        this.secEciTime,
        this.secIcuStay,
        this.secIcuStayValues,
        this.secIcuStayTime,
        this.secIcuStayDays,
        this.secIcuStayDaysValues,
        this.secIcuStayDaysTime,
        this.verifiedBy});

  FormK4Model.fromJson(Map<String, dynamic> json) {
    matOutcomeId = json['MatOutcomeId'];
    doctorId = json['DoctorId'];
    patientId = json['PatientId'];
    formId = json['FormId'];
    secondaryMaternalDeath = json['SecondaryMaternalDeath'];
    secondaryMaternalDeathValues = json['SecondaryMaternalDeathValues'];
    secondaryMaternalDeathTime = json['SecondaryMaternalDeathTime'];
    secCardiacHospitalization = json['SecCardiacHospitalization'];
    secCardiacHospitalizationValues = json['SecCardiacHospitalizationValues'];
    secCardiacHospitalizationTime = json['SecCardiacHospitalizationTime'];
    secNyhaClass = json['SecNyhaClass'];
    secNyhaClassValues = json['SecNyhaClassValues'];
    secNyhaClassTime = json['SecNyhaClassTime'];
    secEci = json['SecEci'];
    secEciValues = json['SecEciValues'];
    secEciTime = json['SecEciTime'];
    secIcuStay = json['SecIcuStay'];
    secIcuStayValues = json['SecIcuStayValues'];
    secIcuStayTime = json['SecIcuStayTime'];
    secIcuStayDays = json['SecIcuStayDays'];
    secIcuStayDaysValues = json['SecIcuStayDaysValues'];
    secIcuStayDaysTime = json['SecIcuStayDaysTime'];
    verifiedBy = json['VerifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MatOutcomeId'] = this.matOutcomeId;
    data['DoctorId'] = this.doctorId;
    data['PatientId'] = this.patientId;
    data['FormId'] = this.formId;
    data['SecondaryMaternalDeath'] = this.secondaryMaternalDeath;
    data['SecondaryMaternalDeathValues'] = this.secondaryMaternalDeathValues;
    data['SecondaryMaternalDeathTime'] = this.secondaryMaternalDeathTime;
    data['SecCardiacHospitalization'] = this.secCardiacHospitalization;
    data['SecCardiacHospitalizationValues'] =
        this.secCardiacHospitalizationValues;
    data['SecCardiacHospitalizationTime'] = this.secCardiacHospitalizationTime;
    data['SecNyhaClass'] = this.secNyhaClass;
    data['SecNyhaClassValues'] = this.secNyhaClassValues;
    data['SecNyhaClassTime'] = this.secNyhaClassTime;
    data['SecEci'] = this.secEci;
    data['SecEciValues'] = this.secEciValues;
    data['SecEciTime'] = this.secEciTime;
    data['SecIcuStay'] = this.secIcuStay;
    data['SecIcuStayValues'] = this.secIcuStayValues;
    data['SecIcuStayTime'] = this.secIcuStayTime;
    data['SecIcuStayDays'] = this.secIcuStayDays;
    data['SecIcuStayDaysValues'] = this.secIcuStayDaysValues;
    data['SecIcuStayDaysTime'] = this.secIcuStayDaysTime;
    data['VerifiedBy'] = this.verifiedBy;
    return data;
  }
}
