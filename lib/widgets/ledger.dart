import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/add-product-controller.dart';
import 'package:myapp/model/listcities.dart';

import '../component/custom-drop-down.dart';
import '../component/roundButton.dart';
import '../constants/colorConstants.dart';
import '../constants/stringConstants.dart';
import '../model/listParties.dart';
import '../utils/lot-of-themes.dart';

class Ledger extends StatefulWidget {
  const Ledger({super.key});

  @override
  State<Ledger> createState() => _LedgerState();
}

enum Place { detailed, summary }

class _LedgerState extends State<Ledger> {
  bool selectedScheme = false;
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput3 = TextEditingController();
  TextEditingController dateinput2 = TextEditingController();
  String? dateValue;
  String? dateValue2;
  String? dateValue3;
  Place? _place;
  bool _homeFieldVisible = false;
  final AddProductController _addProductController = Get.find();
  String? selectedCityName = 'Select City', selectedAccountName = 'Select Account', account ='', city = '';
  Citys? selectedCityValue;
  Parties? selectedAccountValue;
var selected;

  void handleSelection(Place? value) {
    setState(() {
      _place = value;
      _homeFieldVisible = value == Place.summary;
    });
  }

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
            StringConstants.ledgerReport,
            style: TextStyle(color: ColorConstants.mainBgColor, fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomSearchableDropDown(
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
                      account = selectedAccountValue!.accountId!
                    });
                    // controller.getPendingCreditLimit(accountid!);
                  },
                ),
                // DropDown(
                //     menuItem: listAccountWidgets(controller),
                //     hint: StringConstants.selectAccount,
                //     selectedValue: selectedAccountValue,
                //     onChanged: (value) => {
                //       setState(() => {
                //         selectedAccountValue = value,
                //         selectedAccountName = selectedAccountValue!.accountName,
                //         account = selectedAccountValue!.accountId!
                //       })
                //     }),
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
                //     child: DropdownSearch<City>(
                //       popupProps: PopupProps.dialog(
                //           dialogProps: DialogProps(
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(2)),
                //           ),
                //           showSearchBox: true, showSelectedItems: true),
                //       items: controller?.city?? [],
                //       itemAsString: (City c) => c.cityName.toString(),
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
                        )),
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
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text(StringConstants.detailed),
                        value: Place.detailed,
                        groupValue: _place,
                        onChanged: handleSelection,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text(StringConstants.summary),
                        value: Place.summary,
                        groupValue: _place,
                        onChanged: handleSelection,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                if (_homeFieldVisible)
                  Column(
                    children: [
                      CustomSearchableDropDown(
                        items: controller.city ?? [],
                        label: StringConstants.selectAccount,
                        // multiSelectTag: 'Names',
                        // multiSelectValuesAsWidget: true,
                        // multiSelect: true,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey)),
                        dropDownMenuItems: controller.city?.map((item) {
                          return item.cityName;
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
                            city = selectedAccountValue!.accountId!
                          });
                          // controller.getPendingCreditLimit(accountid!);
                        },
                      ),
                      // DropDown(
                      //     menuItem: listCityWidgets(controller),
                      //     hint: StringConstants.selectCity,
                      //     selectedValue: selectedCityValue,
                      //     onChanged: (value) => {
                      //       setState(() => {
                      //         selectedCityValue = value,
                      //         selectedCityName = selectedCityValue!.cityName,
                      //         city = selectedCityValue!.cityID
                      //       })
                      //     }),
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
                      //           showSearchBox: true,
                      //           showSelectedItems: true),
                      //       items: const [
                      //         'abc',
                      //         'xyz',
                      //         'stu',
                      //         'qwe',
                      //         'asd',
                      //         'rtg'
                      //       ],
                      //       dropdownDecoratorProps: const DropDownDecoratorProps(
                      //           dropdownSearchDecoration: InputDecoration(
                      //               border: InputBorder.none,
                      //               hintText: StringConstants.selectCity)),
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
                    ],
                  ),
                Row(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Text(
                          StringConstants.dueAsOnDate,
                          style: TextStyle(color: ColorConstants.textDark),
                          textAlign: TextAlign.center,
                        )),
                    Expanded(
                      flex: 6,
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          onChanged: (val) {
                            setState(() {
                              dateValue3 = val;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select date';
                            }
                            return null;
                          },
                          controller: dateinput3,
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
                                dateinput3.text = formattedDate;
                              });
                            } else {
                              const Text(StringConstants.dateIsNotSelected);
                            }
                          },
                        ),
                      ),
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
                        text: StringConstants.view,
                        btnColor: ColorConstants.primaryColor,
                        btnWidth: 300,
                        press: () async {
                          await controller.getLedger(account!, city!);
                        }))
              ],
            ),
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

  listCityWidgets(AddProductController controller) {
    return controller.city!
        .map((item) => DropdownMenuItem<Citys>(
        value: item,
        child: Text('${item.cityName}',
            style: LotOfThemes.txt14DarkSmall,
            overflow: TextOverflow.ellipsis)))
        .toList();
  }
}
