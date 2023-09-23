class UserData {
  bool? status;
  String? message;
  Customer? customer;

  UserData({this.status, this.message, this.customer});

  UserData.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}

class Customer {
  String? userID;
  String? userName;
  String? salesmanId;
  String? password;
  String? userType;
  // String? active;
  String? tokenKey;
  String? message;
  String? createdOn;

  Customer(
      {this.userID,
      this.userName,
      this.salesmanId,
      this.password,
      this.userType,
      // this.active,
      this.tokenKey,
      this.message,
      this.createdOn});

  Customer.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    userName = json['UserName'];
    salesmanId = json['SalesmanID'];
    password = json['Password'];
    userType = json['UserType'];
    // active = json['Active'];
    tokenKey = json['TokenKey'];
    message = json['Message'];
    createdOn = json['CreatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserID'] = userID;
    data['UserName'] = userName;
    data['SalesmanID'] = salesmanId;
    data['Password'] = password;
    data['UserType'] = userType;
    // data['Active'] = active;
    data['TokenKey'] = tokenKey;
    data['Message'] = message;
    data['CreatedOn'] = createdOn;
    return data;
  }
}
