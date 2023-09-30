import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/widgets/status/statusDialog.dart';

import '../../constants/stringConstants.dart';
import '../../model/listAgencyVisits.dart';
import '../../utils/lot-of-themes.dart';

class VisitStatusListItem extends StatefulWidget {
  final AgencyVisits agencyVisits;
  const VisitStatusListItem(this.agencyVisits, {Key? key}) : super(key: key);

  @override
  State<VisitStatusListItem> createState() => _VisitStatusListItemState();
}

class _VisitStatusListItemState extends State<VisitStatusListItem> {
  Widget marginBottom() => const Padding(padding: EdgeInsets.only(bottom: 4));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.bottomSheet(StatusDialog(widget.agencyVisits));
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.visitDate),),
                  Expanded(child: LotOfThemes.smallTxt1(widget.agencyVisits.vchDate?.replaceRange(10, 21, ' ')?? '')),
                  SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.closeDate),),
                  Expanded(child: LotOfThemes.smallTxt1(widget.agencyVisits.dueDate?.replaceRange(10, 21, '')?? '')),
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
                      child: LotOfThemes.smallTxt1(widget.agencyVisits.accountName?? '')),
                ],
              ),
              marginBottom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 100,
                      child: LotOfThemes.smallHeading1(StringConstants.partyName)),
                  Expanded(
                      child: LotOfThemes.smallTxt1(widget.agencyVisits.partyName?? '')),
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
                      child: LotOfThemes.smallTxt1(widget.agencyVisits.salesmanName?? '')),
                ],
              ),
              marginBottom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 100,
                      child: LotOfThemes.smallHeading1(StringConstants.graceAmount)),
                  Expanded(
                      child: LotOfThemes.smallTxt1(widget.agencyVisits.amount?? '')),
                ],
              ),
              marginBottom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 100,
                      child: LotOfThemes.smallHeading1(StringConstants.creditLimit)),
                  Expanded(
                      child: LotOfThemes.smallTxt1(widget.agencyVisits.creditLimit?? '')),
                ],
              ),
              marginBottom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 100,
                      child: LotOfThemes.smallHeading1(StringConstants.visitName)),
                  Expanded(
                      child: LotOfThemes.smallTxt1(widget.agencyVisits.agencyVisitName?? '')),
                ],
              ),
              marginBottom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 100,
                      child: LotOfThemes.smallHeading1(StringConstants.dueDays)),
                  Expanded(
                      child: LotOfThemes.smallTxt1(widget.agencyVisits.dueDays?? '')),
                ],
              ),
              marginBottom(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 100,
                      child: LotOfThemes.smallHeading1(StringConstants.billingOption)),
                  Expanded(
                      child: LotOfThemes.smallTxt1(widget.agencyVisits.agencyBillingTypeNameList?? '')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
