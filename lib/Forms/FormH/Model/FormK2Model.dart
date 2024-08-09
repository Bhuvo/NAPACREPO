class FormK2Model {
  int? periDetId;
  int? doctorId;
  int? patientId;
  int? formId;
  String? deliveryPlan;
  String? gAForDeliveryPlan;
  bool? dPTCardiologist;
  bool? dPTObstetrician;
  bool? dPTAnesthetist;
  bool? dPTMFM;
  String? planMadeForDelivery;
  String? anesthesiaPlan;
  String? peripartumLie;
  String? peripartumPresentation;
  String? robsonParamter;
  String? dateOfDelivery;
  String? gestationalAgeDelivery;
  String? peripartumLabour;
  bool? oxytocin;
  String? oxytocinDose;
  String? oxytocinDuration;
  bool? dinoprostone;
  String? dinoprostoneDose;
  String? dinoprostoneDuration;
  bool? misoprostol;
  String? misoprostolDose;
  String? misoprostolDuration;
  bool? artificialRupture;
  bool? foleys;
  String? modeOfDelivery;
  bool? obstetricIndication;
  bool? cardiacIndication;
  String? obstetricIndicationValue;
  String? caridacIndicationReason;
  String? typeOfAnesthesia;
  String? anesthesiaDrugUsed;
  String? labourAnalgesia;
  bool? analgesiaEpidural;
  bool? analgesiaParenteral;
  bool? analgesiaInhalational;
  bool? analgesiaIntrathecal;
  bool? analgesiaCSE;
  bool? analgesiaDPE;
  String? analgesiaDrugUsed;
  String? bloodLoss;
  String? bloodLossAmount;
  String? bloodTransfusion;

  FormK2Model(
      {this.periDetId,
        this.doctorId,
        this.patientId,
        this.formId,
        this.deliveryPlan,
        this.gAForDeliveryPlan,
        this.dPTCardiologist,
        this.dPTObstetrician,
        this.dPTAnesthetist,
        this.dPTMFM,
        this.planMadeForDelivery,
        this.anesthesiaPlan,
        this.peripartumLie,
        this.peripartumPresentation,
        this.robsonParamter,
        this.dateOfDelivery,
        this.gestationalAgeDelivery,
        this.peripartumLabour,
        this.oxytocin,
        this.oxytocinDose,
        this.oxytocinDuration,
        this.dinoprostone,
        this.dinoprostoneDose,
        this.dinoprostoneDuration,
        this.misoprostol,
        this.misoprostolDose,
        this.misoprostolDuration,
        this.artificialRupture,
        this.foleys,
        this.modeOfDelivery,
        this.obstetricIndication,
        this.cardiacIndication,
        this.obstetricIndicationValue,
        this.caridacIndicationReason,
        this.typeOfAnesthesia,
        this.anesthesiaDrugUsed,
        this.labourAnalgesia,
        this.analgesiaEpidural,
        this.analgesiaParenteral,
        this.analgesiaInhalational,
        this.analgesiaIntrathecal,
        this.analgesiaCSE,
        this.analgesiaDPE,
        this.analgesiaDrugUsed,
        this.bloodLoss,
        this.bloodLossAmount,
        this.bloodTransfusion});

  FormK2Model.fromJson(Map<String, dynamic> json) {
    periDetId = json['PeriDetId'];
    doctorId = json['DoctorId'];
    patientId = json['PatientId'];
    formId = json['FormId'];
    deliveryPlan = json['DeliveryPlan'];
    gAForDeliveryPlan = json['GAForDeliveryPlan'];
    dPTCardiologist = json['DPTCardiologist'];
    dPTObstetrician = json['DPTObstetrician'];
    dPTAnesthetist = json['DPTAnesthetist'];
    dPTMFM = json['DPTMFM'];
    planMadeForDelivery = json['PlanMadeForDelivery'];
    anesthesiaPlan = json['AnesthesiaPlan'];
    peripartumLie = json['PeripartumLie'];
    peripartumPresentation = json['PeripartumPresentation'];
    robsonParamter = json['RobsonParamter'];
    dateOfDelivery = json['DateOfDelivery'];
    gestationalAgeDelivery = json['GestationalAgeDelivery'];
    peripartumLabour = json['PeripartumLabour'];
    oxytocin = json['Oxytocin'];
    oxytocinDose = json['OxytocinDose'];
    oxytocinDuration = json['OxytocinDuration'];
    dinoprostone = json['Dinoprostone'];
    dinoprostoneDose = json['DinoprostoneDose'];
    dinoprostoneDuration = json['DinoprostoneDuration'];
    misoprostol = json['Misoprostol'];
    misoprostolDose = json['MisoprostolDose'];
    misoprostolDuration = json['MisoprostolDuration'];
    artificialRupture = json['ArtificialRupture'];
    foleys = json['Foleys'];
    modeOfDelivery = json['ModeOfDelivery'];
    obstetricIndication = json['ObstetricIndication'];
    cardiacIndication = json['CardiacIndication'];
    obstetricIndicationValue = json['ObstetricIndicationValue'];
    caridacIndicationReason = json['CaridacIndicationReason'];
    typeOfAnesthesia = json['TypeOfAnesthesia'];
    anesthesiaDrugUsed = json['AnesthesiaDrugUsed'];
    labourAnalgesia = json['LabourAnalgesia'];
    analgesiaEpidural = json['AnalgesiaEpidural'];
    analgesiaParenteral = json['AnalgesiaParenteral'];
    analgesiaInhalational = json['AnalgesiaInhalational'];
    analgesiaIntrathecal = json['AnalgesiaIntrathecal'];
    analgesiaCSE = json['AnalgesiaCSE'];
    analgesiaDPE = json['AnalgesiaDPE'];
    analgesiaDrugUsed = json['AnalgesiaDrugUsed'];
    bloodLoss = json['BloodLoss'];
    bloodLossAmount = json['BloodLossAmount'];
    bloodTransfusion = json['BloodTransfusion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PeriDetId'] = this.periDetId;
    data['DoctorId'] = this.doctorId;
    data['PatientId'] = this.patientId;
    data['FormId'] = this.formId;
    data['DeliveryPlan'] = this.deliveryPlan;
    data['GAForDeliveryPlan'] = this.gAForDeliveryPlan;
    data['DPTCardiologist'] = this.dPTCardiologist;
    data['DPTObstetrician'] = this.dPTObstetrician;
    data['DPTAnesthetist'] = this.dPTAnesthetist;
    data['DPTMFM'] = this.dPTMFM;
    data['PlanMadeForDelivery'] = this.planMadeForDelivery;
    data['AnesthesiaPlan'] = this.anesthesiaPlan;
    data['PeripartumLie'] = this.peripartumLie;
    data['PeripartumPresentation'] = this.peripartumPresentation;
    data['RobsonParamter'] = this.robsonParamter;
    data['DateOfDelivery'] = this.dateOfDelivery;
    data['GestationalAgeDelivery'] = this.gestationalAgeDelivery;
    data['PeripartumLabour'] = this.peripartumLabour;
    data['Oxytocin'] = this.oxytocin;
    data['OxytocinDose'] = this.oxytocinDose;
    data['OxytocinDuration'] = this.oxytocinDuration;
    data['Dinoprostone'] = this.dinoprostone;
    data['DinoprostoneDose'] = this.dinoprostoneDose;
    data['DinoprostoneDuration'] = this.dinoprostoneDuration;
    data['Misoprostol'] = this.misoprostol;
    data['MisoprostolDose'] = this.misoprostolDose;
    data['MisoprostolDuration'] = this.misoprostolDuration;
    data['ArtificialRupture'] = this.artificialRupture;
    data['Foleys'] = this.foleys;
    data['ModeOfDelivery'] = this.modeOfDelivery;
    data['ObstetricIndication'] = this.obstetricIndication;
    data['CardiacIndication'] = this.cardiacIndication;
    data['ObstetricIndicationValue'] = this.obstetricIndicationValue;
    data['CaridacIndicationReason'] = this.caridacIndicationReason;
    data['TypeOfAnesthesia'] = this.typeOfAnesthesia;
    data['AnesthesiaDrugUsed'] = this.anesthesiaDrugUsed;
    data['LabourAnalgesia'] = this.labourAnalgesia;
    data['AnalgesiaEpidural'] = this.analgesiaEpidural;
    data['AnalgesiaParenteral'] = this.analgesiaParenteral;
    data['AnalgesiaInhalational'] = this.analgesiaInhalational;
    data['AnalgesiaIntrathecal'] = this.analgesiaIntrathecal;
    data['AnalgesiaCSE'] = this.analgesiaCSE;
    data['AnalgesiaDPE'] = this.analgesiaDPE;
    data['AnalgesiaDrugUsed'] = this.analgesiaDrugUsed;
    data['BloodLoss'] = this.bloodLoss;
    data['BloodLossAmount'] = this.bloodLossAmount;
    data['BloodTransfusion'] = this.bloodTransfusion;
    return data;
  }
}
