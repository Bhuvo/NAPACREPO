class AntibioticsList {
  int? abId;
  int? patientId;
  int? doctorId;
  String? name;
  String? purpose;
  String? gestWeeks;
  String? durationInDays;

  AntibioticsList(
      {this.abId,
        this.patientId,
        this.doctorId,
        this.name,
        this.purpose,
        this.gestWeeks,
        this.durationInDays});

  AntibioticsList.fromJson(Map<String, dynamic> json) {
    abId = json['AbId'];
    patientId = json['PatientId'];
    doctorId = json['DoctorId'];
    name = json['Name'];
    purpose = json['Purpose'];
    gestWeeks = json['GestWeeks'];
    durationInDays = json['DurationInDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AbId'] = this.abId;
    data['PatientId'] = this.patientId;
    data['DoctorId'] = this.doctorId;
    data['Name'] = this.name;
    data['Purpose'] = this.purpose;
    data['GestWeeks'] = this.gestWeeks;
    data['DurationInDays'] = this.durationInDays;
    return data;
  }
}
