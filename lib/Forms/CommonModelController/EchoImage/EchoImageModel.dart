class EchoImageModel {
  String? id;
  String? name;
  String? filePath;

  EchoImageModel({this.id, this.name, this.filePath});

  EchoImageModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    filePath = json['FilePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['FilePath'] = this.filePath;
    return data;
  }
}
