class EchoAssignmentModel {
  int? echoId;
  int? doctorId;
  int? patientId;
  int? formId;
  String? wallMotion;
  bool? wallMotionHypoGlobal;
  bool? wallMotionHypoRegional;
  String? lVIDDiastole;
  String? lVIDSystole;
  String? lVEfPercent;
  String? rvNormalAbnormal;
  String? rvTapse;
  String? rvRvs;
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
  int? aorticStenosisGradientMean;
  int? aorticStenosisGradientPeak;
  String? aorticRegurgitant;
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
  int? rvotObstructionGradientMean;
  int? rvotObstructionGradientPeak;
  bool? pulmonaryRegurgitant;
  String? pulmonaryRegurgitantValue;
  int? trpg;
  int? peakPr;
  int? pat;
  String? pericardialEffusion;
  bool? othersVegetations;
  bool? othersThrombus;
  String? otherEchoFindings;

  EchoAssignmentModel(
      {this.echoId,
        this.doctorId,
        this.patientId,
        this.formId,
        this.wallMotion,
        this.wallMotionHypoGlobal,
        this.wallMotionHypoRegional,
        this.lVIDDiastole,
        this.lVIDSystole,
        this.lVEfPercent,
        this.rvNormalAbnormal,
        this.rvTapse,
        this.rvRvs,
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
        this.aorticStenosisGradientMean,
        this.aorticStenosisGradientPeak,
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
        this.rvotObstructionGradientMean,
        this.rvotObstructionGradientPeak,
        this.pulmonaryRegurgitant,
        this.pulmonaryRegurgitantValue,
        this.trpg,
        this.peakPr,
        this.pat,
        this.pericardialEffusion,
        this.othersVegetations,
        this.othersThrombus,
        this.otherEchoFindings});

  EchoAssignmentModel.fromJson(Map<String, dynamic> json) {
    echoId = json['EchoId'];
    doctorId = json['DoctorId'];
    patientId = json['PatientId'];
    formId = json['FormId'];
    wallMotion = json['WallMotion'];
    wallMotionHypoGlobal = json['WallMotionHypoGlobal'];
    wallMotionHypoRegional = json['WallMotionHypoRegional'];
    lVIDDiastole = json['LVIDDiastole'];
    lVIDSystole = json['LVIDSystole'];
    lVEfPercent = json['LVEfPercent'];
    rvNormalAbnormal = json['RvNormalAbnormal'];
    rvTapse = json['RvTapse'];
    rvRvs = json['RvRvs'];
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
    aorticStenosisGradientMean = json['aortic_stenosis_gradient_mean'];
    aorticStenosisGradientPeak = json['aortic_stenosis_gradient_peak'];
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
    rvotObstructionGradientMean = json['rvot_obstruction_gradient_mean'];
    rvotObstructionGradientPeak = json['rvot_obstruction_gradient_peak'];
    pulmonaryRegurgitant = json['Pulmonary_Regurgitant'];
    pulmonaryRegurgitantValue = json['Pulmonary_Regurgitant_Value'];
    trpg = json['Trpg'];
    peakPr = json['PeakPr'];
    pat = json['Pat'];
    pericardialEffusion = json['PericardialEffusion'];
    othersVegetations = json['OthersVegetations'];
    othersThrombus = json['OthersThrombus'];
    otherEchoFindings = json['OtherEchoFindings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EchoId'] = this.echoId;
    data['DoctorId'] = this.doctorId;
    data['PatientId'] = this.patientId;
    data['FormId'] = this.formId;
    data['WallMotion'] = this.wallMotion;
    data['WallMotionHypoGlobal'] = this.wallMotionHypoGlobal;
    data['WallMotionHypoRegional'] = this.wallMotionHypoRegional;
    data['LVIDDiastole'] = this.lVIDDiastole;
    data['LVIDSystole'] = this.lVIDSystole;
    data['LVEfPercent'] = this.lVEfPercent;
    data['RvNormalAbnormal'] = this.rvNormalAbnormal;
    data['RvTapse'] = this.rvTapse;
    data['RvRvs'] = this.rvRvs;
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
    data['aortic_stenosis_gradient_mean'] = this.aorticStenosisGradientMean;
    data['aortic_stenosis_gradient_peak'] = this.aorticStenosisGradientPeak;
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
    data['rvot_obstruction_gradient_mean'] = this.rvotObstructionGradientMean;
    data['rvot_obstruction_gradient_peak'] = this.rvotObstructionGradientPeak;
    data['Pulmonary_Regurgitant'] = this.pulmonaryRegurgitant;
    data['Pulmonary_Regurgitant_Value'] = this.pulmonaryRegurgitantValue;
    data['Trpg'] = this.trpg;
    data['PeakPr'] = this.peakPr;
    data['Pat'] = this.pat;
    data['PericardialEffusion'] = this.pericardialEffusion;
    data['OthersVegetations'] = this.othersVegetations;
    data['OthersThrombus'] = this.othersThrombus;
    data['OtherEchoFindings'] = this.otherEchoFindings;
    return data;
  }
}
