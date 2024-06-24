class RegistrationModel {
  int? prePregDetailId;
  int? tNPHDRNoId;
  String? firstDiagnosedOfHeartDisease;
  String? heartdiseaseDiagnosisTime;
  String? chronologicalAgeAtDiagnosis;
  String? gestAgeAtDiagnosis;
  String? nYHAClass;
  String? priorCardiacEvent;
  String? heartFailure;
  String? heartFailureHospitalization;
  String? priorCardiacArrhythmia;
  bool? arrhthymiasAF;
  bool? arrhthymiasAT;
  bool? arrhthymiasSVT;
  bool? arrhthymiasVTVF;
  bool? arrhthymiasOthers;
  String? arrhthymiasOthersSpecify;
  String? priorCardiacArrhythmiaHospitalization;
  String? otherPriorCardiac;
  String? otherPriorCardiacOthersSpecify;
  String? otherPriorCardiacHospitalization;
  String? priorAnticoagulantUse;
  String? priorCardiacDrugsUse;
  String? priorNonCardiacMedications;
  String? riskFactors;
  String? diabetes;
  String? hTN;
  String? psychIllness;
  String? alcohol;
  String? smoking;
  String? anemia;
  String? chewingTobacco;
  String? hypothyroid;
  String? hyperthyroid;
  String? epilepsy;
  String? hIV;
  String? autoimmune;
  String? riskFactorsOthers;
  String? riskFactorsOthersSpecify;
  String? previousPregnancyFlag;
  String? activeFlag;
  String? insertDate;
  String? cardiacSurgeriesDone;
  String? surgeriesValveReplacement;
  String? surgeriesProcedureName;
  String? surgeriesProcedureMonthandYear;
  String? cardiacInterventions;
  String? interventionsProcedureName;
  String? interventionsProcedureMonthandYear;
  String? interventionsProcedureAntenatal;

  RegistrationModel(
      {this.prePregDetailId,
        this.tNPHDRNoId,
        this.firstDiagnosedOfHeartDisease,
        this.heartdiseaseDiagnosisTime,
        this.chronologicalAgeAtDiagnosis,
        this.gestAgeAtDiagnosis,
        this.nYHAClass,
        this.priorCardiacEvent,
        this.heartFailure,
        this.heartFailureHospitalization,
        this.priorCardiacArrhythmia,
        this.arrhthymiasAF,
        this.arrhthymiasAT,
        this.arrhthymiasSVT,
        this.arrhthymiasVTVF,
        this.arrhthymiasOthers,
        this.arrhthymiasOthersSpecify,
        this.priorCardiacArrhythmiaHospitalization,
        this.otherPriorCardiac,
        this.otherPriorCardiacOthersSpecify,
        this.otherPriorCardiacHospitalization,
        this.priorAnticoagulantUse,
        this.priorCardiacDrugsUse,
        this.priorNonCardiacMedications,
        this.riskFactors,
        this.diabetes,
        this.hTN,
        this.psychIllness,
        this.alcohol,
        this.smoking,
        this.anemia,
        this.chewingTobacco,
        this.hypothyroid,
        this.hyperthyroid,
        this.epilepsy,
        this.hIV,
        this.autoimmune,
        this.riskFactorsOthers,
        this.riskFactorsOthersSpecify,
        this.previousPregnancyFlag,
        this.activeFlag,
        this.insertDate,
        this.cardiacSurgeriesDone,
        this.surgeriesValveReplacement,
        this.surgeriesProcedureName,
        this.surgeriesProcedureMonthandYear,
        this.cardiacInterventions,
        this.interventionsProcedureName,
        this.interventionsProcedureMonthandYear,
        this.interventionsProcedureAntenatal});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    prePregDetailId = json['pre_preg_detail_id'];
    tNPHDRNoId = json['TNPHDR_No_Id'];
    firstDiagnosedOfHeartDisease = json['FirstDiagnosed_Of_HeartDisease'];
    heartdiseaseDiagnosisTime = json['Heartdisease_diagnosis_Time'];
    chronologicalAgeAtDiagnosis = json['Chronological_age_at_Diagnosis'];
    gestAgeAtDiagnosis = json['Gest_age_at_Diagnosis'];
    nYHAClass = json['NYHA_Class'];
    priorCardiacEvent = json['Prior_Cardiac_Event'];
    heartFailure = json['Heart_Failure'];
    heartFailureHospitalization = json['Heart_Failure_Hospitalization'];
    priorCardiacArrhythmia = json['Prior_Cardiac_Arrhythmia'];
    arrhthymiasAF = json['Arrhthymias_AF'];
    arrhthymiasAT = json['Arrhthymias_AT'];
    arrhthymiasSVT = json['Arrhthymias_SVT'];
    arrhthymiasVTVF = json['Arrhthymias_VT_VF'];
    arrhthymiasOthers = json['Arrhthymias_Others'];
    arrhthymiasOthersSpecify = json['Arrhthymias_Others_Specify'];
    priorCardiacArrhythmiaHospitalization =
    json['Prior_Cardiac_Arrhythmia_Hospitalization'];
    otherPriorCardiac = json['Other_Prior_Cardiac'];
    otherPriorCardiacOthersSpecify = json['Other_Prior_Cardiac_Others_Specify'];
    otherPriorCardiacHospitalization =
    json['Other_Prior_Cardiac_Hospitalization'];
    priorAnticoagulantUse = json['Prior_Anticoagulant_Use'];
    priorCardiacDrugsUse = json['Prior_Cardiac_Drugs_Use'];
    priorNonCardiacMedications = json['Prior_NonCardiac_Medications'];
    riskFactors = json['RiskFactors'];
    diabetes = json['Diabetes'];
    hTN = json['HTN'];
    psychIllness = json['Psych_Illness'];
    alcohol = json['Alcohol'];
    smoking = json['Smoking'];
    anemia = json['Anemia'];
    chewingTobacco = json['Chewing_Tobacco'];
    hypothyroid = json['Hypothyroid'];
    hyperthyroid = json['Hyperthyroid'];
    epilepsy = json['Epilepsy'];
    hIV = json['HIV'];
    autoimmune = json['Autoimmune'];
    riskFactorsOthers = json['Risk_Factors_Others'];
    riskFactorsOthersSpecify = json['Risk_Factors_Others_Specify'];
    previousPregnancyFlag = json['previous_pregnancy_flag'];
    activeFlag = json['Active_Flag'];
    insertDate = json['Insert_Date'];
    cardiacSurgeriesDone = json['Cardiac_Surgeries_Done'];
    surgeriesValveReplacement = json['Surgeries_Valve_Replacement'];
    surgeriesProcedureName = json['Surgeries_ProcedureName'];
    surgeriesProcedureMonthandYear = json['Surgeries_Procedure_MonthandYear'];
    cardiacInterventions = json['Cardiac_Interventions'];
    interventionsProcedureName = json['Interventions_ProcedureName'];
    interventionsProcedureMonthandYear =
    json['Interventions_Procedure_MonthandYear'];
    interventionsProcedureAntenatal = json['Interventions_Procedure_Antenatal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pre_preg_detail_id'] = '${this.prePregDetailId}';
    data['TNPHDR_No_Id'] = '${this.tNPHDRNoId}';
    data['FirstDiagnosed_Of_HeartDisease'] = this.firstDiagnosedOfHeartDisease;
    data['Heartdisease_diagnosis_Time'] = this.heartdiseaseDiagnosisTime;
    data['Chronological_age_at_Diagnosis'] = this.chronologicalAgeAtDiagnosis;
    data['Gest_age_at_Diagnosis'] = this.gestAgeAtDiagnosis;
    data['NYHA_Class'] = this.nYHAClass;
    data['Prior_Cardiac_Event'] = this.priorCardiacEvent;
    data['Heart_Failure'] = this.heartFailure;
    data['Heart_Failure_Hospitalization'] = this.heartFailureHospitalization;
    data['Prior_Cardiac_Arrhythmia'] = this.priorCardiacArrhythmia;
    data['Arrhthymias_AF'] = '${this.arrhthymiasAF}';
    data['Arrhthymias_AT'] = '${this.arrhthymiasAT}';
    data['Arrhthymias_SVT'] = '${this.arrhthymiasSVT}';
    data['Arrhthymias_VT_VF'] = '${this.arrhthymiasVTVF}';
    data['Arrhthymias_Others'] = '${this.arrhthymiasOthers}';
    data['Arrhthymias_Others_Specify'] = this.arrhthymiasOthersSpecify;
    data['Prior_Cardiac_Arrhythmia_Hospitalization'] =
        this.priorCardiacArrhythmiaHospitalization;
    data['Other_Prior_Cardiac'] = this.otherPriorCardiac;
    data['Other_Prior_Cardiac_Others_Specify'] =
        this.otherPriorCardiacOthersSpecify;
    data['Other_Prior_Cardiac_Hospitalization'] =
        this.otherPriorCardiacHospitalization;
    data['Prior_Anticoagulant_Use'] = this.priorAnticoagulantUse;
    data['Prior_Cardiac_Drugs_Use'] = this.priorCardiacDrugsUse;
    data['Prior_NonCardiac_Medications'] = this.priorNonCardiacMedications;
    data['RiskFactors'] = this.riskFactors;
    data['Diabetes'] = this.diabetes;
    data['HTN'] = this.hTN;
    data['Psych_Illness'] = this.psychIllness;
    data['Alcohol'] = this.alcohol;
    data['Smoking'] = this.smoking;
    data['Anemia'] = this.anemia;
    data['Chewing_Tobacco'] = this.chewingTobacco;
    data['Hypothyroid'] = this.hypothyroid;
    data['Hyperthyroid'] = this.hyperthyroid;
    data['Epilepsy'] = this.epilepsy;
    data['HIV'] = this.hIV;
    data['Autoimmune'] = this.autoimmune;
    data['Risk_Factors_Others'] = this.riskFactorsOthers;
    data['Risk_Factors_Others_Specify'] = this.riskFactorsOthersSpecify;
    data['previous_pregnancy_flag'] = this.previousPregnancyFlag;
    data['Active_Flag'] = this.activeFlag;
    data['Insert_Date'] = this.insertDate;
    data['Cardiac_Surgeries_Done'] = this.cardiacSurgeriesDone;
    data['Surgeries_Valve_Replacement'] = this.surgeriesValveReplacement;
    data['Surgeries_ProcedureName'] = this.surgeriesProcedureName;
    data['Surgeries_Procedure_MonthandYear'] =
        this.surgeriesProcedureMonthandYear;
    data['Cardiac_Interventions'] = this.cardiacInterventions;
    data['Interventions_ProcedureName'] = this.interventionsProcedureName;
    data['Interventions_Procedure_MonthandYear'] =
        this.interventionsProcedureMonthandYear;
    data['Interventions_Procedure_Antenatal'] =
        this.interventionsProcedureAntenatal;
    return data;
  }
}
