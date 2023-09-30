class CreditLimitStatusModel {
  int? records;
  bool? status;
  String? message;
  List<Party>? parties;

  CreditLimitStatusModel({this.records, this.status, this.message, this.parties});

  CreditLimitStatusModel.fromJson(Map<String, dynamic> json) {
    records = json['Records'];
    status = json['Status'];
    message = json['Message'];
    if (json['Parties'] != null) {
      parties = <Party>[];
      json['Parties'].forEach((v) {
        parties!.add(Party.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Records'] = records;
    data['Status'] = status;
    data['Message'] = message;
    if (parties != null) {
      data['Parties'] = parties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Party {
  String? accountId;
  String? accountName;
  String? creditLimit;
  String? orderedAmount;
  String? valueOfGoods;
  String? ledgerBalance;
  String? balanceAmount;
  String? dueBalance;
  String? cityName;
  String? mobile;
  String? supportExecutiveName;
  String? collectionExecutiveName;
  String? stateName;
  String? creditLimitGranted;
  String? creditLimitUnderObservation;

  Party(
      {this.accountId,
        this.accountName,
        this.creditLimit,
        this.orderedAmount,
        this.valueOfGoods,
        this.ledgerBalance,
        this.balanceAmount,
        this.dueBalance,
        this.cityName,
        this.mobile,
        this.supportExecutiveName,
        this.collectionExecutiveName,
        this.stateName,
        this.creditLimitGranted,
        this.creditLimitUnderObservation});

  Party.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    accountName = json['AccountName'];
    creditLimit = json['CreditLimit'];
    orderedAmount = json['OrderedAmount'];
    valueOfGoods = json['ValueOfGoods'];
    ledgerBalance = json['LedgerBalance'];
    balanceAmount = json['BalanceAmount'];
    dueBalance = json['DueBalance'];
    cityName = json['CityName'];
    mobile = json['Mobile'];
    supportExecutiveName = json['SupportExecutiveName'];
    collectionExecutiveName = json['CollectionExecutiveName'];
    stateName = json['StateName'];
    creditLimitGranted = json['CreditLimitGranted'];
    creditLimitUnderObservation = json['CreditLimitUnderObservation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AccountId'] = accountId;
    data['AccountName'] = accountName;
    data['CreditLimit'] = creditLimit;
    data['OrderedAmount'] = orderedAmount;
    data['ValueOfGoods'] = valueOfGoods;
    data['LedgerBalance'] = ledgerBalance;
    data['BalanceAmount'] = balanceAmount;
    data['DueBalance'] = dueBalance;
    data['CityName'] = cityName;
    data['Mobile'] = mobile;
    data['SupportExecutiveName'] = supportExecutiveName;
    data['CollectionExecutiveName'] = collectionExecutiveName;
    data['StateName'] = stateName;
    data['CreditLimitGranted'] = creditLimitGranted;
    data['CreditLimitUnderObservation'] = creditLimitUnderObservation;
    return data;
  }
}