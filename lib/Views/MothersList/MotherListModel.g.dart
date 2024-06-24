// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MotherListModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MotherListModelAdapter extends TypeAdapter<MotherListModel> {
  @override
  final int typeId = 1;

  @override
  MotherListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MotherListModel(
      patientid: fields[0] as String?,
      patientfullname: fields[1] as String?,
      pinNumber: fields[2] as String?,
      age: fields[3] as String?,
      dob: fields[4] as String?,
      address: fields[5] as String?,
      flatname: fields[6] as String?,
      streetLocality: fields[7] as String?,
      postoffice: fields[8] as String?,
      districtname: fields[9] as String?,
      statename: fields[10] as String?,
      villagename: fields[11] as String?,
      pincode: fields[12] as String?,
      aardharno: fields[13] as String?,
      moblienumber: fields[14] as String?,
      alternatemobilenumber: fields[15] as String?,
      relativemobilenumber: fields[16] as String?,
      noofyeareducation: fields[17] as String?,
      qualification: fields[18] as String?,
      occupation: fields[19] as String?,
      martialstatus: fields[20] as String?,
      economicstatusValue: fields[21] as String?,
      inserteddate: fields[22] as String?,
      tNPHDRNOID: fields[23] as String?,
      tNPHDRNo: fields[24] as String?,
      rCHId: fields[25] as String?,
      regis: fields[26] as int?,
      first: fields[27] as int?,
      second: fields[28] as int?,
      foll: fields[29] as int?,
      foll2: fields[30] as int?,
      foll3: fields[31] as int?,
      revisit2: fields[32] as int?,
      revisit3: fields[33] as int?,
    )..isChanged = fields[34] as bool?;
  }

  @override
  void write(BinaryWriter writer, MotherListModel obj) {
    writer
      ..writeByte(35)
      ..writeByte(0)
      ..write(obj.patientid)
      ..writeByte(1)
      ..write(obj.patientfullname)
      ..writeByte(2)
      ..write(obj.pinNumber)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.dob)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.flatname)
      ..writeByte(7)
      ..write(obj.streetLocality)
      ..writeByte(8)
      ..write(obj.postoffice)
      ..writeByte(9)
      ..write(obj.districtname)
      ..writeByte(10)
      ..write(obj.statename)
      ..writeByte(11)
      ..write(obj.villagename)
      ..writeByte(12)
      ..write(obj.pincode)
      ..writeByte(13)
      ..write(obj.aardharno)
      ..writeByte(14)
      ..write(obj.moblienumber)
      ..writeByte(15)
      ..write(obj.alternatemobilenumber)
      ..writeByte(16)
      ..write(obj.relativemobilenumber)
      ..writeByte(17)
      ..write(obj.noofyeareducation)
      ..writeByte(18)
      ..write(obj.qualification)
      ..writeByte(19)
      ..write(obj.occupation)
      ..writeByte(20)
      ..write(obj.martialstatus)
      ..writeByte(21)
      ..write(obj.economicstatusValue)
      ..writeByte(22)
      ..write(obj.inserteddate)
      ..writeByte(23)
      ..write(obj.tNPHDRNOID)
      ..writeByte(24)
      ..write(obj.tNPHDRNo)
      ..writeByte(25)
      ..write(obj.rCHId)
      ..writeByte(26)
      ..write(obj.regis)
      ..writeByte(27)
      ..write(obj.first)
      ..writeByte(28)
      ..write(obj.second)
      ..writeByte(29)
      ..write(obj.foll)
      ..writeByte(30)
      ..write(obj.foll2)
      ..writeByte(31)
      ..write(obj.foll3)
      ..writeByte(32)
      ..write(obj.revisit2)
      ..writeByte(33)
      ..write(obj.revisit3)
      ..writeByte(34)
      ..write(obj.isChanged);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MotherListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
