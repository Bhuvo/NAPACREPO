class VillageModel {
  int? locationId;
  String? locationName;
  int? cityId;
  int? stateId;
  int? countryId;
  Null? lat;
  Null? long;
  Null? latitude;
  Null? longitude;
  String? activeFlag;
  String? cDate;
  Null? updateDate;
  Null? pincode;
  int? talukId;

  VillageModel(
      {this.locationId,
        this.locationName,
        this.cityId,
        this.stateId,
        this.countryId,
        this.lat,
        this.long,
        this.latitude,
        this.longitude,
        this.activeFlag,
        this.cDate,
        this.updateDate,
        this.pincode,
        this.talukId});

  VillageModel.fromJson(Map<String, dynamic> json) {
    locationId = json['Location_id'];
    locationName = json['Location_Name'];
    cityId = json['City_id'];
    stateId = json['State_id'];
    countryId = json['Country_id'];
    lat = json['Lat'];
    long = json['Long'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    activeFlag = json['Active_Flag'];
    cDate = json['C_Date'];
    updateDate = json['Update_Date'];
    pincode = json['Pincode'];
    talukId = json['Taluk_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Location_id'] = this.locationId;
    data['Location_Name'] = this.locationName;
    data['City_id'] = this.cityId;
    data['State_id'] = this.stateId;
    data['Country_id'] = this.countryId;
    data['Lat'] = this.lat;
    data['Long'] = this.long;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['Active_Flag'] = this.activeFlag;
    data['C_Date'] = this.cDate;
    data['Update_Date'] = this.updateDate;
    data['Pincode'] = this.pincode;
    data['Taluk_id'] = this.talukId;
    return data;
  }
}
