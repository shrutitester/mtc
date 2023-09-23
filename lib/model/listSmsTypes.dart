class ListSmsTypes {
  bool? status;
  String? message;
  int? records;
  List<SMSTypes>? smsTypes;

  ListSmsTypes({this.status, this.message, this.records, this.smsTypes});

  ListSmsTypes.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    records = json['Records'];
    if (json['SMSTypes'] != null) {
      smsTypes = <SMSTypes>[];
      json['SMSTypes'].forEach((v) {
        smsTypes!.add(SMSTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
    data['Records'] = records;
    if (smsTypes != null) {
      data['SMSTypes'] = smsTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SMSTypes {
  String? sMSTypeID;
  String? sMSTypeName;

  SMSTypes({this.sMSTypeID, this.sMSTypeName});

  SMSTypes.fromJson(Map<String, dynamic> json) {
    sMSTypeID = json['SMSTypeID'];
    sMSTypeName = json['SMSTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SMSTypeID'] = sMSTypeID;
    data['SMSTypeName'] = sMSTypeName;
    return data;
  }
}
