class TalukModel {
  int? talukId;
  int? cityId;
  String? talukName;
  String? activeFlag;
  String? insertDate;

  TalukModel(
      {this.talukId,
        this.cityId,
        this.talukName,
        this.activeFlag,
        this.insertDate});

  TalukModel.fromJson(Map<String, dynamic> json) {
    talukId = json['Taluk_id'];
    cityId = json['city_id'];
    talukName = json['Taluk_Name'];
    activeFlag = json['Active_Flag'];
    insertDate = json['Insert_Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Taluk_id'] = this.talukId;
    data['city_id'] = this.cityId;
    data['Taluk_Name'] = this.talukName;
    data['Active_Flag'] = this.activeFlag;
    data['Insert_Date'] = this.insertDate;
    return data;
  }
}
