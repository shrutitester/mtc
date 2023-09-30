import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/constants/stringConstants.dart';
import 'package:get/get.dart';
import 'package:myapp/widgets/status/visitStatusListItem.dart';

import '../../component/custom-drop-down.dart';
import '../../component/roundButton.dart';
import '../../controller/add-product-controller.dart';
import '../../model/listParties.dart';
import '../../utils/lot-of-themes.dart';


class VisitStatus extends StatefulWidget {
  const VisitStatus({super.key});

  @override
  State<VisitStatus> createState() => _VisitStatusState();
}

class _VisitStatusState extends State<VisitStatus> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput2 = TextEditingController();
  String? dateValue;
  String? dateValue2;
  final AddProductController _addProductController = Get.find();
  Parties? selectedCustomerValue;
  String? selectedCustomerName = 'Select Customer', selectedPartyName = 'Select Party', selectedSalesmanName = 'Select Salesman';
  Parties? selectedPartyValue;
  Parties? selectedSalesmanValue;
  String customer = '', party = '', salesman = '';
var selected;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
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
            StringConstants.visitStatus,
            style: TextStyle(color: ColorConstants.mainBgColor, fontSize: 22),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: CustomSearchableDropDown(
                              items: controller.account ?? [],
                              label: StringConstants.selectCustomer,
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
                                  selectedCustomerValue = value,
                                          selectedCustomerName = selectedCustomerValue!.accountName,
                                          customer = selectedCustomerValue!.accountId!
                                });
                                // controller.getPendingCreditLimit(accountid!);
                              },
                            ),
                            // DropDown(
                            //     menuItem: listCustomerWidgets(controller),
                            //     hint: StringConstants.selectCustomer,
                            //     selectedValue: selectedCustomerValue,
                            //     onChanged: (value) => {
                            //       setState(() => {
                            //         selectedCustomerValue = value,
                            //         selectedCustomerName = selectedCustomerValue!.accountName,
                            //         customer = selectedCustomerValue!.accountId!
                            //       })
                            //     }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: CustomSearchableDropDown(
                              items: controller.party ?? [],
                              label: StringConstants.selectParty,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.grey)),
                              dropDownMenuItems: controller.party?.map((item) {
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
                                  selectedPartyValue = value,
                                          selectedPartyName = selectedPartyValue!.accountName,
                                          party = selectedPartyValue!.accountId!
                                });
                                // controller.getPendingCreditLimit(accountid!);
                              },
                            ),
                            // DropDown(
                            //     menuItem: listPartyWidgets(controller),
                            //     hint: StringConstants.selectParty,
                            //     selectedValue: selectedPartyValue,
                            //     onChanged: (value) => {
                            //       setState(() => {
                            //         selectedPartyValue = value,
                            //         selectedPartyName = selectedPartyValue!.accountName,
                            //         party = selectedPartyValue!.accountId!
                            //       })
                            //     }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // DropDown(
                    //     menuItem: listSalesmanWidgets(controller),
                    //     hint: StringConstants.selectSalesman,
                    //     selectedValue: selectedSalesmanValue,
                    //     onChanged: (value) => {
                    //       setState(() => {
                    //         selectedSalesmanValue = value,
                    //         selectedSalesmanName = selectedSalesmanValue!.accountName,
                    //         salesman = selectedPartyValue!.accountId!
                    //       })
                    //     }),
                    CustomSearchableDropDown(
                      items: controller.parties ?? [],
                      label: StringConstants.selectSalesman,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey)),
                      dropDownMenuItems: controller.parties?.map((item) {
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
                          selectedSalesmanValue = value,
                          selectedSalesmanName = selectedSalesmanValue!.accountName,
                          salesman = selectedPartyValue!.accountId!
                        });
                        // controller.getPendingCreditLimit(accountid!);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
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
                              ),
                            )
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: SizedBox(
                              height: 50,
                              child: TextFormField(
                                onChanged: (val) {
                                  setState(() {
                                    dateValue2 = val;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select date';
                                  }
                                  return null;
                                },
                                controller: dateinput2,
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
                                      dateinput2.text = formattedDate;
                                    });
                                  } else {
                                    const Text(StringConstants.dateIsNotSelected);
                                  }
                                },
                              ),
                            )
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
                            text: StringConstants.show,
                            btnColor: ColorConstants.primaryColor,
                            btnWidth: 300,
                            press: () async {
                              await controller.getAgencyVisits(customer, party, salesman);
                            }))
                  ],
                ),
              ),
              Expanded(
                  flex: 6,
                  child: ListView.builder(
                    shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.agencyVisit.length,
                      itemBuilder: (BuildContext context, int index){
                      return VisitStatusListItem(controller.agencyVisit![index]);
                      }))
            ],
          ),
        ),
      );
    });
  }
  // listCustomerWidgets(AddProductController controller){
  //   return controller.account!.map((item) => DropdownMenuItem<Parties>(
  //       value: item,
  //       child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
  //         overflow: TextOverflow.ellipsis,
  //       ))).toList();
  // }
  //
  // listPartyWidgets(AddProductController controller){
  //   return controller.party!.map((item) => DropdownMenuItem<Parties>(
  //       value: item,
  //       child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
  //         overflow: TextOverflow.ellipsis,
  //       ))).toList();
  // }
  //
  // listSalesmanWidgets(AddProductController controller){
  //   return controller.parties!.map((item) => DropdownMenuItem<Parties>(
  //       value: item,
  //       child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
  //         overflow: TextOverflow.ellipsis,
  //       ))).toList();
  // }
}
