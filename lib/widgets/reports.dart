import 'package:flutter/material.dart';
import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/constants/stringConstants.dart';
import 'package:myapp/widgets/stock/agencyStock.dart';
import 'package:myapp/widgets/discountPrinting.dart';
import 'package:myapp/widgets/pendingAgencyVisitLimit.dart';
import 'package:myapp/widgets/pendingCreditLimit.dart';
import 'package:myapp/widgets/pendingOrder/pendingOrder.dart';
import 'package:myapp/widgets/saleData/saleData.dart';
import 'package:myapp/widgets/saleReport.dart';
import 'package:get/get.dart';

import 'creditLimit/creditLimitStatus.dart';
import 'ledger.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ColorConstants.mainBgColor,
            size: 22,
          ),
        ),
        title: Text(
          StringConstants.reports,
          style: TextStyle(color: ColorConstants.mainBgColor, fontSize: 22),
        ),
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
                      Get.to(const Ledger());
                    },
                    child: SizedBox(
                      width: 156,
                      height: 140,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/guestArrival.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              StringConstants.ledger,
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
                      Get.to(const CreditLimitStatus());
                    },
                    child: SizedBox(
                      width: 156,
                      height: 140,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/guestArrival.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              StringConstants.creditLimtStatus,
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
                      Get.to(const PendingOrder());
                    },
                    child: SizedBox(
                      width: 156,
                      height: 140,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/guestArrival.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              StringConstants.pendingOrder,
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
                      Get.to(const AgencyStock());
                    },
                    child: SizedBox(
                      width: 156,
                      height: 140,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/guestArrival.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              StringConstants.agencyStock,
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
                      Get.to(const PendingAgencyVisitLimit());
                    },
                    child: SizedBox(
                      width: 156,
                      height: 140,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/guestArrival.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              StringConstants.pendingAgencyVisitLimit,
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
                      Get.to(const PendingCreditLimit());
                    },
                    child: SizedBox(
                      width: 156,
                      height: 140,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/guestArrival.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              StringConstants.pendingCreditLimit,
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
                      Get.to(const SaleReport());
                    },
                    child: SizedBox(
                      width: 156,
                      height: 140,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/salesreport.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              StringConstants.saleReport,
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
                      Get.to( const DiscountPrinting());
                    },
                    child: SizedBox(
                      width: 156,
                      height: 140,
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/guestArrival.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              StringConstants.discountPrinting,
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
                    Get.to(const SaleData());
                  },
                  child: InkWell(
                    child: SizedBox(
                      height: 142,
                      width: 172,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/salesreport.png'),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              StringConstants.saleData,
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
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
}
