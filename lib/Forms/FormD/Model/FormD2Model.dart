class FormD2Model {
  int? clinicalAndBaselineId;
  int? patientId;
  double? height;
  double? weight;
  int? sPO2;
  int? heartRate;
  int? bloodPressure;
  String? heartFailure;
  String? cyanosis;
  String? cardiacMurmur;
  String? abdomenExamination;
  String? gTT;
  double? bloodUrea;
  double? srCreatinine;
  int? tSH;
  int? hCT;
  int? bNP;
  int? nTProBNP;
  String? ifAnyOthersInvestigations;
  String? eCGDate;
  String? eCGValue;
  String? uploadedFile;
  String? eCGDetail;
  String? insertDate;
  int? hb;

  FormD2Model(
      {this.clinicalAndBaselineId,
        this.patientId,
        this.height,
        this.weight,
        this.sPO2,
        this.heartRate,
        this.bloodPressure,
        this.heartFailure,
        this.cyanosis,
        this.cardiacMurmur,
        this.abdomenExamination,
        this.gTT,
        this.bloodUrea,
        this.srCreatinine,
        this.tSH,
        this.hCT,
        this.bNP,
        this.nTProBNP,
        this.ifAnyOthersInvestigations,
        this.eCGDate,
        this.eCGValue,
        this.uploadedFile,
        this.eCGDetail,
        this.insertDate,
        this.hb});

  FormD2Model.fromJson(Map<String, dynamic> json) {
    clinicalAndBaselineId = json['Clinical_and_baseline_id'];
    patientId = json['PatientId'];
    height = json['Height'];
    weight = json['Weight'];
    sPO2 = json['SPO2'];
    heartRate = json['Heart_Rate'];
    bloodPressure = json['Blood_Pressure'];
    heartFailure = json['Heart_Failure'];
    cyanosis = json['Cyanosis'];
    cardiacMurmur = json['Cardiac_Murmur'];
    abdomenExamination = json['Abdomen_Examination'];
    gTT = json['GTT'];
    bloodUrea = json['Blood_urea'];
    srCreatinine = json['Sr_Creatinine'];
    tSH = json['TSH'];
    hCT = json['HCT'];
    bNP = json['BNP'];
    nTProBNP = json['NT_pro_BNP'];
    ifAnyOthersInvestigations = json['If_Any_Others_Investigations'];
    eCGDate = json['ECG_Date'];
    eCGValue = json['ECG_Value'];
    uploadedFile = json['Uploaded_File'];
    eCGDetail = json['ECG_Detail'];
    insertDate = json['Insert_Date'];
    hb = json['Hb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Clinical_and_baseline_id'] = '${this.clinicalAndBaselineId}';
    data['PatientId'] = '${this.patientId}';
    data['Height'] = '${this.height}';
    data['Weight'] = '${this.weight}';
    data['SPO2'] = '${this.sPO2}';
    data['Heart_Rate'] = '${this.heartRate}';
    data['Blood_Pressure'] = '${this.bloodPressure}';
    data['Heart_Failure'] = this.heartFailure;
    data['Cyanosis'] = this.cyanosis;
    data['Cardiac_Murmur'] = this.cardiacMurmur;
    data['Abdomen_Examination'] = this.abdomenExamination;
    data['GTT'] = this.gTT;
    data['Blood_urea'] = '${this.bloodUrea}';
    data['Sr_Creatinine'] = '${this.srCreatinine}';
    data['TSH'] = '${this.tSH}';
    data['HCT'] = '${this.hCT}';
    data['BNP'] = '${this.bNP}';
    data['NT_pro_BNP'] = '${this.nTProBNP}';
    data['If_Any_Others_Investigations'] = this.ifAnyOthersInvestigations;
    data['ECG_Date'] = this.eCGDate;
    data['ECG_Value'] = this.eCGValue;
    data['Uploaded_File'] = this.uploadedFile;
    data['ECG_Detail'] = this.eCGDetail;
    data['Insert_Date'] = this.insertDate;
    data['Hb'] = '${this.hb}';
    return data;
  }
}
