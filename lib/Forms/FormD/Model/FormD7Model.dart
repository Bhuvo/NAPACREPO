class FormD7Model {
  num? cardiomyopathyId;
  num? patientId;
  num? lVIDd1revisit;
  num? lVIDdANrevisit1;
  num? lVIDdANrevisit2;
  num? lVIDdPeripartum;
  num? lVIDdFollowUp1;
  num? lVIDdFollowUp2;
  num? lVEF1revisit;
  num? lVEFANrevisit1;
  num? lVEFANrevisit2;
  num? lVEFPeripartum;
  num? lVEFFollowUp1;
  num? lVEFFollowUp2;
  num? rVTAPSE1revisit;
  num? rVTAPSEANrevisit1;
  num? rVTAPSEANrevisit2;
  num? rVTAPSEPeripartum;
  num? rVTAPSEFollowUp1;
  num? rVTAPSEFollowUp2;
  num? rVs1revisit;
  num? rVsANrevisit1;
  num? rVsANrevisit2;
  num? rVsPeripartum;
  num? rVsFollowUp1;
  num? rVsFollowUp2;
  String? lVHypertrophy;
  num? lVHypertrophyIVS;
  num? lVHypertrophyPostWall;
  String? lVHypertrophySAM;
  String? lVOTObstruction;
  num? lVOTGradientResting;
  num? lVOTGradientProvoked;
  String? otherRelevantEchoFindings;

  FormD7Model(
      {this.cardiomyopathyId,
        this.patientId,
        this.lVIDd1revisit,
        this.lVIDdANrevisit1,
        this.lVIDdANrevisit2,
        this.lVIDdPeripartum,
        this.lVIDdFollowUp1,
        this.lVIDdFollowUp2,
        this.lVEF1revisit,
        this.lVEFANrevisit1,
        this.lVEFANrevisit2,
        this.lVEFPeripartum,
        this.lVEFFollowUp1,
        this.lVEFFollowUp2,
        this.rVTAPSE1revisit,
        this.rVTAPSEANrevisit1,
        this.rVTAPSEANrevisit2,
        this.rVTAPSEPeripartum,
        this.rVTAPSEFollowUp1,
        this.rVTAPSEFollowUp2,
        this.rVs1revisit,
        this.rVsANrevisit1,
        this.rVsANrevisit2,
        this.rVsPeripartum,
        this.rVsFollowUp1,
        this.rVsFollowUp2,
        this.lVHypertrophy,
        this.lVHypertrophyIVS,
        this.lVHypertrophyPostWall,
        this.lVHypertrophySAM,
        this.lVOTObstruction,
        this.lVOTGradientResting,
        this.lVOTGradientProvoked,
        this.otherRelevantEchoFindings});

  FormD7Model.fromJson(Map<String, dynamic> json) {
    cardiomyopathyId = json['Cardiomyopathy_Id'];
    patientId = json['PatientId'];
    lVIDd1revisit = json['LVIDd_1revisit'];
    lVIDdANrevisit1 = json['LVIDd_ANrevisit1'];
    lVIDdANrevisit2 = json['LVIDd_ANrevisit2'];
    lVIDdPeripartum = json['LVIDd_Peripartum'];
    lVIDdFollowUp1 = json['LVIDd_FollowUp1'];
    lVIDdFollowUp2 = json['LVIDd_FollowUp2'];
    lVEF1revisit = json['LVEF_1revisit'];
    lVEFANrevisit1 = json['LVEF_ANrevisit1'];
    lVEFANrevisit2 = json['LVEF_ANrevisit2'];
    lVEFPeripartum = json['LVEF_Peripartum'];
    lVEFFollowUp1 = json['LVEF_FollowUp1'];
    lVEFFollowUp2 = json['LVEF_FollowUp2'];
    rVTAPSE1revisit = json['RV_TAPSE_1revisit'];
    rVTAPSEANrevisit1 = json['RV_TAPSE_ANrevisit1'];
    rVTAPSEANrevisit2 = json['RV_TAPSE_ANrevisit2'];
    rVTAPSEPeripartum = json['RV_TAPSE_Peripartum'];
    rVTAPSEFollowUp1 = json['RV_TAPSE_FollowUp1'];
    rVTAPSEFollowUp2 = json['RV_TAPSE_FollowUp2'];
    rVs1revisit = json['RVs_1revisit'];
    rVsANrevisit1 = json['RVs_ANrevisit1'];
    rVsANrevisit2 = json['RVs_ANrevisit2'];
    rVsPeripartum = json['RVs_Peripartum'];
    rVsFollowUp1 = json['RVs_FollowUp1'];
    rVsFollowUp2 = json['RVs_FollowUp2'];
    lVHypertrophy = json['LV_Hypertrophy'];
    lVHypertrophyIVS = json['LV_Hypertrophy_IVS'];
    lVHypertrophyPostWall = json['LV_Hypertrophy_PostWall'];
    lVHypertrophySAM = json['LV_Hypertrophy_SAM'];
    lVOTObstruction = json['LVOT_Obstruction'];
    lVOTGradientResting = json['LVOT_Gradient_Resting'];
    lVOTGradientProvoked = json['LVOT_Gradient_Provoked'];
    otherRelevantEchoFindings = json['Other_Relevant_Echo_Findings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Cardiomyopathy_Id'] = this.cardiomyopathyId;
    data['PatientId'] = this.patientId;
    data['LVIDd_1revisit'] = this.lVIDd1revisit;
    data['LVIDd_ANrevisit1'] = this.lVIDdANrevisit1;
    data['LVIDd_ANrevisit2'] = this.lVIDdANrevisit2;
    data['LVIDd_Peripartum'] = this.lVIDdPeripartum;
    data['LVIDd_FollowUp1'] = this.lVIDdFollowUp1;
    data['LVIDd_FollowUp2'] = this.lVIDdFollowUp2;
    data['LVEF_1revisit'] = this.lVEF1revisit;
    data['LVEF_ANrevisit1'] = this.lVEFANrevisit1;
    data['LVEF_ANrevisit2'] = this.lVEFANrevisit2;
    data['LVEF_Peripartum'] = this.lVEFPeripartum;
    data['LVEF_FollowUp1'] = this.lVEFFollowUp1;
    data['LVEF_FollowUp2'] = this.lVEFFollowUp2;
    data['RV_TAPSE_1revisit'] = this.rVTAPSE1revisit;
    data['RV_TAPSE_ANrevisit1'] = this.rVTAPSEANrevisit1;
    data['RV_TAPSE_ANrevisit2'] = this.rVTAPSEANrevisit2;
    data['RV_TAPSE_Peripartum'] = this.rVTAPSEPeripartum;
    data['RV_TAPSE_FollowUp1'] = this.rVTAPSEFollowUp1;
    data['RV_TAPSE_FollowUp2'] = this.rVTAPSEFollowUp2;
    data['RVs_1revisit'] = this.rVs1revisit;
    data['RVs_ANrevisit1'] = this.rVsANrevisit1;
    data['RVs_ANrevisit2'] = this.rVsANrevisit2;
    data['RVs_Peripartum'] = this.rVsPeripartum;
    data['RVs_FollowUp1'] = this.rVsFollowUp1;
    data['RVs_FollowUp2'] = this.rVsFollowUp2;
    data['LV_Hypertrophy'] = this.lVHypertrophy;
    data['LV_Hypertrophy_IVS'] = this.lVHypertrophyIVS;
    data['LV_Hypertrophy_PostWall'] = this.lVHypertrophyPostWall;
    data['LV_Hypertrophy_SAM'] = this.lVHypertrophySAM;
    data['LVOT_Obstruction'] = this.lVOTObstruction;
    data['LVOT_Gradient_Resting'] = this.lVOTGradientResting;
    data['LVOT_Gradient_Provoked'] = this.lVOTGradientProvoked;
    data['Other_Relevant_Echo_Findings'] = this.otherRelevantEchoFindings;
    return data;
  }
}
