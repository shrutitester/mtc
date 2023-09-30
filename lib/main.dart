import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils/lot-of-themes.dart';
import 'package:myapp/widgets/splashScreen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/colorConstants.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: ColorConstants.primaryColor,
          secondaryHeaderColor: ColorConstants.primaryColor,
          appBarTheme: AppBarTheme(color: ColorConstants.primaryColor),
          textTheme: TextTheme(
            headline1: GoogleFonts.robotoMono(
              textStyle: LotOfThemes.heading1,
            ),
            headline2: GoogleFonts.robotoMono(
              textStyle: LotOfThemes.heading2,
            ),
            headline3: GoogleFonts.robotoMono(
              textStyle: LotOfThemes.heading3,
            ),
            headline4: GoogleFonts.robotoMono(
              textStyle: LotOfThemes.heading4,
            ),
          ),
        ),
        // ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        //   useMaterial3: true,
        // ),
        home:  const SplashScreen(),
      )
    );
  }
}


