import 'package:flutter/material.dart';

import '../constants/colorConstants.dart';
import '../constants/stringConstants.dart';

class ThemeHelper {
  InputDecoration textInputDecoration(
      [String? lableText,
      String? hintText,
      IconData? prefixIcon,
      IconData? suffixIcon,
      bool? hasFocus]) {
    return InputDecoration(
      labelText: lableText,
      labelStyle: hasFocus != null && hasFocus
          ? const TextStyle(color: Colors.blue)
          : null,

      hintText: hintText,
      errorMaxLines: 4,
      counter: const SizedBox.shrink(),
      fillColor: Colors.white,
      filled: true,
      // ignore: prefer_const_constructors
      errorStyle: hasFocus != null && hasFocus
          ? const TextStyle(fontSize: 0, height: 0)
          : const TextStyle(
              backgroundColor: Colors.yellow,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
      //   errorStyle: const TextStyle(
      //   backgroundColor: Colors.yellow,
      //   color: Colors.black87,
      //   fontWeight: FontWeight.bold,
      //   fontSize: 13,
      // ),
      prefixIcon: prefixIcon != null
          ? Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Icon(prefixIcon, size: 20),
            )
          : null,
      suffixIcon: suffixIcon != null
          ? Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Icon(suffixIcon, size: 20),
              // child: Icon(
              //   Icons.remove_red_eye,
              // ),
            )
          : null,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      // isDense: true,
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.grey.shade400)),
      errorBorder: hasFocus != null && hasFocus
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.grey))
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.0)),
      focusedErrorBorder: hasFocus != null && hasFocus
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.grey))
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.0)),
    );
  }

  InputDecoration textInputDecorationWithCounter([
    String? lableText,
    String? hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool? hasFocus,
  ]) {
    return InputDecoration(
      labelText: lableText,
      labelStyle: hasFocus != null && hasFocus
          ? const TextStyle(color: Colors.blue)
          : null,

      hintText: hintText,
      errorMaxLines: 4,
      // counter: const SizedBox.shrink(),
      fillColor: Colors.white,
      filled: true,
      // ignore: prefer_const_constructors
      errorStyle: hasFocus != null && hasFocus
          ? const TextStyle(fontSize: 0, height: 0)
          : const TextStyle(
              backgroundColor: Colors.yellow,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
      //   errorStyle: const TextStyle(
      //   backgroundColor: Colors.yellow,
      //   color: Colors.black87,
      //   fontWeight: FontWeight.bold,
      //   fontSize: 13,
      // ),
      prefixIcon: prefixIcon != null
          ? Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Icon(prefixIcon, size: 20),
            )
          : null,
      suffixIcon: suffixIcon != null
          ? Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Icon(suffixIcon, size: 20),
              // child: Icon(
              //   Icons.remove_red_eye,
              // ),
            )
          : null,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.grey.shade400)),
      errorBorder: hasFocus != null && hasFocus
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.grey))
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.0)),
      focusedErrorBorder: hasFocus != null && hasFocus
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.grey))
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.0)),
    );
  }

  InputDecoration genderInputDecoration(
      [String lableText = "",
      String hintText = "",
      String? prefixIcon,
      String? suffixIcon,
      bool? hasFocus]) {
    return InputDecoration(
      labelText: lableText,
      labelStyle: hasFocus != null && hasFocus
          ? const TextStyle(color: Colors.blue)
          : null,

      hintText: hintText,
      errorMaxLines: 4,
      counter: const SizedBox.shrink(),
      fillColor: Colors.white,
      filled: true,
      // ignore: prefer_const_constructors
      errorStyle: hasFocus != null && hasFocus
          ? const TextStyle(fontSize: 0, height: 0)
          : const TextStyle(
              // backgroundColor: Colors.yellow,
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontFamily: StringConstants.gilroyFontFamily,
              fontSize: 14,
            ),
      //   errorStyle: const TextStyle(
      //   backgroundColor: Colors.yellow,
      //   color: Colors.black87,
      //   fontWeight: FontWeight.bold,
      //   fontSize: 13,
      // ),
      prefixIcon: prefixIcon != null
          ? Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Image.asset(
                '$prefixIcon',
                width: 24,
                height: 24,
                color: Colors.grey,
                fit: BoxFit.fill,
              ),
            )
          : null,
      suffixIcon: suffixIcon != null
          ? Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Image.asset(
                '$suffixIcon',
                width: 24,
                height: 24,
                color: Colors.grey,
                fit: BoxFit.fill,
              ),
            )
          : null,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Colors.grey)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.grey.shade400)),
      errorBorder: hasFocus != null && hasFocus
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.grey))
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.0)),
      focusedErrorBorder: hasFocus != null && hasFocus
          ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.grey))
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.0)),
    );
  }

  BoxDecoration inputBoxDecorationShaddow() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]);
  }

  BoxDecoration buttonBoxDecoration(BuildContext context,
      [String color1 = "", String color2 = ""]) {
    Color c1 = Theme.of(context).primaryColor;
    Color c2 = Theme.of(context).colorScheme.secondary;
    if (color1.isEmpty == false) {
      // c1 = HexColor(color1);
    }
    if (color2.isEmpty == false) {
      // c2 = HexColor(color2);
    }

    return BoxDecoration(
      // ignore: prefer_const_literals_to_create_immutables
      boxShadow: [
        const BoxShadow(
            color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 1.0],
        colors: [
          c1,
          c2,
        ],
      ),
      color: Colors.deepPurple.shade300,
      borderRadius: BorderRadius.circular(30),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(const Size(60, 40)),
      backgroundColor: MaterialStateProperty.all(ColorConstants.primaryColor),
      // backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  AlertDialog alartDialog(String title, String content, BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black38)),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
