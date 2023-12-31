import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/constants/stringConstants.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/add-product-controller.dart';

import '../../component/roundButton.dart';
import '../../model/listParties.dart';
import '../../utils/lot-of-themes.dart';
import 'creditLimitListItem.dart';

class CreditLimitStatus extends StatefulWidget {
  const CreditLimitStatus({super.key});

  @override
  State<CreditLimitStatus> createState() => _CreditLimitStatusState();
}

class _CreditLimitStatusState extends State<CreditLimitStatus> {
  String? dateValue;
  TextEditingController dateinput = TextEditingController();
  Parties? selectedAccountValue;
  String? selectedAccountName = 'Select Account', accountid = '';
  var selected;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AddProductController controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.primaryColor,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorConstants.mainBgColor,
              size: 22,
            ),
          ),
          title: Text(
            StringConstants.creditLimtStatus,
            style: TextStyle(color: ColorConstants.mainBgColor, fontSize: 22),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    CustomSearchableDropDown(
                      items: controller.account ?? [],
                      label: StringConstants.selectAccount,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey)),
                      dropDownMenuItems: controller.account?.map((item) {
                            return item.accountName;
                          }).toList() ??
                          [],
                      onChanged: (value) {
                        if (value != null) {
                          selected = value.toString();
                        } else {
                          selected = null;
                        }
                        setState(() => {
                              selectedAccountValue = value,
                              selectedAccountName = selectedAccountValue!.accountName,
                              accountid = selectedAccountValue!.accountId!
                            });
                        // controller.getPendingCreditLimit(accountid!);
                      },
                    ),
                    // DropDown(
                    //     menuItem: listAccountWidgets(controller),
                    //     hint: StringConstants.selectAccount,
                    //     selectedValue: selectedAccountValue,
                    //     onChanged: (value) => {
                    //           setState(() => {
                    //                 selectedAccountValue = value,
                    //                 selectedAccountName =
                    //                     selectedAccountValue!.accountName,
                    //                 accountid = selectedAccountValue!.accountId
                    //               })
                    //         }),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Text(
                              StringConstants.dueDate,
                              style:
                                  TextStyle(color: ColorConstants.txtColorDark),
                              textAlign: TextAlign.center,
                            )),
                        Expanded(
                            flex: 6,
                            child: SizedBox(
                              height: 50,
                              child: TextFormField(
                                onChanged: (val) {
                                  setState(() {
                                    dateValue = val;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select date';
                                  }
                                  return null;
                                },
                                controller: dateinput,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '01/04/2023',
                                  suffixIcon:
                                      Icon(Icons.calendar_today_outlined),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2101));
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickedDate);
                                    setState(() {
                                      dateinput.text = formattedDate;
                                    });
                                  } else {
                                    const Text(
                                        StringConstants.dateIsNotSelected);
                                  }
                                },
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 50,
                        // width: MediaQuery.of(context).size.width,
                        child: RoundedButton(
                            text: StringConstants.view,
                            btnColor: ColorConstants.primaryColor,
                            btnWidth: 300,
                            press: () async {
                              await controller.getCreditLimit(accountid!);
                              // _showMyDialog();
                            }))
                  ],
                ),
              ),
              Expanded(
                  flex: 7,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.credit.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CreditLimitListItem(controller.credit[index]);
                      }))
            ],
          ),
        ),
      );
    });
  }

  _showMyDialog() {
    return showDialog<void>(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return GetBuilder<AddProductController>(builder: (controller) {
            return AlertDialog(
              title: const Text(StringConstants.alert),
              content: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Column(
                  children: [
                    // controller.creditLimitStatus!.parties!.isEmpty
                    //     ?
                    Text('${controller.creditLimitStatus!.message} '),
                    // : SizedBox.shrink(),
                    // const SizedBox(
                    //   height: 10.0,
                    // ),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(StringConstants.ok))
                  ],
                ),
              ),
            );
          });
        });
  }

  // listAccountWidgets(AddProductController controller) {
  //   return controller.account!
  //       .map((item) => DropdownMenuItem<Parties>(
  //           value: item,
  //           child: Text(
  //             '${item.accountName}',
  //             style: LotOfThemes.txt14DarkSmall,
  //             overflow: TextOverflow.ellipsis,
  //           )))
  //       .toList();
  // }
}
