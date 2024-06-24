class RegistrationPregnancyModel {
  int? prevPregDetailsId;
  int? tNPHDRNoId;
  int? previousPregNo;
  String? againstMedicalAdvice;
  String? conception;
  String? preconceptionContraception;
  String? yearOfDelivery;
  String? modeOfPreviousPregnancy;
  String? previousPregnancyOutcome;
  String? birthWeight;
  bool? molarPregnancy;
  bool? ectopicPregnancy;
  bool? maternalCardiac;
  bool? maternalObstetric;
  String? adverseOutcome;
  bool? fetal;
  bool? others;
  String? neonatalDeath;
  String? congenitalAnomaly;
  String? neonatalComplication;
  String? postDeliveryContraceptionUse;
  String? modeOfContraception;
  Null? activeFlag;
  Null? insertDate;

  RegistrationPregnancyModel(
      {this.prevPregDetailsId,
        this.tNPHDRNoId,
        this.previousPregNo,
        this.againstMedicalAdvice,
        this.conception,
        this.preconceptionContraception,
        this.yearOfDelivery,
        this.modeOfPreviousPregnancy,
        this.previousPregnancyOutcome,
        this.birthWeight,
        this.molarPregnancy,
        this.ectopicPregnancy,
        this.maternalCardiac,
        this.maternalObstetric,
        this.adverseOutcome,
        this.fetal,
        this.others,
        this.neonatalDeath,
        this.congenitalAnomaly,
        this.neonatalComplication,
        this.postDeliveryContraceptionUse,
        this.modeOfContraception,
        this.activeFlag,
        this.insertDate});

  RegistrationPregnancyModel.fromJson(Map<String, dynamic> json) {
    prevPregDetailsId = json['prev_preg_details_id'];
    tNPHDRNoId = json['TNPHDR_No_Id'];
    previousPregNo = json['Previous_Preg_No'];
    againstMedicalAdvice = json['Against_Medical_Advice'];
    conception = json['Conception'];
    preconceptionContraception = json['Preconception_Contraception'];
    yearOfDelivery = json['Year_of_Delivery'];
    modeOfPreviousPregnancy = json['Mode_of_PreviousPregnancy'];
    previousPregnancyOutcome = json['Previous_Pregnancy_Outcome'];
    birthWeight = json['Birth_Weight'];
    molarPregnancy = json['Molar_Pregnancy'];
    ectopicPregnancy = json['Ectopic_Pregnancy'];
    maternalCardiac = json['Maternal_Cardiac'];
    maternalObstetric = json['Maternal_Obstetric'];
    adverseOutcome = json['Adverse_Outcome'];
    fetal = json['Fetal'];
    others = json['Others'];
    neonatalDeath = json['Neonatal_Death'];
    congenitalAnomaly = json['Congenital_Anomaly'];
    neonatalComplication = json['Neonatal_Complication'];
    postDeliveryContraceptionUse = json['PostDelivery_ContraceptionUse'];
    modeOfContraception = json['Mode_of_Contraception'];
    activeFlag = json['Active_Flag'];
    insertDate = json['Insert_Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prev_preg_details_id'] = this.prevPregDetailsId ==0 || this.prevPregDetailsId == null ? null :'${this.prevPregDetailsId}';
    data['TNPHDR_No_Id'] = '${this.tNPHDRNoId}';
    data['Previous_Preg_No'] = '${this.previousPregNo}';
    data['Against_Medical_Advice'] = this.againstMedicalAdvice;
    data['Conception'] = this.conception;
    data['Preconception_Contraception'] = this.preconceptionContraception;
    data['Year_of_Delivery'] = this.yearOfDelivery;
    data['Mode_of_PreviousPregnancy'] = this.modeOfPreviousPregnancy;
    data['Previous_Pregnancy_Outcome'] = this.previousPregnancyOutcome;
    data['Birth_Weight'] = this.birthWeight;
    data['Molar_Pregnancy'] = '${this.molarPregnancy}';
    data['Ectopic_Pregnancy'] = '${this.ectopicPregnancy}';
    data['Maternal_Cardiac'] = '${this.maternalCardiac}';
    data['Maternal_Obstetric'] = '${this.maternalObstetric}';
    data['Adverse_Outcome'] = this.adverseOutcome;
    data['Fetal'] = '${this.fetal}';
    data['Others'] = '${this.others}';
    data['Neonatal_Death'] = this.neonatalDeath;
    data['Congenital_Anomaly'] = this.congenitalAnomaly;
    data['Neonatal_Complication'] = this.neonatalComplication;
    data['PostDelivery_ContraceptionUse'] = this.postDeliveryContraceptionUse;
    data['Mode_of_Contraception'] = this.modeOfContraception;
    data['Active_Flag'] = this.activeFlag;
    data['Insert_Date'] = this.insertDate;
    return data;
  }
}
