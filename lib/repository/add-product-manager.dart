

import 'package:myapp/constants/stringConstants.dart';
import 'package:myapp/utils/api-helper.dart';

import '../model/addVisitmodel.dart';
import '../model/creditLimitStatus.dart';
import '../model/listAgencyVisits.dart';
import '../model/listDesignations.dart';
import '../model/listParties.dart';
import '../model/listSmsTypes.dart';
import '../model/listStyleCategory.dart';
import '../model/listcities.dart';
import '../model/showAgencyStock.dart';
import '../model/showSaleBills.dart';
import '../model/updateVisit.dart';


class AddProductNetworkManager {
  static Future<ListCities> getListCity() async{
    ListCities? listcities;
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listCities,
      callType: StringConstants.postCall
    );
    if (returnMap.containsKey('exception')) {
      listcities = ListCities();
      listcities.status = false;
      listcities.message = returnMap['exception'];
      return listcities;
    } else if (returnMap.containsKey('statusCode')) {
      listcities = ListCities();
      listcities.status = false;
      listcities.message = returnMap['error'];
      return listcities;
    } else {
      listcities = ListCities.fromJson(returnMap['body']);
      return listcities;
    }
  }

  static Future<AgencyStock> getAgencyStock(String customer, String supplier, String salesman, String subparty) async {
    AgencyStock? agencyStock;
    Map<String, dynamic> bodyMap = {
      'CustomerID' : customer,
      'SupplierID' : supplier,
      'salesmanId' : salesman,
      'PartyID' : subparty
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.showAgencyStock,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      agencyStock = AgencyStock();
      agencyStock.status = false;
      agencyStock.message = returnMap['exception'];
      return agencyStock;
    } else if (returnMap.containsKey('statusCode')) {
      agencyStock = AgencyStock();
      agencyStock.status = false;
      agencyStock.message = returnMap['error'];
      return agencyStock;
    }
    else {
      agencyStock = AgencyStock.fromJson(returnMap['body']);
      return agencyStock;
    }
  }

  static Future<AddVisit> getSaveAgencyDiscountoutpdf(String customer, String supplier, String city) async {
    AddVisit? addvisit;
    Map<String, dynamic> bodyMap = {
      'AppUserName' : 'a',
      'CustomerId' : customer,
      'SupplierId' : supplier,
      'CityId' : city,
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: 'ORDER/SaveAgencyDiscountoutpdf',
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      addvisit = AddVisit();
      addvisit.status = false;
      addvisit.message = returnMap['exception'];
      return addvisit;
    } else if (returnMap.containsKey('statusCode')) {
      addvisit = AddVisit();
      addvisit.status = false;
      addvisit.message = returnMap['error'];
      return addvisit;
    } else {
      addvisit = AddVisit.fromJson(returnMap['body']);
      return addvisit;
    }
  }

  static Future<AddVisit> getListSaleBills (String account, String party, String salesman) async {
    AddVisit? addvisit;
    Map<String, dynamic> bodyMap = {
      'AccountID' : account,
      'PartyID' : party,
      'SalesmanID' : salesman,
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listsalebills,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      addvisit = AddVisit();
      addvisit.status = false;
      addvisit.message = returnMap['exception'];
      return addvisit;
    } else if (returnMap.containsKey('statusCode')) {
      addvisit = AddVisit();
      addvisit.status = false;
      addvisit.message = returnMap['error'];
      return addvisit;
    } else {
      addvisit = AddVisit.fromJson(returnMap['body']);
      return addvisit;
    }
  }

  static Future<AddVisit> getLedger (String account, String city) async {
    AddVisit? addvisit;
    Map<String, dynamic> bodyMap = {
      'accountid' : account,
      'valid' : 'Y',
      'chkbarred' : 'N',
      'rdoDetailed' : 'Y',
      'rdoSummary' : 'N',
      'chkShowInterest' : 'N',
      'rdoReceivable' : 'Y',
      'chklsbaddebts' : 'Y',
      'chkseparatePage' : 'N',
      'ExportFileName' : '25993819May2023133648',
      'PartyID' : city,
      'appUserName' : 'a'
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.columnarLedger,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      addvisit = AddVisit();
      addvisit.status = false;
      addvisit.message = returnMap['exception'];
      return addvisit;
    } else if (returnMap.containsKey('statusCode')) {
      addvisit = AddVisit();
      addvisit.status = false;
      addvisit.message = returnMap['error'];
      return addvisit;
    } else {
      addvisit = AddVisit.fromJson(returnMap['body']);
      return addvisit;
    }
  }

  static Future<AddVisit> getOrderEntry (String account, String city, String salesmanid, String supplier, String style, String transport, String own) async {
    AddVisit? addvisit;
    Map<String, dynamic> bodyMap = {
      'VchDate' : "account",
      'cashPartyName' : 'Y',
      'StoreID' : 'N',
      'CustomerID' : account,
      'CustomerName' : 'N',
      'PartyID' : 'N',
      'PartyName' : 'Y',
      'AgencyVisitName' : 'Y',
      'Method' : 'N',
      'GivenBy' : '25993819May2023133648',
      'DispatchDays' : city,
      'DeliveryDate' : 'a',
      'TransportID' : transport,
      'Booking' : 'a',
      'Marka' : 'a',
      'OwnFirmID' : own,
      'CustomerFirmID' : 'a',
      'UserID' : 'a',
      'SalesmanID' : salesmanid,
      'SupplierID' : supplier,
      'StyleCategoryID' : style,
      'StyleCategoryName' : 'a',
      'BillingType' : 'a',
      'BillingTypeID' : 'a',
      'NoOfCases' : 'a',
      'Pcs' : 'a',
      'Amount' : 'a',
      'DetailRemark' : 'a',
      'DispatchRemark' : 'a',
      'BillingPercentage' : 'a',
      'shippingFirmId' : 'a',
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.bookOrder,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      addvisit = AddVisit();
      addvisit.status = false;
      addvisit.message = returnMap['exception'];
      return addvisit;
    } else if (returnMap.containsKey('statusCode')) {
      addvisit = AddVisit();
      addvisit.status = false;
      addvisit.message = returnMap['error'];
      return addvisit;
    } else {
      addvisit = AddVisit.fromJson(returnMap['body']);
      return addvisit;
    }
  }

  static Future<AddVisit> getAddVisit (String salesman, String account, String party, String own) async {
    AddVisit? addvisit;
    Map<String, dynamic> bodyMap = {
      'accountId' : account,
      'PartyId' : party,
      'DueDate' : 'N',
      'OwnFirmId' : own,
      'CustomerFirmId' : 'N',
      'SalesmanId' : salesman,
      'Amount' : 'Y',
      'CreditLimit' : 'Y',
      'agencyVisitName' : 'N',
      'BillingPercentage' : '25993819May2023133648',
      'dueDays' : '',
      'shippingFirmId' : 'a',
      'AgencyBillingTypeNameList' : 'a',
      'AgencyBillingTypeIDList' : 'a',
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.addvisits,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      addvisit = AddVisit();
      addvisit.status = false;
      addvisit.message = returnMap['exception'];
      return addvisit;
    } else if (returnMap.containsKey('statusCode')) {
      addvisit = AddVisit();
      addvisit.status = false;
      addvisit.message = returnMap['error'];
      return addvisit;
    } else {
      addvisit = AddVisit.fromJson(returnMap['body']);
      return addvisit;
    }
  }

  static Future<ListStyleCategory> getStyleCategory(String supplierid) async {
    ListStyleCategory? listStyleCategory;
    Map<String, dynamic> bodyMap = {'supplierId': supplierid};
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: StringConstants.listStyleCategories,
        callType: StringConstants.postCall,
        fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      listStyleCategory = ListStyleCategory();
      listStyleCategory.status = false;
      listStyleCategory.message = returnMap['exception'];
      return listStyleCategory;
    } else if (returnMap.containsKey('statusCode')) {
      listStyleCategory = ListStyleCategory();
      listStyleCategory.status = false;
      listStyleCategory.message = returnMap['error'];
      return listStyleCategory;
    } else {
      listStyleCategory = ListStyleCategory.fromJson(returnMap['body']);
      return listStyleCategory;
    }
  }

  static Future<ListAgencyVisits> getAgencyVisits(String customer, String party, String salesman) async {
  ListAgencyVisits? listAgencyVisits;
  Map<String, dynamic> bodyMap = {
    'accountId' : customer,
    'partyId' : party,
    'salesmanId' : salesman
  };
  Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listagencyvisits,
      callType: StringConstants.postCall,
    fieldsMap: bodyMap
  );
  if (returnMap.containsKey('exception')) {
    listAgencyVisits = ListAgencyVisits();
    listAgencyVisits.status = false;
    listAgencyVisits.message = returnMap['exception'];
    return listAgencyVisits;
  } else if (returnMap.containsKey('statusCode'))
  {
    listAgencyVisits = ListAgencyVisits();
    listAgencyVisits.status = false;
    listAgencyVisits.message = returnMap['error'];
    return listAgencyVisits;
  }
  else {
    listAgencyVisits = ListAgencyVisits.fromJson(returnMap['body']);
    return listAgencyVisits;
  }
}

  static Future<AgencyStock> getOrderStatus(String customer, String supplier, String salesman, String subparty) async {
    AgencyStock? agencyStock;
    Map<String, dynamic> bodyMap = {
      'CustomerID' : customer,
      'SupplierID' : supplier,
      'salesmanId' : salesman,
      'PartyID' : subparty
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.showbookedorders,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      agencyStock = AgencyStock();
      agencyStock.status = false;
      agencyStock.message = returnMap['exception'];
      return agencyStock;
    } else if (returnMap.containsKey('statusCode')) {
      agencyStock = AgencyStock();
      agencyStock.status = false;
      agencyStock.message = returnMap['error'];
      return agencyStock;
    } else {
      agencyStock = AgencyStock.fromJson(returnMap['body']);
      return agencyStock;
    }
  }

  static Future<ShowSaleBills> getSaleBills(String accountid) async {
    ShowSaleBills? showSaleBills;
    Map<String, dynamic> bodyMap = {
      'accountid' : accountid
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.showsalebills,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      showSaleBills = ShowSaleBills();
      showSaleBills.status = false;
      showSaleBills.message = returnMap['exception'];
      return showSaleBills;
    } else if (returnMap.containsKey('statusCode')) {
      showSaleBills = ShowSaleBills();
      showSaleBills.status = false;
      showSaleBills.message = returnMap['error'];
      return showSaleBills;
    } else {
      showSaleBills = ShowSaleBills.fromJson(returnMap['body']);
      return showSaleBills;
    }
  }

  static Future<PartyData> getCustomerFirm(String accountid) async {
    PartyData? party;
    Map<String, dynamic> bodyMap = {
      'accountid' : accountid
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listFirmNameOfParties,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      party = PartyData();
      party.status = false;
      party.message = returnMap['exception'];
      return party;
    } else if (returnMap.containsKey('statusCode')) {
      party = PartyData();
      party.status = false;
      party.message = returnMap['error'];
      return party;
    } else {
      party = PartyData.fromJson(returnMap['body']);
      return party;
    }
  }

  static Future<ListAgencyVisits> getVisit(String partyid) async {
    ListAgencyVisits? listAgencyVisits;
    Map<String, dynamic> bodyMap = {
      'partyId' : partyid
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listagencyvisits,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      listAgencyVisits = ListAgencyVisits();
      listAgencyVisits.status = false;
      listAgencyVisits.message = returnMap['exception'];
      return listAgencyVisits;
    } else if (returnMap.containsKey('statusCode')) {
      listAgencyVisits = ListAgencyVisits();
      listAgencyVisits.status = false;
      listAgencyVisits.message = returnMap['error'];
      return listAgencyVisits;
    } else {
      listAgencyVisits = ListAgencyVisits.fromJson(returnMap['body']);
      return listAgencyVisits;
    }
  }

  static Future<PartyData> getShippingFirm(String accountid, String partyid) async {
    PartyData? party;
    Map<String, dynamic> bodyMap = {
      'accountid' : accountid,
      'partyid' : partyid
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listFirmNameOfParties,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      party = PartyData();
      party.status = false;
      party.message = returnMap['exception'];
      return party;
    } else if (returnMap.containsKey('statusCode')) {
      party = PartyData();
      party.status = false;
      party.message = returnMap['error'];
      return party;
    } else {
      party = PartyData.fromJson(returnMap['body']);
      return party;
    }
  }

  static Future<CreditLimitStatusModel> getCreditLimit(String accountid) async {
    CreditLimitStatusModel? creditLimitStatus;
    Map<String, dynamic> bodyMap = {
      'accountid' : accountid
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.creditlimitstatus,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      creditLimitStatus = CreditLimitStatusModel();
      creditLimitStatus.status = false;
      creditLimitStatus.message = returnMap['exception'];
      return creditLimitStatus;
    } else if (returnMap.containsKey('statusCode')) {
      creditLimitStatus = CreditLimitStatusModel();
      creditLimitStatus.status = false;
      creditLimitStatus.message = returnMap['error'];
      return creditLimitStatus;
    } else {
      creditLimitStatus = CreditLimitStatusModel.fromJson(returnMap['body']);
      return creditLimitStatus;
    }
  }

  static Future<AddVisit> getPendingCreditLimit(String accountid) async {
    AddVisit? addVisit;
    Map<String, dynamic> bodyMap = {
      'accountid' : accountid
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.showpendingcreditlimit,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      addVisit = AddVisit();
      addVisit.status = false;
      addVisit.message = returnMap['exception'];
      return addVisit;
    } else if (returnMap.containsKey('statusCode')) {
      addVisit = AddVisit();
      addVisit.status = false;
      addVisit.message = returnMap['error'];
      return addVisit;
    } else {
      addVisit = AddVisit.fromJson(returnMap['body']);
      return addVisit;}}

  static Future<AddVisit> getPendingAgencyVisitLimit(String accountid) async {
    AddVisit? addVisit;
    Map<String, dynamic> bodyMap = {
      'accountid' : accountid
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.showpendingagencyvisitlimit,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      addVisit = AddVisit();
      addVisit.status = false;
      addVisit.message = returnMap['exception'];
      return addVisit;
    } else if (returnMap.containsKey('statusCode')) {
      addVisit = AddVisit();
      addVisit.status = false;
      addVisit.message = returnMap['error'];
      return addVisit;
    } else {
      addVisit = AddVisit.fromJson(returnMap['body']);
      return addVisit;}}
  // static Future<AddVisit> addVisit (bodyMap) async{
  //   AddVisit model;
  //   Map<String, dynamic> returnData = {"Status": false, "Message": ""};
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //     api: 'ORDER/AddVisit',
  //     callType: StringConstants.postCall,
  //     fieldsMap: bodyMap
  //   );
  //
  //   if (returnMap.containsKey('exception')) {
  //     model = AddVisit();
  //     model.status = false;
  //     model.message = returnMap['exception'];
  //     return model;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     model = AddVisit();
  //     model.status = false;
  //     model.message = returnMap['error'];
  //     return model;
  //   } else {
  //     model = AddVisit.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }

  static Future<AgencyStock> getPendingOrder(String customer, String supplier, String salesman, String subparty) async{
    AgencyStock? agencyStock;
    Map<String, dynamic> bodyMap ={
      'CustomerID' : customer,
      'SupplierID' : supplier,
      'salesmanId' : salesman,
      'PartyID' : subparty
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.showagencypendingorders,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      agencyStock = AgencyStock();
      agencyStock.status = false;
      agencyStock.message = returnMap['exception'];
      return agencyStock;
    } else if (returnMap.containsKey('statusCode')) {
      agencyStock = AgencyStock();
      agencyStock.status = false;
      agencyStock.message = returnMap['error'];
      return agencyStock;
    } else {
      agencyStock = AgencyStock.fromJson(returnMap['body']);
      return agencyStock;
    }
  }

  static Future<AgencyStock> getShowBill(String account, String party, String salesman) async{
    AgencyStock? agencyStock;
    Map<String, dynamic> bodyMap ={
      'AccountID' : account,
      'PartyID' : party,
      'salesmanId' : salesman,
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.showagencypendingorders,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );
    if (returnMap.containsKey('exception')) {
      agencyStock = AgencyStock();
      agencyStock.status = false;
      agencyStock.message = returnMap['exception'];
      return agencyStock;
    } else if (returnMap.containsKey('statusCode')) {
      agencyStock = AgencyStock();
      agencyStock.status = false;
      agencyStock.message = returnMap['error'];
      return agencyStock;
    } else {
      agencyStock = AgencyStock.fromJson(returnMap['body']);
      return agencyStock;
    }
  }

  static Future<PartyData> getSalesman () async{
    PartyData? partyData;
    Map<String, dynamic> bodyMap = {
      'groupid' : '37'
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listparties,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );

    if (returnMap.containsKey('exception')) {
      partyData = PartyData();
      partyData.status = false;
      partyData.message = returnMap['exception'];
      return partyData;
    } else if (returnMap.containsKey('statusCode')) {
      partyData = PartyData();
      partyData.status = false;
      partyData.message = returnMap['error'];
      return partyData;
    } else {
      partyData = PartyData.fromJson(returnMap['body']);
      return partyData;
    }
  }

  static Future<PartyData> getAccount () async{
    PartyData? partyData;
    Map<String, dynamic> bodyMap = {
      'groupid' : '26'
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listparties,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );

    if (returnMap.containsKey('exception')) {
      partyData = PartyData();
      partyData.status = false;
      partyData.message = returnMap['exception'];
      return partyData;
    } else if (returnMap.containsKey('statusCode')) {
      partyData = PartyData();
      partyData.status = false;
      partyData.message = returnMap['error'];
      return partyData;
    } else {
      partyData = PartyData.fromJson(returnMap['body']);
      return partyData;
    }
  }

  static Future<PartyData> getParty () async{
    PartyData? partyData;
    Map<String, dynamic> bodyMap = {
      'groupid' : '49'
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listparties,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );

    if (returnMap.containsKey('exception')) {
      partyData = PartyData();
      partyData.status = false;
      partyData.message = returnMap['exception'];
      return partyData;
    } else if (returnMap.containsKey('statusCode')) {
      partyData = PartyData();
      partyData.status = false;
      partyData.message = returnMap['error'];
      return partyData;
    } else {
      partyData = PartyData.fromJson(returnMap['body']);
      return partyData;
    }
  }

  static Future<PartyData> getOwnFirm() async{
    PartyData? partyData;
    Map<String, dynamic> bodyMap = {
      'groupid' : '56'
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listparties,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );

    if (returnMap.containsKey('exception')) {
      partyData = PartyData();
      partyData.status = false;
      partyData.message = returnMap['exception'];
      return partyData;
    } else if (returnMap.containsKey('statusCode')) {
      partyData = PartyData();
      partyData.status = false;
      partyData.message = returnMap['error'];
      return partyData;
    } else {
      partyData = PartyData.fromJson(returnMap['body']);
      return partyData;
    }
  }

  static Future<PartyData> getTransport() async{
    PartyData? partyData;
    Map<String, dynamic> bodyMap = {
      'groupid' : '30'
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listparties,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );

    if (returnMap.containsKey('exception')) {
      partyData = PartyData();
      partyData.status = false;
      partyData.message = returnMap['exception'];
      return partyData;
    } else if (returnMap.containsKey('statusCode')) {
      partyData = PartyData();
      partyData.status = false;
      partyData.message = returnMap['error'];
      return partyData;
    } else {
      partyData = PartyData.fromJson(returnMap['body']);
      return partyData;
    }
  }

  static Future<PartyData> getSupplier() async{
    PartyData? partyData;
    Map<String, dynamic> bodyMap = {
      'groupid' : '22'
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listparties,
      callType: StringConstants.postCall,
      fieldsMap: bodyMap
    );

    if (returnMap.containsKey('exception')) {
      partyData = PartyData();
      partyData.status = false;
      partyData.message = returnMap['exception'];
      return partyData;
    } else if (returnMap.containsKey('statusCode')) {
      partyData = PartyData();
      partyData.status = false;
      partyData.message = returnMap['error'];
      return partyData;
    } else {
      partyData = PartyData.fromJson(returnMap['body']);
      return partyData;
    }
  }

  static Future<ListDesignations> getDesignation() async{
    ListDesignations? listDesignations;
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listDesignations,
      callType: StringConstants.postCall,
      // fieldsMap: bodyMap
    );

    if (returnMap.containsKey('exception')) {
      listDesignations = ListDesignations();
      listDesignations.status = false;
      listDesignations.message = returnMap['exception'];
      return listDesignations;
    } else if (returnMap.containsKey('statusCode')) {
      listDesignations = ListDesignations();
      listDesignations.status = false;
      listDesignations.message = returnMap['error'];
      return listDesignations;
    } else {
      listDesignations = ListDesignations.fromJson(returnMap['body']);
      return listDesignations;
    }
  }

  static Future<ListSmsTypes> getSmsType() async{
    ListSmsTypes? listSmsTypes;
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
      api: StringConstants.listSMSTypes,
      callType: StringConstants.postCall,
      // fieldsMap: bodyMap
    );

    if (returnMap.containsKey('exception')) {
      listSmsTypes = ListSmsTypes();
      listSmsTypes.status = false;
      listSmsTypes.message = returnMap['exception'];
      return listSmsTypes;
    } else if (returnMap.containsKey('statusCode')) {
      listSmsTypes = ListSmsTypes();
      listSmsTypes.status = false;
      listSmsTypes.message = returnMap['error'];
      return listSmsTypes;
    } else {
      listSmsTypes = ListSmsTypes.fromJson(returnMap['body']);
      return listSmsTypes;
    }
  }



  // static Future<UpdateVisit> getCart(
  //     String partyCode, String mobileNo) async {
  //   UpdateVisit  model;
  //   Map<String, dynamic> bodyMap = {
  //     'partyCode': partyCode,
  //     'MobileNo': mobileNo
  //   };
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'cart/displayCart',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //
  //   if (returnMap.containsKey('exception')) {
  //     model = UpdateVisit();
  //     model.status = false;
  //     model.message = returnMap['exception'];
  //     return model;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     model = UpdateVisit();
  //     model.status = false;
  //     model.message = returnMap['error'];
  //     return model;
  //   } else {
  //     model = UpdateVisit.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }
  // static Future<PartyData> getPartyList(
  //     ) async {
  //   PartyData? partyData;
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //     api: 'party/listParties',
  //     callType: StringConstants.postCall,
  //   );
  //   if (returnMap.containsKey('exception')) {
  //     partyData = PartyData();
  //     partyData.status = false;
  //     partyData.message = returnMap['exception'];
  //     return partyData;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     partyData = PartyData();
  //     partyData.status = false;
  //     partyData.message = returnMap['error'];
  //     return partyData;
  //   } else {
  //     partyData = PartyData.fromJson(returnMap['body']);
  //     return partyData;
  //   }
  // }

  // static Future<CartPartyData> getCartPartyList(
  //     String partyName) async {
  //   CartPartyData? partyData;
  //   Map<String, dynamic> bodyMap = {'partyName': partyName};
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'party/listCartParties',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //   if (returnMap.containsKey('exception')) {
  //     partyData = CartPartyData();
  //     partyData.status = false;
  //     partyData.message = returnMap['exception'];
  //     return partyData;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     partyData = CartPartyData();
  //     partyData.status = false;
  //     partyData.message = returnMap['error'];
  //     return partyData;
  //   } else {
  //     partyData = CartPartyData.fromJson(returnMap['body']);
  //     return partyData;
  //   }
  // }

  // static Future<CartPartyData> getCartPartyListOrderByRemark(
  //     String remark) async {
  //   CartPartyData? partyData;
  //   Map<String, dynamic> bodyMap = {'Remark': remark};
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'party/listCartParties',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //   if (returnMap.containsKey('exception')) {
  //     partyData = CartPartyData();
  //     partyData.status = false;
  //     partyData.message = returnMap['exception'];
  //     return partyData;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     partyData = CartPartyData();
  //     partyData.status = false;
  //     partyData.message = returnMap['error'];
  //     return partyData;
  //   } else {
  //     partyData = CartPartyData.fromJson(returnMap['body']);
  //     return partyData;
  //   }
  // }

  // static Future<PartyData> getCustomerList(
  //     ) async {
  //   PartyData? partyData;
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //     api: 'party/listParties',
  //     callType: StringConstants.postCall,
  //   );
  //   if (returnMap.containsKey('exception')) {
  //     partyData = PartyData();
  //     partyData.status = false;
  //     partyData.message = returnMap['exception'];
  //     return partyData;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     partyData = PartyData();
  //     partyData.status = false;
  //     partyData.message = returnMap['error'];
  //     return partyData;
  //   } else {
  //     partyData = PartyData.fromJson(returnMap['body']);
  //     return partyData;
  //   }
  // }

  // static Future<PartyData> getTransportList(
  //     ) async {
  //   PartyData? partyData;
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //     api: 'party/listTransport',
  //     callType: StringConstants.postCall,
  //   );
  //   if (returnMap.containsKey('exception')) {
  //     partyData = PartyData();
  //     partyData.status = false;
  //     partyData.message = returnMap['exception'];
  //     return partyData;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     partyData = PartyData();
  //     partyData.status = false;
  //     partyData.message = returnMap['error'];
  //     return partyData;
  //   } else {
  //     partyData = PartyData.fromJson(returnMap['body']);
  //     return partyData;
  //   }
  // }

  // static Future<PartyData> getPackerList(
  //     ) async {
  //   PartyData? partyData;
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //     api: 'party/listPacker',
  //     callType: StringConstants.postCall,
  //   );
  //   if (returnMap.containsKey('exception')) {
  //     partyData = PartyData();
  //     partyData.status = false;
  //     partyData.message = returnMap['exception'];
  //     return partyData;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     partyData = PartyData();
  //     partyData.status = false;
  //     partyData.message = returnMap['error'];
  //     return partyData;
  //   } else {
  //     partyData = PartyData.fromJson(returnMap['body']);
  //     return partyData;
  //   }
  // }
  // getCart

  // static Future<ShowCart> getCart(
  //     String partyCode, String mobileNo) async {
  //   ShowCart? model;
  //   Map<String, dynamic> bodyMap = {
  //     'partyCode': partyCode,
  //     'MobileNo': mobileNo
  //   };
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'cart/displayCart',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //
  //   if (returnMap.containsKey('exception')) {
  //     model = ShowCart();
  //     model.status = false;
  //     model.message = returnMap['exception'];
  //     return model;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     model = ShowCart();
  //     model.status = false;
  //     model.message = returnMap['error'];
  //     return model;
  //   } else {
  //     model = ShowCart.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }

  // static Future<UserOrder> getOrder(
  //     ) async {
  //   UserOrder? model;
  //   Map<String, dynamic> bodyMap = {
  //     // 'customerCode': customerCode,
  //     // 'partyCode': partyCode
  //   };
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'Order/ShowBookedOrders',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //
  //   if (returnMap.containsKey('exception')) {
  //     model = UserOrder();
  //     model.status = false;
  //     model.message = returnMap['exception'];
  //     return model;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     model = UserOrder();
  //     model.status = false;
  //     model.message = returnMap['error'];
  //     return model;
  //   } else {
  //     model = UserOrder.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }

  // static Future<UserOrder> getOrderByPartyName(
  //     partyName) async {
  //   UserOrder? model;
  //   Map<String, dynamic> bodyMap = {'PartyName': partyName};
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'Order/ShowBookedOrders',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //
  //   if (returnMap.containsKey('exception')) {
  //     model = UserOrder();
  //     model.status = false;
  //     model.message = returnMap['exception'];
  //     return model;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     model = UserOrder();
  //     model.status = false;
  //     model.message = returnMap['error'];
  //     return model;
  //   } else {
  //     model = UserOrder.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }

  // static Future<UserOrder> getOrderByRemark(
  //     remark) async {
  //   UserOrder? model;
  //   Map<String, dynamic> bodyMap = {
  //     'PackerName': remark,
  //     // 'partyCode': partyCode
  //   };
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'Order/ShowBookedOrders',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //
  //   if (returnMap.containsKey('exception')) {
  //     model = UserOrder();
  //     model.status = false;
  //     model.message = returnMap['exception'];
  //     return model;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     model = UserOrder();
  //     model.status = false;
  //     model.message = returnMap['error'];
  //     return model;
  //   } else {
  //     model = UserOrder.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }

  // static Future<ShowCart> getOrderDetails(
  //     slNo) async {
  //   ShowCart? model;
  //   Map<String, dynamic> bodyMap = {
  //     'SlNo': slNo
  //     // 'partyCode': partyCode
  //   };
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'ORDER/ShowBookedOrderDetail',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //
  //   if (returnMap.containsKey('exception')) {
  //     model = ShowCart();
  //     model.status = false;
  //     model.message = returnMap['exception'];
  //     return model;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     model = ShowCart();
  //     model.status = false;
  //     model.message = returnMap['error'];
  //     return model;
  //   } else {
  //     model = ShowCart.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }

  // static Future<CommonModel> bookOrder(
  //     bodyMap) async {
  //   CommonModel model;
  //   Map<String, dynamic> returnData = {"Status": false, "Message": ""};
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'ORDER/bookOrder',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //
  //   if (returnMap.containsKey('exception')) {
  //     model = CommonModel();
  //     model.status = false;
  //     model.message = returnMap['exception'];
  //     return model;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     model = CommonModel();
  //     model.status = false;
  //     model.message = returnMap['error'];
  //     return model;
  //   } else {
  //     model = CommonModel.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }

  // static Future<Map<String, dynamic>> bookOrder(bodyMap) async {
  //   Map<String, dynamic> returnData = {"Status": false, "Message": ""};
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'ORDER/bookOrder',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //
  //   if (returnMap.containsKey('exception')) {
  //     returnData["Status"] = false;
  //     returnData["Message"] = returnMap['exception'];
  //     return returnData;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     returnData["Status"] = false;
  //     returnData["Message"] = returnMap['error'];
  //     return returnData;
  //   } else {
  //     if (returnMap["body"]["Status"] == true) {
  //       returnData["Status"] = true;
  //       returnData["Message"] = "Order booked successfully";
  //     } else {
  //       returnData["Status"] = false;
  //       returnData["Message"] = returnMap["body"]['Message'];
  //     }
  //     return returnData;
  //   }
  // }
}


