import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/widgets/addContactPerson.dart';
import 'package:myapp/widgets/addVisit.dart';
import 'package:myapp/widgets/guestArrival.dart';
import 'package:myapp/widgets/loginScreen.dart';
import 'package:myapp/widgets/newOrder.dart';
import 'package:myapp/widgets/orderStatus/orderStatus.dart';
import 'package:myapp/widgets/reports.dart';
import 'package:myapp/widgets/status/visitStatus.dart';

import '../constants/stringConstants.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen( {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        title: Text(
          StringConstants.myApp,
          style: TextStyle(color: ColorConstants.mainBgColor),
        ),
        actions: [
          IconButton(
              onPressed: () => _dialogBuilder(context),
              icon: Icon(
                Icons.power_settings_new,
                color: ColorConstants.mainBgColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Get.to(const OrderStatus());
                    },
                    child: SizedBox(
                      width: 156.w,
                      height: 140.h,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/guestArrival.png'),
                             SizedBox(
                              height: 10.h,
                            ),
                            const Text(
                              StringConstants.orderStatus,
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Get.to(const NewOrder());
                    },
                    child: SizedBox(
                      width: 156.w,
                      height: 140.h,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/guestArrival.png'),
                             SizedBox(
                              height: 10.h,
                            ),
                            const Text(
                              StringConstants.newOrder,
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Get.to(const AddVisit());
                    },
                    child: SizedBox(
                      width: 156.w,
                      height: 140.h,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/guestArrival.png'),
                             SizedBox(
                              height: 10.h,
                            ),
                            const Text(
                              StringConstants.addVisit,
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Get.to(const VisitStatus());
                    },
                    child: SizedBox(
                      width: 156.w,
                      height: 140.h,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/guestArrival.png'),
                             SizedBox(
                              height: 10.h,
                            ),
                            const Text(
                              StringConstants.visitStatus,
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Get.to(const Reports());
                    },
                    child: SizedBox(
                      width: 156.w,
                      height: 140.h,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/guestArrival.png'),
                             SizedBox(
                              height: 10.h,
                            ),
                            const Text(
                              StringConstants.reports,
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Get.to(const AddContactPerson());
                    },
                    child: SizedBox(
                      width: 156.w,
                      height: 140.h,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/guestArrival.png'),
                             SizedBox(
                              height: 10.h,
                            ),
                            const Text(
                              StringConstants.addContactPerson,
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                child: InkWell(
                  onTap: () {
                    Get.to(const GuestArrival());
                  },
                  child: SizedBox(
                    height: 142.h,
                    width: 172.w,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/guestArrival.png'),
                           SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            StringConstants.guestArrival,
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            title: const Text(StringConstants.alert),
            content: const Text(StringConstants.areYouSureToLogout),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(StringConstants.cancel)),
              TextButton(
                  onPressed: () {
                    Get.to(const LoginScreen());
                  },
                  child: const Text(StringConstants.yes)),
            ],
          );
        });
  }
  // gridItems(List<CardData> list){
  //   return List<Widget>.generate(list.length, (index){
  //     return getGridItem(list[index]);
  //   });
  // }
}
