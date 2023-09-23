import 'package:get/get.dart';
import '../constants/stringConstants.dart';
import '../model/user-data.dart';
import '../repository/signup-logIn-manager.dart';
import '../utils/preferences.dart';

class UserController extends GetxController {
  String? userName;
  String? password;
  bool? isLoading = false;
  UserData? userModel;
  AppPreferences preferences = AppPreferences();
  updateUserName(value) {
    userName = value;
    update();
  }

  updatePassword(value) {
    password = value;
    update();
  }

// for signing
  Future<String> signIn() async {
    isLoading = true;
    update();
    userModel = await SignupLogInManager.signIn(userName, password);
    if (userModel!.customer != null) {
      String userId = userModel!.customer!.userID!;
      preferences.setStringPreference(StringConstants.userId, userId);
      isLoading = false;
      update();
      return "true";
    }else{
      isLoading = false;
      update();
    }
    // update();
    return userModel!.message!;
  }
}
