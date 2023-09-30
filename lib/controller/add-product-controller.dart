import 'package:get/get.dart';
import '../../../utils/preferences.dart';
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
import '../model/user-data.dart';
import '../repository/add-product-manager.dart';

class AddProductController extends GetxController {
  // bool? isLoading = false;
  // bool? isLoadingForCart = false;
  // bool? isLoadingForOrderDetail = false;
  // bool? isLoadingForScannedItem = false;
  // UserData? userModel;
  final preferences = AppPreferences();
  List<Citys>? city = [];
  List<Parties>? parties = [];
  List<Parties>? account = [];
  List<Parties>? party = [];
  List<Parties>? transport = [];
  List<Parties>? supplier = [];
  List<Parties>? ownFirm = [];
  List<Parties>? customerFirm = [];
  List<Parties>? shippingFirm = [];
  List<Orders>? orders = [];
  List<Orders>? order = [];
  List<Orders>? pending = [];
  List<StyleCategories>? style = [];
  List<Designations>? designation = [];
  List<SMSTypes>? sms = [];
  List<AgencyVisits> agencyVisit = [];
  List<AgencyVisits> visit = [];
  List<AddVisit> discountoutpdf = [];
  List<Bills> bills = [];
  List<Party> credit = [];
  AddVisit? addVisit;
  CreditLimitStatusModel? creditLimitStatus;

  // List<CartParties>? cartParties = [];
  // List<Parties>? customers = [];
  // List<Parties>? transports = [];
  // List<Parties>? packers = [];
  // List<AddScannedData> addScanDataList = [];
  // List<Design> scannedDesignList = [];
  // List<AddScannedData> barCodeScanned = [];
  // ScanedBarcodeData? scanedBarcodeData;
  // List<Order>? orderList = [];
  // List<Design>? orderDetailList = [];
  // List<Design>? cartList = [];
  // int cart = 0.obs();
  // String? ttQty = '0';
  // String? avlQty = '0';
  // String? ttAmt = '0';
  // String? orderTotalQty = '0';
  // String? orderTotalAmt = '0';
  // int printableAmt = 0;
  // bool? cartPartyStatus = false;
  // String? cartPartyModel;

  @override
  void onInit() {
    getListCity();
    getSalesman();
    getSupplier();
    getAccount();
    getParty();
    getSaleBills('');
    getTransport();
    getCreditLimit('');
    getOwnFirm();
    getDesignation();
    getSmsType();
    getAgencyStock('', '', '', '');
    getPendingCreditLimit('');
    getPendingAgencyVisitLimit('');
    getStyleCategory('');
    getAgencyVisits('','','');
    getOrderStatus('','','','');
    getPendingOrder('', '', '', '');
    super.onInit();
  }

  getListCity() async {
    ListCities data = await AddProductNetworkManager.getListCity();
    city!.clear();
    if(data.citys != null){
      city!.addAll(data.citys!);
    }
    update();
  }

  getSalesman() async{
    PartyData data = await AddProductNetworkManager.getSalesman();
    parties!.clear();
    if(data.parties != null){
      parties!.addAll(data.parties!);
    }
    update();
  }

  getAccount() async{
    PartyData data = await AddProductNetworkManager.getAccount();
    account!.clear();
    if(data.parties != null){
      account!.addAll(data.parties!);
    }
    update();
  }

  getParty() async{
    PartyData data = await AddProductNetworkManager.getParty();
    party!.clear();
    if(data.parties != null){
      party!.addAll(data.parties!);
    }
    update();
  }

  getTransport() async{
    PartyData data = await AddProductNetworkManager.getTransport();
    transport!.clear();
    if(data.parties != null){
      transport!.addAll(data.parties!);
    }
    update();
  }

  getSupplier() async{
    PartyData data = await AddProductNetworkManager.getSupplier();
    supplier!.clear();
    if(data.parties != null){
      supplier!.addAll(data.parties!);
    }
    update();
  }

  getSaleBills(String accountid) async{
    ShowSaleBills data = await AddProductNetworkManager.getSaleBills(accountid);
    bills!.clear();
    if(data.bills != null){
      bills!.addAll(data.bills!);
    }
    update();
  }

  getCustomerFirm(String accountid) async{
    PartyData data = await AddProductNetworkManager.getCustomerFirm(accountid);
    customerFirm!.clear();
    if(data.parties != null){
      customerFirm!.addAll(data.parties!);
    }
    update();
  }

  getVisit(String accountid) async{
    ListAgencyVisits data = await AddProductNetworkManager.getVisit(accountid);
    visit!.clear();
    if(data.agencyVisits != null){
      visit!.addAll(data.agencyVisits!);
    }
    update();
  }

  getShippingFirm(String accountid, String partyid) async{
    PartyData data = await AddProductNetworkManager.getShippingFirm(accountid, partyid);
    shippingFirm!.clear();
    if(data.parties != null){
      shippingFirm!.addAll(data.parties!);
    }
    update();
  }

  getCreditLimit(String accountid) async{
    CreditLimitStatusModel data = await AddProductNetworkManager.getCreditLimit(accountid);
    credit!.clear();
    if(data.parties != null){
      credit!.addAll(data.parties!);
    }
    update();
  }

  getPendingCreditLimit(String accountid) async{
    AddVisit data = await AddProductNetworkManager.getPendingCreditLimit(accountid);
    if(data.status == true){
    }
    return data;
  }

  getPendingAgencyVisitLimit(String accountid) async{
    AddVisit data = await AddProductNetworkManager.getPendingAgencyVisitLimit(accountid);
    if(data.status == true){
    }
    return data;
  }

  getOwnFirm() async{
    PartyData data = await AddProductNetworkManager.getOwnFirm();
    ownFirm!.clear();
    if(data.parties != null){
      ownFirm!.addAll(data.parties!);
    }
    update();
  }

  getAgencyStock(String customer, String supplier, String salesman, String subparty) async {
    AgencyStock data = await AddProductNetworkManager.getAgencyStock(customer, supplier, salesman, subparty);
    orders!.clear();
    if(data.orders != null){
      orders!.addAll(data.orders!);
    }
    update();
  }

  getSaveAgencyDiscountoutpdf(String customer, String supplier, String city) async{
    AddVisit data = await AddProductNetworkManager.getSaveAgencyDiscountoutpdf(customer, supplier, city);
    if(data.status == true){
    }
    return data;
  }

  getListSaleBills(String account, String party, String salesman) async{
    AddVisit data = await AddProductNetworkManager.getListSaleBills(account, party, salesman);
    if(data.status == true){
    }
    return data;
  }

  getLedger(String account, String city) async{
    AddVisit data = await AddProductNetworkManager.getLedger(account, city);
    if(data.status == true){
    }
    return data;
  }

  getOrderEntry(String account, String party, String salesmanid, String supplier, String style, String transport, String own) async{
    AddVisit data = await AddProductNetworkManager.getOrderEntry(account, party, salesmanid, supplier, style, transport, own );
    if(data.status == true){
    }
    return data;
  }

  getAddVisit(String salesman, String account, String party, String own) async{
    AddVisit data = await AddProductNetworkManager.getAddVisit(salesman, account, party, own);
    if(data.status == true){
    }
    return data;
  }

  getStyleCategory(String supplierid) async {
    ListStyleCategory data = await AddProductNetworkManager.getStyleCategory(supplierid);
    style!.clear();
    if(data.styleCategories != null){
      style!.addAll(data.styleCategories!);
    }
    update();
  }

  getAgencyVisits(String customer,String party, String salesman) async {
    ListAgencyVisits data = await AddProductNetworkManager.getAgencyVisits(customer, party, salesman);
    agencyVisit!.clear();
    if(data.agencyVisits != null){
      agencyVisit!.addAll(data.agencyVisits!);
    }
    update();
  }

  // getShowBill(String customer,String party, String salesman) async {
  //   ListAgencyVisits data = await AddProductNetworkManager.getShowBill(customer, party, salesman);
  //   agencyVisit!.clear();
  //   if(data.agencyVisits != null){
  //     agencyVisit!.addAll(data.agencyVisits!);
  //   }
  //   update();
  // }

  getOrderStatus(String customer, String supplier, String salesman, String subparty) async {
    AgencyStock data = await AddProductNetworkManager.getOrderStatus(customer, supplier, salesman, subparty);
    order!.clear();
    if(data.orders != null){
      order!.addAll(data.orders!);
    }
    update();
  }

  getPendingOrder(String customer, String supplier, String salesman, String subparty) async {
    AgencyStock data = await AddProductNetworkManager.getPendingOrder(customer, supplier, salesman, subparty);
    pending!.clear();
    if(data.orders != null){
      pending!.addAll(data.orders!);
    }
    update();
  }

  getDesignation() async {
    ListDesignations data = await AddProductNetworkManager.getDesignation();
    designation!.clear();
    if(data.designations != null){
      designation!.addAll(data.designations!);
    }
    update();
  }

  getSmsType() async{
    ListSmsTypes data = await AddProductNetworkManager.getSmsType();
    sms!.clear();
    if(data.smsTypes != null){
      sms!.addAll(data.smsTypes!);
    }
    update();
  }

  // Future<AddVisit> addVisit(
  //     String accountId,
  //     String PartyId,
  //     String DueDate,
  //     String OwnFirmId,
  //     String CustomerFirmId,
  //     String SalesmanId,
  //     String Amount,
  //     String CreditLimit,
  //     String agencyVisitName,
  //     String BillingPercentage,
  //     String dueDays,
  //     String shippingFirmId,
  //     String AgencyBilllingTypeNameList,
  //     String AgencyBillingTypeIDList,
  //     ) async {
  //     isLoading = true;
  //     update();
  //     Map<String, dynamic> bodyMap = {
  //       'accountId': accountId,
  //       'PartyId': PartyId,
  //       'DueDate': DueDate,
  //       'OwnFirmId': OwnFirmId,
  //       'CustomerFirmId': CustomerFirmId,
  //       'SalesmanId': SalesmanId,
  //       'Amount': Amount,
  //       'CreditLimit': CreditLimit,
  //       'agencyVisitName': agencyVisitName,
  //       'BillingPercentage': BillingPercentage,
  //       'dueDays': dueDays,
  //       'shippingFirmId': shippingFirmId,
  //       'AgencyBilllingTypeNameList': AgencyBilllingTypeNameList,
  //       'AgencyBillingTypeIDList': AgencyBillingTypeIDList,
  //     };
  //     AddVisit model = await AddProductNetworkManager.addVisit(bodyMap);
  //     isLoading = false;
  //     update();
  //     return model;
  // }











  // getPartyList() async {
  //   PartyData data = await AddProductNetworkManager.getPartyList();
  //   parties!.clear();
  //   if (data.parties != null) {
  //     parties!.addAll(data.parties!);
  //   }
  //   update();
  // }
  //
  // getCustomerList() async {
  //   PartyData data = await AddProductNetworkManager.getPartyList();
  //   customers!.clear();
  //   if (data.parties != null) {
  //     customers!.addAll(data.parties!);
  //   }
  //   update();
  // }
  //
  // getTransportList() async {
  //   PartyData data = await AddProductNetworkManager.getTransportList();
  //   transports!.clear();
  //   if (data.parties != null) {
  //     transports!.addAll(data.parties!);
  //   }
  //   update();
  // }
  //
  // getPackerList() async {
  //   PartyData data = await AddProductNetworkManager.getPackerList();
  //   packers!.clear();
  //   if (data.parties != null) {
  //     packers!.addAll(data.parties!);
  //   }
  //   update();
  // }

  // getCartPartyList(String partyName) async {
  //   CartPartyData data =
  //       await AddProductNetworkManager.getCartPartyList(partyName);
  //   cartParties!.clear();
  //   if (data.cartParties != null) {
  //     cartParties!.addAll(data.cartParties!);
  //   }
  //   update();
  // }
  //
  // getCartPartyListViaRemark(String remark) async {
  //   CartPartyData data =
  //       await AddProductNetworkManager.getCartPartyListOrderByRemark(remark);
  //   cartParties!.clear();
  //   if (data.cartParties != null) {
  //     cartParties!.addAll(data.cartParties!);
  //   }
  //   update();
  // }
  //
  // getCart(String partyCode, String mobileNo) async {
  //   isLoadingForCart = true;
  //   // update();
  //   ShowCart data = await AddProductNetworkManager.getCart(partyCode, mobileNo);
  //   cartList!.clear();
  //   if (data.design!.isNotEmpty) {
  //     cartList!.addAll(data.design!);
  //     getUpdateValues();
  //   }
  //   isLoadingForCart = false;
  //   update();
  // }
  //
  // getOrderList() async {
  //   UserOrder data = await AddProductNetworkManager.getOrder();
  //   orderList!.clear();
  //   if (data.order!.isNotEmpty) {
  //     orderList!.addAll(data.order!);
  //   }
  //   update();
  // }
  //
  // search(String value) async {
  //   UserOrder data = await AddProductNetworkManager.getOrderByPartyName(value);
  //   orderList!.clear();
  //   if (data.order!.isNotEmpty) {
  //     orderList!.addAll(data.order!);
  //   }
  //   update();
  // }
  //
  // searchViaRemark(String value) async {
  //   UserOrder data = await AddProductNetworkManager.getOrderByRemark(value);
  //   orderList!.clear();
  //   if (data.order!.isNotEmpty) {
  //     orderList!.addAll(data.order!);
  //   }
  //   update();
  // }
  //
  // getOrderDetail(String slNo) async {
  //   isLoadingForOrderDetail = true;
  //   ShowCart data = await AddProductNetworkManager.getOrderDetails(slNo);
  //   orderDetailList!.clear();
  //   if (data.design!.isNotEmpty) {
  //     orderDetailList!.addAll(data.design!);
  //     getUpdateOrderValues();
  //   }
  //   isLoadingForOrderDetail = false;
  //   update();
  // }

  // Future<ScanedBarcodeData> getBarcodeScannedData(String barcode, String qty,
  //     String partyCode, String mobileNo, String remark) async {
  //   isLoadingForScannedItem = true;
  //   update();
  //   String userId =
  //       await preferences.getStringPreference(StringConstants.userId);
  //   ScanedBarcodeData scanedBarcodeData =
  //       await SignupLogInManager.getBarcodeScannedData(barcode);
  //   if (scanedBarcodeData.barcode != null) {
  //     if (int.parse(qty) <=
  //         (int.parse(scanedBarcodeData.barcode!.availableQty!))) {
  //       CommonModel data = await SignupLogInManager.addToCart(
  //           partyCode.toString(),
  //           barcode.toString(),
  //           scanedBarcodeData.barcode!.designCode.toString(),
  //           scanedBarcodeData.barcode!.sizeCode.toString(),
  //           scanedBarcodeData.barcode!.colourCode.toString(),
  //           scanedBarcodeData.barcode!.hSNCode.toString(),
  //           '0',
  //           qty.toString(),
  //           scanedBarcodeData.barcode!.rate.toString(),
  //           (int.parse(qty) *
  //                   double.parse(scanedBarcodeData.barcode!.rate.toString()))
  //               .toString(),
  //           userId.toString(),
  //           mobileNo.toString(),
  //           remark.toString());
  //       if (data.status! == true) {
  //         cartPartyModel = data.message!;
  //         cartPartyStatus = data.status!;
  //       } else {
  //         cartPartyModel = data.message!;
  //         cartPartyStatus = data.status!;
  //       }
  //     } else {
  //       cartPartyModel =
  //           ' Current Stock is :(\t ${scanedBarcodeData.barcode!.availableQty!} )\nPlease enter Valid Quantity';
  //       cartPartyStatus = false;
  //     }
  //   }
  //   isLoadingForScannedItem = false;
  //   update();
  //
  //   return scanedBarcodeData;
  // }
  //
  // addToCart(
  //     {partyCode,
  //     barCode,
  //     designCode,
  //     sizeCode,
  //     colorCode,
  //     hsnCode,
  //     discountCode,
  //     quantity,
  //     rate,
  //     amount,
  //     userId,
  //     mobileNo,
  //     remark}) async {
  //   // String customerCode =
  //   // await preferences.getStringPreference(StringConstants.customerCode);
  //
  //   CommonModel data = await SignupLogInManager.addToCart(
  //       partyCode,
  //       barCode,
  //       designCode,
  //       sizeCode,
  //       colorCode,
  //       hsnCode,
  //       discountCode,
  //       quantity,
  //       rate,
  //       amount,
  //       userId,
  //       mobileNo,
  //       remark);
  //   if (data.status == true) {
  //     // getCartPartyList();
  //   }
  //   update();
  //   return data;
  // }

  // removeCart(partyCode, designCode, sizeCode, colorCode, mobile) async {
  //   // String customerCode =
  //   // await preferences.getStringPreference(StringConstants.customerCode);
  //   // isLoading = true;
  //   // update();
  //   CommonModel data = await SignupLogInManager.removeCart(
  //       partyCode, designCode, sizeCode, colorCode, mobile);
  //   if (data.status == true) {
  //     // await getCart();
  //     // getUpdateValues();
  //   }
  //   // isLoading = false;
  //   // update();
  //   return data;
  // }
  //
  // saveOrderPdf(slNo) async {
  //   isLoading = true;
  //   update();
  //   CommonModel data = await SignupLogInManager.saveOrderPdf(slNo);
  //   if (data.status == true) {
  //     shareOrderPdfToParty();
  //   }
  //   isLoading = false;
  //   update();
  //   return data;
  // }
  //
  // shareOrderPdfToParty() async {
  //   String slNo = await preferences.getStringPreference(StringConstants.slNo);
  //   String vchNo = await preferences.getStringPreference(StringConstants.vchNo);
  //   String partyMobile =
  //       await preferences.getStringPreference(StringConstants.partyMobile);
  //   CommonModel data =
  //       await SignupLogInManager.shareOrderPdfToParty(slNo, vchNo, partyMobile);
  //   if (data.status == true) {
  //     shareOrderPdfToPacker();
  //   }
  //   return data;
  // }
  //
  // Future<CommonModel> shareOrderPdfToPartyViaAdmin(
  //     slNo, vchNo, partyMobile) async {
  //   // String slNo = await preferences.getStringPreference(StringConstants.slNo);
  //   // String vchNo = await preferences.getStringPreference(StringConstants.vchNo);
  //   // String partyMobile =
  //   // await preferences.getStringPreference(StringConstants.partyMobile);
  //   CommonModel data =
  //       await SignupLogInManager.shareOrderPdfToParty(slNo, vchNo, partyMobile);
  //   if (data.status == true) {
  //     // shareOrderPdfToPacker();
  //   }
  //   return data;
  // }
  //
  // shareOrderPdfToPacker() async {
  //   String slNo = await preferences.getStringPreference(StringConstants.slNo);
  //   String vchNo = await preferences.getStringPreference(StringConstants.vchNo);
  //   String packerMobile =
  //       await preferences.getStringPreference(StringConstants.packerMobile);
  //   CommonModel data = await SignupLogInManager.shareOrderPdfToPacker(
  //       slNo, vchNo, packerMobile);
  //   if (data.status == true) {}
  //   return data;
  // }
  //
  // void getUpdateValues() {
  //   int totalQty = 0;
  //   double totalAmt = 0;
  //   for (Design designs in cartList!) {
  //     totalQty = totalQty + int.parse(designs.qty.toString());
  //     totalAmt = totalAmt + double.parse(designs.amount.toString());
  //   }
  //   ttQty = totalQty.toString();
  //   ttAmt = totalAmt.toString();
  //   if (cartList!.isNotEmpty) {
  //     // cart = cartList.length+1;
  //   }
  //   update();
  // }
  //
  // void getUpdateOrderValues() {
  //   int totalQty = 0;
  //   double totalAmt = 0;
  //   for (Design designs in orderDetailList!) {
  //     totalQty = totalQty + int.parse(designs.qty.toString());
  //     totalAmt = totalAmt + double.parse(designs.amount.toString());
  //   }
  //   orderTotalQty = totalQty.toString();
  //   orderTotalAmt = totalAmt.toString();
  //   printableAmt = totalAmt.toInt();
  //
  //   // if (cartList!.isNotEmpty) {
  //   //   // cart = cartList.length+1;
  //   // }
  //   update();
  // }
  //
  // getQrScannedDesigns() {
  //   List<Map<String, dynamic>> designItems = [];
  //   for (var element in cartList!) {
  //     element.discountRate = '0';
  //     element.detSlNo = ((designItems.length) + 1).toString();
  //     designItems.add(element.toBarCodeAddToCartJson());
  //   }
  //   return designItems;
  // }
  //
  // removeQrScannedDesign(int index) {
  //   // int index =
  //   //     addScanDataList.indexWhere((element) => element.barCode == barCode);
  //   addScanDataList.removeAt(index);
  //   update();
  // }
  //
  // void updateQty(int index, String qty) {
  //   addScanDataList[index].qty = qty;
  //   update();
  // }

  // Future<CommonModel> bookOrder(
  //     String partyCode,
  //     String customerCode,
  //     String transportCode,
  //     String booking,
  //     String remark,
  //     String packer,
  //     String receivedAmt,
  //     String mobileNo,
  //     String ttQty,
  //     String ttAmt) async {
  //   isLoading = true;
  //   update();
  //   Map<String, dynamic> bodyMap = {
  //     "PartyCode": partyCode,
  //     "CustomerCode": customerCode,
  //     "TransportCode": transportCode,
  //     "Booking": booking,
  //     "Qty": ttQty,
  //     "Amount": ttAmt,
  //     "Remark": remark,
  //     "PackerName": packer,
  //     "advance": receivedAmt,
  //     "MobileNo": mobileNo,
  //     "Design": getQrScannedDesigns(),
  //   };
  //   CommonModel model = await AddProductNetworkManager.bookOrder(bodyMap);
  //   isLoading = false;
  //   update();
  //   return model;
  // }
  //
  // removeAllScannedData() {
  //   addScanDataList.clear();
  //   update();
  // }
  //
  // Future<ScanedBarcodeData> getBarcodeScannedDataDetail(barcode) async {
  //   ScanedBarcodeData scanedBarcodeData =
  //       await SignupLogInManager.getBarcodeScannedData(barcode);
  //   // if (scanedBarcodeData.barcode != null) {}
  //   update();
  //   return scanedBarcodeData;
  // }
}
