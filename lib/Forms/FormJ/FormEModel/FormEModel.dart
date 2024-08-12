class FormEModel {
  int? cHDFId;
  int? patientId;
  bool? atrialSeptalDefect;
  bool? ventricularSeptalDefect;
  bool? patentDuctusArteriosus;
  bool? aVCanalDefect;
  bool? aPWindow;
  bool? otherLRShunts;
  bool? eisenmengerPhysiology;
  bool? valvularPulmonaryStenosis;
  bool? subValvularPS;
  bool? tOF;
  bool? doubleOutletRightVentricle;
  bool? transpositionOfGreatArteries;
  bool? correctedTransposition;
  bool? ebsteinAnomaly;
  bool? pulmonaryAtresia;
  bool? truncusArteriosus;
  bool? singleVentricle;
  bool? tricuspidAtresia;
  bool? diseaseSpecificOthers;
  String? diseaseSpecificOthersSpecify;
  bool? diseaseSpecificPostSurgical;
  bool? intracranialRepair;
  bool? fontan;
  bool? bDGShunt;
  bool? bTShunt;
  bool? rVPAConduit;
  bool? arterialSwitch;
  bool? prostheticValve;
  bool? postSurgicalOthers;
  String? postSurgicalOthersSpecify;
  bool? diseaseSpecificPostCardiac;
  bool? deviceClosureASD;
  bool? deviceClosureVSD;
  bool? deviceClosurePDA;
  bool? pulmonary;
  bool? aortic;
  bool? mitral;
  String? postCardiacOthers;
  String? otherHeartDiseaseSpecify;
  bool? headache;
  bool? visualDisturbance;
  bool? dizziness;
  bool? alteredMentalStatus;
  bool? bleedingTendency;
  bool? cNSSymptoms;
  bool? arthritis;
  bool? renalDysfunction;
  bool? cyanosis;
  bool? polycythemia;
  bool? anemia;
  int? spO2RUL;
  int? spO2LUL;
  int? fourLimbsRUL;
  int? fourLimbsLUL;
  int? hematocrit;
  int? serumFerritin;
  String? anyOtherRelevantInformation;
  String? insertDate;

  FormEModel(
      {this.cHDFId,
        this.patientId,
        this.atrialSeptalDefect,
        this.ventricularSeptalDefect,
        this.patentDuctusArteriosus,
        this.aVCanalDefect,
        this.aPWindow,
        this.otherLRShunts,
        this.eisenmengerPhysiology,
        this.valvularPulmonaryStenosis,
        this.subValvularPS,
        this.tOF,
        this.doubleOutletRightVentricle,
        this.transpositionOfGreatArteries,
        this.correctedTransposition,
        this.ebsteinAnomaly,
        this.pulmonaryAtresia,
        this.truncusArteriosus,
        this.singleVentricle,
        this.tricuspidAtresia,
        this.diseaseSpecificOthers,
        this.diseaseSpecificOthersSpecify,
        this.diseaseSpecificPostSurgical,
        this.intracranialRepair,
        this.fontan,
        this.bDGShunt,
        this.bTShunt,
        this.rVPAConduit,
        this.arterialSwitch,
        this.prostheticValve,
        this.postSurgicalOthers,
        this.postSurgicalOthersSpecify,
        this.diseaseSpecificPostCardiac,
        this.deviceClosureASD,
        this.deviceClosureVSD,
        this.deviceClosurePDA,
        this.pulmonary,
        this.aortic,
        this.mitral,
        this.postCardiacOthers,
        this.otherHeartDiseaseSpecify,
        this.headache,
        this.visualDisturbance,
        this.dizziness,
        this.alteredMentalStatus,
        this.bleedingTendency,
        this.cNSSymptoms,
        this.arthritis,
        this.renalDysfunction,
        this.cyanosis,
        this.polycythemia,
        this.anemia,
        this.spO2RUL,
        this.spO2LUL,
        this.fourLimbsRUL,
        this.fourLimbsLUL,
        this.hematocrit,
        this.serumFerritin,
        this.anyOtherRelevantInformation,
        this.insertDate});

  FormEModel.fromJson(Map<String, dynamic> json) {
    cHDFId = json['CHDF_Id'];
    patientId = json['PatientId'];
    atrialSeptalDefect = json['Atrial_Septal_Defect'];
    ventricularSeptalDefect = json['Ventricular_Septal_Defect'];
    patentDuctusArteriosus = json['Patent_Ductus_Arteriosus'];
    aVCanalDefect = json['AV_Canal_Defect'];
    aPWindow = json['AP_Window'];
    otherLRShunts = json['Other_L_R_Shunts'];
    eisenmengerPhysiology = json['Eisenmenger_Physiology'];
    valvularPulmonaryStenosis = json['Valvular_Pulmonary_Stenosis'];
    subValvularPS = json['Sub_Valvular_PS'];
    tOF = json['TOF'];
    doubleOutletRightVentricle = json['Double_Outlet_Right_Ventricle'];
    transpositionOfGreatArteries = json['Transposition_of_Great_Arteries'];
    correctedTransposition = json['Corrected_Transposition'];
    ebsteinAnomaly = json['Ebstein_Anomaly'];
    pulmonaryAtresia = json['Pulmonary_Atresia'];
    truncusArteriosus = json['Truncus_Arteriosus'];
    singleVentricle = json['Single_Ventricle'];
    tricuspidAtresia = json['Tricuspid_Atresia'];
    diseaseSpecificOthers = json['DiseaseSpecific_Others'];
    diseaseSpecificOthersSpecify = json['DiseaseSpecific_Others_Specify'];
    diseaseSpecificPostSurgical = json['Disease_Specific_Post_Surgical'];
    intracranialRepair = json['Intracranial_Repair'];
    fontan = json['Fontan'];
    bDGShunt = json['BDG_Shunt'];
    bTShunt = json['BT_Shunt'];
    rVPAConduit = json['RV_PA_Conduit'];
    arterialSwitch = json['Arterial_Switch'];
    prostheticValve = json['Prosthetic_Valve'];
    postSurgicalOthers = json['PostSurgical_Others'];
    postSurgicalOthersSpecify = json['Post_Surgical_Others_Specify'];
    diseaseSpecificPostCardiac = json['Disease_Specific_Post_Cardiac'];
    deviceClosureASD = json['Device_Closure_ASD'];
    deviceClosureVSD = json['Device_Closure_VSD'];
    deviceClosurePDA = json['Device_Closure_PDA'];
    pulmonary = json['Pulmonary'];
    aortic = json['Aortic'];
    mitral = json['Mitral'];
    postCardiacOthers = json['Post_Cardiac_Others'];
    otherHeartDiseaseSpecify = json['OtherHeartDisease_Specify'];
    headache = json['Headache'];
    visualDisturbance = json['Visual_Disturbance'];
    dizziness = json['Dizziness'];
    alteredMentalStatus = json['Altered_Mental_Status'];
    bleedingTendency = json['Bleeding_Tendency'];
    cNSSymptoms = json['CNS_Symptoms'];
    arthritis = json['Arthritis'];
    renalDysfunction = json['Renal_Dysfunction'];
    cyanosis = json['Cyanosis'];
    polycythemia = json['Polycythemia'];
    anemia = json['Anemia'];
    spO2RUL = json['SpO2_RUL'];
    spO2LUL = json['SpO2_LUL'];
    fourLimbsRUL = json['FourLimbs_RUL'];
    fourLimbsLUL = json['FourLimbs_LUL'];
    hematocrit = json['Hematocrit'];
    serumFerritin = json['Serum_Ferritin'];
    anyOtherRelevantInformation = json['Any_Other_Relevant_Information'];
    insertDate = json['Insert_Date'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['CHDF_Id'] = this.cHDFId;
  //   data['PatientId'] = this.patientId;
  //   data['Atrial_Septal_Defect'] = this.atrialSeptalDefect;
  //   data['Ventricular_Septal_Defect'] = this.ventricularSeptalDefect;
  //   data['Patent_Ductus_Arteriosus'] = this.patentDuctusArteriosus;
  //   data['AV_Canal_Defect'] = this.aVCanalDefect;
  //   data['AP_Window'] = this.aPWindow;
  //   data['Other_L_R_Shunts'] = this.otherLRShunts;
  //   data['Eisenmenger_Physiology'] = this.eisenmengerPhysiology;
  //   data['Valvular_Pulmonary_Stenosis'] = this.valvularPulmonaryStenosis;
  //   data['Sub_Valvular_PS'] = this.subValvularPS;
  //   data['TOF'] = this.tOF;
  //   data['Double_Outlet_Right_Ventricle'] = this.doubleOutletRightVentricle;
  //   data['Transposition_of_Great_Arteries'] = this.transpositionOfGreatArteries;
  //   data['Corrected_Transposition'] = this.correctedTransposition;
  //   data['Ebstein_Anomaly'] = this.ebsteinAnomaly;
  //   data['Pulmonary_Atresia'] = this.pulmonaryAtresia;
  //   data['Truncus_Arteriosus'] = this.truncusArteriosus;
  //   data['Single_Ventricle'] = this.singleVentricle;
  //   data['Tricuspid_Atresia'] = this.tricuspidAtresia;
  //   data['DiseaseSpecific_Others'] = this.diseaseSpecificOthers;
  //   data['DiseaseSpecific_Others_Specify'] = this.diseaseSpecificOthersSpecify;
  //   data['Disease_Specific_Post_Surgical'] = this.diseaseSpecificPostSurgical;
  //   data['Intracranial_Repair'] = this.intracranialRepair;
  //   data['Fontan'] = this.fontan;
  //   data['BDG_Shunt'] = this.bDGShunt;
  //   data['BT_Shunt'] = this.bTShunt;
  //   data['RV_PA_Conduit'] = this.rVPAConduit;
  //   data['Arterial_Switch'] = this.arterialSwitch;
  //   data['Prosthetic_Valve'] = this.prostheticValve;
  //   data['PostSurgical_Others'] = this.postSurgicalOthers;
  //   data['Post_Surgical_Others_Specify'] = this.postSurgicalOthersSpecify;
  //   data['Disease_Specific_Post_Cardiac'] = this.diseaseSpecificPostCardiac;
  //   data['Device_Closure_ASD'] = this.deviceClosureASD;
  //   data['Device_Closure_VSD'] = this.deviceClosureVSD;
  //   data['Device_Closure_PDA'] = this.deviceClosurePDA;
  //   data['Pulmonary'] = this.pulmonary;
  //   data['Aortic'] = this.aortic;
  //   data['Mitral'] = this.mitral;
  //   data['Post_Cardiac_Others'] = this.postCardiacOthers;
  //   data['OtherHeartDisease_Specify'] = this.otherHeartDiseaseSpecify;
  //   data['Headache'] = this.headache;
  //   data['Visual_Disturbance'] = this.visualDisturbance;
  //   data['Dizziness'] = this.dizziness;
  //   data['Altered_Mental_Status'] = this.alteredMentalStatus;
  //   data['Bleeding_Tendency'] = this.bleedingTendency;
  //   data['CNS_Symptoms'] = this.cNSSymptoms;
  //   data['Arthritis'] = this.arthritis;
  //   data['Renal_Dysfunction'] = this.renalDysfunction;
  //   data['Cyanosis'] = this.cyanosis;
  //   data['Polycythemia'] = this.polycythemia;
  //   data['Anemia'] = this.anemia;
  //   data['SpO2_RUL'] = this.spO2RUL;
  //   data['SpO2_LUL'] = this.spO2LUL;
  //   data['FourLimbs_RUL'] = this.fourLimbsRUL;
  //   data['FourLimbs_LUL'] = this.fourLimbsLUL;
  //   data['Hematocrit'] = this.hematocrit;
  //   data['Serum_Ferritin'] = this.serumFerritin;
  //   data['Any_Other_Relevant_Information'] = this.anyOtherRelevantInformation;
  //   data['Insert_Date'] = this.insertDate;
  //   return data;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CHDF_Id'] = '${this.cHDFId}';
    data['PatientId'] = '${this.patientId}';
    data['Atrial_Septal_Defect'] = '${this.atrialSeptalDefect}';
    data['Ventricular_Septal_Defect'] = '${this.ventricularSeptalDefect}';
    data['Patent_Ductus_Arteriosus'] = '${this.patentDuctusArteriosus}';
    data['AV_Canal_Defect'] = '${this.aVCanalDefect}';
    data['AP_Window'] = '${this.aPWindow}';
    data['Other_L_R_Shunts'] = '${this.otherLRShunts}';
    data['Eisenmenger_Physiology'] = '${this.eisenmengerPhysiology}';
    data['Valvular_Pulmonary_Stenosis'] = '${this.valvularPulmonaryStenosis}';
    data['Sub_Valvular_PS'] = '${this.subValvularPS}';
    data['TOF'] = '${this.tOF}';
    data['Double_Outlet_Right_Ventricle'] = '${this.doubleOutletRightVentricle}';
    data['Transposition_of_Great_Arteries'] = '${this.transpositionOfGreatArteries}';
    data['Corrected_Transposition'] = '${this.correctedTransposition}';
    data['Ebstein_Anomaly'] = '${this.ebsteinAnomaly}';
    data['Pulmonary_Atresia'] = '${this.pulmonaryAtresia}';
    data['Truncus_Arteriosus'] = '${this.truncusArteriosus}';
    data['Single_Ventricle'] = '${this.singleVentricle}';
    data['Tricuspid_Atresia'] = '${this.tricuspidAtresia}';
    data['DiseaseSpecific_Others'] = '${this.diseaseSpecificOthers}';
    data['DiseaseSpecific_Others_Specify'] = '${this.diseaseSpecificOthersSpecify}';
    data['Disease_Specific_Post_Surgical'] = '${this.diseaseSpecificPostSurgical}';
    data['Intracranial_Repair'] = '${this.intracranialRepair}';
    data['Fontan'] = '${this.fontan}';
    data['BDG_Shunt'] = '${this.bDGShunt}';
    data['BT_Shunt'] = '${this.bTShunt}';
    data['RV_PA_Conduit'] = '${this.rVPAConduit}';
    data['Arterial_Switch'] = '${this.arterialSwitch}';
    data['Prosthetic_Valve'] = '${this.prostheticValve}';
    data['PostSurgical_Others'] = '${this.postSurgicalOthers}';
    data['Post_Surgical_Others_Specify'] = '${this.postSurgicalOthersSpecify}';
    data['Disease_Specific_Post_Cardiac'] = '${this.diseaseSpecificPostCardiac}';
    data['Device_Closure_ASD'] = '${this.deviceClosureASD}';
    data['Device_Closure_VSD'] = '${this.deviceClosureVSD}';
    data['Device_Closure_PDA'] = '${this.deviceClosurePDA}';
    data['Pulmonary'] = '${this.pulmonary}';
    data['Aortic'] = '${this.aortic}';
    data['Mitral'] = '${this.mitral}';
    data['Post_Cardiac_Others'] = '${this.postCardiacOthers}';
    data['OtherHeartDisease_Specify'] = '${this.otherHeartDiseaseSpecify}';
    data['Headache'] = '${this.headache}';
    data['Visual_Disturbance'] = '${this.visualDisturbance}';
    data['Dizziness'] = '${this.dizziness}';
    data['Altered_Mental_Status'] = '${this.alteredMentalStatus}';
    data['Bleeding_Tendency'] = '${this.bleedingTendency}';
    data['CNS_Symptoms'] = '${this.cNSSymptoms}';
    data['Arthritis'] = '${this.arthritis}';
    data['Renal_Dysfunction'] = '${this.renalDysfunction}';
    data['Cyanosis'] = '${this.cyanosis}';
    data['Polycythemia'] = '${this.polycythemia}';
    data['Anemia'] = '${this.anemia}';
    data['SpO2_RUL'] = '${this.spO2RUL}';
    data['SpO2_LUL'] = '${this.spO2LUL}';
    data['FourLimbs_RUL'] = '${this.fourLimbsRUL}';
    data['FourLimbs_LUL'] = '${this.fourLimbsLUL}';
    data['Hematocrit'] = '${this.hematocrit}';
    data['Serum_Ferritin'] = '${this.serumFerritin}';
    data['Any_Other_Relevant_Information'] = '${this.anyOtherRelevantInformation}';
    data['Insert_Date'] = '${this.insertDate}';
    return data;
  }

}
