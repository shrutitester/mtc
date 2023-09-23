class AgencyStock {
  bool? status;
  String? message;
  int? records;
  List<Orders>? orders;

  AgencyStock({this.status, this.message, this.records, this.orders});

  AgencyStock.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    records = json['Records'];
    if (json['Orders'] != null) {
      orders = <Orders>[];
      json['Orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Status'] = status;
    data['Message'] = message;
    data['Records'] = records;
    if (orders != null) {
      data['Orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  String? id;
  String? vchNo;
  String? agencyOrderId;
  String? vchDate;
  String? orderNo;
  String? storeId;
  String? storeName;
  String? customerId;
  String? customerName;
  String? partyId;
  String? partyName;
  String? agencyVisitId;
  String? agencyVisitName;
  String? method;
  String? givenBy;
  String? cashPartyName;
  String? dispatchDays;
  String? deliveryDate;
  String? transportId;
  String? transportName;
  String? booking;
  String? marka;
  String? remark;
  String? ownFirmId;
  String? customerFirmId;
  String? ownFirmName;
  String? customerFirmName;
  String? shippingFirmId;
  String? shippingFirmName;
  String? orderFormNo;
  String? userId;
  String? userName;
  String? salesmanId;
  String? salesmanName;
  String? supplierId;
  String? supplierName;
  String? styleCategoryId;
  String? styleCategoryName;
  String? billingType;
  String? billingTypeId;
  String? noOfCases;
  String? pcs;
  String? amount;
  String? detailRemark;
  String? dispatchRemark;
  String? billingPercentage;
  String? appUserName;
  String? cityId;
  String? fromDate;
  String? toDate;

  Orders(
      {this.id,
      this.vchNo,
      this.agencyOrderId,
      this.vchDate,
      this.orderNo,
      this.storeId,
      this.storeName,
      this.customerId,
      this.customerName,
      this.partyId,
      this.partyName,
      this.agencyVisitId,
      this.agencyVisitName,
      this.method,
      this.givenBy,
      this.cashPartyName,
      this.dispatchDays,
      this.deliveryDate,
      this.transportId,
      this.transportName,
      this.booking,
      this.marka,
      this.remark,
      this.ownFirmId,
      this.customerFirmId,
      this.ownFirmName,
      this.customerFirmName,
      this.shippingFirmId,
      this.shippingFirmName,
      this.orderFormNo,
      this.userId,
      this.userName,
      this.salesmanId,
      this.salesmanName,
      this.supplierId,
      this.supplierName,
      this.styleCategoryId,
      this.styleCategoryName,
      this.billingType,
      this.amount,
      this.detailRemark,
      this.dispatchRemark,
      this.billingPercentage,
      this.appUserName,
      this.cityId,
      this.fromDate,
      this.toDate,
      this.noOfCases,
      this.billingTypeId,
      this.pcs});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    vchNo = json['VchNo'];
    agencyOrderId = json['AgencyOrderID'];
    vchDate = json['VchDate'];
    orderNo = json['OrderNo'];
    storeId = json['StoreID'];
    storeName = json['StoreName'];
    customerId = json['CustomerID'];
    customerName = json['CustomerName'];
    partyId = json['PartyID'];
    partyName = json['PartyName'];
    agencyVisitId = json['AgencyVisitID'];
    agencyVisitName = json['AgencyVisitName'];
    method = json['Method'];
    givenBy = json['GivenBy'];
    cashPartyName = json['CashPartyName'];
    dispatchDays = json['DispatchDays'];
    deliveryDate = json['DeliveryDate'];
    transportId = json['TransportID'];
    transportName = json['TransportName'];
    booking = json['Booking'];
    marka = json['Marka'];
    remark = json['Remark'];
    ownFirmId = json['OwnFirmID'];
    customerFirmId = json['CustomerFirmID'];
    ownFirmName = json['OwnFirmName'];
    customerFirmName = json['CustomerFirmName'];
    shippingFirmId = json['ShippingFirmID'];
    shippingFirmName = json['ShippingFirmName'];
    orderFormNo = json['OrderFormNo'];
    userId = json['UserID'];
    userName = json['UserName'];
    salesmanId = json['SalesmanID'];
    salesmanName = json['SalesmanName'];
    supplierId = json['SupplierID'];
    supplierName = json['SupplierName'];
    styleCategoryId = json['StyleCategoryID'];
    styleCategoryName = json['StyleCategoryName'];
    billingType = json['BillingType'];
    billingTypeId = json['BillingTypeID'];
    noOfCases = json['NoOfCases'];
    pcs = json['Pcs'];
    amount = json['Amount'];
    detailRemark = json['DetailRemark'];
    dispatchRemark = json['DispatchRemark'];
    billingPercentage = json['BillingPercentage'];
    appUserName = json['AppUserName'];
    cityId = json['CityID'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['VchNo'] = vchNo;
    data['AgencyOrderID'] = agencyOrderId;
    data['VchDate'] = vchDate;
    data['OrderNo'] = orderNo;
    data['StoreID'] = storeId;
    data['StoreName'] = storeName;
    data['CustomerID'] = customerId;
    data['CustomerName'] = customerName;
    data['PartyID'] = partyId;
    data['PartyName'] = partyName;
    data['AgencyVisitID'] = agencyVisitId;
    data['AgencyVisitName'] = agencyVisitName;
    data['Method'] = method;
    data['GivenBy'] = givenBy;
    data['CashPartyName'] = cashPartyName;
    data['DispatchDays'] = dispatchDays;
    data['DeliveryDate'] = deliveryDate;
    data['TransportID'] = transportId;
    data['TransportName'] = transportName;
    data['Booking'] = booking;
    data['Marka'] = marka;
    data['Remark'] = remark;
    data['OwnFirmID'] = ownFirmId;
    data['CustomerFirmID'] = customerFirmId;
    data['OwnFirmName'] = ownFirmName;
    data['CustomerFirmName'] = customerFirmName;
    data['ShippingFirmID'] = shippingFirmId;
    data['ShippingFirmName'] = shippingFirmName;
    data['OrderFormNo'] = orderFormNo;
    data['UserID'] = userId;
    data['UserName'] = userName;
    data['SalesmanID'] = salesmanId;
    data['SalesmanName'] = salesmanName;
    data['SupplierID'] = supplierId;
    data['SupplierName'] = supplierName;
    data['StyleCategoryID'] = styleCategoryId;
    data['StyleCategoryName'] = styleCategoryName;
    data['BillingType'] = billingType;
    data['BillingTypeID'] = billingTypeId;
    data['NoOfCases'] = noOfCases;
    data['Pcs'] = pcs;
    data['Amount'] = amount;
    data['DetailRemark'] = detailRemark;
    data['DispatchRemark'] = dispatchRemark;
    data['BillingPercentage'] = billingPercentage;
    data['AppUserName'] = appUserName;
    data['CityID'] = cityId;
    data['FromDate'] = fromDate;
    data['ToDate'] = toDate;
    return data;
  }
}
