import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/constants/stringConstants.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/add-product-controller.dart';

import '../component/roundButton.dart';
import '../model/listParties.dart';

class SaleReport extends StatefulWidget {
  const SaleReport({super.key});

  @override
  State<SaleReport> createState() => _SaleReportState();
}

class _SaleReportState extends State<SaleReport> {
  String? dateValue;
  TextEditingController dateinput = TextEditingController();
  Parties? selectedAccountValue;
  String? selectedAccountName = 'Select Account', selectedPartyName = 'Select Party', selectedSalesmanName = 'Select Salesman';
  Parties? selectedPartyValue;
  Parties? selectedSalesmanValue;
  String account = '', party = '', salesman = '';
  var selected;
  List? selectedList;

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
            StringConstants.saleBills,
            style: TextStyle(color: ColorConstants.mainBgColor, fontSize: 22),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child:CustomSearchableDropDown(
                          items: controller.account ?? [],
                          label: StringConstants.selectAccount,
                          // multiSelectTag: 'Names',
                          // multiSelectValuesAsWidget: true,
                          // multiSelect: true,
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
                              account = selectedAccountValue!.accountId!});},),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: CustomSearchableDropDown(
                          items: controller.party ?? [],
                          label: StringConstants.selectAccount,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Colors.grey)),
                          dropDownMenuItems: controller.party?.map((item) {
                            return item.accountName;}).toList() ?? [],
                          onChanged: (value){
                            if(value!=null) {selected = value.toString();} else{selected=null;}
                            setState(() => {
                              selectedAccountValue = value,
                              selectedAccountName = selectedAccountValue!.accountName,
                              party = selectedAccountValue!.accountId!});},),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    // Expanded(
                    //     child:  DropDown(
                    //         menuItem: listSalesmanWidgets(controller),
                    //         hint: StringConstants.selectSalesman,
                    //         selectedValue: selectedSalesmanValue,
                    //         onChanged: (value) => {
                    //           setState(() => {
                    //             selectedSalesmanValue = value,
                    //             selectedSalesmanName = selectedSalesmanValue!.accountName,
                    //             salesman = selectedSalesmanValue!.accountId!
                    //           })
                    //         }),),
                    Expanded(
                        child:  CustomSearchableDropDown(
                          items: controller.parties ?? [],
                          label: StringConstants.selectAccount,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Colors.grey)),
                          dropDownMenuItems: controller.parties?.map((item) {
                            return item.accountName;}).toList() ?? [],
                          onChanged: (value){
                            if(value!=null) {selected = value.toString();} else{selected=null;}
                            setState(() => {
                              selectedAccountValue = value,
                              selectedAccountName = selectedAccountValue!.accountName,
                              salesman = selectedAccountValue!.accountId!});},)),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
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
                            suffixIcon: Icon(Icons.calendar_today_outlined),
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
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                              setState(() {
                                dateinput.text = formattedDate;
                              });
                            } else {
                              const Text(StringConstants.dateIsNotSelected);
                            }
                          },
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 50,
                    // width: MediaQuery.of(context).size.width,
                    child: RoundedButton(
                        text: StringConstants.showBil,
                        btnColor: ColorConstants.primaryColor,
                        btnWidth: 300,
                        press: () async {
                          await controller.getListSaleBills(account, party, salesman);
                        }))
              ],
            ),
          ),
        ),
      );
    });
  }
}
