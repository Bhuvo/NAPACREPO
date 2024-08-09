class FormD9Model {
  int? riskId;
  int? patientId;
  String? fetalEchocardiogram;
  String? fetalEchocardiogramAbnormal;
  String? fetalEchocardiogramDate;
  String? fetalAnomalyScan;
  String? fetalAnomalyScanAbnormal;
  String? anomalyEchocardiogramDate;
  String? baselineriskMwho;
  int? carpreg2score;
  String? carpreg21;
  String? carpreg22;
  String? carpreg23;
  String? carpreg24;
  String? carpreg25;
  String? carpreg26;
  String? carpreg27;
  String? carpreg28;
  String? carpreg29;
  String? carpreg210;
  int? zaharascore;
  String? zaharascore1;
  String? zaharascore2;
  String? zaharascore3;
  String? zaharascore4;
  String? zaharascore5;
  String? zaharascore6;
  String? zaharascore7;
  String? zaharascore8;
  int? deviscore;
  String? deviscore1;
  String? deviscore2;
  String? deviscore3;
  String? deviscore4;
  String? deviscore5;
  String? deviscore6;
  String? deviscore7;
  String? mPAC4RiskCategory;
  String? mPAC3RiskCategory;
  String? specificAdvice;
  bool? hospitalization;
  bool? changeOfMedication;
  bool? obstetricsIntervention;
  bool? cardiacIntervention;
  bool? specificAdviceOthers;
  String? specificAdviceOthersSpecify;
  String? medicationsAdvised;
  String? dateOfNextFollowUp;
  String? insertDate;

  FormD9Model(
      {this.riskId,
        this.patientId,
        this.fetalEchocardiogram,
        this.fetalEchocardiogramAbnormal,
        this.fetalEchocardiogramDate,
        this.fetalAnomalyScan,
        this.fetalAnomalyScanAbnormal,
        this.anomalyEchocardiogramDate,
        this.baselineriskMwho,
        this.carpreg2score,
        this.carpreg21,
        this.carpreg22,
        this.carpreg23,
        this.carpreg24,
        this.carpreg25,
        this.carpreg26,
        this.carpreg27,
        this.carpreg28,
        this.carpreg29,
        this.carpreg210,
        this.zaharascore,
        this.zaharascore1,
        this.zaharascore2,
        this.zaharascore3,
        this.zaharascore4,
        this.zaharascore5,
        this.zaharascore6,
        this.zaharascore7,
        this.zaharascore8,
        this.deviscore,
        this.deviscore1,
        this.deviscore2,
        this.deviscore3,
        this.deviscore4,
        this.deviscore5,
        this.deviscore6,
        this.deviscore7,
        this.mPAC4RiskCategory,
        this.mPAC3RiskCategory,
        this.specificAdvice,
        this.hospitalization,
        this.changeOfMedication,
        this.obstetricsIntervention,
        this.cardiacIntervention,
        this.specificAdviceOthers,
        this.specificAdviceOthersSpecify,
        this.medicationsAdvised,
        this.dateOfNextFollowUp,
        this.insertDate});

  FormD9Model.fromJson(Map<String, dynamic> json) {
    riskId = json['Risk_Id'];
    patientId = json['PatientId'];
    fetalEchocardiogram = json['Fetal_Echocardiogram'];
    fetalEchocardiogramAbnormal = json['Fetal_Echocardiogram_Abnormal'];
    fetalEchocardiogramDate = json['Fetal_Echocardiogram_Date'];
    fetalAnomalyScan = json['Fetal_Anomaly_Scan'];
    fetalAnomalyScanAbnormal = json['Fetal_Anomaly_Scan_Abnormal'];
    anomalyEchocardiogramDate = json['Anomaly_Echocardiogram_Date'];
    baselineriskMwho = json['baselinerisk_mwho'];
    carpreg2score = json['carpreg2score'];
    carpreg21 = json['carpreg2_1'];
    carpreg22 = json['carpreg2_2'];
    carpreg23 = json['carpreg2_3'];
    carpreg24 = json['carpreg2_4'];
    carpreg25 = json['carpreg2_5'];
    carpreg26 = json['carpreg2_6'];
    carpreg27 = json['carpreg2_7'];
    carpreg28 = json['carpreg2_8'];
    carpreg29 = json['carpreg2_9'];
    carpreg210 = json['carpreg2_10'];
    zaharascore = json['zaharascore'];
    zaharascore1 = json['zaharascore_1'];
    zaharascore2 = json['zaharascore_2'];
    zaharascore3 = json['zaharascore_3'];
    zaharascore4 = json['zaharascore_4'];
    zaharascore5 = json['zaharascore_5'];
    zaharascore6 = json['zaharascore_6'];
    zaharascore7 = json['zaharascore_7'];
    zaharascore8 = json['zaharascore_8'];
    deviscore = json['Deviscore'];
    deviscore1 = json['Deviscore_1'];
    deviscore2 = json['Deviscore_2'];
    deviscore3 = json['Deviscore_3'];
    deviscore4 = json['Deviscore_4'];
    deviscore5 = json['Deviscore_5'];
    deviscore6 = json['Deviscore_6'];
    deviscore7 = json['Deviscore_7'];
    mPAC4RiskCategory = json['MPAC_4_Risk_Category'];
    mPAC3RiskCategory = json['MPAC_3_Risk_Category'];
    specificAdvice = json['Specific_Advice'];
    hospitalization = json['Hospitalization'];
    changeOfMedication = json['Change_of_Medication'];
    obstetricsIntervention = json['Obstetrics_Intervention'];
    cardiacIntervention = json['Cardiac_Intervention'];
    specificAdviceOthers = json['Specific_Advice_Others'];
    specificAdviceOthersSpecify = json['Specific_Advice_Others_Specify'];
    medicationsAdvised = json['Medications_Advised'];
    dateOfNextFollowUp = json['Date_of_Next_FollowUp'];
    insertDate = json['Insert_Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Risk_Id'] = this.riskId;
    data['PatientId'] = this.patientId;
    data['Fetal_Echocardiogram'] = this.fetalEchocardiogram;
    data['Fetal_Echocardiogram_Abnormal'] = this.fetalEchocardiogramAbnormal;
    data['Fetal_Echocardiogram_Date'] = this.fetalEchocardiogramDate;
    data['Fetal_Anomaly_Scan'] = this.fetalAnomalyScan;
    data['Fetal_Anomaly_Scan_Abnormal'] = this.fetalAnomalyScanAbnormal;
    data['Anomaly_Echocardiogram_Date'] = this.anomalyEchocardiogramDate;
    data['baselinerisk_mwho'] = this.baselineriskMwho;
    data['carpreg2score'] = this.carpreg2score;
    data['carpreg2_1'] = this.carpreg21;
    data['carpreg2_2'] = this.carpreg22;
    data['carpreg2_3'] = this.carpreg23;
    data['carpreg2_4'] = this.carpreg24;
    data['carpreg2_5'] = this.carpreg25;
    data['carpreg2_6'] = this.carpreg26;
    data['carpreg2_7'] = this.carpreg27;
    data['carpreg2_8'] = this.carpreg28;
    data['carpreg2_9'] = this.carpreg29;
    data['carpreg2_10'] = this.carpreg210;
    data['zaharascore'] = this.zaharascore;
    data['zaharascore_1'] = this.zaharascore1;
    data['zaharascore_2'] = this.zaharascore2;
    data['zaharascore_3'] = this.zaharascore3;
    data['zaharascore_4'] = this.zaharascore4;
    data['zaharascore_5'] = this.zaharascore5;
    data['zaharascore_6'] = this.zaharascore6;
    data['zaharascore_7'] = this.zaharascore7;
    data['zaharascore_8'] = this.zaharascore8;
    data['Deviscore'] = this.deviscore;
    data['Deviscore_1'] = this.deviscore1;
    data['Deviscore_2'] = this.deviscore2;
    data['Deviscore_3'] = this.deviscore3;
    data['Deviscore_4'] = this.deviscore4;
    data['Deviscore_5'] = this.deviscore5;
    data['Deviscore_6'] = this.deviscore6;
    data['Deviscore_7'] = this.deviscore7;
    data['MPAC_4_Risk_Category'] = this.mPAC4RiskCategory;
    data['MPAC_3_Risk_Category'] = this.mPAC3RiskCategory;
    data['Specific_Advice'] = this.specificAdvice;
    data['Hospitalization'] = this.hospitalization;
    data['Change_of_Medication'] = this.changeOfMedication;
    data['Obstetrics_Intervention'] = this.obstetricsIntervention;
    data['Cardiac_Intervention'] = this.cardiacIntervention;
    data['Specific_Advice_Others'] = this.specificAdviceOthers;
    data['Specific_Advice_Others_Specify'] = this.specificAdviceOthersSpecify;
    data['Medications_Advised'] = this.medicationsAdvised;
    data['Date_of_Next_FollowUp'] = this.dateOfNextFollowUp;
    data['Insert_Date'] = this.insertDate;
    return data;
  }
}
