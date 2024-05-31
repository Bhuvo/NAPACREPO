class form1 {
  List<Form1List>? form1List;

  form1({this.form1List});

  form1.fromJson(Map<String, dynamic> json) {
    if (json['form1List'] != null) {
      form1List = <Form1List>[];
      json['form1List'].forEach((v) {
        form1List!.add(new Form1List.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.form1List != null) {
      data['form1List'] = this.form1List!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Form1List {
  String? heading;
  String? subHeading;
  List<String>? options;

  Form1List({this.heading, this.subHeading, this.options});

  Form1List.fromJson(Map<String, dynamic> json) {
    heading = json['heading'];
    subHeading = json['subHeading'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heading'] = this.heading;
    data['subHeading'] = this.subHeading;
    data['options'] = this.options;
    return data;
  }
}
