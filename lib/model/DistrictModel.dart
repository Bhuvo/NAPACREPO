class DistrictModel {
  int? cityId;
  String? cityName;
  int? stateId;
  int? countryId;
  Null? priorityId;
  Null? typeFlag;
  String? activeFlag;
  String? insertDate;
  Null? updateDate;

  DistrictModel(
      {this.cityId,
        this.cityName,
        this.stateId,
        this.countryId,
        this.priorityId,
        this.typeFlag,
        this.activeFlag,
        this.insertDate,
        this.updateDate});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    stateId = json['state_id'];
    countryId = json['Country_id'];
    priorityId = json['Priority_id'];
    typeFlag = json['Type_Flag'];
    activeFlag = json['active_flag'];
    insertDate = json['insert_date'];
    updateDate = json['update_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['state_id'] = this.stateId;
    data['Country_id'] = this.countryId;
    data['Priority_id'] = this.priorityId;
    data['Type_Flag'] = this.typeFlag;
    data['active_flag'] = this.activeFlag;
    data['insert_date'] = this.insertDate;
    data['update_date'] = this.updateDate;
    return data;
  }
}
