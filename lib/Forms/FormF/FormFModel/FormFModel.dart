class FormFModel {
  int? antenatalId;
  int? visitNo;
  int? doctorId;
  int? patientId;
  String? visitDate;
  int? periodOfGestation;
  String? trimester;
  String? nyhaSymptomsClass;
  String? clinicalSignWeight;
  String? clinicalSignHR;
  String? clinicalSignSp;
  String? clinicalSignBp;
  String? clinicalSignCcf;
  String? clinicalSignCyanosis;
  String? clinicalSignCardiacMurmur;
  String? ecgDate;
  String? ecgNormalAbnormal;
  String? significantChanges;
  String? wallMotion;
  bool? wallMotionHypoGlobal;
  bool? wallMotionHypoRegional;
  String? lVIDDiastole;
  String? lVIDSystole;
  String? lVEfPercent;
  String? rvNormalAbnormal;
  String? rvTapse;
  String? rvRvs;
  String? pericardialEffusion;
  bool? othersVegetations;
  bool? othersThrombus;
  String? otherEchoFindings;
  String? Trpg;
  String? PeakPr;
  String? Pat;
  bool? valveMitralNormal;
  bool? valveMitralStenotic;
  bool? valveMitralRegurgitant;
  bool? valveMitralStenoticMild;
  Null? valveMitralStenoticModerate;
  Null? valveMitralStenoticSevere;
  String? valveMitralMvoa;
  bool? valveMitralRegurgitantMild;
  Null? valveMitralRegurgitantModerate;
  Null? valveMitralRegurgitantSevere;
  bool? valveAorticNormal;
  bool? valveAorticStenotic;
  bool? valveAorticRegurgitant;
  bool? valveAorticStenoticMild;
  bool? valveAorticStenoticModerate;
  Null? valveAorticStenoticSevere;
  String? avgMg;
  String? avgPg;
  bool? valveAorticRegurgitantMild;
  Null? valveAorticRegurgitantModerate;
  Null? valveAorticRegurgitantSevere;
  bool? valveTricuspidNormal;
  bool? valveTricuspidStenotic;
  bool? valveTricuspidRegurgitant;
  bool? valveTricuspidStenoticMild;
  bool? valveTricuspidStenoticModerate;
  bool? valveTricuspidStenoticSevere;
  String? tvgMg;
  String? tvgPg;
  bool? valveTricuspidRegurgitantMild;
  Null? valveTricuspidRegurgitantModerate;
  Null? valveTricuspidRegurgitantSevere;
  bool? valvePulmonaryNormal;
  bool? valvePulmonaryStenotic;
  bool? valvePulmonaryRegurgitant;
  bool? valvePulmonaryStenoticMild;
  bool? valvePulmonaryStenoticModerate;
  bool? valvePulmonaryStenoticSevere;
  String? pvgMg;
  String? pvgPg;
  bool? valvePulmonaryRegurgitantMild;
  Null? valvePulmonaryRegurgitantModerate;
  Null? valvePulmonaryRegurgitantSevere;
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
        this.wallMotion,
        this.lVIDDiastole,
        this.lVIDSystole,
        this.lVEfPercent,
        this.rvNormalAbnormal,
        this.rvTapse,
        this.rvRvs,
        this.pericardialEffusion,
        this.othersVegetations,
        this.othersThrombus,
        this.otherEchoFindings,
        this.Trpg,
        this.PeakPr,
        this.Pat,
        this.valveMitralNormal,
        this.valveMitralStenotic,
        this.valveMitralRegurgitant,
        this.valveMitralStenoticMild,
        this.valveMitralStenoticModerate,
        this.valveMitralStenoticSevere,
        this.valveMitralMvoa,
        this.valveMitralRegurgitantMild,
        this.valveMitralRegurgitantModerate,
        this.valveMitralRegurgitantSevere,
        this.valveAorticNormal,
        this.valveAorticStenotic,
        this.valveAorticRegurgitant,
        this.valveAorticStenoticMild,
        this.valveAorticStenoticModerate,
        this.valveAorticStenoticSevere,
        this.avgMg,
        this.avgPg,
        this.valveAorticRegurgitantMild,
        this.valveAorticRegurgitantModerate,
        this.valveAorticRegurgitantSevere,
        this.valveTricuspidNormal,
        this.valveTricuspidStenotic,
        this.valveTricuspidRegurgitant,
        this.valveTricuspidStenoticMild,
        this.valveTricuspidStenoticModerate,
        this.valveTricuspidStenoticSevere,
        this.tvgMg,
        this.tvgPg,
        this.valveTricuspidRegurgitantMild,
        this.valveTricuspidRegurgitantModerate,
        this.valveTricuspidRegurgitantSevere,
        this.valvePulmonaryNormal,
        this.valvePulmonaryStenotic,
        this.valvePulmonaryRegurgitant,
        this.valvePulmonaryStenoticMild,
        this.valvePulmonaryStenoticModerate,
        this.valvePulmonaryStenoticSevere,
        this.pvgMg,
        this.pvgPg,
        this.valvePulmonaryRegurgitantMild,
        this.valvePulmonaryRegurgitantModerate,
        this.valvePulmonaryRegurgitantSevere,
        this.outComeIdentified,
        this.wallMotionHypoGlobal,
        this.wallMotionHypoRegional});

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
    wallMotion = json['WallMotion'];
    lVIDDiastole = json['LVIDDiastole'];
    lVIDSystole = json['LVIDSystole'];
    lVEfPercent = json['LVEfPercent'];
    rvNormalAbnormal = json['RvNormalAbnormal'];
    rvTapse = json['RvTapse'];
    rvRvs = json['RvRvs'];
    pericardialEffusion = json['PericardialEffusion'];
    othersVegetations = json['OthersVegetations'];
    othersThrombus = json['OthersThrombus'];
    otherEchoFindings = json['OtherEchoFindings'];
    Trpg = json['Trpg'];
    PeakPr = json['PeakPr'];
    Pat = json['Pat'];
    valveMitralNormal = json['ValveMitralNormal'];
    valveMitralStenotic = json['ValveMitralStenotic'];
    valveMitralRegurgitant = json['ValveMitralRegurgitant'];
    valveMitralStenoticMild = json['ValveMitralStenoticMild'];
    valveMitralStenoticModerate = json['ValveMitralStenoticModerate'];
    valveMitralStenoticSevere = json['ValveMitralStenoticSevere'];
    valveMitralMvoa = json['ValveMitralMvoa'];
    valveMitralRegurgitantMild = json['ValveMitralRegurgitantMild'];
    valveMitralRegurgitantModerate = json['ValveMitralRegurgitantModerate'];
    valveMitralRegurgitantSevere = json['ValveMitralRegurgitantSevere'];
    valveAorticNormal = json['ValveAorticNormal'];
    valveAorticStenotic = json['ValveAorticStenotic'];
    valveAorticRegurgitant = json['ValveAorticRegurgitant'];
    valveAorticStenoticMild = json['ValveAorticStenoticMild'];
    valveAorticStenoticModerate = json['ValveAorticStenoticModerate'];
    valveAorticStenoticSevere = json['ValveAorticStenoticSevere'];
    avgMg = json['AvgMg'];
    avgPg = json['AvgPg'];
    valveAorticRegurgitantMild = json['ValveAorticRegurgitantMild'];
    valveAorticRegurgitantModerate = json['ValveAorticRegurgitantModerate'];
    valveAorticRegurgitantSevere = json['ValveAorticRegurgitantSevere'];
    valveTricuspidNormal = json['ValveTricuspidNormal'];
    valveTricuspidStenotic = json['ValveTricuspidStenotic'];
    valveTricuspidRegurgitant = json['ValveTricuspidRegurgitant'];
    valveTricuspidStenoticMild = json['ValveTricuspidStenoticMild'];
    valveTricuspidStenoticModerate = json['ValveTricuspidStenoticModerate'];
    valveTricuspidStenoticSevere = json['ValveTricuspidStenoticSevere'];
    tvgMg = json['TvgMg'];
    tvgPg = json['TvgPg'];
    valveTricuspidRegurgitantMild = json['ValveTricuspidRegurgitantMild'];
    valveTricuspidRegurgitantModerate =
    json['ValveTricuspidRegurgitantModerate'];
    valveTricuspidRegurgitantSevere = json['ValveTricuspidRegurgitantSevere'];
    valvePulmonaryNormal = json['ValvePulmonaryNormal'];
    valvePulmonaryStenotic = json['ValvePulmonaryStenotic'];
    valvePulmonaryRegurgitant = json['ValvePulmonaryRegurgitant'];
    valvePulmonaryStenoticMild = json['ValvePulmonaryStenoticMild'];
    valvePulmonaryStenoticModerate = json['ValvePulmonaryStenoticModerate'];
    valvePulmonaryStenoticSevere = json['ValvePulmonaryStenoticSevere'];
    pvgMg = json['PvgMg'];
    pvgPg = json['PvgPg'];
    valvePulmonaryRegurgitantMild = json['ValvePulmonaryRegurgitantMild'];
    valvePulmonaryRegurgitantModerate =
    json['ValvePulmonaryRegurgitantModerate'];
    valvePulmonaryRegurgitantSevere = json['ValvePulmonaryRegurgitantSevere'];
    outComeIdentified = json['OutComeIdentified'];
    wallMotionHypoGlobal = json['WallMotionHypoGlobal'];
    wallMotionHypoRegional = json['WallMotionHypoRegional'];
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
    data['WallMotion'] = this.wallMotion;
    data['LVIDDiastole'] = this.lVIDDiastole;
    data['LVIDSystole'] = this.lVIDSystole;
    data['LVEfPercent'] = this.lVEfPercent;
    data['RvNormalAbnormal'] = this.rvNormalAbnormal;
    data['RvTapse'] = this.rvTapse;
    data['RvRvs'] = this.rvRvs;
    data['PericardialEffusion'] = this.pericardialEffusion;
    data['OthersVegetations'] = this.othersVegetations;
    data['OthersThrombus'] = this.othersThrombus;
    data['OtherEchoFindings'] = this.otherEchoFindings;
    data['Trpg'] = this.Trpg;
    data['PeakPr'] = this.PeakPr;
    data['Pat'] = this.Pat;
    data['ValveMitralNormal'] = this.valveMitralNormal;
    data['ValveMitralStenotic'] = this.valveMitralStenotic;
    data['ValveMitralRegurgitant'] = this.valveMitralRegurgitant;
    data['ValveMitralStenoticMild'] = this.valveMitralStenoticMild;
    data['ValveMitralStenoticModerate'] = this.valveMitralStenoticModerate;
    data['ValveMitralStenoticSevere'] = this.valveMitralStenoticSevere;
    data['ValveMitralMvoa'] = this.valveMitralMvoa;
    data['ValveMitralRegurgitantMild'] = this.valveMitralRegurgitantMild;
    data['ValveMitralRegurgitantModerate'] =
        this.valveMitralRegurgitantModerate;
    data['ValveMitralRegurgitantSevere'] = this.valveMitralRegurgitantSevere;
    data['ValveAorticNormal'] = this.valveAorticNormal;
    data['ValveAorticStenotic'] = this.valveAorticStenotic;
    data['ValveAorticRegurgitant'] = this.valveAorticRegurgitant;
    data['ValveAorticStenoticMild'] = this.valveAorticStenoticMild;
    data['ValveAorticStenoticModerate'] = this.valveAorticStenoticModerate;
    data['ValveAorticStenoticSevere'] = this.valveAorticStenoticSevere;
    data['AvgMg'] = this.avgMg;
    data['AvgPg'] = this.avgPg;
    data['ValveAorticRegurgitantMild'] = this.valveAorticRegurgitantMild;
    data['ValveAorticRegurgitantModerate'] =
        this.valveAorticRegurgitantModerate;
    data['ValveAorticRegurgitantSevere'] = this.valveAorticRegurgitantSevere;
    data['ValveTricuspidNormal'] = this.valveTricuspidNormal;
    data['ValveTricuspidStenotic'] = this.valveTricuspidStenotic;
    data['ValveTricuspidRegurgitant'] = this.valveTricuspidRegurgitant;
    data['ValveTricuspidStenoticMild'] = this.valveTricuspidStenoticMild;
    data['ValveTricuspidStenoticModerate'] =
        this.valveTricuspidStenoticModerate;
    data['ValveTricuspidStenoticSevere'] = this.valveTricuspidStenoticSevere;
    data['TvgMg'] = this.tvgMg;
    data['TvgPg'] = this.tvgPg;
    data['ValveTricuspidRegurgitantMild'] = this.valveTricuspidRegurgitantMild;
    data['ValveTricuspidRegurgitantModerate'] =
        this.valveTricuspidRegurgitantModerate;
    data['ValveTricuspidRegurgitantSevere'] =
        this.valveTricuspidRegurgitantSevere;
    data['ValvePulmonaryNormal'] = this.valvePulmonaryNormal;
    data['ValvePulmonaryStenotic'] = this.valvePulmonaryStenotic;
    data['ValvePulmonaryRegurgitant'] = this.valvePulmonaryRegurgitant;
    data['ValvePulmonaryStenoticMild'] = this.valvePulmonaryStenoticMild;
    data['ValvePulmonaryStenoticModerate'] =
        this.valvePulmonaryStenoticModerate;
    data['ValvePulmonaryStenoticSevere'] = this.valvePulmonaryStenoticSevere;
    data['PvgMg'] = this.pvgMg;
    data['PvgPg'] = this.pvgPg;
    data['ValvePulmonaryRegurgitantMild'] = this.valvePulmonaryRegurgitantMild;
    data['ValvePulmonaryRegurgitantModerate'] =
        this.valvePulmonaryRegurgitantModerate;
    data['ValvePulmonaryRegurgitantSevere'] =
        this.valvePulmonaryRegurgitantSevere;
    data['OutComeIdentified'] = this.outComeIdentified;
    data['WallMotionHypoGlobal'] = this.wallMotionHypoGlobal;
    data['WallMotionHypoRegional'] = this.wallMotionHypoRegional;
    return data;
  }
}
