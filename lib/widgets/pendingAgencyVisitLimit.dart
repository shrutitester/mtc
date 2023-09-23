import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:myapp/constants/stringConstants.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/add-product-controller.dart';

import '../component/custom-drop-down.dart';
import '../constants/colorConstants.dart';
import '../model/listParties.dart';
import '../utils/lot-of-themes.dart';

class PendingAgencyVisitLimit extends StatefulWidget {
  const PendingAgencyVisitLimit({super.key});

  @override
  State<PendingAgencyVisitLimit> createState() =>
      _PendingAgencyVisitLimitState();
}

class _PendingAgencyVisitLimitState extends State<PendingAgencyVisitLimit> {
  Parties? selectedAccountValue;
  String? selectedAccountName = 'Select Account';

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
            StringConstants.pendingAgencyVisitLimit,
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
              DropDown(
                  menuItem: listAccountWidgets(controller),
                  hint: StringConstants.selectAccount,
                  selectedValue: selectedAccountValue,
                  onChanged: (value) => {
                    setState(() => {
                      selectedAccountValue = value,
                      selectedAccountName = selectedAccountValue!.accountName,
                    })
                  }),
              // Container(
              //     height: 45,
              //     width: MediaQuery
              //         .of(context)
              //         .size
              //         .width,
              //     padding: const EdgeInsets.symmetric(horizontal: 16),
              //     decoration: BoxDecoration(
              //         border: Border.all(color: Colors.grey, width: 1),
              //         borderRadius: BorderRadius.circular(5)),
              //     child: DropdownSearch<String>(
              //       popupProps: PopupProps.dialog(
              //           dialogProps: DialogProps(
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(2)),
              //           ),
              //           showSearchBox: true, showSelectedItems: true),
              //       items: const ['abc', 'xyz', 'stu', 'qwe', 'asd', 'rtg'],
              //       dropdownDecoratorProps: const DropDownDecoratorProps(
              //           dropdownSearchDecoration: InputDecoration(
              //               border: InputBorder.none,
              //               hintText: StringConstants.selectAccount)),
              //       onChanged: (val) {
              //         // selectedCustomer = val;
              //         setState(() {
              //           // initializeState(val);
              //         });
              //       },
              //       // selectedItem: _chosenValue1,
              //     )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                StringConstants.balance,
                style: TextStyle(fontSize: 12),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 50,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: ColorConstants.midGrey,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Text(
                  "balance",
                  style: LotOfThemes.dark14,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
  listAccountWidgets(AddProductController controller){
    return controller.account!.map((item) => DropdownMenuItem<Parties>(
        value: item,
        child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
          overflow: TextOverflow.ellipsis,
        ))).toList();
  }
}
