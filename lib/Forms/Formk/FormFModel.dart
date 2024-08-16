class FormFModel {
  int? formFId;
  int? patientId;
  bool? peripartumCardiomyopathy;
  bool? dilatedCardiomyopathy;
  bool? ischemicHeartDisease;
  bool? ventricularHeartDisease;
  bool? hypertrophicCardiomyopathy;
  bool? restrictiveCardiomyopathy;
  bool? myocarditis;
  bool? congenitalHeartDisease;
  bool? acuteRheumaticFever;
  bool? nonCompliantCardiomyopathy;
  bool? etiologyOthers;
  String? etiologyOthersSpecify;
  String? postpartumHypertension;
  String? substanceAbuse;
  String? tocolyticTheraphy;
  String? fever;
  String? obesity;
  String? familyHistory;
  String? priorDiagnosisOfPPCM;
  String? diagnosisOfPPCMLVEF;
  String? presentPregnancySymptoms;
  String? symptomsFirstNoted;
  int? antenatalGestationalAge;
  String? postnatalInDays;
  String? eCHOs;
  String? bioMarker;
  String? bioMarkerDate;
  int? bioMarkerBNP;
  int? bioMarkerProBNP;
  String? treatmentGiven;
  bool? aCEI;
  bool? aRNI;
  bool? aRB;
  bool? otherDiuretics;
  String? otherDiureticsSpecify;
  bool? betaBlockers;
  bool? digoxin;
  bool? nitrates;
  bool? mRAs;
  bool? anticoagulants;
  bool? diuretic;
  String? anyOtherRelevantInformation;

  FormFModel(
      {this.formFId,
        this.patientId,
        this.peripartumCardiomyopathy,
        this.dilatedCardiomyopathy,
        this.ischemicHeartDisease,
        this.ventricularHeartDisease,
        this.hypertrophicCardiomyopathy,
        this.restrictiveCardiomyopathy,
        this.myocarditis,
        this.congenitalHeartDisease,
        this.acuteRheumaticFever,
        this.nonCompliantCardiomyopathy,
        this.etiologyOthers,
        this.etiologyOthersSpecify,
        this.postpartumHypertension,
        this.substanceAbuse,
        this.tocolyticTheraphy,
        this.fever,
        this.obesity,
        this.familyHistory,
        this.priorDiagnosisOfPPCM,
        this.diagnosisOfPPCMLVEF,
        this.presentPregnancySymptoms,
        this.symptomsFirstNoted,
        this.antenatalGestationalAge,
        this.postnatalInDays,
        this.eCHOs,
        this.bioMarker,
        this.bioMarkerDate,
        this.bioMarkerBNP,
        this.bioMarkerProBNP,
        this.treatmentGiven,
        this.aCEI,
        this.aRNI,
        this.aRB,
        this.otherDiuretics,
        this.otherDiureticsSpecify,
        this.betaBlockers,
        this.digoxin,
        this.nitrates,
        this.mRAs,
        this.anticoagulants,
        this.diuretic,
        this.anyOtherRelevantInformation});

  FormFModel.fromJson(Map<String, dynamic> json) {
    formFId = json['Form_F_Id'];
    patientId = json['PatientId'];
    peripartumCardiomyopathy = json['Peripartum_Cardiomyopathy'];
    dilatedCardiomyopathy = json['Dilated_Cardiomyopathy'];
    ischemicHeartDisease = json['Ischemic_HeartDisease'];
    ventricularHeartDisease = json['Ventricular_HeartDisease'];
    hypertrophicCardiomyopathy = json['Hypertrophic_Cardiomyopathy'];
    restrictiveCardiomyopathy = json['Restrictive_Cardiomyopathy'];
    myocarditis = json['Myocarditis'];
    congenitalHeartDisease = json['Congenital_Heart_Disease'];
    acuteRheumaticFever = json['Acute_Rheumatic_Fever'];
    nonCompliantCardiomyopathy = json['NonCompliant_Cardiomyopathy'];
    etiologyOthers = json['Etiology_Others'];
    etiologyOthersSpecify = json['Etiology_Others_Specify'];
    postpartumHypertension = json['Postpartum_Hypertension'];
    substanceAbuse = json['Substance_Abuse'];
    tocolyticTheraphy = json['Tocolytic_Theraphy'];
    fever = json['Fever'];
    obesity = json['Obesity'];
    familyHistory = json['Family_History'];
    priorDiagnosisOfPPCM = json['Prior_Diagnosis_of_PPCM'];
    diagnosisOfPPCMLVEF = json['Diagnosis_of_PPCM_LVEF'];
    presentPregnancySymptoms = json['Present_Pregnancy_Symptoms'];
    symptomsFirstNoted = json['Symptoms_First_Noted'];
    antenatalGestationalAge = json['Antenatal_Gestational_Age'];
    postnatalInDays = json['Postnatal_InDays'];
    eCHOs = json['ECHOs'];
    bioMarker = json['Bio_Marker'];
    bioMarkerDate = json['Bio_Marker_Date'];
    bioMarkerBNP = json['Bio_Marker_BNP'];
    bioMarkerProBNP = json['Bio_Marker_Pro_BNP'];
    treatmentGiven = json['Treatment_Given'];
    aCEI = json['ACEI'];
    aRNI = json['ARNI'];
    aRB = json['ARB'];
    otherDiuretics = json['Other_Diuretics'];
    otherDiureticsSpecify = json['Other_Diuretics_Specify'];
    betaBlockers = json['Beta_Blockers'];
    digoxin = json['Digoxin'];
    nitrates = json['Nitrates'];
    mRAs = json['MRAs'];
    anticoagulants = json['Anticoagulants'];
    diuretic = json['Diuretic'];
    anyOtherRelevantInformation = json['Any_Other_Relevant_Information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Form_F_Id'] = this.formFId;
    data['PatientId'] = this.patientId;
    data['Peripartum_Cardiomyopathy'] = this.peripartumCardiomyopathy;
    data['Dilated_Cardiomyopathy'] = this.dilatedCardiomyopathy;
    data['Ischemic_HeartDisease'] = this.ischemicHeartDisease;
    data['Ventricular_HeartDisease'] = this.ventricularHeartDisease;
    data['Hypertrophic_Cardiomyopathy'] = this.hypertrophicCardiomyopathy;
    data['Restrictive_Cardiomyopathy'] = this.restrictiveCardiomyopathy;
    data['Myocarditis'] = this.myocarditis;
    data['Congenital_Heart_Disease'] = this.congenitalHeartDisease;
    data['Acute_Rheumatic_Fever'] = this.acuteRheumaticFever;
    data['NonCompliant_Cardiomyopathy'] = this.nonCompliantCardiomyopathy;
    data['Etiology_Others'] = this.etiologyOthers;
    data['Etiology_Others_Specify'] = this.etiologyOthersSpecify;
    data['Postpartum_Hypertension'] = this.postpartumHypertension;
    data['Substance_Abuse'] = this.substanceAbuse;
    data['Tocolytic_Theraphy'] = this.tocolyticTheraphy;
    data['Fever'] = this.fever;
    data['Obesity'] = this.obesity;
    data['Family_History'] = this.familyHistory;
    data['Prior_Diagnosis_of_PPCM'] = this.priorDiagnosisOfPPCM;
    data['Diagnosis_of_PPCM_LVEF'] = this.diagnosisOfPPCMLVEF;
    data['Present_Pregnancy_Symptoms'] = this.presentPregnancySymptoms;
    data['Symptoms_First_Noted'] = this.symptomsFirstNoted;
    data['Antenatal_Gestational_Age'] = this.antenatalGestationalAge;
    data['Postnatal_InDays'] = this.postnatalInDays;
    data['ECHOs'] = this.eCHOs;
    data['Bio_Marker'] = this.bioMarker;
    data['Bio_Marker_Date'] = this.bioMarkerDate;
    data['Bio_Marker_BNP'] = this.bioMarkerBNP;
    data['Bio_Marker_Pro_BNP'] = this.bioMarkerProBNP;
    data['Treatment_Given'] = this.treatmentGiven;
    data['ACEI'] = this.aCEI;
    data['ARNI'] = this.aRNI;
    data['ARB'] = this.aRB;
    data['Other_Diuretics'] = this.otherDiuretics;
    data['Other_Diuretics_Specify'] = this.otherDiureticsSpecify;
    data['Beta_Blockers'] = this.betaBlockers;
    data['Digoxin'] = this.digoxin;
    data['Nitrates'] = this.nitrates;
    data['MRAs'] = this.mRAs;
    data['Anticoagulants'] = this.anticoagulants;
    data['Diuretic'] = this.diuretic;
    data['Any_Other_Relevant_Information'] = this.anyOtherRelevantInformation;
    return data;
  }
}
