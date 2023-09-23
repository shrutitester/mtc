import 'package:flutter/material.dart';

import '../../constants/colorConstants.dart';
import '../../constants/stringConstants.dart';
import '../../model/showSaleBills.dart';
import '../../utils/lot-of-themes.dart';

class SaleDataDialog extends StatefulWidget {
  final Bills bills;
  const SaleDataDialog(this.bills, {super.key});

  @override
  State<SaleDataDialog> createState() => _SaleDataDialogState();
}

class _SaleDataDialogState extends State<SaleDataDialog> {
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
                    Container(
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
                            // const Icon(Icons.download_rounded,
                            //     size: 16, color: Colors.white),
                            Text(
                              " Pdf ",
                              style: LotOfThemes.textBold(Colors.white, 12),
                            ),
                          ],
                        )),
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.vchNo),),
                        Expanded(child: LotOfThemes.smallTxt1(widget.bills.vchNo ?? '')),
                        SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.vchDate),),
                        Expanded(child: LotOfThemes.smallTxt1(widget.bills.vchDate?.replaceRange(9, 20, ' ')??''))
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.accountName)),
                        Expanded(
                            child: LotOfThemes.smallTxt1(widget.bills.accountName ?? '')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.type),),
                        Expanded(child: LotOfThemes.smallTxt1(widget.bills.type ?? '')),
                        SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.billNo),),
                        Expanded(child: LotOfThemes.smallTxt1(widget.bills.billNo??''))
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.rateType)),
                        Expanded(
                            child: LotOfThemes.smallTxt1(widget.bills.rateType ?? '')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.qty),),
                        Expanded(child: LotOfThemes.smallTxt1(widget.bills.qty ?? '')),
                        SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.amount),),
                        Expanded(child: LotOfThemes.smallTxt1(widget.bills.amount??''))
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.customerFirmName)),
                        Expanded(
                            child: LotOfThemes.smallTxt1(widget.bills.customerFirmName ?? '')),
                      ],
                    ),
                    marginBottom(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: LotOfThemes.smallHeading1(StringConstants.ownFirmName)),
                        Expanded(
                            child: LotOfThemes.smallTxt1(widget.bills.ownFirmName ?? '')),
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
