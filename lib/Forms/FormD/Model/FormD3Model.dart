class FormD3Model {
  int? completeDiagnosisId;
  int? patientId;
  int? periodOfGestation;
  String? obstetricDiagnosisValue1;
  String? obstetricDiagnosisValue2;
  String? obstetricDiagnosisValue3;
  String? congMalformation;
  String? congMalformationSpecify;
  bool? pEDCongenitalHeartDisease;
  bool? pEDHeartDisease;
  bool? pEDCardiomyopathy;
  bool? pEDAortopathies;
  bool? pEDCardiacArrhythmia;
  bool? pEDCoronaryArteryDisease;
  bool? pEDPulmonaryEmbolism;
  bool? pEDPrimaryPulmonaryHypertension;
  bool? pEDOthers;
  String? pEDOthersSpecify;
  bool? cardiomyopathyDilated;
  bool? cardiomyopathyHypertrophic;
  bool? cardiomyopathyRestrictive;
  bool? cardiomyopathyPeripartum;
  bool? cardiomyopathyOthers;
  String? cardiomyopathyOthersSpecify;
  bool? aortopathiesMarfan;
  bool? aortopathiesTakayasu;
  bool? aortopathiesHTAD;
  bool? aortopathiesOthers;
  String? aortopathiesOthersSpecify;
  bool? pulmonaryHypertension;
  bool? congestiveHeartFailure;
  bool? atrialFibrillation;
  bool? infectiveEndocarditis;
  String? completeCardiacDiagnosis;
  String? insertDate;

  FormD3Model(
      {this.completeDiagnosisId,
        this.patientId,
        this.periodOfGestation,
        this.obstetricDiagnosisValue1,
        this.obstetricDiagnosisValue2,
        this.obstetricDiagnosisValue3,
        this.congMalformation,
        this.congMalformationSpecify,
        this.pEDCongenitalHeartDisease,
        this.pEDHeartDisease,
        this.pEDCardiomyopathy,
        this.pEDAortopathies,
        this.pEDCardiacArrhythmia,
        this.pEDCoronaryArteryDisease,
        this.pEDPulmonaryEmbolism,
        this.pEDPrimaryPulmonaryHypertension,
        this.pEDOthers,
        this.pEDOthersSpecify,
        this.cardiomyopathyDilated,
        this.cardiomyopathyHypertrophic,
        this.cardiomyopathyRestrictive,
        this.cardiomyopathyPeripartum,
        this.cardiomyopathyOthers,
        this.cardiomyopathyOthersSpecify,
        this.aortopathiesMarfan,
        this.aortopathiesTakayasu,
        this.aortopathiesHTAD,
        this.aortopathiesOthers,
        this.aortopathiesOthersSpecify,
        this.pulmonaryHypertension,
        this.congestiveHeartFailure,
        this.atrialFibrillation,
        this.infectiveEndocarditis,
        this.completeCardiacDiagnosis,
        this.insertDate});

  FormD3Model.fromJson(Map<String, dynamic> json) {
    completeDiagnosisId = json['Complete_Diagnosis_Id'];
    patientId = json['PatientId'];
    periodOfGestation = json['Period_of_Gestation'];
    obstetricDiagnosisValue1 = json['Obstetric_Diagnosis_Value_1'];
    obstetricDiagnosisValue2 = json['Obstetric_Diagnosis_Value_2'];
    obstetricDiagnosisValue3 = json['Obstetric_Diagnosis_Value_3'];
    congMalformation = json['Cong_Malformation'];
    congMalformationSpecify = json['Cong_Malformation_Specify'];
    pEDCongenitalHeartDisease = json['PED_Congenital_Heart_Disease'];
    pEDHeartDisease = json['PED_Heart_Disease'];
    pEDCardiomyopathy = json['PED_Cardiomyopathy'];
    pEDAortopathies = json['PED_Aortopathies'];
    pEDCardiacArrhythmia = json['PED_CardiacArrhythmia'];
    pEDCoronaryArteryDisease = json['PED_Coronary_Artery_Disease'];
    pEDPulmonaryEmbolism = json['PED_PulmonaryEmbolism'];
    pEDPrimaryPulmonaryHypertension = json['PED_PrimaryPulmonaryHypertension'];
    pEDOthers = json['PED_Others'];
    pEDOthersSpecify = json['PED_Others_Specify'];
    cardiomyopathyDilated = json['Cardiomyopathy_Dilated'];
    cardiomyopathyHypertrophic = json['Cardiomyopathy_Hypertrophic'];
    cardiomyopathyRestrictive = json['Cardiomyopathy_Restrictive'];
    cardiomyopathyPeripartum = json['Cardiomyopathy_Peripartum'];
    cardiomyopathyOthers = json['Cardiomyopathy_Others'];
    cardiomyopathyOthersSpecify = json['Cardiomyopathy_Others_Specify'];
    aortopathiesMarfan = json['Aortopathies_Marfan'];
    aortopathiesTakayasu = json['Aortopathies_Takayasu'];
    aortopathiesHTAD = json['Aortopathies_HTAD'];
    aortopathiesOthers = json['Aortopathies_Others'];
    aortopathiesOthersSpecify = json['Aortopathies_Others_Specify'];
    pulmonaryHypertension = json['Pulmonary_Hypertension'];
    congestiveHeartFailure = json['Congestive_Heart_Failure'];
    atrialFibrillation = json['Atrial_Fibrillation'];
    infectiveEndocarditis = json['Infective_Endocarditis'];
    completeCardiacDiagnosis = json['Complete_Cardiac_Diagnosis'];
    insertDate = json['Insert_Date'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['Complete_Diagnosis_Id'] = this.completeDiagnosisId;
  //   data['PatientId'] = this.patientId;
  //   data['Period_of_Gestation'] = this.periodOfGestation;
  //   data['Obstetric_Diagnosis_Value_1'] = this.obstetricDiagnosisValue1;
  //   data['Obstetric_Diagnosis_Value_2'] = this.obstetricDiagnosisValue2;
  //   data['Obstetric_Diagnosis_Value_3'] = this.obstetricDiagnosisValue3;
  //   data['Cong_Malformation'] = this.congMalformation;
  //   data['Cong_Malformation_Specify'] = this.congMalformationSpecify;
  //   data['PED_Congenital_Heart_Disease'] = this.pEDCongenitalHeartDisease;
  //   data['PED_Heart_Disease'] = this.pEDHeartDisease;
  //   data['PED_Cardiomyopathy'] = this.pEDCardiomyopathy;
  //   data['PED_Aortopathies'] = this.pEDAortopathies;
  //   data['PED_CardiacArrhythmia'] = this.pEDCardiacArrhythmia;
  //   data['PED_Coronary_Artery_Disease'] = this.pEDCoronaryArteryDisease;
  //   data['PED_PulmonaryEmbolism'] = this.pEDPulmonaryEmbolism;
  //   data['PED_PrimaryPulmonaryHypertension'] =
  //       this.pEDPrimaryPulmonaryHypertension;
  //   data['PED_Others'] = this.pEDOthers;
  //   data['PED_Others_Specify'] = this.pEDOthersSpecify;
  //   data['Cardiomyopathy_Dilated'] = this.cardiomyopathyDilated;
  //   data['Cardiomyopathy_Hypertrophic'] = this.cardiomyopathyHypertrophic;
  //   data['Cardiomyopathy_Restrictive'] = this.cardiomyopathyRestrictive;
  //   data['Cardiomyopathy_Peripartum'] = this.cardiomyopathyPeripartum;
  //   data['Cardiomyopathy_Others'] = this.cardiomyopathyOthers;
  //   data['Cardiomyopathy_Others_Specify'] = this.cardiomyopathyOthersSpecify;
  //   data['Aortopathies_Marfan'] = this.aortopathiesMarfan;
  //   data['Aortopathies_Takayasu'] = this.aortopathiesTakayasu;
  //   data['Aortopathies_HTAD'] = this.aortopathiesHTAD;
  //   data['Aortopathies_Others'] = this.aortopathiesOthers;
  //   data['Aortopathies_Others_Specify'] = this.aortopathiesOthersSpecify;
  //   data['Pulmonary_Hypertension'] = this.pulmonaryHypertension;
  //   data['Congestive_Heart_Failure'] = this.congestiveHeartFailure;
  //   data['Atrial_Fibrillation'] = this.atrialFibrillation;
  //   data['Infective_Endocarditis'] = this.infectiveEndocarditis;
  //   data['Complete_Cardiac_Diagnosis'] = this.completeCardiacDiagnosis;
  //   data['Insert_Date'] = this.insertDate;
  //   return data;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Complete_Diagnosis_Id'] = this.completeDiagnosisId?.toString();
    data['PatientId'] = this.patientId?.toString();
    data['Period_of_Gestation'] = this.periodOfGestation?.toString();
    data['Obstetric_Diagnosis_Value_1'] = this.obstetricDiagnosisValue1?.toString();
    data['Obstetric_Diagnosis_Value_2'] = this.obstetricDiagnosisValue2?.toString();
    data['Obstetric_Diagnosis_Value_3'] = this.obstetricDiagnosisValue3?.toString();
    data['Cong_Malformation'] = this.congMalformation?.toString();
    data['Cong_Malformation_Specify'] = this.congMalformationSpecify?.toString();
    data['PED_Congenital_Heart_Disease'] = this.pEDCongenitalHeartDisease?.toString();
    data['PED_Heart_Disease'] = this.pEDHeartDisease?.toString();
    data['PED_Cardiomyopathy'] = this.pEDCardiomyopathy?.toString();
    data['PED_Aortopathies'] = this.pEDAortopathies?.toString();
    data['PED_CardiacArrhythmia'] = this.pEDCardiacArrhythmia?.toString();
    data['PED_Coronary_Artery_Disease'] = this.pEDCoronaryArteryDisease?.toString();
    data['PED_PulmonaryEmbolism'] = this.pEDPulmonaryEmbolism?.toString();
    data['PED_PrimaryPulmonaryHypertension'] = this.pEDPrimaryPulmonaryHypertension?.toString();
    data['PED_Others'] = this.pEDOthers?.toString();
    data['PED_Others_Specify'] = this.pEDOthersSpecify?.toString();
    data['Cardiomyopathy_Dilated'] = this.cardiomyopathyDilated?.toString();
    data['Cardiomyopathy_Hypertrophic'] = this.cardiomyopathyHypertrophic?.toString();
    data['Cardiomyopathy_Restrictive'] = this.cardiomyopathyRestrictive?.toString();
    data['Cardiomyopathy_Peripartum'] = this.cardiomyopathyPeripartum?.toString();
    data['Cardiomyopathy_Others'] = this.cardiomyopathyOthers?.toString();
    data['Cardiomyopathy_Others_Specify'] = this.cardiomyopathyOthersSpecify?.toString();
    data['Aortopathies_Marfan'] = this.aortopathiesMarfan?.toString();
    data['Aortopathies_Takayasu'] = this.aortopathiesTakayasu?.toString();
    data['Aortopathies_HTAD'] = this.aortopathiesHTAD?.toString();
    data['Aortopathies_Others'] = this.aortopathiesOthers?.toString();
    data['Aortopathies_Others_Specify'] = this.aortopathiesOthersSpecify?.toString();
    data['Pulmonary_Hypertension'] = this.pulmonaryHypertension?.toString();
    data['Congestive_Heart_Failure'] = this.congestiveHeartFailure?.toString();
    data['Atrial_Fibrillation'] = this.atrialFibrillation?.toString();
    data['Infective_Endocarditis'] = this.infectiveEndocarditis?.toString();
    data['Complete_Cardiac_Diagnosis'] = this.completeCardiacDiagnosis?.toString();
    data['Insert_Date'] = this.insertDate?.toString();
    return data;
  }

}
