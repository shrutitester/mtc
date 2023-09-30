import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/model/showAgencyStock.dart';
import 'package:myapp/utils/lot-of-themes.dart';
import 'package:myapp/widgets/stock/stockDialog.dart';

import '../../constants/stringConstants.dart';

class StockListItem extends StatefulWidget {
  final Orders orders;
  const StockListItem(this.orders, {Key? key}) : super(key: key);

  @override
  State<StockListItem> createState() => _StockListItemState();
}

class _StockListItemState extends State<StockListItem> {
  Widget marginBottom() => const Padding(padding: EdgeInsets.only(bottom: 4));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.bottomSheet(StockDialog(widget.orders));
      },
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.vchNo),),
                  Expanded(child: LotOfThemes.smallTxt1(widget.orders.vchNo ?? '')),
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.dispatchDate),),
                  Expanded(child: LotOfThemes.smallTxt1(widget.orders.vchDate?.replaceRange(9, 20, ' ') ?? '')),
                ],
              ),
              marginBottom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.orderDate),),
                  Expanded(child: LotOfThemes.smallTxt1('VchNo')),
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.orderNo),),
                  Expanded(child: LotOfThemes.smallTxt1(widget.orders.orderNo?? '')),
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
                      child: LotOfThemes.smallTxt1(widget.orders.customerName ?? '')),
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
                      child: LotOfThemes.smallTxt1(widget.orders.supplierName ?? '')),
                ],
              ),
              marginBottom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.pcs),),
                  Expanded(child: LotOfThemes.smallTxt1(widget.orders.pcs ?? '')),
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.cases),),
                  Expanded(child: LotOfThemes.smallTxt1(widget.orders.noOfCases?? '')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
