import 'package:flutter/material.dart';

import '../../constants/stringConstants.dart';
import '../../model/showAgencyStock.dart';
import '../../utils/lot-of-themes.dart';

class OrderStatusListItem extends StatefulWidget {
  final Orders orders;
  const OrderStatusListItem(this.orders, {super.key});

  @override
  State<OrderStatusListItem> createState() => _OrderStatusListItemState();
}

class _OrderStatusListItemState extends State<OrderStatusListItem> {
  Widget marginBottom() => const Padding(padding: EdgeInsets.only(bottom: 4));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.vchNo),),
                  Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.vchNo ?? '')),
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.dispatchDate),),
                  Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.dispatchDays ?? '')),
                ],
              ),
              marginBottom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.orderDate),),
                  Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.orderFormNo ?? '')),
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.orderNo),),
                  Expanded(child: LotOfThemes.smallTxt1(widget?.orders?.orderNo?? '')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
