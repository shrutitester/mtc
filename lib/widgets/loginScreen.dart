import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/roundButton.dart';
import '../component/roundedInputField.dart';
import '../constants/colorConstants.dart';
import '../constants/stringConstants.dart';
import '../controller/user-controller.dart';
import '../utils/lot-of-themes.dart';
import '../utils/preferences.dart';
import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final preferences = AppPreferences();
  final formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  String password = '';
  String userName = '';
  String _isShowPass = 'Password';
  final UserController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Splashscreen.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    RoundedInputField(
                      prefixIcon: const Icon(Icons.person),
                      label: 'User Name',
                      // hintText: 'User Name',
                      maxLength: 24,
                      counterText: "",
                      textinputAction: TextInputAction.next,
                      onChanged: (value) {
                        _controller.updateUserName(value);
                        userName = value;
                      },
                      type: StringConstants.username,
                      keyboardType: TextInputType.text,
                    ),
                    LotOfThemes.heightMargin(10.0),
                    RoundedInputField(
                      prefixIcon: const Icon(Icons.lock),
                      label: 'Password',
                      maxLength: 24,
                      counterText: "",
                      textinputAction: TextInputAction.done,
                      onChanged: (value) {
                        _controller.updatePassword(value);
                        password = value;
                      },
                      obscureText: _isObscure,
                      suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                              _isObscure == true
                                  ? _isShowPass = 'Password'
                                  : _isShowPass = 'InVisible';
                            });
                          }),
                      type: _isShowPass,
                    ),
                    LotOfThemes.heightMargin(10.0),
                    SizedBox(
                        height: 50,
                        // width: MediaQuery.of(context).size.width,
                        child:
                        //     GetBuilder<UserController>(
                        //         builder: (controller) {
                        //   return
                        RoundedButton(
                                                  isLoading: _controller.isLoading,
                                                  text: StringConstants.submit,
                                                  btnColor: ColorConstants.primaryColor,
                                                  btnWidth: 300,
                                                  press: () =>
                                                onSubmit(),
                      //                         )
                      //                         ;
                        // })
                    ) )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onSubmit() async {
    if (formKey.currentState?.validate() == true) {
      if (userName.toString() == '') {
        Get.snackbar("Alert!", 'Please enter User Name',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black54,
            colorText: Colors.white);
        return;
      }
      if (password.toString() == '') {
        Get.snackbar("Alert!", 'Please enter Password',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black54,
            colorText: Colors.white);
        return;
      }
      String result = await _controller.signIn();
      if (result == "true") {
        preferences.setStringPreference(StringConstants.isLogin, 'isLogin');
        Get.off(const HomeScreen());
      } else {
        Get.snackbar("Error!", result,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black54,
            colorText: Colors.white);
      }
    }
  }
}
