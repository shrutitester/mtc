
import '../constants/stringConstants.dart';
import '../model/user-data.dart';
import '../utils/api-helper.dart';

class SignupLogInManager {
  static Future<UserData> signIn(
      username, password) async {
    UserData? model;
    Map<String, dynamic> bodyMap = {
      'username': username,
      'password': password,
      // 'TokenKey': firebaseToken,
    };
    Map<String, dynamic> returnMap = await ApiHelper.hitApi(
        api: 'login/login',
        callType: StringConstants.postCall,
        fieldsMap: bodyMap);
    if (returnMap.containsKey('exception')) {
      model = UserData();
      model.status = false;
      model.message = returnMap['exception'];
      return model;
    } else if (returnMap.containsKey('statusCode')) {
      model = UserData();
      model.status = false;
      model.message = returnMap['error'];
      return model;
    } else {
      model = UserData.fromJson(returnMap['body']);
      return model;
    }
  }

  // static Future<ScanedBarcodeData> getBarcodeScannedData(
  //     barcode) async {
  //   ScanedBarcodeData? scanedBarcodeData;
  //   Map<String, dynamic> bodyMap = {
  //     'barcode': barcode,
  //   };
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'sale/decodebarcode',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //
  //   if (returnMap.containsKey('exception')) {
  //     scanedBarcodeData = ScanedBarcodeData();
  //     scanedBarcodeData.status = false;
  //     scanedBarcodeData.message = returnMap['exception'];
  //     return scanedBarcodeData;
  //   } else if (returnMap.containsKey('statusCode')) {
  //     scanedBarcodeData = ScanedBarcodeData();
  //     scanedBarcodeData.status = false;
  //     scanedBarcodeData.message = returnMap['error'];
  //     return scanedBarcodeData;
  //   } else {
  //     scanedBarcodeData = ScanedBarcodeData.fromJson(returnMap['body']);
  //     return scanedBarcodeData;
  //   }
  // }

  // static Future<CommonModel> addToCart(
  //     partyCode,
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
  //     remark) async {
  //   CommonModel? model;
  //   AppPreferences preferences = AppPreferences();
  //   String userCode =
  //       await preferences.getStringPreference(StringConstants.userId);
  //   Map<String, dynamic> bodyMap = {
  //     'partyCode': partyCode,
  //     'Barcode': barCode,
  //     'designCode': designCode,
  //     'SizeCode': sizeCode,
  //     'ColourCode': colorCode,
  //     'HSNCode': hsnCode,
  //     'DiscountRate': '0',
  //     'qty': quantity,
  //     'rate': rate,
  //     'amount': amount,
  //     'UserID': userCode,
  //     'MobileNo': mobileNo,
  //     'remark': remark
  //   };
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'CART/addToCart',
  //       callType: StringConstants.postCall,
  //       fieldsMap: bodyMap);
  //   // debugPrint('cart response$bodyMap');
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
  //     model = CommonModel();
  //     model = CommonModel.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }

  // static Future<CommonModel> removeCart(
  //     partyCode, designCode, sizeCode, colorCode, mobile) async {
  //   CommonModel? model;
  //   Map<String, dynamic> bodyMap = {
  //     'PartyCode': partyCode,
  //     'DesignCode': designCode,
  //     'SizeCode': sizeCode,
  //     'ColourCode': colorCode,
  //     'MobileNo': mobile
  //   };
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'CART/removefromcart',
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
  //     model = CommonModel();
  //     model = CommonModel.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }

  // static Future<CommonModel> saveOrderPdf(
  //     slNo) async {
  //   CommonModel? model;
  //   Map<String, dynamic> bodyMap = {'SlNo': slNo};
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'ORDER/SaveOrderPdf',
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
  //     model = CommonModel();
  //     model = CommonModel.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }

  // static Future<CommonModel> shareOrderPdfToParty(
  //     slNo, vchNo, mobileNo) async {
  //   CommonModel? model;
  //   Map<String, dynamic> bodyMap = {
  //     'SlNo': slNo,
  //     'VchNo': vchNo,
  //     'MobileNo': mobileNo,
  //     'order': 'Y',
  //   };
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'ORDER/ShareOrderPdf',
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
  //     model = CommonModel();
  //     model = CommonModel.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }

  // static Future<CommonModel> shareOrderPdfToPacker(
  //     slNo, vchNo, mobileNo) async {
  //   CommonModel? model;
  //   Map<String, dynamic> bodyMap = {
  //     'SlNo': slNo,
  //     'VchNo': vchNo,
  //     'MobileNo': mobileNo,
  //     'order': 'Y',
  //   };
  //   Map<String, dynamic> returnMap = await ApiHelper.hitApi(
  //       api: 'ORDER/ShareOrderPdf',
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
  //     model = CommonModel();
  //     model = CommonModel.fromJson(returnMap['body']);
  //     return model;
  //   }
  // }
}
