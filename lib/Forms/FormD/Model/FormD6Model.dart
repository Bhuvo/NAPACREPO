class FormD6Model {
  num? aortopathyId;
  num? patientId;
  bool? dilated;
  bool? aneurysm;
  bool? coarctation;
  bool? stenosis;
  bool? dissection;
  bool? aortaOthers;
  String? aortaOthersSpecify;
  String? locationOfAbnormality;
  String? detailsOfAbnormality;
  num? annulus1Visit;
  num? annulusANrevisit1;
  num? annulusANrevisit2;
  num? annulusPeripartum;
  num? annulusFollowup1;
  num? annulusFollowup2;
  num? aorticSinus1Visit;
  num? aorticSinusANrevisit1;
  num? aorticSinusANrevisit2;
  num? aorticSinusPeripartum;
  num? aorticSinusFollowup1;
  num? aorticSinusFollowup2;
  num? sTJunction1Visit;
  num? sTJunctionANrevisit1;
  num? sTJunctionANrevisit2;
  num? sTJunctionPeripartum;
  num? sTJunctionFollowup1;
  num? sTJunctionFollowup2;
  num? ascAorta1Visit;
  num? ascAortaANrevisit1;
  num? ascAortaANrevisit2;
  num? ascAortaPeripartum;
  num? ascAortaFollowup1;
  num? ascAortaFollowup2;
  num? archAorta1Visit;
  num? archAortaANrevisit1;
  num? archAortaANrevisit2;
  num? archAortaPeripartum;
  num? archAortaFollowup1;
  num? archAortaFollowup2;
  num? thoracicAorta1Visit;
  num? thoracicAortaANrevisit1;
  num? thoracicAortaANrevisit2;
  num? thoracicAortaPeripartum;
  num? thoracicAortaFollowup1;
  num? thoracicAortaFollowup2;
  String? othersRelevantEchoFindings;
  String? insertDate;

  FormD6Model(
      {this.aortopathyId,
        this.patientId,
        this.dilated,
        this.aneurysm,
        this.coarctation,
        this.stenosis,
        this.dissection,
        this.aortaOthers,
        this.aortaOthersSpecify,
        this.locationOfAbnormality,
        this.detailsOfAbnormality,
        this.annulus1Visit,
        this.annulusANrevisit1,
        this.annulusANrevisit2,
        this.annulusPeripartum,
        this.annulusFollowup1,
        this.annulusFollowup2,
        this.aorticSinus1Visit,
        this.aorticSinusANrevisit1,
        this.aorticSinusANrevisit2,
        this.aorticSinusPeripartum,
        this.aorticSinusFollowup1,
        this.aorticSinusFollowup2,
        this.sTJunction1Visit,
        this.sTJunctionANrevisit1,
        this.sTJunctionANrevisit2,
        this.sTJunctionPeripartum,
        this.sTJunctionFollowup1,
        this.sTJunctionFollowup2,
        this.ascAorta1Visit,
        this.ascAortaANrevisit1,
        this.ascAortaANrevisit2,
        this.ascAortaPeripartum,
        this.ascAortaFollowup1,
        this.ascAortaFollowup2,
        this.archAorta1Visit,
        this.archAortaANrevisit1,
        this.archAortaANrevisit2,
        this.archAortaPeripartum,
        this.archAortaFollowup1,
        this.archAortaFollowup2,
        this.thoracicAorta1Visit,
        this.thoracicAortaANrevisit1,
        this.thoracicAortaANrevisit2,
        this.thoracicAortaPeripartum,
        this.thoracicAortaFollowup1,
        this.thoracicAortaFollowup2,
        this.othersRelevantEchoFindings,
        this.insertDate});

  FormD6Model.fromJson(Map<String, dynamic> json) {
    aortopathyId = json['Aortopathy_Id'];
    patientId = json['PatientId'];
    dilated = json['Dilated'];
    aneurysm = json['Aneurysm'];
    coarctation = json['Coarctation'];
    stenosis = json['Stenosis'];
    dissection = json['Dissection'];
    aortaOthers = json['Aorta_Others'];
    aortaOthersSpecify = json['Aorta_Others_Specify'];
    locationOfAbnormality = json['Location_of_Abnormality'];
    detailsOfAbnormality = json['Details_of_Abnormality'];
    annulus1Visit = json['Annulus_1Visit'];
    annulusANrevisit1 = json['Annulus_ANrevisit1'];
    annulusANrevisit2 = json['Annulus_ANrevisit2'];
    annulusPeripartum = json['Annulus_Peripartum'];
    annulusFollowup1 = json['Annulus_Followup1'];
    annulusFollowup2 = json['Annulus_Followup2'];
    aorticSinus1Visit = json['AorticSinus_1Visit'];
    aorticSinusANrevisit1 = json['AorticSinus_ANrevisit1'];
    aorticSinusANrevisit2 = json['AorticSinus_ANrevisit2'];
    aorticSinusPeripartum = json['AorticSinus_Peripartum'];
    aorticSinusFollowup1 = json['AorticSinus_Followup1'];
    aorticSinusFollowup2 = json['AorticSinus_Followup2'];
    sTJunction1Visit = json['ST_Junction_1Visit'];
    sTJunctionANrevisit1 = json['ST_Junction_ANrevisit1'];
    sTJunctionANrevisit2 = json['ST_Junction_ANrevisit2'];
    sTJunctionPeripartum = json['ST_Junction_Peripartum'];
    sTJunctionFollowup1 = json['ST_Junction_Followup1'];
    sTJunctionFollowup2 = json['ST_Junction_Followup2'];
    ascAorta1Visit = json['AscAorta_1Visit'];
    ascAortaANrevisit1 = json['AscAorta_ANrevisit1'];
    ascAortaANrevisit2 = json['AscAorta_ANrevisit2'];
    ascAortaPeripartum = json['AscAorta_Peripartum'];
    ascAortaFollowup1 = json['AscAorta_Followup1'];
    ascAortaFollowup2 = json['AscAorta_Followup2'];
    archAorta1Visit = json['ArchAorta_1Visit'];
    archAortaANrevisit1 = json['ArchAorta_ANrevisit1'];
    archAortaANrevisit2 = json['ArchAorta_ANrevisit2'];
    archAortaPeripartum = json['ArchAorta_Peripartum'];
    archAortaFollowup1 = json['ArchAorta_Followup1'];
    archAortaFollowup2 = json['ArchAorta_Followup2'];
    thoracicAorta1Visit = json['ThoracicAorta_1Visit'];
    thoracicAortaANrevisit1 = json['ThoracicAorta_ANrevisit1'];
    thoracicAortaANrevisit2 = json['ThoracicAorta_ANrevisit2'];
    thoracicAortaPeripartum = json['ThoracicAorta_Peripartum'];
    thoracicAortaFollowup1 = json['ThoracicAorta_Followup1'];
    thoracicAortaFollowup2 = json['ThoracicAorta_Followup2'];
    othersRelevantEchoFindings = json['Others_Relevant_Echo_Findings'];
    insertDate = json['Insert_Date'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['Aortopathy_Id'] = this.aortopathyId;
  //   data['PatientId'] = this.patientId;
  //   data['Dilated'] = this.dilated;
  //   data['Aneurysm'] = this.aneurysm;
  //   data['Coarctation'] = this.coarctation;
  //   data['Stenosis'] = this.stenosis;
  //   data['Dissection'] = this.dissection;
  //   data['Aorta_Others'] = this.aortaOthers;
  //   data['Aorta_Others_Specify'] = this.aortaOthersSpecify;
  //   data['Location_of_Abnormality'] = this.locationOfAbnormality;
  //   data['Details_of_Abnormality'] = this.detailsOfAbnormality;
  //   data['Annulus_1Visit'] = this.annulus1Visit;
  //   data['Annulus_ANrevisit1'] = this.annulusANrevisit1;
  //   data['Annulus_ANrevisit2'] = this.annulusANrevisit2;
  //   data['Annulus_Peripartum'] = this.annulusPeripartum;
  //   data['Annulus_Followup1'] = this.annulusFollowup1;
  //   data['Annulus_Followup2'] = this.annulusFollowup2;
  //   data['AorticSinus_1Visit'] = this.aorticSinus1Visit;
  //   data['AorticSinus_ANrevisit1'] = this.aorticSinusANrevisit1;
  //   data['AorticSinus_ANrevisit2'] = this.aorticSinusANrevisit2;
  //   data['AorticSinus_Peripartum'] = this.aorticSinusPeripartum;
  //   data['AorticSinus_Followup1'] = this.aorticSinusFollowup1;
  //   data['AorticSinus_Followup2'] = this.aorticSinusFollowup2;
  //   data['ST_Junction_1Visit'] = this.sTJunction1Visit;
  //   data['ST_Junction_ANrevisit1'] = this.sTJunctionANrevisit1;
  //   data['ST_Junction_ANrevisit2'] = this.sTJunctionANrevisit2;
  //   data['ST_Junction_Peripartum'] = this.sTJunctionPeripartum;
  //   data['ST_Junction_Followup1'] = this.sTJunctionFollowup1;
  //   data['ST_Junction_Followup2'] = this.sTJunctionFollowup2;
  //   data['AscAorta_1Visit'] = this.ascAorta1Visit;
  //   data['AscAorta_ANrevisit1'] = this.ascAortaANrevisit1;
  //   data['AscAorta_ANrevisit2'] = this.ascAortaANrevisit2;
  //   data['AscAorta_Peripartum'] = this.ascAortaPeripartum;
  //   data['AscAorta_Followup1'] = this.ascAortaFollowup1;
  //   data['AscAorta_Followup2'] = this.ascAortaFollowup2;
  //   data['ArchAorta_1Visit'] = this.archAorta1Visit;
  //   data['ArchAorta_ANrevisit1'] = this.archAortaANrevisit1;
  //   data['ArchAorta_ANrevisit2'] = this.archAortaANrevisit2;
  //   data['ArchAorta_Peripartum'] = this.archAortaPeripartum;
  //   data['ArchAorta_Followup1'] = this.archAortaFollowup1;
  //   data['ArchAorta_Followup2'] = this.archAortaFollowup2;
  //   data['ThoracicAorta_1Visit'] = this.thoracicAorta1Visit;
  //   data['ThoracicAorta_ANrevisit1'] = this.thoracicAortaANrevisit1;
  //   data['ThoracicAorta_ANrevisit2'] = this.thoracicAortaANrevisit2;
  //   data['ThoracicAorta_Peripartum'] = this.thoracicAortaPeripartum;
  //   data['ThoracicAorta_Followup1'] = this.thoracicAortaFollowup1;
  //   data['ThoracicAorta_Followup2'] = this.thoracicAortaFollowup2;
  //   data['Others_Relevant_Echo_Findings'] = this.othersRelevantEchoFindings;
  //   data['Insert_Date'] = this.insertDate;
  //   return data;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Aortopathy_Id'] = '${this.aortopathyId}';
    data['PatientId'] = '${this.patientId}';
    data['Dilated'] = '${this.dilated}';
    data['Aneurysm'] = '${this.aneurysm}';
    data['Coarctation'] = '${this.coarctation}';
    data['Stenosis'] = '${this.stenosis}';
    data['Dissection'] = '${this.dissection}';
    data['Aorta_Others'] = '${this.aortaOthers}';
    data['Aorta_Others_Specify'] = '${this.aortaOthersSpecify}';
    data['Location_of_Abnormality'] = '${this.locationOfAbnormality}';
    data['Details_of_Abnormality'] = '${this.detailsOfAbnormality}';
    data['Annulus_1Visit'] = '${this.annulus1Visit}';
    data['Annulus_ANrevisit1'] = '${this.annulusANrevisit1}';
    data['Annulus_ANrevisit2'] = '${this.annulusANrevisit2}';
    data['Annulus_Peripartum'] = '${this.annulusPeripartum}';
    data['Annulus_Followup1'] = '${this.annulusFollowup1}';
    data['Annulus_Followup2'] = '${this.annulusFollowup2}';
    data['AorticSinus_1Visit'] = '${this.aorticSinus1Visit}';
    data['AorticSinus_ANrevisit1'] = '${this.aorticSinusANrevisit1}';
    data['AorticSinus_ANrevisit2'] = '${this.aorticSinusANrevisit2}';
    data['AorticSinus_Peripartum'] = '${this.aorticSinusPeripartum}';
    data['AorticSinus_Followup1'] = '${this.aorticSinusFollowup1}';
    data['AorticSinus_Followup2'] = '${this.aorticSinusFollowup2}';
    data['ST_Junction_1Visit'] = '${this.sTJunction1Visit}';
    data['ST_Junction_ANrevisit1'] = '${this.sTJunctionANrevisit1}';
    data['ST_Junction_ANrevisit2'] = '${this.sTJunctionANrevisit2}';
    data['ST_Junction_Peripartum'] = '${this.sTJunctionPeripartum}';
    data['ST_Junction_Followup1'] = '${this.sTJunctionFollowup1}';
    data['ST_Junction_Followup2'] = '${this.sTJunctionFollowup2}';
    data['AscAorta_1Visit'] = '${this.ascAorta1Visit}';
    data['AscAorta_ANrevisit1'] = '${this.ascAortaANrevisit1}';
    data['AscAorta_ANrevisit2'] = '${this.ascAortaANrevisit2}';
    data['AscAorta_Peripartum'] = '${this.ascAortaPeripartum}';
    data['AscAorta_Followup1'] = '${this.ascAortaFollowup1}';
    data['AscAorta_Followup2'] = '${this.ascAortaFollowup2}';
    data['ArchAorta_1Visit'] = '${this.archAorta1Visit}';
    data['ArchAorta_ANrevisit1'] = '${this.archAortaANrevisit1}';
    data['ArchAorta_ANrevisit2'] = '${this.archAortaANrevisit2}';
    data['ArchAorta_Peripartum'] = '${this.archAortaPeripartum}';
    data['ArchAorta_Followup1'] = '${this.archAortaFollowup1}';
    data['ArchAorta_Followup2'] = '${this.archAortaFollowup2}';
    data['ThoracicAorta_1Visit'] = '${this.thoracicAorta1Visit}';
    data['ThoracicAorta_ANrevisit1'] = '${this.thoracicAortaANrevisit1}';
    data['ThoracicAorta_ANrevisit2'] = '${this.thoracicAortaANrevisit2}';
    data['ThoracicAorta_Peripartum'] = '${this.thoracicAortaPeripartum}';
    data['ThoracicAorta_Followup1'] = '${this.thoracicAortaFollowup1}';
    data['ThoracicAorta_Followup2'] = '${this.thoracicAortaFollowup2}';
    data['Others_Relevant_Echo_Findings'] = '${this.othersRelevantEchoFindings}';
    data['Insert_Date'] = '${this.insertDate}';
    return data;
  }

}
