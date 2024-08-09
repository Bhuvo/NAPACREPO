class FormK5Model {
  int? obsOutcomeId;
  int? doctorId;
  int? patientId;
  int? formId;
  String? obsModeOfDelivery;
  String? obstetricGdm;
  String? obstetricGdmValues;
  String? obstetricGdmTime;
  String? obstetricGht;
  String? obstetricGhtValues;
  String? obstetricGhtTime;
  String? obstetricPreecla;
  String? obstetricPreeclaValues;
  String? obstetricPreeclaTime;
  String? obstetricEclampsia;
  String? obstetricEclampsiaValues;
  String? obstetricEclampsiaTime;
  String? obstetricHellp;
  String? obstetricHellpValues;
  String? obstetricHellpTime;
  String? obstetricSepsis;
  String? obstetricSepsisValues;
  String? obstetricSepsisTime;
  String? obstetricCardres;
  String? obstetricCardresValues;
  String? obstetricCardresTime;
  String? obstetricIntubation;
  String? obstetricIntubationValues;
  String? obstetricIntubationTime;
  String? obstetricInotrope;
  String? obstetricInotropeValues;
  String? obstetricInotropeTime;
  String? obstetricPh;
  String? obstetricPhValues;
  String? obstetricPhTime;
  String? obstetricOliguria;
  String? obstetricOliguriaTime;
  String? obstetricLactate;
  String? obstetricLactateValues;
  String? obstetricLactateTime;
  String? obstetricLessHrs;
  String? obstetricLessHrsValues;
  String? obstetricLessHrsTime;
  String? obstetricGrtHrs;
  String? obstetricGrtHrsValues;
  String? obstetricGrtHrsTime;
  String? obstetricProm;
  String? obstetricPromValues;
  String? obstetricPromTime;
  String? obstetricAbrPlac;
  String? obstetricAbrPlacValues;
  String? obstetricAbrPlacTime;
  String? obstetricRetPlac;
  String? obstetricRetPlacValues;
  String? obstetricRetPlacTime;
  String? obstetricPph;
  String? obstetricPphValues;
  String? obstetricPphTime;

  FormK5Model(
      {this.obsOutcomeId,
        this.doctorId,
        this.patientId,
        this.formId,
        this.obsModeOfDelivery,
        this.obstetricGdm,
        this.obstetricGdmValues,
        this.obstetricGdmTime,
        this.obstetricGht,
        this.obstetricGhtValues,
        this.obstetricGhtTime,
        this.obstetricPreecla,
        this.obstetricPreeclaValues,
        this.obstetricPreeclaTime,
        this.obstetricEclampsia,
        this.obstetricEclampsiaValues,
        this.obstetricEclampsiaTime,
        this.obstetricHellp,
        this.obstetricHellpValues,
        this.obstetricHellpTime,
        this.obstetricSepsis,
        this.obstetricSepsisValues,
        this.obstetricSepsisTime,
        this.obstetricCardres,
        this.obstetricCardresValues,
        this.obstetricCardresTime,
        this.obstetricIntubation,
        this.obstetricIntubationValues,
        this.obstetricIntubationTime,
        this.obstetricInotrope,
        this.obstetricInotropeValues,
        this.obstetricInotropeTime,
        this.obstetricPh,
        this.obstetricPhValues,
        this.obstetricPhTime,
        this.obstetricOliguria,
        this.obstetricOliguriaTime,
        this.obstetricLactate,
        this.obstetricLactateValues,
        this.obstetricLactateTime,
        this.obstetricLessHrs,
        this.obstetricLessHrsValues,
        this.obstetricLessHrsTime,
        this.obstetricGrtHrs,
        this.obstetricGrtHrsValues,
        this.obstetricGrtHrsTime,
        this.obstetricProm,
        this.obstetricPromValues,
        this.obstetricPromTime,
        this.obstetricAbrPlac,
        this.obstetricAbrPlacValues,
        this.obstetricAbrPlacTime,
        this.obstetricRetPlac,
        this.obstetricRetPlacValues,
        this.obstetricRetPlacTime,
        this.obstetricPph,
        this.obstetricPphValues,
        this.obstetricPphTime});

  FormK5Model.fromJson(Map<String, dynamic> json) {
    obsOutcomeId = json['ObsOutcomeId'];
    doctorId = json['DoctorId'];
    patientId = json['PatientId'];
    formId = json['FormId'];
    obsModeOfDelivery = json['ObsModeOfDelivery'];
    obstetricGdm = json['ObstetricGdm'];
    obstetricGdmValues = json['ObstetricGdmValues'];
    obstetricGdmTime = json['ObstetricGdmTime'];
    obstetricGht = json['ObstetricGht'];
    obstetricGhtValues = json['ObstetricGhtValues'];
    obstetricGhtTime = json['ObstetricGhtTime'];
    obstetricPreecla = json['ObstetricPreecla'];
    obstetricPreeclaValues = json['ObstetricPreeclaValues'];
    obstetricPreeclaTime = json['ObstetricPreeclaTime'];
    obstetricEclampsia = json['ObstetricEclampsia'];
    obstetricEclampsiaValues = json['ObstetricEclampsiaValues'];
    obstetricEclampsiaTime = json['ObstetricEclampsiaTime'];
    obstetricHellp = json['ObstetricHellp'];
    obstetricHellpValues = json['ObstetricHellpValues'];
    obstetricHellpTime = json['ObstetricHellpTime'];
    obstetricSepsis = json['ObstetricSepsis'];
    obstetricSepsisValues = json['ObstetricSepsisValues'];
    obstetricSepsisTime = json['ObstetricSepsisTime'];
    obstetricCardres = json['ObstetricCardres'];
    obstetricCardresValues = json['ObstetricCardresValues'];
    obstetricCardresTime = json['ObstetricCardresTime'];
    obstetricIntubation = json['ObstetricIntubation'];
    obstetricIntubationValues = json['ObstetricIntubationValues'];
    obstetricIntubationTime = json['ObstetricIntubationTime'];
    obstetricInotrope = json['ObstetricInotrope'];
    obstetricInotropeValues = json['ObstetricInotropeValues'];
    obstetricInotropeTime = json['ObstetricInotropeTime'];
    obstetricPh = json['ObstetricPh'];
    obstetricPhValues = json['ObstetricPhValues'];
    obstetricPhTime = json['ObstetricPhTime'];
    obstetricOliguria = json['ObstetricOliguria'];
    obstetricOliguriaTime = json['ObstetricOliguriaTime'];
    obstetricLactate = json['ObstetricLactate'];
    obstetricLactateValues = json['ObstetricLactateValues'];
    obstetricLactateTime = json['ObstetricLactateTime'];
    obstetricLessHrs = json['ObstetricLessHrs'];
    obstetricLessHrsValues = json['ObstetricLessHrsValues'];
    obstetricLessHrsTime = json['ObstetricLessHrsTime'];
    obstetricGrtHrs = json['ObstetricGrtHrs'];
    obstetricGrtHrsValues = json['ObstetricGrtHrsValues'];
    obstetricGrtHrsTime = json['ObstetricGrtHrsTime'];
    obstetricProm = json['ObstetricProm'];
    obstetricPromValues = json['ObstetricPromValues'];
    obstetricPromTime = json['ObstetricPromTime'];
    obstetricAbrPlac = json['ObstetricAbrPlac'];
    obstetricAbrPlacValues = json['ObstetricAbrPlacValues'];
    obstetricAbrPlacTime = json['ObstetricAbrPlacTime'];
    obstetricRetPlac = json['ObstetricRetPlac'];
    obstetricRetPlacValues = json['ObstetricRetPlacValues'];
    obstetricRetPlacTime = json['ObstetricRetPlacTime'];
    obstetricPph = json['ObstetricPph'];
    obstetricPphValues = json['ObstetricPphValues'];
    obstetricPphTime = json['ObstetricPphTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ObsOutcomeId'] = this.obsOutcomeId;
    data['DoctorId'] = this.doctorId;
    data['PatientId'] = this.patientId;
    data['FormId'] = this.formId;
    data['ObsModeOfDelivery'] = this.obsModeOfDelivery;
    data['ObstetricGdm'] = this.obstetricGdm;
    data['ObstetricGdmValues'] = this.obstetricGdmValues;
    data['ObstetricGdmTime'] = this.obstetricGdmTime;
    data['ObstetricGht'] = this.obstetricGht;
    data['ObstetricGhtValues'] = this.obstetricGhtValues;
    data['ObstetricGhtTime'] = this.obstetricGhtTime;
    data['ObstetricPreecla'] = this.obstetricPreecla;
    data['ObstetricPreeclaValues'] = this.obstetricPreeclaValues;
    data['ObstetricPreeclaTime'] = this.obstetricPreeclaTime;
    data['ObstetricEclampsia'] = this.obstetricEclampsia;
    data['ObstetricEclampsiaValues'] = this.obstetricEclampsiaValues;
    data['ObstetricEclampsiaTime'] = this.obstetricEclampsiaTime;
    data['ObstetricHellp'] = this.obstetricHellp;
    data['ObstetricHellpValues'] = this.obstetricHellpValues;
    data['ObstetricHellpTime'] = this.obstetricHellpTime;
    data['ObstetricSepsis'] = this.obstetricSepsis;
    data['ObstetricSepsisValues'] = this.obstetricSepsisValues;
    data['ObstetricSepsisTime'] = this.obstetricSepsisTime;
    data['ObstetricCardres'] = this.obstetricCardres;
    data['ObstetricCardresValues'] = this.obstetricCardresValues;
    data['ObstetricCardresTime'] = this.obstetricCardresTime;
    data['ObstetricIntubation'] = this.obstetricIntubation;
    data['ObstetricIntubationValues'] = this.obstetricIntubationValues;
    data['ObstetricIntubationTime'] = this.obstetricIntubationTime;
    data['ObstetricInotrope'] = this.obstetricInotrope;
    data['ObstetricInotropeValues'] = this.obstetricInotropeValues;
    data['ObstetricInotropeTime'] = this.obstetricInotropeTime;
    data['ObstetricPh'] = this.obstetricPh;
    data['ObstetricPhValues'] = this.obstetricPhValues;
    data['ObstetricPhTime'] = this.obstetricPhTime;
    data['ObstetricOliguria'] = this.obstetricOliguria;
    data['ObstetricOliguriaTime'] = this.obstetricOliguriaTime;
    data['ObstetricLactate'] = this.obstetricLactate;
    data['ObstetricLactateValues'] = this.obstetricLactateValues;
    data['ObstetricLactateTime'] = this.obstetricLactateTime;
    data['ObstetricLessHrs'] = this.obstetricLessHrs;
    data['ObstetricLessHrsValues'] = this.obstetricLessHrsValues;
    data['ObstetricLessHrsTime'] = this.obstetricLessHrsTime;
    data['ObstetricGrtHrs'] = this.obstetricGrtHrs;
    data['ObstetricGrtHrsValues'] = this.obstetricGrtHrsValues;
    data['ObstetricGrtHrsTime'] = this.obstetricGrtHrsTime;
    data['ObstetricProm'] = this.obstetricProm;
    data['ObstetricPromValues'] = this.obstetricPromValues;
    data['ObstetricPromTime'] = this.obstetricPromTime;
    data['ObstetricAbrPlac'] = this.obstetricAbrPlac;
    data['ObstetricAbrPlacValues'] = this.obstetricAbrPlacValues;
    data['ObstetricAbrPlacTime'] = this.obstetricAbrPlacTime;
    data['ObstetricRetPlac'] = this.obstetricRetPlac;
    data['ObstetricRetPlacValues'] = this.obstetricRetPlacValues;
    data['ObstetricRetPlacTime'] = this.obstetricRetPlacTime;
    data['ObstetricPph'] = this.obstetricPph;
    data['ObstetricPphValues'] = this.obstetricPphValues;
    data['ObstetricPphTime'] = this.obstetricPphTime;
    return data;
  }
}
