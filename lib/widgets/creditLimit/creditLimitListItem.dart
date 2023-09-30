import 'package:flutter/material.dart';

import '../../constants/stringConstants.dart';
import '../../model/creditLimitStatus.dart';
import '../../utils/lot-of-themes.dart';

class CreditLimitListItem extends StatefulWidget {
  final Party? party;
  const CreditLimitListItem(this.party, {super.key});

  @override
  State<CreditLimitListItem> createState() => _CreditLimitListItemState();
}

class _CreditLimitListItemState extends State<CreditLimitListItem> {
  Widget marginBottom() => const Padding(padding: EdgeInsets.only(bottom: 6));

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.accountName),),
                Expanded(child: LotOfThemes.smallTxt1(widget.party?.accountName ?? '')),
              ],
            ),
            marginBottom(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 100,
                    child: LotOfThemes.smallHeading1(StringConstants.mobile)),
                Expanded(
                    child: LotOfThemes.smallTxt1(widget.party?.mobile ?? '')),
              ],
            ),
            marginBottom(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.creditLimit),),
                Expanded(child: LotOfThemes.smallTxt1(widget.party?.creditLimit ?? '')),

              ],
            ),
            marginBottom(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 100,
                    child: LotOfThemes.smallHeading1(StringConstants.ledgerBalance)),
                Expanded(
                    child: LotOfThemes.smallTxt1(widget.party?.ledgerBalance ?? '')),
              ],
            ),
            marginBottom(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.avaiableLimit),),
                Expanded(child: LotOfThemes.smallTxt1(widget.party?.balanceAmount ?? '')),

              ],
            ),
            marginBottom(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.limitUtilized),),
                Expanded(child: LotOfThemes.smallTxt1(widget.party?.balanceAmount ?? '')),

              ],
            ),
            marginBottom(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 100, child: LotOfThemes.smallHeading1(StringConstants.dueBalance),),
                Expanded(child: LotOfThemes.smallTxt1(widget.party?.dueBalance ?? '')),

              ],
            )
          ],
        ),
      ),
    );
  }
}
