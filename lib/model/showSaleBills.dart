class ShowSaleBills {
  int? records;
  bool? status;
  String? message;
  List<Bills>? bills;

  ShowSaleBills({this.records, this.status, this.message, this.bills});

  ShowSaleBills.fromJson(Map<String, dynamic> json) {
    records = json['Records'];
    status = json['Status'];
    message = json['Message'];
    if (json['Bills'] != null) {
      bills = <Bills>[];
      json['Bills'].forEach((v) {
        bills!.add(Bills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Records'] = records;
    data['Status'] = status;
    data['Message'] = message;
    if (bills != null) {
      data['Bills'] = bills!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bills {
  String? iD;
  String? vchNo;
  String? vchDate;
  String? billNo;
  String? agencyVisitID;
  String? agencyVisitName;
  String? accountID;
  String? accountName;
  String? partyID;
  String? partyName;
  String? mobile;
  String? cashPartyName;
  String? salesmanID;
  String? salesmanName;
  String? ownFirmID;
  String? customerFirmID;
  String? type;
  String? rateType;
  String? ownFirmName;
  String? customerFirmName;
  String? shippingFirmID;
  String? shippingFirmName;
  String? qty;
  String? amount;
  String? fromDate;
  String? toDate;

  Bills(
      {this.iD,
        this.vchNo,
        this.vchDate,
        this.billNo,
        this.agencyVisitID,
        this.agencyVisitName,
        this.accountID,
        this.accountName,
        this.partyID,
        this.partyName,
        this.mobile,
        this.cashPartyName,
        this.salesmanID,
        this.salesmanName,
        this.ownFirmID,
        this.customerFirmID,
        this.type,
        this.rateType,
        this.ownFirmName,
        this.customerFirmName,
        this.shippingFirmID,
        this.shippingFirmName,
        this.qty,
        this.amount,
        this.fromDate,
        this.toDate});

  Bills.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    vchNo = json['VchNo'];
    vchDate = json['VchDate'];
    billNo = json['BillNo'];
    agencyVisitID = json['AgencyVisitID'];
    agencyVisitName = json['AgencyVisitName'];
    accountID = json['AccountID'];
    accountName = json['AccountName'];
    partyID = json['PartyID'];
    partyName = json['PartyName'];
    mobile = json['Mobile'];
    cashPartyName = json['CashPartyName'];
    salesmanID = json['SalesmanID'];
    salesmanName = json['SalesmanName'];
    ownFirmID = json['OwnFirmID'];
    customerFirmID = json['CustomerFirmID'];
    type = json['Type'];
    rateType = json['RateType'];
    ownFirmName = json['OwnFirmName'];
    customerFirmName = json['CustomerFirmName'];
    shippingFirmID = json['ShippingFirmID'];
    shippingFirmName = json['ShippingFirmName'];
    qty = json['Qty'];
    amount = json['Amount'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['VchNo'] = vchNo;
    data['VchDate'] = vchDate;
    data['BillNo'] = billNo;
    data['AgencyVisitID'] = agencyVisitID;
    data['AgencyVisitName'] = agencyVisitName;
    data['AccountID'] = accountID;
    data['AccountName'] = accountName;
    data['PartyID'] = partyID;
    data['PartyName'] = partyName;
    data['Mobile'] = mobile;
    data['CashPartyName'] = cashPartyName;
    data['SalesmanID'] = salesmanID;
    data['SalesmanName'] = salesmanName;
    data['OwnFirmID'] = ownFirmID;
    data['CustomerFirmID'] = customerFirmID;
    data['Type'] = type;
    data['RateType'] = rateType;
    data['OwnFirmName'] = ownFirmName;
    data['CustomerFirmName'] = customerFirmName;
    data['ShippingFirmID'] = shippingFirmID;
    data['ShippingFirmName'] = shippingFirmName;
    data['Qty'] = qty;
    data['Amount'] = amount;
    data['FromDate'] = fromDate;
    data['ToDate'] = toDate;
    return data;
  }
}