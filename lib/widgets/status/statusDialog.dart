import 'package:flutter/material.dart';
import 'package:myapp/constants/colorConstants.dart';
import 'package:get/get.dart';
import 'package:myapp/widgets/status/updateAgency.dart';
import '../../constants/stringConstants.dart';
import '../../model/listAgencyVisits.dart';
import '../../utils/lot-of-themes.dart';

class StatusDialog extends StatefulWidget {
  final AgencyVisits agencyVisits;
  const StatusDialog(this.agencyVisits, {super.key});

  @override
  State<StatusDialog> createState() => _StatusDialogState();
}

class _StatusDialogState extends State<StatusDialog> {
  Widget marginBottom() => const Padding(padding: EdgeInsets.only(bottom: 4));

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor,
        borderRadius:  const BorderRadius.only(
        topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        )),
     child: Material(
       child: SingleChildScrollView(
         child: Column(
           children: [
             Container(
               color: ColorConstants.primaryColor,
               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   InkWell(
                     onTap: (){
                       Get.to(const UpdateAgency());
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
                             // const Icon(Icons.download_rounded,
                             //     size: 16, color: Colors.white),
                             Text(
                               StringConstants.edit,
                               style: LotOfThemes.textBold(Colors.white, 12),
                             ),
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
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.visitDate),),
                       Expanded(child: LotOfThemes.smallTxt1(widget.agencyVisits.vchDate?? '')),
                       SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.closeDate),),
                       Expanded(child: LotOfThemes.smallTxt1(widget.agencyVisits.dueDate?? '')),
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
                   marginBottom(),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       SizedBox(
                           width: 100,
                           child: LotOfThemes.smallHeading1(StringConstants.ownFirm)),
                       Expanded(
                           child: LotOfThemes.smallTxt1(widget.agencyVisits.ownFirmName?? '')),
                     ],
                   ),
                   marginBottom(),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       SizedBox(
                           width: 100,
                           child: LotOfThemes.smallHeading1(StringConstants.customerFirm)),
                       Expanded(
                           child: LotOfThemes.smallTxt1(widget.agencyVisits.customerFirmName?? '')),
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
                           child: LotOfThemes.smallTxt1(widget.agencyVisits.shippingFirmName?? '')),
                     ],
                   ),
                   marginBottom(),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       SizedBox(
                           width: 100,
                           child: LotOfThemes.smallHeading1(StringConstants.billingDays)),
                       Expanded(
                           child: LotOfThemes.smallTxt1(widget.agencyVisits.billingPercentage?? '')),
                     ],
                   ),
                 ],
               ),
             )
           ],
         ),
       ),
     ),
    );
  }
}
