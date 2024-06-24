class StateModel {
  int? stateId;
  String? stateName;
  int? countryId;
  String? activeFlag;
  String? insertDate;
  String? updateDate;

  StateModel({
    this.stateId,
    this.stateName,
    this.countryId,
    this.activeFlag,
    this.insertDate,
    this.updateDate,
  });

  StateModel.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    stateName = json['state_name'];
    countryId = json['country_id'];
    activeFlag = json['active_flag'];
    insertDate = json['insert_date'];
    updateDate = json['update_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state_id'] = stateId;
    data['state_name'] = stateName;
    data['country_id'] = countryId;
    data['active_flag'] = activeFlag;
    data['insert_date'] = insertDate;
    data['update_date'] = updateDate;
    return data;
  }
}
