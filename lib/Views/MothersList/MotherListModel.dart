
import 'package:hive/hive.dart';

part 'MotherListModel.g.dart';

@HiveType(typeId: 1)
class MotherListModel {
  @HiveField(0)
  String? patientid;

  @HiveField(1)
  String? patientfullname;

  @HiveField(2)
  String? pinNumber;

  @HiveField(3)
  String? age;

  @HiveField(4)
  String? dob;

  @HiveField(5)
  String? address;

  @HiveField(6)
  String? flatname;

  @HiveField(7)
  String? streetLocality;

  @HiveField(8)
  String? postoffice;

  @HiveField(9)
  String? districtname;

  @HiveField(10)
  String? statename;

  @HiveField(11)
  String? villagename;

  @HiveField(12)
  String? pincode;

  @HiveField(13)
  String? aardharno;

  @HiveField(14)
  String? moblienumber;

  @HiveField(15)
  String? alternatemobilenumber;

  @HiveField(16)
  String? relativemobilenumber;

  @HiveField(17)
  String? noofyeareducation;

  @HiveField(18)
  String? qualification;

  @HiveField(19)
  String? occupation;

  @HiveField(20)
  String? martialstatus;

  @HiveField(21)
  String? economicstatusValue;

  @HiveField(22)
  String? inserteddate;

  @HiveField(23)
  String? tNPHDRNOID;

  @HiveField(24)
  String? tNPHDRNo;

  @HiveField(25)
  String? rCHId;

  @HiveField(26)
  int? regis;

  @HiveField(27)
  int? first;

  @HiveField(28)
  int? second;

  @HiveField(29)
  int? foll;

  @HiveField(30)
  int? foll2;

  @HiveField(31)
  int? foll3;

  @HiveField(32)
  int? revisit2;

  @HiveField(33)
  int? revisit3;

  @HiveField(34)
  bool? isChanged;


  MotherListModel(
      {this.patientid,
        this.patientfullname,
        this.pinNumber,
        this.age,
        this.dob,
        this.address,
        this.flatname,
        this.streetLocality,
        this.postoffice,
        this.districtname,
        this.statename,
        this.villagename,
        this.pincode,
        this.aardharno,
        this.moblienumber,
        this.alternatemobilenumber,
        this.relativemobilenumber,
        this.noofyeareducation,
        this.qualification,
        this.occupation,
        this.martialstatus,
        this.economicstatusValue,
        this.inserteddate,
        this.tNPHDRNOID,
        this.tNPHDRNo,
        this.rCHId,
        this.regis,
        this.first,
        this.second,
        this.foll,
        this.foll2,
        this.foll3,
        this.revisit2,
        this.revisit3});

  @override
  String toString() {
    return '$patientid$patientfullname$tNPHDRNOID$tNPHDRNo';
  }

  MotherListModel.fromJson(Map<String, dynamic> json) {
    patientid = json['patientid'];
    patientfullname = json['patientfullname'];
    pinNumber = json['pin_number'];
    age = json['age'];
    dob = json['dob'];
    address = json['address'];
    flatname = json['flatname'];
    streetLocality = json['street_locality'];
    postoffice = json['postoffice'];
    districtname = json['districtname'];
    statename = json['statename'];
    villagename = json['villagename'];
    pincode = json['pincode'];
    aardharno = json['aardharno'];
    moblienumber = json['moblienumber'];
    alternatemobilenumber = json['alternatemobilenumber'];
    relativemobilenumber = json['relativemobilenumber'];
    noofyeareducation = json['noofyeareducation'];
    qualification = json['Qualification'];
    occupation = json['occupation'];
    martialstatus = json['martialstatus'];
    economicstatusValue = json['economicstatus_value'];
    inserteddate = json['inserteddate'];
    tNPHDRNOID = json['TNPHDR_NO_ID'];
    tNPHDRNo = json['TNPHDR_No'];
    rCHId = json['RCH_Id'];
    regis = json['Regis'];
    first = json['First'];
    second = json['Second'];
    foll = json['foll'];
    foll2 = json['foll2'];
    foll3 = json['foll3'];
    revisit2 = json['Revisit_2'];
    revisit3 = json['Revisit_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patientid'] = this.patientid;
    data['patientfullname'] = this.patientfullname;
    data['pin_number'] = this.pinNumber;
    data['age'] = this.age;
    data['dob'] = this.dob;
    data['address'] = this.address;
    data['flatname'] = this.flatname;
    data['street_locality'] = this.streetLocality;
    data['postoffice'] = this.postoffice;
    data['districtname'] = this.districtname;
    data['statename'] = this.statename;
    data['villagename'] = this.villagename;
    data['pincode'] = this.pincode;
    data['aardharno'] = this.aardharno;
    data['moblienumber'] = this.moblienumber;
    data['alternatemobilenumber'] = this.alternatemobilenumber;
    data['relativemobilenumber'] = this.relativemobilenumber;
    data['noofyeareducation'] = this.noofyeareducation;
    data['Qualification'] = this.qualification;
    data['occupation'] = this.occupation;
    data['martialstatus'] = this.martialstatus;
    data['economicstatus_value'] = this.economicstatusValue;
    data['inserteddate'] = this.inserteddate;
    data['TNPHDR_NO_ID'] = this.tNPHDRNOID;
    data['TNPHDR_No'] = this.tNPHDRNo;
    data['RCH_Id'] = this.rCHId;
    data['Regis'] = this.regis;
    data['First'] = this.first;
    data['Second'] = this.second;
    data['foll'] = this.foll;
    data['foll2'] = this.foll2;
    data['foll3'] = this.foll3;
    data['Revisit_2'] = this.revisit2;
    data['Revisit_3'] = this.revisit3;
    return data;
  }
}
