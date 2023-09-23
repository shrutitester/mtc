class PartyData {
  bool? status;
  String? message;
  int? records;
  List<Parties>? parties;

  PartyData({this.status, this.message, this.records, this.parties});

  PartyData.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    records = json['Records'];
    if (json['Parties'] != null) {
      parties = <Parties>[];
      json['Parties'].forEach((v) {
        parties!.add(Parties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
    data['Records'] = records;
    if (parties != null) {
      data['Parties'] = parties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parties{
  String? accountId;
  String? accountName;
  String? groupId;
  String? groupName;
  String? address;
  String? stateName;
  String? stateId;
  String? cityName;
  String? cityId;
  String? gstin;
  String? pinCode;
  String? email;
  String? phone;
  String? mobile;

  Parties({
    this.accountId,
    this.accountName,
    this.groupId,
    this.groupName,
    this.address,
    this.stateName,
    this.stateId,
    this.cityName,
    this.cityId,
    this.gstin,
    this.pinCode,
    this.email,
    this.phone,
    this.mobile
});

  Parties.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountID'];
    accountName = json['AccountName'];
    groupId = json['GroupID'];
    groupName = json['GroupName'];
    address = json['Address'];
    stateName = json['StateName'];
    stateId = json['StateID'];
    cityName = json['CityName'];
    cityId = json['CityID'];
    gstin = json['GSTIN'];
    pinCode = json['PINCode'];
    email = json['Email'];
    phone = json['Phone'];
    mobile = json['Mobile'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AccountID'] = accountId;
    data['AccountName'] = accountName;
    data['GroupID'] = groupId;
    data['GroupName'] = groupName;
    data['Address'] = address;
    data['StateName'] = stateName;
    data['StateID'] = stateId;
    data['CityName'] = cityName;
    data['CityID'] = cityId;
    data['GSTIN'] = gstin;
    data['PINCode'] = pinCode;
    data['Email'] = email;
    data['Phone'] = phone;
    data['Mobile'] = mobile;
    return data;
  }
}