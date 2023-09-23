class ListAgencyVisits{
  bool? status;
  String? message;
  int? records;
  List<AgencyVisits>? agencyVisits;

  ListAgencyVisits({this.status, this.message, this.records, this.agencyVisits});

  ListAgencyVisits.fromJson(Map<String, dynamic> json){
    status = json['Status'];
    message = json['Message'];
    records = json['Records'];
    if(json['AgencyVisits'] != null){
      agencyVisits = <AgencyVisits>[];
      json['AgencyVisits'].forEach((v){
        agencyVisits!.add(AgencyVisits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
    data['Records'] = records;
    if (agencyVisits != null){
      data['AgencyVisits'] = agencyVisits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AgencyVisits{
  String? agencyVisitID;
  String? agencyVisitName;
  String? agencyVisitUNQ;
  String? vchDate;
  String? accountID;
  String? accountName;
  String? partyID;
  String? partyName;
  String? salesmanID;
  String? salesmanName;
  String? ownFirmID;
  String? ownFirmName;
  String? customerFirmID;
  String? customerFirmName;
  String? shippingFirmID;
  String? shippingFirmName;
  String? agencyBillingTypeIDList;
  String? agencyBillingTypeNameList;
  String? dueDays;
  String? dueDate;
  String? creditLimit;
  String? amount;
  String? billingPercentage;
  String? fromDate;
  String? toDate;

  AgencyVisits({this.agencyVisitID, this.agencyVisitName, this.agencyVisitUNQ,
    this.vchDate, this.accountID, this.accountName, this.partyID, this.partyName,
    this.salesmanID, this.salesmanName, this.ownFirmID, this.ownFirmName,
    this.customerFirmID, this.customerFirmName, this.shippingFirmID,
    this.shippingFirmName, this.agencyBillingTypeIDList, this.agencyBillingTypeNameList,
    this.dueDays, this.creditLimit, this.amount, this.billingPercentage,
    this.fromDate, this.toDate, this.dueDate
  });

  AgencyVisits.fromJson(Map<String, dynamic> json){
    agencyVisitID = json['AgencyVisitID'];
    agencyVisitName = json['AgencyVisitName'];
    agencyVisitUNQ = json['AgencyVisitUNQ'];
    vchDate = json['VchDate'];
    accountID = json['AccountID'];
    accountName = json['AccountName'];
    partyID = json['PartyID'];
    partyName = json['PartyName'];
    salesmanID = json['SalesmanID'];
    salesmanName = json['SalesmanName'];
    ownFirmID = json['OwnFirmID'];
    ownFirmName = json['OwnFirmName'];
    customerFirmID = json['CustomerFirmID'];
    customerFirmName = json['CustomerFirmName'];
    shippingFirmID = json['ShippingFirmID'];
    shippingFirmName = json['ShippingFirmName'];
    agencyBillingTypeIDList = json['AgencyBillingTypeIDList'];
    agencyBillingTypeNameList = json['AgencyBillingTypeNameList'];
    dueDays = json['DueDays'];
    dueDate = json['DueDate'];
    creditLimit = json['CreditLimit'];
    amount = json['Amount'];
    billingPercentage = json['BillingPercentage'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};

    data['AgencyVisitID'] = agencyVisitID  ;
    data['AgencyVisitName'] = agencyVisitName  ;
    data['AgencyVisitUNQ'] = agencyVisitUNQ  ;
    data['VchDate'] = vchDate  ;
    data['AccountID'] = accountID  ;
    data['AccountName'] = accountName  ;
    data['PartyID'] = partyID  ;
    data['PartyName'] = partyName  ;
    data['SalesmanID'] = salesmanID  ;
    data['SalesmanName'] = salesmanName  ;
    data['OwnFirmID'] = ownFirmID  ;
    data['OwnFirmName'] = ownFirmName  ;
    data['CustomerFirmID'] = customerFirmID  ;
    data['CustomerFirmName'] = customerFirmName  ;
    data['ShippingFirmID'] = shippingFirmID  ;
    data['ShippingFirmName'] = shippingFirmName  ;
    data['AgencyBillingTypeIDList'] = agencyBillingTypeIDList  ;
    data['AgencyBillingTypeNameList'] = agencyBillingTypeNameList  ;
    data['DueDays'] = dueDays  ;
    data['DueDate'] = dueDate  ;
    data['CreditLimit'] = creditLimit  ;
    data['Amount'] = amount  ;
    data['BillingPercentage'] = billingPercentage  ;
    data['FromDate'] = fromDate  ;
    data['ToDate'] = toDate  ;
    return data;
  }
}