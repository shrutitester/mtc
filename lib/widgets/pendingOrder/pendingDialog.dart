import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myapp/widgets/pendingOrder/remarkDialog.dart';

import '../../constants/colorConstants.dart';
import '../../constants/stringConstants.dart';
import '../../model/showAgencyStock.dart';
import '../../utils/lot-of-themes.dart';

class PendingDialog extends StatefulWidget {
  final Orders orders;
  const PendingDialog(this.orders);

  @override
  State<PendingDialog> createState() => _PendingDialogState();
}

class _PendingDialogState extends State<PendingDialog> {
  Widget marginBottom() => const Padding(padding: EdgeInsets.only(bottom: 4));

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: ColorConstants.primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          )),
      child: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: ColorConstants.primaryColor,
                padding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(const RemarkDialog());
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 16),
                          decoration: BoxDecoration(
                              color: ColorConstants.blackColor,
                              border: Border.all(
                                color: ColorConstants.blackColor,
                              ),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                          child: Row(
                            children: [
                              const Icon(Icons.download_rounded,
                                  size: 16, color: Colors.white),
                              // Text(
                              //   " Download Pdf",
                              //   style: LotOfThemes.textBold(Colors.white, 12),
                              // ),
                            ],
                          )),
                    ),
                    InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(Icons.cancel, color: Colors.white))
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.vchNo)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.vchNo ??'')),
                        SizedBox(
                            width: 70, child: LotOfThemes.smallHeading1(StringConstants.dispatchDate)),
                        Expanded(
                            child: LotOfThemes.smallTxt1(widget?.orders?.vchDate?.replaceRange(9, 21, ' ')??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.orderDate)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.deliveryDate?.replaceRange(9, 21, ' ') ??'')),
                        SizedBox(
                            width: 70,
                            child: LotOfThemes.smallHeading1(StringConstants.orderNo)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.orderNo??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.customer)),
                        Expanded(
                            child: LotOfThemes.smallTxt1(widget?.orders?.customerName??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.supplier)),
                        Expanded(
                            child: LotOfThemes.smallTxt1(widget?.orders?.supplierName??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100, child: LotOfThemes.smallHeading1(StringConstants.pcs)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.pcs ??'')),
                        SizedBox(
                            width: 70,
                            child: LotOfThemes.smallHeading1(StringConstants.cases)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.noOfCases??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.storeName)),
                        Expanded(
                            child: LotOfThemes.smallTxt1(widget?.orders?.orderFormNo??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.partyName)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.partyName??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.cashPartyName)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.cashPartyName??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.orderMode)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.method??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.transport)),
                        Expanded(
                            child: LotOfThemes.smallTxt1(widget?.orders?.transportName??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.dispatchDays)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.dispatchDays??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.booking)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.booking??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.itemRemark)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.detailRemark??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.customerFirm)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.customerFirmName??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.shippingFirm)),
                        Expanded(
                            child: LotOfThemes.smallTxt1(widget?.orders?.shippingFirmName??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.styleCategory)),
                        Expanded(
                            child:
                            LotOfThemes.smallTxt1(widget?.orders?.styleCategoryName??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.salesman)),
                        Expanded(
                            child:
                            LotOfThemes.smallTxt1(widget?.orders?.salesmanName ??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100, child: LotOfThemes.smallHeading1(StringConstants.billingType)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.billingType??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.billingDays)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.billingPercentage??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.amt)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.amount??'')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.dispatchRemark)),
                        Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.dispatchRemark??'')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
