import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/user-controller.dart';
import 'package:myapp/widgets/homeScreen.dart';

import '../constants/stringConstants.dart';
import '../controller/add-product-controller.dart';
import '../utils/preferences.dart';
import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserController userController= Get.put(UserController());
  AddProductController productController = Get.put(AddProductController());

  @override
  void initState() {
    super.initState();
    _timerNavigate();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/Splashscreen.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  void _timerNavigate() async {
    Future.delayed(const Duration(seconds: 3), () async {
      AppPreferences preferences = AppPreferences();
      String isLogin =
          await preferences.getStringPreference(StringConstants.isLogin);
     if(isLogin != 'isLogin'){
      Get.off(() =>  const HomeScreen());
     } else {
       Get.off(() => const LoginScreen());
     }
    });
  }
}
