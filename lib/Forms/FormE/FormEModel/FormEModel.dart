class FormEModel {
   int? mTPID;
  int? patientId;
  int? doctorId;
  String? abortType;
  String? visitDate;
  String? GestationalAge;
  bool? MtpCardiac;
  bool? MtpObstetric;
  bool? MtpFetal;
  bool? MtpSocial;
  String? gestationWeek;
  String? methodAdoptedForMtp;
  bool? methodSuctionEvacuation;
  bool? methodDilationCurettage;
  bool? methodDilationEvacuation;
  bool? methodHysterotomy;
  bool? methodMifepristone;
  String? mifepristoneDose;
  bool? methodMisoprostol;
  String? misoprostolDose;
  bool? methodDinoprostone;
  bool? methodMechanical;
  bool? methodOxytocin;
  String? modeOfAnesthesiaAnalgesia;
  String? antibioticProphylaxis;
  String? antibioticProphylaxisDetails;
  String? contraceptionAdvisedAfterMtp;
  String? contraceptionAdvisedValue;
  String? contraceptionAdvisedValueOthers;
  String? outcomeAndComplication;
  String? obstetricOutcome;
  String? maternalDeathFourTwo;
  String? deathSummary;
  String? maternalDeathFourTwoValue;
  String? maternalDeathFourTwoDetails;
  String? resuscitatedCardiacArrest;
  String? resuscitatedCardiacArrestDetails;
  String? newOnsetHF;
  String? newOnsetHFDetails;
  String? newSustainedCardiacArrhythmia;
  String? newSustainedCardiacArrhythmiaDetails;
  String? cVAStroke;
  String? cVAStrokeDetails;
  String? prostheticValveThrombosis;
  String? prostheticValveThrombosisDetails;
  String? systemicThromboembolism;
  String? systemicThromboembolismDetails;
  String? venousThromboembolism;
  String? venousThromboembolismDetails;
  String? bleedingMajorMinor;
  String? bleedingMajorMinorObestric;
  String? bleedingMajorMinorNonObestric;
  String? bleedingMajorMinorValue;
  String? bleedingMajorMinorDetails;
  String? infectiveEndocarditis;
  String? infectiveEndocarditisDetails;
  String? aorticDissection;
  String? aorticDissectionDetails;
  String? acuteCoronarySyndrome;
  String? acuteCoronarySyndromeDetails;
  String? urgentCardiacIntervention;
  String? urgentCardiacInterventionDetails;
  String? maternalDeathOneEightZero;
  String? maternalDeathOneEightZeroDetails;
  String? urgentUnplannedCardiacHospitalization;
  String? urgentUnplannedCardiacHospitalizationDetails;
  String? declineInNyhaClass;
  String? declineInNyhaClassDetails;
  String? electiveCardiacIntervention;
  String? electiveCardiacInterventionDetails;
  String? iCUStayDuration;
  String? iCUStayDurationDetails;
  String? otherComplications;
  String? cIOrPISignature;
  String? totalHospitalStayDuration;
  String? additionalDetails;

  FormEModel(
      {this.mTPID,
        this.patientId,
        this.doctorId,
        this.abortType,
        this.visitDate,
        this.GestationalAge,
        this.gestationWeek,
        this.MtpCardiac,
        this.MtpObstetric,
        this.MtpFetal,
        this.MtpSocial,
        this.methodAdoptedForMtp,
        this.methodSuctionEvacuation,
        this.methodDilationCurettage,
        this.methodDilationEvacuation,
        this.methodHysterotomy,
        this.methodMifepristone,
        this.mifepristoneDose,
        this.methodMisoprostol,
        this.misoprostolDose,
        this.methodDinoprostone,
        this.methodMechanical,
        this.methodOxytocin,
        this.modeOfAnesthesiaAnalgesia,
        this.antibioticProphylaxis,
        this.antibioticProphylaxisDetails,
        this.contraceptionAdvisedAfterMtp,
        this.contraceptionAdvisedValue,
        this.contraceptionAdvisedValueOthers,
        this.outcomeAndComplication,
        this.obstetricOutcome,
        this.maternalDeathFourTwo,
        this.deathSummary,
        this.maternalDeathFourTwoValue,
        this.maternalDeathFourTwoDetails,
        this.resuscitatedCardiacArrest,
        this.resuscitatedCardiacArrestDetails,
        this.newOnsetHF,
        this.newOnsetHFDetails,
        this.newSustainedCardiacArrhythmia,
        this.newSustainedCardiacArrhythmiaDetails,
        this.cVAStroke,
        this.cVAStrokeDetails,
        this.prostheticValveThrombosis,
        this.prostheticValveThrombosisDetails,
        this.systemicThromboembolism,
        this.systemicThromboembolismDetails,
        this.venousThromboembolism,
        this.venousThromboembolismDetails,
        this.bleedingMajorMinor,
        this.bleedingMajorMinorObestric,
        this.bleedingMajorMinorNonObestric,
        this.bleedingMajorMinorValue,
        this.bleedingMajorMinorDetails,
        this.infectiveEndocarditis,
        this.infectiveEndocarditisDetails,
        this.aorticDissection,
        this.aorticDissectionDetails,
        this.acuteCoronarySyndrome,
        this.acuteCoronarySyndromeDetails,
        this.urgentCardiacIntervention,
        this.urgentCardiacInterventionDetails,
        this.maternalDeathOneEightZero,
        this.maternalDeathOneEightZeroDetails,
        this.urgentUnplannedCardiacHospitalization,
        this.urgentUnplannedCardiacHospitalizationDetails,
        this.declineInNyhaClass,
        this.declineInNyhaClassDetails,
        this.electiveCardiacIntervention,
        this.electiveCardiacInterventionDetails,
        this.iCUStayDuration,
        this.iCUStayDurationDetails,
        this.otherComplications,
        this.cIOrPISignature,
        this.totalHospitalStayDuration,
        this.additionalDetails});

  FormEModel.fromJson(Map<String, dynamic> json) {
    mTPID = json['MTPID'];
    patientId = json['PatientId'];
    doctorId = json['DoctorId'];
    abortType = json['AbortType'];
    visitDate = json['VisitDate'];
    GestationalAge = json['GestationalAge'];
    MtpCardiac = json['MtpCardiac'];
    MtpObstetric = json['MtpObstetric'];
    MtpFetal = json['MtpFetal'];
    MtpSocial = json['MtpSocial'];
    gestationWeek = json['GestationWeek'];
    methodAdoptedForMtp = json['MethodAdoptedForMtp'];
    methodSuctionEvacuation = json['MethodSuctionEvacuation'];
    methodDilationCurettage = json['MethodDilationCurettage'];
    methodDilationEvacuation = json['MethodDilationEvacuation'];
    methodHysterotomy = json['MethodHysterotomy'];
    methodMifepristone = json['MethodMifepristone'];
    mifepristoneDose = json['MifepristoneDose'];
    methodMisoprostol = json['MethodMisoprostol'];
    misoprostolDose = json['MisoprostolDose'];
    methodDinoprostone = json['MethodDinoprostone'];
    methodMechanical = json['MethodMechanical'];
    methodOxytocin = json['MethodOxytocin'];
    modeOfAnesthesiaAnalgesia = json['ModeOfAnesthesiaAnalgesia'];
    antibioticProphylaxis = json['AntibioticProphylaxis'];
    antibioticProphylaxisDetails = json['AntibioticProphylaxisDetails'];
    contraceptionAdvisedAfterMtp = json['ContraceptionAdvisedAfterMtp'];
    contraceptionAdvisedValue = json['ContraceptionAdvisedValue'];
    contraceptionAdvisedValueOthers = json['ContraceptionAdvisedValueOthers'];
    outcomeAndComplication = json['OutcomeAndComplication'];
    obstetricOutcome = json['ObstetricOutcome'];
    maternalDeathFourTwo = json['MaternalDeathFourTwo'];
    deathSummary = json['DeathSummary'];
    maternalDeathFourTwoValue = json['MaternalDeathFourTwoValue'];
    maternalDeathFourTwoDetails = json['MaternalDeathFourTwoDetails'];
    resuscitatedCardiacArrest = json['ResuscitatedCardiacArrest'];
    resuscitatedCardiacArrestDetails = json['ResuscitatedCardiacArrestDetails'];
    newOnsetHF = json['NewOnsetHF'];
    newOnsetHFDetails = json['NewOnsetHFDetails'];
    newSustainedCardiacArrhythmia = json['NewSustainedCardiacArrhythmia'];
    newSustainedCardiacArrhythmiaDetails =
    json['NewSustainedCardiacArrhythmiaDetails'];
    cVAStroke = json['CVAStroke'];
    cVAStrokeDetails = json['CVAStrokeDetails'];
    prostheticValveThrombosis = json['ProstheticValveThrombosis'];
    prostheticValveThrombosisDetails = json['ProstheticValveThrombosisDetails'];
    systemicThromboembolism = json['SystemicThromboembolism'];
    systemicThromboembolismDetails = json['SystemicThromboembolismDetails'];
    venousThromboembolism = json['VenousThromboembolism'];
    venousThromboembolismDetails = json['VenousThromboembolismDetails'];
    bleedingMajorMinor = json['BleedingMajorMinor'];
    bleedingMajorMinorObestric = json['BleedingMajorMinorObestric'];
    bleedingMajorMinorNonObestric = json['BleedingMajorMinorNonObestric'];
    bleedingMajorMinorValue = json['BleedingMajorMinorValue'];
    bleedingMajorMinorDetails = json['BleedingMajorMinorDetails'];
    infectiveEndocarditis = json['InfectiveEndocarditis'];
    infectiveEndocarditisDetails = json['InfectiveEndocarditisDetails'];
    aorticDissection = json['AorticDissection'];
    aorticDissectionDetails = json['AorticDissectionDetails'];
    acuteCoronarySyndrome = json['AcuteCoronarySyndrome'];
    acuteCoronarySyndromeDetails = json['AcuteCoronarySyndromeDetails'];
    urgentCardiacIntervention = json['UrgentCardiacIntervention'];
    urgentCardiacInterventionDetails = json['UrgentCardiacInterventionDetails'];
    maternalDeathOneEightZero = json['MaternalDeathOneEightZero'];
    maternalDeathOneEightZeroDetails = json['MaternalDeathOneEightZeroDetails'];
    urgentUnplannedCardiacHospitalization =
    json['UrgentUnplannedCardiacHospitalization'];
    urgentUnplannedCardiacHospitalizationDetails =
    json['UrgentUnplannedCardiacHospitalizationDetails'];
    declineInNyhaClass = json['DeclineInNyhaClass'];
    declineInNyhaClassDetails = json['DeclineInNyhaClassDetails'];
    electiveCardiacIntervention = json['ElectiveCardiacIntervention'];
    electiveCardiacInterventionDetails =
    json['ElectiveCardiacInterventionDetails'];
    iCUStayDuration = json['ICUStayDuration'];
    iCUStayDurationDetails = json['ICUStayDurationDetails'];
    otherComplications = json['OtherComplications'];
    cIOrPISignature = json['CIOrPISignature'];
    totalHospitalStayDuration = json['TotalHospitalStayDuration'];
    additionalDetails = json['AdditionalDetails'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MTPID'] = this.mTPID;
    data['PatientId'] = this.patientId;
    data['DoctorId'] = this.doctorId;
    data['AbortType'] = this.abortType;
    data['VisitDate'] = this.visitDate;
    data['GestationalAge'] = this.GestationalAge;
    data['MtpCardiac'] = this.MtpCardiac;
    data['MtpObstetric'] = this.MtpObstetric;
    data['MtpFetal'] = this.MtpFetal;
    data['MtpSocial'] = this.MtpSocial;
    data['GestationWeek'] = this.gestationWeek;
    data['MethodAdoptedForMtp'] = this.methodAdoptedForMtp;
    data['MethodSuctionEvacuation'] = this.methodSuctionEvacuation;
    data['MethodDilationCurettage'] = this.methodDilationCurettage;
    data['MethodDilationEvacuation'] = this.methodDilationEvacuation;
    data['MethodHysterotomy'] = this.methodHysterotomy;
    data['MethodMifepristone'] = this.methodMifepristone;
    data['MifepristoneDose'] = this.mifepristoneDose;
    data['MethodMisoprostol'] = this.methodMisoprostol;
    data['MisoprostolDose'] = this.misoprostolDose;
    data['MethodDinoprostone'] = this.methodDinoprostone;
    data['MethodMechanical'] = this.methodMechanical;
    data['MethodOxytocin'] = this.methodOxytocin;
    data['ModeOfAnesthesiaAnalgesia'] = this.modeOfAnesthesiaAnalgesia;
    data['AntibioticProphylaxis'] = this.antibioticProphylaxis;
    data['AntibioticProphylaxisDetails'] = this.antibioticProphylaxisDetails;
    data['ContraceptionAdvisedAfterMtp'] = this.contraceptionAdvisedAfterMtp;
    data['ContraceptionAdvisedValue'] = this.contraceptionAdvisedValue;
    data['ContraceptionAdvisedValueOthers'] =
        this.contraceptionAdvisedValueOthers;
    data['OutcomeAndComplication'] = this.outcomeAndComplication;
    data['ObstetricOutcome'] = this.obstetricOutcome;
    data['MaternalDeathFourTwo'] = this.maternalDeathFourTwo;
    data['DeathSummary'] = this.deathSummary;
    data['MaternalDeathFourTwoValue'] = this.maternalDeathFourTwoValue;
    data['MaternalDeathFourTwoDetails'] = this.maternalDeathFourTwoDetails;
    data['ResuscitatedCardiacArrest'] = this.resuscitatedCardiacArrest;
    data['ResuscitatedCardiacArrestDetails'] =
        this.resuscitatedCardiacArrestDetails;
    data['NewOnsetHF'] = this.newOnsetHF;
    data['NewOnsetHFDetails'] = this.newOnsetHFDetails;
    data['NewSustainedCardiacArrhythmia'] = this.newSustainedCardiacArrhythmia;
    data['NewSustainedCardiacArrhythmiaDetails'] =
        this.newSustainedCardiacArrhythmiaDetails;
    data['CVAStroke'] = this.cVAStroke;
    data['CVAStrokeDetails'] = this.cVAStrokeDetails;
    data['ProstheticValveThrombosis'] = this.prostheticValveThrombosis;
    data['ProstheticValveThrombosisDetails'] =
        this.prostheticValveThrombosisDetails;
    data['SystemicThromboembolism'] = this.systemicThromboembolism;
    data['SystemicThromboembolismDetails'] =
        this.systemicThromboembolismDetails;
    data['VenousThromboembolism'] = this.venousThromboembolism;
    data['VenousThromboembolismDetails'] = this.venousThromboembolismDetails;
    data['BleedingMajorMinor'] = this.bleedingMajorMinor;
    data['BleedingMajorMinorObestric'] = this.bleedingMajorMinorObestric;
    data['BleedingMajorMinorNonObestric'] = this.bleedingMajorMinorNonObestric;
    data['BleedingMajorMinorValue'] = this.bleedingMajorMinorValue;
    data['BleedingMajorMinorDetails'] = this.bleedingMajorMinorDetails;
    data['InfectiveEndocarditis'] = this.infectiveEndocarditis;
    data['InfectiveEndocarditisDetails'] = this.infectiveEndocarditisDetails;
    data['AorticDissection'] = this.aorticDissection;
    data['AorticDissectionDetails'] = this.aorticDissectionDetails;
    data['AcuteCoronarySyndrome'] = this.acuteCoronarySyndrome;
    data['AcuteCoronarySyndromeDetails'] = this.acuteCoronarySyndromeDetails;
    data['UrgentCardiacIntervention'] = this.urgentCardiacIntervention;
    data['UrgentCardiacInterventionDetails'] =
        this.urgentCardiacInterventionDetails;
    data['MaternalDeathOneEightZero'] = this.maternalDeathOneEightZero;
    data['MaternalDeathOneEightZeroDetails'] =
        this.maternalDeathOneEightZeroDetails;
    data['UrgentUnplannedCardiacHospitalization'] =
        this.urgentUnplannedCardiacHospitalization;
    data['UrgentUnplannedCardiacHospitalizationDetails'] =
        this.urgentUnplannedCardiacHospitalizationDetails;
    data['DeclineInNyhaClass'] = this.declineInNyhaClass;
    data['DeclineInNyhaClassDetails'] = this.declineInNyhaClassDetails;
    data['ElectiveCardiacIntervention'] = this.electiveCardiacIntervention;
    data['ElectiveCardiacInterventionDetails'] =
        this.electiveCardiacInterventionDetails;
    data['ICUStayDuration'] = this.iCUStayDuration;
    data['ICUStayDurationDetails'] = this.iCUStayDurationDetails;
    data['OtherComplications'] = this.otherComplications;
    data['CIOrPISignature'] = this.cIOrPISignature;
    data['TotalHospitalStayDuration'] = this.totalHospitalStayDuration;
    data['AdditionalDetails'] = this.additionalDetails;
    return data;
  }
}
