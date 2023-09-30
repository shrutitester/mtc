import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/utils/lot-of-themes.dart';
import 'package:myapp/widgets/saleData/saleDataDialog.dart';

import '../../constants/stringConstants.dart';
import '../../model/showSaleBills.dart';

class SaleDataListItem extends StatefulWidget {
  final Bills bills;
  const SaleDataListItem(this.bills, {super.key});

  @override
  State<SaleDataListItem> createState() => _SaleDataListItemState();
}

class _SaleDataListItemState extends State<SaleDataListItem> {
  Widget marginBottom() => const Padding(padding: EdgeInsets.only(bottom: 6));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.bottomSheet(SaleDataDialog(widget.bills));
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
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

            ],
          ),
        ),
      ),
    );
  }
}
