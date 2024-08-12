class FormD5Model {
  int? congenitalHeartDiseaseId;
  int? patientId;
  String? situs;
  String? position;
  String? aVConnection;
  String? vAConnection;
  String? pulmonaryVenousConnections;
  String? systemicVenousConnections;
  String? systemicVenousConnectionsAbnormal;
  bool? defectASD;
  bool? defectVSD;
  bool? defectPDA;
  bool? defectAPW;
  bool? defectAVSD;
  bool? defectASDSecundum;
  bool? defectASDPrimium;
  bool? defectASDSinusVenosus;
  bool? defectASDOthers;
  int? defectASDSize;
  bool? defectVSDPerimembranous;
  bool? defectVSDOutlet;
  bool? defectVSDInlet;
  bool? defectVSDMuscular;
  bool? defectVSDOthers;
  int? defectVSDSize;
  int? defectPDASize;
  int? defectAPWSize;
  int? defectAVSDSize;
  String? chamberDescription;
  String? hypoplasticChambers;
  String? hypoplasticChambersSpecify;
  bool? morphologicLA;
  bool? morphologicRA;
  bool? morphologicLV;
  bool? morphologicRV;
  String? rVOT;
  bool? rVOTInfundibular;
  bool? rVOTValvar;
  bool? rVOTDCRV;
  String? mPAAndBranchPA;
  String? lVOTObstruction;
  int? lVOTObstructionPeakGradient;
  int? lVOTObstructionMeanGradient;
  bool? locationValvular;
  bool? locationSupraValvular;
  bool? locationSubValvular;
  String? locationSubValvularSpecify;
  String? vMMitralValve;
  String? vMMitralValveOthers;
  String? vMTricuspidValve;
  String? vMTricuspidValveOthers;
  String? vMPulmonaryValve;
  String? vMPulmonaryValveOthers;
  String? vMAorticValve;
  String? vMAorticValveOthers;
  String? aorticRoot;
  String? aorticArch;
  String? coarctation;
  int? coarctationPeakGradient;
  String? coronaryAnatomy;
  bool? anomalousOrigin;
  bool? anomalousCourse;
  String? coronaryAnatomyDetails;
  String? otherRelevantEchoFindings;
  String? insertDate;

  FormD5Model(
      {this.congenitalHeartDiseaseId,
        this.patientId,
        this.situs,
        this.position,
        this.aVConnection,
        this.vAConnection,
        this.pulmonaryVenousConnections,
        this.systemicVenousConnections,
        this.systemicVenousConnectionsAbnormal,
        this.defectASD,
        this.defectVSD,
        this.defectPDA,
        this.defectAPW,
        this.defectAVSD,
        this.defectASDSecundum,
        this.defectASDPrimium,
        this.defectASDSinusVenosus,
        this.defectASDOthers,
        this.defectASDSize,
        this.defectVSDPerimembranous,
        this.defectVSDOutlet,
        this.defectVSDInlet,
        this.defectVSDMuscular,
        this.defectVSDOthers,
        this.defectVSDSize,
        this.defectPDASize,
        this.defectAPWSize,
        this.defectAVSDSize,
        this.chamberDescription,
        this.hypoplasticChambers,
        this.hypoplasticChambersSpecify,
        this.morphologicLA,
        this.morphologicRA,
        this.morphologicLV,
        this.morphologicRV,
        this.rVOT,
        this.rVOTInfundibular,
        this.rVOTValvar,
        this.rVOTDCRV,
        this.mPAAndBranchPA,
        this.lVOTObstruction,
        this.lVOTObstructionPeakGradient,
        this.lVOTObstructionMeanGradient,
        this.locationValvular,
        this.locationSupraValvular,
        this.locationSubValvular,
        this.locationSubValvularSpecify,
        this.vMMitralValve,
        this.vMMitralValveOthers,
        this.vMTricuspidValve,
        this.vMTricuspidValveOthers,
        this.vMPulmonaryValve,
        this.vMPulmonaryValveOthers,
        this.vMAorticValve,
        this.vMAorticValveOthers,
        this.aorticRoot,
        this.aorticArch,
        this.coarctation,
        this.coarctationPeakGradient,
        this.coronaryAnatomy,
        this.anomalousOrigin,
        this.anomalousCourse,
        this.coronaryAnatomyDetails,
        this.otherRelevantEchoFindings,
        this.insertDate});

  FormD5Model.fromJson(Map<String, dynamic> json) {
    congenitalHeartDiseaseId = json['Congenital_Heart_Disease_Id'];
    patientId = json['PatientId'];
    situs = json['Situs'];
    position = json['Position'];
    aVConnection = json['AV_Connection'];
    vAConnection = json['VA_Connection'];
    pulmonaryVenousConnections = json['Pulmonary_Venous_Connections'];
    systemicVenousConnections = json['Systemic_Venous_Connections'];
    systemicVenousConnectionsAbnormal =
    json['Systemic_Venous_Connections_Abnormal'];
    defectASD = json['Defect_ASD'];
    defectVSD = json['Defect_VSD'];
    defectPDA = json['Defect_PDA'];
    defectAPW = json['Defect_APW'];
    defectAVSD = json['Defect_AVSD'];
    defectASDSecundum = json['Defect_ASD_Secundum'];
    defectASDPrimium = json['Defect_ASD_Primium'];
    defectASDSinusVenosus = json['Defect_ASD_SinusVenosus'];
    defectASDOthers = json['Defect_ASD_Others'];
    defectASDSize = json['Defect_ASD_Size'];
    defectVSDPerimembranous = json['Defect_VSD_Perimembranous'];
    defectVSDOutlet = json['Defect_VSD_Outlet'];
    defectVSDInlet = json['Defect_VSD_Inlet'];
    defectVSDMuscular = json['Defect_VSD_Muscular'];
    defectVSDOthers = json['Defect_VSD_Others'];
    defectVSDSize = json['Defect_VSD_Size'];
    defectPDASize = json['Defect_PDA_Size'];
    defectAPWSize = json['Defect_APW_Size'];
    defectAVSDSize = json['Defect_AVSD_Size'];
    chamberDescription = json['Chamber_Description'];
    hypoplasticChambers = json['Hypoplastic_Chambers'];
    hypoplasticChambersSpecify = json['Hypoplastic_Chambers_Specify'];
    morphologicLA = json['Morphologic_LA'];
    morphologicRA = json['Morphologic_RA'];
    morphologicLV = json['Morphologic_LV'];
    morphologicRV = json['Morphologic_RV'];
    rVOT = json['RVOT'];
    rVOTInfundibular = json['RVOT_Infundibular'];
    rVOTValvar = json['RVOT_Valvar'];
    rVOTDCRV = json['RVOT_DCRV'];
    mPAAndBranchPA = json['MPA_and_Branch_PA'];
    lVOTObstruction = json['LVOT_Obstruction'];
    lVOTObstructionPeakGradient = json['LVOT_Obstruction_PeakGradient'];
    lVOTObstructionMeanGradient = json['LVOT_Obstruction_MeanGradient'];
    locationValvular = json['Location_Valvular'];
    locationSupraValvular = json['Location_Supra_Valvular'];
    locationSubValvular = json['Location_Sub_Valvular'];
    locationSubValvularSpecify = json['Location_Sub_Valvular_Specify'];
    vMMitralValve = json['VM_Mitral_Valve'];
    vMMitralValveOthers = json['VM_Mitral_Valve_Others'];
    vMTricuspidValve = json['VM_Tricuspid_Valve'];
    vMTricuspidValveOthers = json['VM_Tricuspid_Valve_Others'];
    vMPulmonaryValve = json['VM_Pulmonary_Valve'];
    vMPulmonaryValveOthers = json['VM_Pulmonary_Valve_Others'];
    vMAorticValve = json['VM_Aortic_Valve'];
    vMAorticValveOthers = json['VM_Aortic_Valve_Others'];
    aorticRoot = json['Aortic_Root'];
    aorticArch = json['Aortic_Arch'];
    coarctation = json['Coarctation'];
    coarctationPeakGradient = json['Coarctation_PeakGradient'];
    coronaryAnatomy = json['Coronary_Anatomy'];
    anomalousOrigin = json['Anomalous_Origin'];
    anomalousCourse = json['Anomalous_Course'];
    coronaryAnatomyDetails = json['Coronary_Anatomy_Details'];
    otherRelevantEchoFindings = json['Other_Relevant_Echo_Findings'];
    insertDate = json['Insert_Date'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['Congenital_Heart_Disease_Id'] = this.congenitalHeartDiseaseId;
  //   data['PatientId'] = this.patientId;
  //   data['Situs'] = this.situs;
  //   data['Position'] = this.position;
  //   data['AV_Connection'] = this.aVConnection;
  //   data['VA_Connection'] = this.vAConnection;
  //   data['Pulmonary_Venous_Connections'] = this.pulmonaryVenousConnections;
  //   data['Systemic_Venous_Connections'] = this.systemicVenousConnections;
  //   data['Systemic_Venous_Connections_Abnormal'] =
  //       this.systemicVenousConnectionsAbnormal;
  //   data['Defect_ASD'] = this.defectASD;
  //   data['Defect_VSD'] = this.defectVSD;
  //   data['Defect_PDA'] = this.defectPDA;
  //   data['Defect_APW'] = this.defectAPW;
  //   data['Defect_AVSD'] = this.defectAVSD;
  //   data['Defect_ASD_Secundum'] = this.defectASDSecundum;
  //   data['Defect_ASD_Primium'] = this.defectASDPrimium;
  //   data['Defect_ASD_SinusVenosus'] = this.defectASDSinusVenosus;
  //   data['Defect_ASD_Others'] = this.defectASDOthers;
  //   data['Defect_ASD_Size'] = this.defectASDSize;
  //   data['Defect_VSD_Perimembranous'] = this.defectVSDPerimembranous;
  //   data['Defect_VSD_Outlet'] = this.defectVSDOutlet;
  //   data['Defect_VSD_Inlet'] = this.defectVSDInlet;
  //   data['Defect_VSD_Muscular'] = this.defectVSDMuscular;
  //   data['Defect_VSD_Others'] = this.defectVSDOthers;
  //   data['Defect_VSD_Size'] = this.defectVSDSize;
  //   data['Defect_PDA_Size'] = this.defectPDASize;
  //   data['Defect_APW_Size'] = this.defectAPWSize;
  //   data['Defect_AVSD_Size'] = this.defectAVSDSize;
  //   data['Chamber_Description'] = this.chamberDescription;
  //   data['Hypoplastic_Chambers'] = this.hypoplasticChambers;
  //   data['Hypoplastic_Chambers_Specify'] = this.hypoplasticChambersSpecify;
  //   data['Morphologic_LA'] = this.morphologicLA;
  //   data['Morphologic_RA'] = this.morphologicRA;
  //   data['Morphologic_LV'] = this.morphologicLV;
  //   data['Morphologic_RV'] = this.morphologicRV;
  //   data['RVOT'] = this.rVOT;
  //   data['RVOT_Infundibular'] = this.rVOTInfundibular;
  //   data['RVOT_Valvar'] = this.rVOTValvar;
  //   data['RVOT_DCRV'] = this.rVOTDCRV;
  //   data['MPA_and_Branch_PA'] = this.mPAAndBranchPA;
  //   data['LVOT_Obstruction'] = this.lVOTObstruction;
  //   data['LVOT_Obstruction_PeakGradient'] = this.lVOTObstructionPeakGradient;
  //   data['LVOT_Obstruction_MeanGradient'] = this.lVOTObstructionMeanGradient;
  //   data['Location_Valvular'] = this.locationValvular;
  //   data['Location_Supra_Valvular'] = this.locationSupraValvular;
  //   data['Location_Sub_Valvular'] = this.locationSubValvular;
  //   data['Location_Sub_Valvular_Specify'] = this.locationSubValvularSpecify;
  //   data['VM_Mitral_Valve'] = this.vMMitralValve;
  //   data['VM_Mitral_Valve_Others'] = this.vMMitralValveOthers;
  //   data['VM_Tricuspid_Valve'] = this.vMTricuspidValve;
  //   data['VM_Tricuspid_Valve_Others'] = this.vMTricuspidValveOthers;
  //   data['VM_Pulmonary_Valve'] = this.vMPulmonaryValve;
  //   data['VM_Pulmonary_Valve_Others'] = this.vMPulmonaryValveOthers;
  //   data['VM_Aortic_Valve'] = this.vMAorticValve;
  //   data['VM_Aortic_Valve_Others'] = this.vMAorticValveOthers;
  //   data['Aortic_Root'] = this.aorticRoot;
  //   data['Aortic_Arch'] = this.aorticArch;
  //   data['Coarctation'] = this.coarctation;
  //   data['Coarctation_PeakGradient'] = this.coarctationPeakGradient;
  //   data['Coronary_Anatomy'] = this.coronaryAnatomy;
  //   data['Anomalous_Origin'] = this.anomalousOrigin;
  //   data['Anomalous_Course'] = this.anomalousCourse;
  //   data['Coronary_Anatomy_Details'] = this.coronaryAnatomyDetails;
  //   data['Other_Relevant_Echo_Findings'] = this.otherRelevantEchoFindings;
  //   data['Insert_Date'] = this.insertDate;
  //   return data;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Congenital_Heart_Disease_Id'] = this.congenitalHeartDiseaseId;
    data['PatientId'] = this.patientId;
    data['Situs'] = "${this.situs}";
    data['Position'] = "${this.position}";
    data['AV_Connection'] = "${this.aVConnection}";
    data['VA_Connection'] = "${this.vAConnection}";
    data['Pulmonary_Venous_Connections'] = "${this.pulmonaryVenousConnections}";
    data['Systemic_Venous_Connections'] = "${this.systemicVenousConnections}";
    data['Systemic_Venous_Connections_Abnormal'] = "${this.systemicVenousConnectionsAbnormal}";
    data['Defect_ASD'] = this.defectASD;
    data['Defect_VSD'] = this.defectVSD;
    data['Defect_PDA'] = this.defectPDA;
    data['Defect_APW'] = this.defectAPW;
    data['Defect_AVSD'] = this.defectAVSD;
    data['Defect_ASD_Secundum'] = this.defectASDSecundum;
    data['Defect_ASD_Primium'] = this.defectASDPrimium;
    data['Defect_ASD_SinusVenosus'] = this.defectASDSinusVenosus;
    data['Defect_ASD_Others'] = this.defectASDOthers;
    data['Defect_ASD_Size'] = this.defectASDSize;
    data['Defect_VSD_Perimembranous'] = this.defectVSDPerimembranous;
    data['Defect_VSD_Outlet'] = this.defectVSDOutlet;
    data['Defect_VSD_Inlet'] = this.defectVSDInlet;
    data['Defect_VSD_Muscular'] = this.defectVSDMuscular;
    data['Defect_VSD_Others'] = this.defectVSDOthers;
    data['Defect_VSD_Size'] = this.defectVSDSize;
    data['Defect_PDA_Size'] = this.defectPDASize;
    data['Defect_APW_Size'] = this.defectAPWSize;
    data['Defect_AVSD_Size'] = this.defectAVSDSize;
    data['Chamber_Description'] = "${this.chamberDescription}";
    data['Hypoplastic_Chambers'] = "${this.hypoplasticChambers}";
    data['Hypoplastic_Chambers_Specify'] = "${this.hypoplasticChambersSpecify}";
    data['Morphologic_LA'] = this.morphologicLA;
    data['Morphologic_RA'] = this.morphologicRA;
    data['Morphologic_LV'] = this.morphologicLV;
    data['Morphologic_RV'] = this.morphologicRV;
    data['RVOT'] = "${this.rVOT}";
    data['RVOT_Infundibular'] = this.rVOTInfundibular;
    data['RVOT_Valvar'] = this.rVOTValvar;
    data['RVOT_DCRV'] = this.rVOTDCRV;
    data['MPA_and_Branch_PA'] = "${this.mPAAndBranchPA}";
    data['LVOT_Obstruction'] = "${this.lVOTObstruction}";
    data['LVOT_Obstruction_PeakGradient'] = this.lVOTObstructionPeakGradient;
    data['LVOT_Obstruction_MeanGradient'] = this.lVOTObstructionMeanGradient;
    data['Location_Valvular'] = this.locationValvular;
    data['Location_Supra_Valvular'] = this.locationSupraValvular;
    data['Location_Sub_Valvular'] = this.locationSubValvular;
    data['Location_Sub_Valvular_Specify'] = "${this.locationSubValvularSpecify}";
    data['VM_Mitral_Valve'] = "${this.vMMitralValve}";
    data['VM_Mitral_Valve_Others'] = "${this.vMMitralValveOthers}";
    data['VM_Tricuspid_Valve'] = "${this.vMTricuspidValve}";
    data['VM_Tricuspid_Valve_Others'] = "${this.vMTricuspidValveOthers}";
    data['VM_Pulmonary_Valve'] = "${this.vMPulmonaryValve}";
    data['VM_Pulmonary_Valve_Others'] = "${this.vMPulmonaryValveOthers}";
    data['VM_Aortic_Valve'] = "${this.vMAorticValve}";
    data['VM_Aortic_Valve_Others'] = "${this.vMAorticValveOthers}";
    data['Aortic_Root'] = "${this.aorticRoot}";
    data['Aortic_Arch'] = "${this.aorticArch}";
    data['Coarctation'] = "${this.coarctation}";
    data['Coarctation_PeakGradient'] = this.coarctationPeakGradient;
    data['Coronary_Anatomy'] = "${this.coronaryAnatomy}";
    data['Anomalous_Origin'] = this.anomalousOrigin;
    data['Anomalous_Course'] = this.anomalousCourse;
    data['Coronary_Anatomy_Details'] = "${this.coronaryAnatomyDetails}";
    data['Other_Relevant_Echo_Findings'] = "${this.otherRelevantEchoFindings}";
    data['Insert_Date'] = "${this.insertDate}";
    return data;
  }

}
