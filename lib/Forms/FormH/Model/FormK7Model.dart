
class FormK7Model {
  int? finalOutcomeId;
  int? doctorId;
  int? patientId;
  int? formId;
  String? finalOutcomeValue;
  String? dateOfDischarge;
  String? durationOfStay;
  String? functionalClass;
  String? contraceptionUsed;
  String? contraceptionUsedOthersValue;
  String? breastFeeding;
  String? breastFeedingDay;
  String? nextFollowupDate;
  String? dateOfDeath;
  String? otherInformation;

  FormK7Model(
      {this.finalOutcomeId,
        this.doctorId,
        this.patientId,
        this.formId,
        this.finalOutcomeValue,
        this.dateOfDischarge,
        this.durationOfStay,
        this.functionalClass,
        this.contraceptionUsed,
        this.contraceptionUsedOthersValue,
        this.breastFeeding,
        this.breastFeedingDay,
        this.nextFollowupDate,
        this.dateOfDeath,
        this.otherInformation});

  FormK7Model.fromJson(Map<String, dynamic> json) {
    finalOutcomeId = json['FinalOutcomeId'];
    doctorId = json['DoctorId'];
    patientId = json['PatientId'];
    formId = json['FormId'];
    finalOutcomeValue = json['FinalOutcomeValue'];
    dateOfDischarge = json['DateOfDischarge'];
    durationOfStay = json['DurationOfStay'];
    functionalClass = json['FunctionalClass'];
    contraceptionUsed = json['ContraceptionUsed'];
    contraceptionUsedOthersValue = json['ContraceptionUsedOthersValue'];
    breastFeeding = json['BreastFeeding'];
    breastFeedingDay = json['BreastFeedingDay'];
    nextFollowupDate = json['NextFollowupDate'];
    dateOfDeath = json['DateOfDeath'];
    otherInformation = json['OtherInformation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FinalOutcomeId'] = this.finalOutcomeId;
    data['DoctorId'] = this.doctorId;
    data['PatientId'] = this.patientId;
    data['FormId'] = this.formId;
    data['FinalOutcomeValue'] = this.finalOutcomeValue;
    data['DateOfDischarge'] = this.dateOfDischarge;
    data['DurationOfStay'] = this.durationOfStay;
    data['FunctionalClass'] = this.functionalClass;
    data['ContraceptionUsed'] = this.contraceptionUsed;
    data['ContraceptionUsedOthersValue'] = this.contraceptionUsedOthersValue;
    data['BreastFeeding'] = this.breastFeeding;
    data['BreastFeedingDay'] = this.breastFeedingDay;
    data['NextFollowupDate'] = this.nextFollowupDate;
    data['DateOfDeath'] = this.dateOfDeath;
    data['OtherInformation'] = this.otherInformation;
    return data;
  }
}
