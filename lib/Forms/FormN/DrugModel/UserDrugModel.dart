class UserDrugModel {
  int? prescriptionId;
  int? tNPHDRNoId;
  int? visitNo;
  String? drugName;
  int? dosage;
  String? roaValue;
  String? units;
  String? frequency;
  int? numberOfDays;
  String? otherDrugName;
  String? activeFlag;
  String? insertDate;

  UserDrugModel(
      {this.prescriptionId,
        this.tNPHDRNoId,
        this.visitNo,
        this.drugName,
        this.dosage,
        this.roaValue,
        this.units,
        this.frequency,
        this.numberOfDays,
        this.otherDrugName,
        this.activeFlag,
        this.insertDate});

  UserDrugModel.fromJson(Map<String, dynamic> json) {
    prescriptionId = json['prescription_id'];
    tNPHDRNoId = json['TNPHDR_No_Id'];
    visitNo = json['Visit_No'];
    drugName = json['Drug_Name'];
    dosage = json['Dosage'];
    roaValue = json['Roa_Value'];
    units = json['Units'];
    frequency = json['frequency'];
    numberOfDays = json['Number_Of_Days'];
    otherDrugName = json['Other_Drug_Name'];
    activeFlag = json['Active_Flag'];
    insertDate = json['Insert_Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prescription_id'] = '${this.prescriptionId}';
    data['TNPHDR_No_Id'] = '${this.tNPHDRNoId}';
    data['Visit_No'] = '${this.visitNo}';
    data['Drug_Name'] = this.drugName;
    data['Dosage'] = '${this.dosage}';
    data['Roa_Value'] = this.roaValue;
    data['Units'] = this.units;
    data['frequency'] = this.frequency;
    data['Number_Of_Days'] = '${this.numberOfDays}';
    data['Other_Drug_Name'] = this.otherDrugName;
    data['Active_Flag'] = this.activeFlag;
    data['Insert_Date'] = this.insertDate;
    return data;
  }
}
