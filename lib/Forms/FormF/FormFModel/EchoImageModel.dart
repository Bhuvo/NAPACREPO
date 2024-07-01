class EchoImageModel {
  String? id;
  String? name;
  String? filePath;
  String? visitNo;

  EchoImageModel({this.id, this.name, this.filePath, this.visitNo});

  EchoImageModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    filePath = json['FilePath'];
    visitNo = json['VisitNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['FilePath'] = this.filePath;
    data['VisitNo'] = this.visitNo;
    return data;
  }

  //override to String
  @override
  String toString() {
    return filePath ?? '';
  }
}
