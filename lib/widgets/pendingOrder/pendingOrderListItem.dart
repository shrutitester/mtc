import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/widgets/pendingOrder/pendingDialog.dart';

import '../../constants/stringConstants.dart';
import '../../model/showAgencyStock.dart';
import '../../utils/lot-of-themes.dart';

class PendingOrderListItem extends StatefulWidget {
  final Orders orders;
  const PendingOrderListItem(this.orders, {super.key});

  @override
  State<PendingOrderListItem> createState() => _PendingOrderListItemState();
}

class _PendingOrderListItemState extends State<PendingOrderListItem> {
  Widget marginBottom() => const Padding(padding: EdgeInsets.only(bottom: 6));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.bottomSheet(PendingDialog(widget.orders));
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
                  Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.vchNo ?? '')),
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.dispatchDate),),
                  Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.vchDate?.replaceRange(9, 20, ' ') ?? '')),
                ],
              ),
              marginBottom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.orderDate),),
                  Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.deliveryDate?.replaceRange(9, 20, ' ') ?? '')),
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.orderNo),),
                  Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.orderNo?? '')),
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
                      child: LotOfThemes.smallTxt1(widget?.orders?.customerName ?? '')),
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
                      child: LotOfThemes.smallTxt1(widget?.orders?.supplierName ?? '')),
                ],
              ),
              marginBottom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.pcs),),
                  Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.pcs ?? '')),
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.cases),),
                  Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.noOfCases?? '')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
