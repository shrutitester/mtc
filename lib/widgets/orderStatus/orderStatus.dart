import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/constants/stringConstants.dart';

import '../../component/roundButton.dart';
import '../../controller/add-product-controller.dart';
import '../../model/listParties.dart';
import 'orderStatusListItem.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({super.key});

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  String? dateValue;
  String? dateValue2;
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput2 = TextEditingController();
  final AddProductController _addProductController = Get.find();
  Parties? selectedPartyValue;
  String? selectedPartyName = 'Select Party',
      selectedSalesmanName = 'Select Salesman',
      selectedAccountName = 'Select Customer',
      selectedSupplierName = 'Select supplier';
  Parties? selectedSalesmanValue;
  Parties? selectedAccountValue;
  Parties? selectedSupplierValue;
  String customer = '', supplier = '', salesman = '', subparty = '';
  var selected;
  List? selectedList;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
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
            StringConstants.orderDetails,
            style: TextStyle(color: ColorConstants.mainBgColor, fontSize: 22),
          ),
          backgroundColor: ColorConstants.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: CustomSearchableDropDown(
                          items: controller.account ?? [],
                          label: StringConstants.selectAccount,
                          // multiSelectTag: 'Names',
                          // multiSelectValuesAsWidget: true,
                          // multiSelect: true,
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
                                  selectedAccountName =
                                      selectedAccountValue!.accountName,
                                  customer = selectedAccountValue!.accountId!
                                });
                            controller.getPendingCreditLimit(customer);
                          },
                        )
                            // DropDown(
                            //     menuItem: listAccountWidgets(controller),
                            //     hint: StringConstants.selectCustomer,
                            //     selectedValue: selectedAccountValue,
                            //     onChanged: (value) => {
                            //       setState(() => {
                            //         selectedAccountValue = value,
                            //         selectedAccountName = selectedAccountValue!.accountName,
                            //         customer = selectedAccountValue!.accountId!
                            //       })
                            //     }),
                            ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: CustomSearchableDropDown(
                          items: controller.supplier ?? [],
                          label: StringConstants.selectSupplier,
                          // multiSelectTag: 'Names',
                          // multiSelectValuesAsWidget: true,
                          // multiSelect: true,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.grey)),
                          dropDownMenuItems: controller.supplier?.map((item) {
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
                                  selectedSupplierValue = value,
                                  selectedSupplierName =
                                      selectedSupplierValue!.accountName,
                                  supplier = selectedSupplierValue!.accountId!
                                });
                            // controller.getPendingCreditLimit(customer!);
                          },
                        )
                            // DropDown(
                            //     menuItem: listSupplierWidgets(controller),
                            //     hint: StringConstants.selectSupplier,
                            //     selectedValue: selectedSupplierValue,
                            //     onChanged: (value) => {
                            //       setState(() => {
                            //         selectedSupplierValue = value,
                            //         selectedSupplierName = selectedSupplierValue!.accountName,
                            //         supplier = selectedSupplierValue!.accountId!
                            //       })
                            //     }),
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
                        Expanded(
                            child: CustomSearchableDropDown(
                          items: controller.parties ?? [],
                          label: StringConstants.selectSalesman,
                          // multiSelectTag: 'Names',
                          // multiSelectValuesAsWidget: true,
                          // multiSelect: true,
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
                                  selectedSalesmanName =
                                      selectedSalesmanValue!.accountName,
                                  salesman = selectedSalesmanValue!.accountId!
                                });
                            // controller.getPendingCreditLimit(customer!);
                          },
                        )
                            // DropDown(
                            //     menuItem: listSalesmanWidgets(controller),
                            //     hint: StringConstants.selectSalesman,
                            //     selectedValue: selectedSalesmanValue,
                            //     onChanged: (value) => {
                            //       setState(() => {
                            //         selectedSalesmanValue = value,
                            //         selectedSalesmanName = selectedSalesmanValue!.accountName,
                            //         salesman = selectedSalesmanValue!.accountId!
                            //       })
                            //     }),
                            ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: CustomSearchableDropDown(
                          items: controller.party ?? [],
                          label: StringConstants.selectSubParty,
                          // multiSelectTag: 'Names',
                          // multiSelectValuesAsWidget: true,
                          // multiSelect: true,
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
                                  selectedPartyName =
                                      selectedPartyValue!.accountName,
                                  subparty = selectedPartyValue!.accountId!
                                });
                            // controller.getPendingCreditLimit(customer!);
                          },
                        )
                            // DropDown(
                            //     menuItem: listPartyWidgets(controller),
                            //     hint: StringConstants.selectSubParty,
                            //     selectedValue: selectedPartyValue,
                            //     onChanged: (value) => {
                            //       setState(() => {
                            //         selectedPartyValue = value,
                            //         selectedPartyName = selectedPartyValue!.accountName,
                            //         subparty = selectedPartyValue!.accountId!
                            //       })
                            //     }),
                            ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                          ),
                          // InkWell(
                          //   onTap: () =>
                          //       _selectDate(context, startDateTime, DateTime(2023)),
                          //   child: Container(
                          //       height: 50,
                          //       decoration: BoxDecoration(
                          //           border: Border.all(
                          //             width: 0.7,
                          //             color: ColorConstants.midGrey,
                          //           ),
                          //           color: Colors.white,
                          //           borderRadius: BorderRadius.circular(4)),
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //         children: [
                          //           Text(
                          //             '1/4/2023',
                          //             // startDate ?? "Start date",
                          //             style: LotOfThemes.dark14,
                          //           ),
                          //           Icon(Icons.calendar_today,
                          //               color: ColorConstants.primaryColor),
                          //         ],
                          //       )),
                          // ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
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
                            // hintText: ,
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
                        )
                            // InkWell(
                            //   onTap: () => startDate != null
                            //       ? _selectDate(
                            //           context, startDateTime!, DateTime(2023))
                            //       : ScaffoldMessenger.of(context).showSnackBar(
                            //           const SnackBar(
                            //               content: Text('Select start date first')),
                            //         ),
                            //   child: Container(
                            //       height: 50,
                            //       decoration: BoxDecoration(
                            //         border: Border.all(
                            //           width: 0.7,
                            //           color: ColorConstants.midGrey,
                            //         ),
                            //         color: Colors.white,
                            //         borderRadius: BorderRadius.circular(4),
                            //       ),
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //         children: [
                            //           Text(
                            //               '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                            //               style: LotOfThemes.dark14),
                            //           Icon(
                            //             Icons.calendar_today,
                            //             color: ColorConstants.primaryColor,
                            //           ),
                            //         ],
                            //       )),
                            // ),
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
                              await controller.getOrderStatus(
                                  customer, supplier, salesman, subparty);
                            }))
                  ],
                ),
              ),
              Expanded(
                  flex: 6,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.order?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return
                            //   Card(
                            //   child: Column(
                            //     children: [
                            //       Text('data')
                            //     ],
                            //   ),
                            // );
                            OrderStatusListItem(controller.order![index]);
                      }))
            ],
          ),
        ),
      );
    });
  }
}
