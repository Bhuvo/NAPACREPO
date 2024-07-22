class DrugModel {
  int? drugId;
  String? drugName;
  String? units;
  String? recommendedDose;
  String? activeFlag;
  String? insertDate;
  String? defaultROA;

  DrugModel(
      {this.drugId,
        this.drugName,
        this.units,
        this.recommendedDose,
        this.activeFlag,
        this.insertDate,
        this.defaultROA});

  DrugModel.fromJson(Map<String, dynamic> json) {
    drugId = json['drug_id'];
    drugName = json['drug_name'];
    units = json['Units'];
    recommendedDose = json['RecommendedDose'];
    activeFlag = json['Active_Flag'];
    insertDate = json['Insert_Date'];
    defaultROA = json['Default_ROA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drug_id'] = this.drugId;
    data['drug_name'] = this.drugName;
    data['Units'] = this.units;
    data['RecommendedDose'] = this.recommendedDose;
    data['Active_Flag'] = this.activeFlag;
    data['Insert_Date'] = this.insertDate;
    data['Default_ROA'] = this.defaultROA;
    return data;
  }

  @override
  String toString() {
    return '$drugName';
  }
}
