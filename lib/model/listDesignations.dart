class ListDesignations {
  bool? status;
  String? message;
  int? records;
  List<Designations>? designations;

  ListDesignations(
      {this.status, this.message, this.records, this.designations});

  ListDesignations.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    records = json['Records'];
    if (json['Designations'] != null) {
      designations = <Designations>[];
      json['Designations'].forEach((v) {
        designations!.add(Designations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
    data['Records'] = records;
    if (designations != null) {
      data['Designations'] = designations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Designations {
  String? designationID;
  String? designationName;

  Designations({this.designationID, this.designationName});

  Designations.fromJson(Map<String, dynamic> json) {
    designationID = json['DesignationID'];
    designationName = json['DesignationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DesignationID'] = designationID;
    data['DesignationName'] = designationName;
    return data;
  }
}
