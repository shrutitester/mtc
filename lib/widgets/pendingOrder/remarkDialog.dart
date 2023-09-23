import 'package:flutter/material.dart';

import '../../component/roundButton.dart';
import '../../component/roundedInputField.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstants.dart';

class RemarkDialog extends StatefulWidget {
  const RemarkDialog({super.key});

  @override
  State<RemarkDialog> createState() => _RemarkDialogState();
}

class _RemarkDialogState extends State<RemarkDialog> {
  Widget marginBottom() => const Padding(padding: EdgeInsets.only(bottom: 10));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height/5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            RoundedInputField(
              // prefixIcon: const Icon(Icons.person),
              label: StringConstants.remark,
              // hintText: 'User Name',
              maxLength: 24,
              counterText: "",
              textinputAction: TextInputAction.next,
              onChanged: (value) {
              },
              type: StringConstants.username,
              keyboardType: TextInputType.text,
            ),
            marginBottom(),
            Row(
              children: [
                Expanded(child: SizedBox(
                    height: 45,
                    // width: MediaQuery.of(context).size.width,
                    child: RoundedButton(
                        text: StringConstants.cancelOrder,
                        btnColor: ColorConstants.primaryColor,
                        // btnWidth: 300,
                        press: () {}))),
                const SizedBox(width: 4,),
                Expanded(child: SizedBox(
                    height: 45,
                    // width: MediaQuery.of(context).size.width,
                    child: RoundedButton(
                        text: StringConstants.finalOrder,
                        btnColor: ColorConstants.primaryColor,
                        // btnWidth: 300,
                        press: () {}))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
