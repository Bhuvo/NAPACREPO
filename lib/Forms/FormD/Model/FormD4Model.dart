class FormD4Model {
  int? echoId;
  int? patientId;
  String? echocardiographicAssessment;
  String? echoImage;
  String? morphologicalLA;
  String? morphologicalRA;
  String? morphologicalLV;
  String? morphologicalRV;
  String? wallMotion;
  String? lVSYSFunction;
  int? lVSYSDiastoleMm;
  int? lVSYSSystoleMm;
  String? lVSYSEF;
  int? lVSYSEFPercentage;
  String? rVSYS;
  int? rVSYSTAPSEMm;
  int? rVSYSRVs;
  int? rVSYSRVFAC;
  String? valvularMorphology;
  String? mitral;
  String? mitralFunction;
  bool? mitralStenotic;
  String? mitralStenoticValue;
  int? mitralMVOA;
  int? mitralMVGradientMean;
  int? mitralMVGradientPeak;
  bool? mitralRegurgitant;
  String? mitralRegurgitantValue;
  String? aortic;
  String? aorticFunction;
  bool? aorticStenotic;
  String? aorticStenoticValue;
  int? aorticGradientMean;
  int? aorticGradientPeak;
  bool? aorticRegurgitant;
  String? aorticRegurgitantValue;
  String? tricuspid;
  String? tricuspidFunction;
  bool? tricuspidStenotic;
  String? tricuspidStenoticValue;
  int? tricuspidGradientMean;
  int? tricuspidGradientPeak;
  bool? tricuspidRegurgitant;
  String? tricuspidRegurgitantValue;
  String? pulmonary;
  String? pulmonaryFunction;
  bool? pulmonaryStenotic;
  String? pulmonaryStenoticValue;
  int? pulmonaryGradientMean;
  int? pulmonaryGradientPeak;
  bool? pulmonaryRegurgitant;
  String? pulmonaryRegurgitantValue;
  String? valvarPathology;
  String? valvarPathologyOthers;
  int? tricuspidTRPG;
  int? estimatedRAPressure;
  int? pAT;
  int? peakPulmonaryReg;
  String? pulmonaryHypertension;
  String? pericardium;
  String? pericardiumEffusion;
  String? aorta;
  bool? othersVegetation;
  bool? othersThrombusClot;
  bool? othersMass;
  String? otherRelevantEchoFindings;
  String? insertDate;

  FormD4Model(
      {this.echoId,
        this.patientId,
        this.echocardiographicAssessment,
        this.echoImage,
        this.morphologicalLA,
        this.morphologicalRA,
        this.morphologicalLV,
        this.morphologicalRV,
        this.wallMotion,
        this.lVSYSFunction,
        this.lVSYSDiastoleMm,
        this.lVSYSSystoleMm,
        this.lVSYSEF,
        this.lVSYSEFPercentage,
        this.rVSYS,
        this.rVSYSTAPSEMm,
        this.rVSYSRVs,
        this.rVSYSRVFAC,
        this.valvularMorphology,
        this.mitral,
        this.mitralFunction,
        this.mitralStenotic,
        this.mitralStenoticValue,
        this.mitralMVOA,
        this.mitralMVGradientMean,
        this.mitralMVGradientPeak,
        this.mitralRegurgitant,
        this.mitralRegurgitantValue,
        this.aortic,
        this.aorticFunction,
        this.aorticStenotic,
        this.aorticStenoticValue,
        this.aorticGradientMean,
        this.aorticGradientPeak,
        this.aorticRegurgitant,
        this.aorticRegurgitantValue,
        this.tricuspid,
        this.tricuspidFunction,
        this.tricuspidStenotic,
        this.tricuspidStenoticValue,
        this.tricuspidGradientMean,
        this.tricuspidGradientPeak,
        this.tricuspidRegurgitant,
        this.tricuspidRegurgitantValue,
        this.pulmonary,
        this.pulmonaryFunction,
        this.pulmonaryStenotic,
        this.pulmonaryStenoticValue,
        this.pulmonaryGradientMean,
        this.pulmonaryGradientPeak,
        this.pulmonaryRegurgitant,
        this.pulmonaryRegurgitantValue,
        this.valvarPathology,
        this.valvarPathologyOthers,
        this.tricuspidTRPG,
        this.estimatedRAPressure,
        this.pAT,
        this.peakPulmonaryReg,
        this.pulmonaryHypertension,
        this.pericardium,
        this.pericardiumEffusion,
        this.aorta,
        this.othersVegetation,
        this.othersThrombusClot,
        this.othersMass,
        this.otherRelevantEchoFindings,
        this.insertDate});

  FormD4Model.fromJson(Map<String, dynamic> json) {
    echoId = json['Echo_Id'];
    patientId = json['PatientId'];
    echocardiographicAssessment = json['Echocardiographic_Assessment'];
    echoImage = json['echo_image'];
    morphologicalLA = json['Morphological_LA'];
    morphologicalRA = json['Morphological_RA'];
    morphologicalLV = json['Morphological_LV'];
    morphologicalRV = json['Morphological_RV'];
    wallMotion = json['Wall_Motion'];
    lVSYSFunction = json['LV_SYS_Function'];
    lVSYSDiastoleMm = json['LV_SYS_Diastole_mm'];
    lVSYSSystoleMm = json['LV_SYS_Systole_mm'];
    lVSYSEF = json['LV_SYS_EF'];
    lVSYSEFPercentage = json['LV_SYS_EF_Percentage'];
    rVSYS = json['RV_SYS'];
    rVSYSTAPSEMm = json['RV_SYS_TAPSE_mm'];
    rVSYSRVs = json['RV_SYS_RVs'];
    rVSYSRVFAC = json['RV_SYS_RV_FAC'];
    valvularMorphology = json['Valvular_Morphology'];
    mitral = json['Mitral'];
    mitralFunction = json['Mitral_Function'];
    mitralStenotic = json['Mitral_Stenotic'];
    mitralStenoticValue = json['Mitral_Stenotic_Value'];
    mitralMVOA = json['Mitral_MVOA'];
    mitralMVGradientMean = json['Mitral_MV_Gradient_Mean'];
    mitralMVGradientPeak = json['Mitral_MV_Gradient_Peak'];
    mitralRegurgitant = json['Mitral_Regurgitant'];
    mitralRegurgitantValue = json['Mitral_Regurgitant_Value'];
    aortic = json['Aortic'];
    aorticFunction = json['Aortic_Function'];
    aorticStenotic = json['Aortic_Stenotic'];
    aorticStenoticValue = json['Aortic_Stenotic_Value'];
    aorticGradientMean = json['Aortic_Gradient_Mean'];
    aorticGradientPeak = json['Aortic_Gradient_Peak'];
    aorticRegurgitant = json['Aortic_Regurgitant'];
    aorticRegurgitantValue = json['Aortic_Regurgitant_Value'];
    tricuspid = json['Tricuspid'];
    tricuspidFunction = json['Tricuspid_Function'];
    tricuspidStenotic = json['Tricuspid_Stenotic'];
    tricuspidStenoticValue = json['Tricuspid_Stenotic_Value'];
    tricuspidGradientMean = json['Tricuspid_Gradient_Mean'];
    tricuspidGradientPeak = json['Tricuspid_Gradient_Peak'];
    tricuspidRegurgitant = json['Tricuspid_Regurgitant'];
    tricuspidRegurgitantValue = json['Tricuspid_Regurgitant_Value'];
    pulmonary = json['Pulmonary'];
    pulmonaryFunction = json['Pulmonary_Function'];
    pulmonaryStenotic = json['Pulmonary_Stenotic'];
    pulmonaryStenoticValue = json['Pulmonary_Stenotic_Value'];
    pulmonaryGradientMean = json['Pulmonary_Gradient_Mean'];
    pulmonaryGradientPeak = json['Pulmonary_Gradient_Peak'];
    pulmonaryRegurgitant = json['Pulmonary_Regurgitant'];
    pulmonaryRegurgitantValue = json['Pulmonary_Regurgitant_Value'];
    valvarPathology = json['Valvar_Pathology'];
    valvarPathologyOthers = json['Valvar_Pathology_Others'];
    tricuspidTRPG = json['Tricuspid_TRPG'];
    estimatedRAPressure = json['Estimated_RA_Pressure'];
    pAT = json['PAT'];
    peakPulmonaryReg = json['Peak_Pulmonary_Reg'];
    pulmonaryHypertension = json['Pulmonary_Hypertension'];
    pericardium = json['Pericardium'];
    pericardiumEffusion = json['Pericardium_Effusion'];
    aorta = json['Aorta'];
    othersVegetation = json['Others_Vegetation'];
    othersThrombusClot = json['Others_Thrombus_Clot'];
    othersMass = json['Others_Mass'];
    otherRelevantEchoFindings = json['Other_Relevant_Echo_Findings'];
    insertDate = json['Insert_Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Echo_Id'] = this.echoId;
    data['PatientId'] = this.patientId;
    data['Echocardiographic_Assessment'] = this.echocardiographicAssessment;
    data['echo_image'] = this.echoImage;
    data['Morphological_LA'] = this.morphologicalLA;
    data['Morphological_RA'] = this.morphologicalRA;
    data['Morphological_LV'] = this.morphologicalLV;
    data['Morphological_RV'] = this.morphologicalRV;
    data['Wall_Motion'] = this.wallMotion;
    data['LV_SYS_Function'] = this.lVSYSFunction;
    data['LV_SYS_Diastole_mm'] = this.lVSYSDiastoleMm;
    data['LV_SYS_Systole_mm'] = this.lVSYSSystoleMm;
    data['LV_SYS_EF'] = this.lVSYSEF;
    data['LV_SYS_EF_Percentage'] = this.lVSYSEFPercentage;
    data['RV_SYS'] = this.rVSYS;
    data['RV_SYS_TAPSE_mm'] = this.rVSYSTAPSEMm;
    data['RV_SYS_RVs'] = this.rVSYSRVs;
    data['RV_SYS_RV_FAC'] = this.rVSYSRVFAC;
    data['Valvular_Morphology'] = this.valvularMorphology;
    data['Mitral'] = this.mitral;
    data['Mitral_Function'] = this.mitralFunction;
    data['Mitral_Stenotic'] = this.mitralStenotic;
    data['Mitral_Stenotic_Value'] = this.mitralStenoticValue;
    data['Mitral_MVOA'] = this.mitralMVOA;
    data['Mitral_MV_Gradient_Mean'] = this.mitralMVGradientMean;
    data['Mitral_MV_Gradient_Peak'] = this.mitralMVGradientPeak;
    data['Mitral_Regurgitant'] = this.mitralRegurgitant;
    data['Mitral_Regurgitant_Value'] = this.mitralRegurgitantValue;
    data['Aortic'] = this.aortic;
    data['Aortic_Function'] = this.aorticFunction;
    data['Aortic_Stenotic'] = this.aorticStenotic;
    data['Aortic_Stenotic_Value'] = this.aorticStenoticValue;
    data['Aortic_Gradient_Mean'] = this.aorticGradientMean;
    data['Aortic_Gradient_Peak'] = this.aorticGradientPeak;
    data['Aortic_Regurgitant'] = this.aorticRegurgitant;
    data['Aortic_Regurgitant_Value'] = this.aorticRegurgitantValue;
    data['Tricuspid'] = this.tricuspid;
    data['Tricuspid_Function'] = this.tricuspidFunction;
    data['Tricuspid_Stenotic'] = this.tricuspidStenotic;
    data['Tricuspid_Stenotic_Value'] = this.tricuspidStenoticValue;
    data['Tricuspid_Gradient_Mean'] = this.tricuspidGradientMean;
    data['Tricuspid_Gradient_Peak'] = this.tricuspidGradientPeak;
    data['Tricuspid_Regurgitant'] = this.tricuspidRegurgitant;
    data['Tricuspid_Regurgitant_Value'] = this.tricuspidRegurgitantValue;
    data['Pulmonary'] = this.pulmonary;
    data['Pulmonary_Function'] = this.pulmonaryFunction;
    data['Pulmonary_Stenotic'] = this.pulmonaryStenotic;
    data['Pulmonary_Stenotic_Value'] = this.pulmonaryStenoticValue;
    data['Pulmonary_Gradient_Mean'] = this.pulmonaryGradientMean;
    data['Pulmonary_Gradient_Peak'] = this.pulmonaryGradientPeak;
    data['Pulmonary_Regurgitant'] = this.pulmonaryRegurgitant;
    data['Pulmonary_Regurgitant_Value'] = this.pulmonaryRegurgitantValue;
    data['Valvar_Pathology'] = this.valvarPathology;
    data['Valvar_Pathology_Others'] = this.valvarPathologyOthers;
    data['Tricuspid_TRPG'] = this.tricuspidTRPG;
    data['Estimated_RA_Pressure'] = this.estimatedRAPressure;
    data['PAT'] = this.pAT;
    data['Peak_Pulmonary_Reg'] = this.peakPulmonaryReg;
    data['Pulmonary_Hypertension'] = this.pulmonaryHypertension;
    data['Pericardium'] = this.pericardium;
    data['Pericardium_Effusion'] = this.pericardiumEffusion;
    data['Aorta'] = this.aorta;
    data['Others_Vegetation'] = this.othersVegetation;
    data['Others_Thrombus_Clot'] = this.othersThrombusClot;
    data['Others_Mass'] = this.othersMass;
    data['Other_Relevant_Echo_Findings'] = this.otherRelevantEchoFindings;
    data['Insert_Date'] = this.insertDate;
    return data;
  }
}
