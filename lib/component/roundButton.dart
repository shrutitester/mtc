import 'package:flutter/material.dart';

import '../constants/colorConstants.dart';
import '../utils/lot-of-themes.dart';

class RoundedButton extends StatelessWidget {
  final double? btnWidth;
  final String? text;
  final Function? press;
  final Color? textColor;
  final Color? btnColor;
  final bool? isLoading;
  final double? height;

  const RoundedButton({
    Key? key,
    this.text,
    this.btnColor,
    this.btnWidth,
    this.press,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.height = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: myBoxDecoration(),
      width: btnWidth,
      height: height,
      child: isLoading == true
          ? Center(
              child: Text(
                "Loading ...",
                textAlign: TextAlign.center,
                style: LotOfThemes.googleFont(
                    style: LotOfThemes.txt14(ColorConstants.white)),
              ),
            )
          : InkWell(
              onTap: () {
                press!();
              },
              child: Center(
                child: Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: LotOfThemes.googleFont(
                      style: LotOfThemes.txt14(ColorConstants.white)),
                ),
              ),
            ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: btnColor ?? ColorConstants.primaryColor,
      border: Border.all(
        color: btnColor ?? ColorConstants.primaryColor,
        width: 1, //                   <--- border width here
      ),
    );
  }
}
