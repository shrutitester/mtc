class ListCities {
  int? records;
  bool? status;
  String? message;
  List<Citys>? citys;

  ListCities({this.records, this.status, this.message, this.citys});

  ListCities.fromJson(Map<String, dynamic> json) {
    records = json['Records'];
    status = json['Status'];
    message = json['Message'];
    if (json['Citys'] != null) {
      citys = <Citys>[];
      json['Citys'].forEach((v) {
        citys!.add(Citys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Records'] = records;
    data['Status'] = status;
    data['Message'] = message;
    if (citys != null) {
      data['Citys'] = citys!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Citys {
  String? cityID;
  String? cityName;

  Citys({this.cityID, this.cityName});

  Citys.fromJson(Map<String, dynamic> json) {
    cityID = json['CityID'];
    cityName = json['CityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CityID'] = cityID;
    data['CityName'] = cityName;
    return data;
  }
}