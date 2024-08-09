class FormK3Model {
  int? prOutcomeId;
  int? doctorId;
  int? patientId;
  int? formId;
  String? primaryMdCardNonCard;
  String? primaryMaternalDeathFourTwo;
  String? primaryMaternalDeathFourTwoValues;
  bool? primaryBleedingObs;
  String? primaryBleedingTypeObestric;
  bool? primaryBleedingNonObs;
  String? primaryBleedingTypeNonObestric;
  String? primaryBleeding;
  String? primaryBleedingValues;
  String? primaryBleedingTime;
  String? primaryInfEnd;
  String? primaryInfEndValues;
  String? primaryInfEndTime;
  String? primaryAorticDisc;
  String? primaryAorticDiscValues;
  String? primaryAorticDiscTime;
  String? primaryAcs;
  String? primaryAcsValues;
  String? primaryAcsTime;
  String? primaryUci;
  String? primaryUciValues;
  String? primaryUciTime;
  String? primaryRca;
  String? primaryOnsetHf;
  String? primarySca;
  String? primaryCva;
  String? primaryPvt;
  String? primarySystThromb;
  String? primaryPte;

  FormK3Model(
      {this.prOutcomeId,
        this.doctorId,
        this.patientId,
        this.formId,
        this.primaryMdCardNonCard,
        this.primaryMaternalDeathFourTwo,
        this.primaryMaternalDeathFourTwoValues,
        this.primaryBleedingObs,
        this.primaryBleedingTypeObestric,
        this.primaryBleedingNonObs,
        this.primaryBleedingTypeNonObestric,
        this.primaryBleeding,
        this.primaryBleedingValues,
        this.primaryBleedingTime,
        this.primaryInfEnd,
        this.primaryInfEndValues,
        this.primaryInfEndTime,
        this.primaryAorticDisc,
        this.primaryAorticDiscValues,
        this.primaryAorticDiscTime,
        this.primaryAcs,
        this.primaryAcsValues,
        this.primaryAcsTime,
        this.primaryUci,
        this.primaryUciValues,
        this.primaryUciTime,
        this.primaryRca,
        this.primaryOnsetHf,
        this.primarySca,
        this.primaryCva,
        this.primaryPvt,
        this.primarySystThromb,
        this.primaryPte});

  FormK3Model.fromJson(Map<String, dynamic> json) {
    prOutcomeId = json['PrOutcomeId'];
    doctorId = json['DoctorId'];
    patientId = json['PatientId'];
    formId = json['FormId'];
    primaryMdCardNonCard = json['PrimaryMdCardNonCard'];
    primaryMaternalDeathFourTwo = json['PrimaryMaternalDeathFourTwo'];
    primaryMaternalDeathFourTwoValues =
    json['PrimaryMaternalDeathFourTwoValues'];
    primaryBleedingObs = json['PrimaryBleedingObs'];
    primaryBleedingTypeObestric = json['PrimaryBleedingTypeObestric'];
    primaryBleedingNonObs = json['PrimaryBleedingNonObs'];
    primaryBleedingTypeNonObestric = json['PrimaryBleedingTypeNonObestric'];
    primaryBleeding = json['PrimaryBleeding'];
    primaryBleedingValues = json['PrimaryBleedingValues'];
    primaryBleedingTime = json['PrimaryBleedingTime'];
    primaryInfEnd = json['PrimaryInfEnd'];
    primaryInfEndValues = json['PrimaryInfEndValues'];
    primaryInfEndTime = json['PrimaryInfEndTime'];
    primaryAorticDisc = json['PrimaryAorticDisc'];
    primaryAorticDiscValues = json['PrimaryAorticDiscValues'];
    primaryAorticDiscTime = json['PrimaryAorticDiscTime'];
    primaryAcs = json['PrimaryAcs'];
    primaryAcsValues = json['PrimaryAcsValues'];
    primaryAcsTime = json['PrimaryAcsTime'];
    primaryUci = json['PrimaryUci'];
    primaryUciValues = json['PrimaryUciValues'];
    primaryUciTime = json['PrimaryUciTime'];
    primaryRca = json['PrimaryRca'];
    primaryOnsetHf = json['PrimaryOnsetHf'];
    primarySca = json['PrimarySca'];
    primaryCva = json['PrimaryCva'];
    primaryPvt = json['PrimaryPvt'];
    primarySystThromb = json['PrimarySystThromb'];
    primaryPte = json['PrimaryPte'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PrOutcomeId'] = this.prOutcomeId;
    data['DoctorId'] = this.doctorId;
    data['PatientId'] = this.patientId;
    data['FormId'] = this.formId;
    data['PrimaryMdCardNonCard'] = this.primaryMdCardNonCard;
    data['PrimaryMaternalDeathFourTwo'] = this.primaryMaternalDeathFourTwo;
    data['PrimaryMaternalDeathFourTwoValues'] =
        this.primaryMaternalDeathFourTwoValues;
    data['PrimaryBleedingObs'] = this.primaryBleedingObs;
    data['PrimaryBleedingTypeObestric'] = this.primaryBleedingTypeObestric;
    data['PrimaryBleedingNonObs'] = this.primaryBleedingNonObs;
    data['PrimaryBleedingTypeNonObestric'] =
        this.primaryBleedingTypeNonObestric;
    data['PrimaryBleeding'] = this.primaryBleeding;
    data['PrimaryBleedingValues'] = this.primaryBleedingValues;
    data['PrimaryBleedingTime'] = this.primaryBleedingTime;
    data['PrimaryInfEnd'] = this.primaryInfEnd;
    data['PrimaryInfEndValues'] = this.primaryInfEndValues;
    data['PrimaryInfEndTime'] = this.primaryInfEndTime;
    data['PrimaryAorticDisc'] = this.primaryAorticDisc;
    data['PrimaryAorticDiscValues'] = this.primaryAorticDiscValues;
    data['PrimaryAorticDiscTime'] = this.primaryAorticDiscTime;
    data['PrimaryAcs'] = this.primaryAcs;
    data['PrimaryAcsValues'] = this.primaryAcsValues;
    data['PrimaryAcsTime'] = this.primaryAcsTime;
    data['PrimaryUci'] = this.primaryUci;
    data['PrimaryUciValues'] = this.primaryUciValues;
    data['PrimaryUciTime'] = this.primaryUciTime;
    data['PrimaryRca'] = this.primaryRca;
    data['PrimaryOnsetHf'] = this.primaryOnsetHf;
    data['PrimarySca'] = this.primarySca;
    data['PrimaryCva'] = this.primaryCva;
    data['PrimaryPvt'] = this.primaryPvt;
    data['PrimarySystThromb'] = this.primarySystThromb;
    data['PrimaryPte'] = this.primaryPte;
    return data;
  }
}
