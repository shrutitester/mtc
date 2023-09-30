import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/constants/stringConstants.dart';
import 'package:myapp/controller/add-product-controller.dart';

import '../component/roundedInputField.dart';
import '../model/listParties.dart';
import '../utils/lot-of-themes.dart';

class PendingCreditLimit extends StatefulWidget {
  const PendingCreditLimit({super.key});

  @override
  State<PendingCreditLimit> createState() => _PendingCreditLimitState();
}

class _PendingCreditLimitState extends State<PendingCreditLimit> {
  Parties? selectedAccountValue;
  String? selectedAccountName = 'Select Account', accountid = '', balance = '';
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
            StringConstants.pendingCreditLimit,
            style: TextStyle(color: ColorConstants.mainBgColor, fontSize: 22),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Text(
                StringConstants.selectCustomer,
                style: TextStyle(fontSize: 12),
              ),
              CustomSearchableDropDown(
                items: controller.account ?? [],
                label: StringConstants.selectAccount,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: Colors.grey)),
                dropDownMenuItems: controller.account?.map((item) {
                  return item.accountName;}).toList() ?? [],
                onChanged: (value){
                  if(value!=null) {selected = value.toString();} else{selected=null;}
                  setState(() => {
                    selectedAccountValue = value,
                    selectedAccountName = selectedAccountValue!.accountName,
                    accountid = selectedAccountValue!.accountId!});
                  controller.getPendingCreditLimit(accountid!);

                },),
              // DropDown(
              //     menuItem: listAccountWidgets(controller),
              //     hint: StringConstants.selectAccount,
              //     selectedValue: selectedAccountValue,
              //     onChanged: (value)  {
              //       setState(()  {
              //         selectedAccountValue = value;
              //         selectedAccountName = selectedAccountValue!.accountName;
              //         // accountid = selectedAccountValue!.accountId;
              //          controller.getPendingCreditLimit(selectedAccountValue!.accountId!);
              //       });
              //       // await controller.getPendingCreditLimit(selectedAccountValue!.accountId!);
              //     }),
              // const Text(
              //   StringConstants.selectCustomer,
              //   style: TextStyle(fontSize: 12),
              // ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                StringConstants.balance,
                style: TextStyle(fontSize: 12),
              ),
              RoundedInputField(
                initialValue: controller.addVisit?.message??'',
                keyboardType: TextInputType.text,
                textinputAction:
                TextInputAction.next,
                onChanged: (value) {
                  setState(() {
                    balance = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    // color: Colors.white,
                    border: Border.all(
                      color: ColorConstants.midGrey,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Text(controller.addVisit?.message??'',
                  style: LotOfThemes.dark14,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // listAccountWidgets(AddProductController controller) {
  //   return controller.account!.map((item) =>
  //       DropdownMenuItem<Parties>(
  //           value: item,
  //           child: Text(
  //             '${item.accountName}', style: LotOfThemes.txt14DarkSmall,
  //             overflow: TextOverflow.ellipsis,
  //           ))).toList();
  // }
}
