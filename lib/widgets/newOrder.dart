import 'dart:core';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/constants/stringConstants.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/add-product-controller.dart';
import 'package:myapp/model/listStyleCategory.dart';

import '../component/custom-drop-down.dart';
import '../component/roundButton.dart';
import '../component/roundedInputField.dart';
import '../model/listParties.dart';
import '../utils/lot-of-themes.dart';

class NewOrder extends StatefulWidget {

  const NewOrder({Key? key}) : super(key: key);

  @override
  State<NewOrder> createState() => _NewOrderState();
}

enum Place { parcel, loose }

enum Billing { none, direct, through }

class _NewOrderState extends State<NewOrder> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  Parties? parties;
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  String? dateValue;
  bool selectedScheme = false;
  Place? _place;
  Billing? _billing;
  bool _homeFieldVisible = true;
  bool _type = false;
  bool _type2 = false;
  final TextEditingController _subPartyRemarkController = TextEditingController();
  final TextEditingController _dispatchController = TextEditingController();
  final TextEditingController _givenByController = TextEditingController();
  final TextEditingController _itemRemarkController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _amountInWorkController = TextEditingController();
  final TextEditingController _noOfCasesController = TextEditingController();
  final TextEditingController _bookingController = TextEditingController();
  final TextEditingController _markaController = TextEditingController();
  final TextEditingController _dispatchRemarkController = TextEditingController();
  String? subParty = '', dispatchdays = '', givenBy = '', item = '', qty = '', amount = '',  amountInWork = '', cases = '', booking = '', marka = '', dispatch = '', supplierid = '';
  final AddProductController _addProductController = Get.find();
  Parties? selectedAccountValue;
  Parties? selectedPartyValue;
  Parties? selectedSalesmanValue;
  Parties? selectedTransportValue;
  Parties? selectedOwnValue;
  Parties? selectedSupplierValue;
  StyleCategories? selectedStyleValue;
  String? selectedStyleName = 'Select Style',selectedSupplierName = 'Select supplier',selectedOwnName = 'Select Own Firm',selectedTransportName = 'Select Salesman',selectedSalesmanName = 'Select Salesman',selectedPartyName = 'Select Party',selectedAccountName = 'Select Account';

  void handleSelection(Place? value) {
    setState(() {
      _place = value;
      _homeFieldVisible = value == Place.parcel;
    });
  }

  void billingType(Billing? value) {
    setState(() {
      _billing = value;
      _type = value == Billing.direct;
    });
    setState(() {
      _billing = value;
      _type2 = value == Billing.through;
    });
  }

  @override
  void initState() {
    getStyle();
    super.initState();
  }

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
                )),
            title: Text(
              StringConstants.orderEntryNew,
              style: TextStyle(color: ColorConstants.mainBgColor, fontSize: 22),
            ),
          ),
          key: _globalKey,
          body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringConstants.account,
                          style: LotOfThemes.light14,
                        ),
                        DropDown(
                            menuItem: listAccountWidgets(_addProductController),
                            hint: StringConstants.selectAccount,
                            selectedValue: selectedAccountValue,
                            onChanged: (value) => {
                              setState(() => {
                                selectedAccountValue = value,
                                selectedAccountName = selectedAccountValue!.accountName,
                              })
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringConstants.party,
                          style: LotOfThemes.light14,
                        ),
                        DropDown(
                            menuItem: listPartyWidgets(_addProductController),
                            hint: StringConstants.selectParty,
                            selectedValue: selectedPartyValue,
                            onChanged: (value) => {
                              setState(() => {
                                selectedPartyValue = value,
                                selectedPartyName = selectedPartyValue!.accountName,
                              })
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        RoundedInputField(
                          label: StringConstants.subPartyRemark,
                          controller: _subPartyRemarkController,
                          keyboardType: TextInputType.text,
                          type: StringConstants.username,
                          onChanged: (val) {
                            setState(() {
                              subParty = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringConstants.visit,
                          style: LotOfThemes.light14,
                        ),
                        Container(
                            height: 45,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownSearch<String>(
                              popupProps: PopupProps.dialog(
                                  dialogProps: DialogProps(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                  ),
                                  showSearchBox: true, showSelectedItems: true),
                              items: const [
                                'abc',
                                'xyz',
                                'stu',
                                'qwe',
                                'asd',
                                'rtg'
                              ],
                              dropdownDecoratorProps: const DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: StringConstants.selectVisit)),
                              onChanged: (val) {
                                // selectedCustomer = val;
                                setState(() {
                                  // initializeState(val);
                                });
                              },
                              // selectedItem: _chosenValue1,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringConstants.salesman,
                          style: LotOfThemes.light14,
                        ),
                        DropDown(
                            menuItem: listSalesmanWidgets(_addProductController),
                            hint: StringConstants.selectSalesman,
                            selectedValue: selectedSalesmanValue,
                            onChanged: (value) => {
                              setState(() => {
                                selectedSalesmanValue = value,
                                selectedSalesmanName = selectedSalesmanValue!.accountName,
                              })
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundedInputField(
                                label: StringConstants.dispatchDays,
                                controller: _dispatchController,
                                keyboardType: TextInputType.text,
                                type: StringConstants.username,
                                onChanged: (val) {
                                  setState(() {
                                    dispatchdays = val;
                                  });
                                },
                              ),
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
                                      suffixIcon: Icon(
                                          Icons.calendar_today_outlined),
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
                                        DateFormat('dd-MM-yyyy').format(
                                            pickedDate);
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
                        Text(
                          StringConstants.mode,
                          style: LotOfThemes.light14,
                        ),
                        Column(
                          children: [
                            Row(
                                children: [
                              Transform.scale(
                                scale: 1.20,
                                child: Radio<bool>(
                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => Colors.black),
                                  value: selectedScheme,
                                  groupValue: true,
                                  onChanged: (value) {
                                    setState(() {
                                      // model.selectedScheme = true;
                                      // widget.getBillingFirm(model);
                                    });
                                  },
                                ),
                              ),
                              Text(StringConstants.telephonic,
                                  style: LotOfThemes.light14),
                            ]),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.20,
                                  child: Radio<bool>(
                                    activeColor: ColorConstants.primaryColor,
                                    fillColor: MaterialStateColor.resolveWith(
                                            (states) =>
                                        ColorConstants.txtColorDark),
                                    value: selectedScheme,
                                    groupValue: true,
                                    onChanged: (value) {
                                      setState(() {
                                        // model.selectedScheme = false;
                                      });
                                    },
                                  ),
                                ),
                                Text(StringConstants.salesmanVisit,
                                    style: LotOfThemes.light14),
                              ],
                            ),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.20,
                                  child: Radio<bool>(
                                    activeColor: ColorConstants.primaryColor,
                                    fillColor: MaterialStateColor.resolveWith(
                                            (states) =>
                                        ColorConstants.txtColorDark),
                                    value: selectedScheme,
                                    groupValue: false,
                                    onChanged: (value) {
                                      setState(() {
                                        // model.selectedScheme = false;
                                      });
                                    },
                                  ),
                                ),
                                Text(StringConstants.marketVisit,
                                    style: LotOfThemes.light14),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RoundedInputField(
                          label: StringConstants.givenBy,
                          controller: _givenByController,
                          keyboardType: TextInputType.text,
                          type: StringConstants.username,
                          onChanged: (val) {
                            setState(() {
                              givenBy = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringConstants.supplier,
                          style: LotOfThemes.light14,
                        ),
                        DropDown(
                            menuItem: listSupplierWidgets(_addProductController),
                            hint: StringConstants.selectSupplier,
                            selectedValue: selectedSupplierValue,
                            onChanged: (value) => {
                              setState(() => {
                                selectedSupplierValue = value,
                                selectedSupplierName = selectedSupplierValue!.accountName,
                                supplierid = selectedSupplierValue!.accountId
                              })
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringConstants.styleCategory,
                          style: LotOfThemes.light14,
                        ),
                        DropDown(
                            menuItem: listStyleWidgets(_addProductController),
                            hint: StringConstants.selectStyleCategory,
                            selectedValue: selectedStyleValue,
                            onChanged: (value) async {
                              await controller.getStyleCategory(supplierid!);
                              // setState(() => {
                              //   selectedStyleValue = value,
                              //   selectedStyleName = selectedStyleValue!.styleCategoryName,
                              // });
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        RoundedInputField(
                          label: StringConstants.itemRemark,
                          controller: _itemRemarkController,
                          keyboardType: TextInputType.text,
                          type: StringConstants.username,
                          onChanged: (val) {
                            setState(() {
                              item = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringConstants.discountToCustomer,
                          style: LotOfThemes.light14,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Expanded(child: Text(StringConstants.percentage)),
                            Expanded(child: Text(StringConstants.rate)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RoundedInputField(
                                label: StringConstants.qty,
                                controller: _qtyController,
                                keyboardType: TextInputType.text,
                                type: StringConstants.username,
                                onChanged: (val) {
                                  setState(() {
                                    qty = val;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: RoundedInputField(
                                label: StringConstants.amount,
                                controller: _amountController,
                                keyboardType: TextInputType.text,
                                type: StringConstants.username,
                                onChanged: (val) {
                                  setState(() {
                                    amount = val;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RoundedInputField(
                          label: StringConstants.amountInWords,
                          controller: _amountInWorkController,
                          keyboardType: TextInputType.text,
                          type: StringConstants.username,
                          onChanged: (val) {
                            setState(() {
                              amountInWork = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringConstants.dispatchType,
                          style: LotOfThemes.light14,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                title: const Text(StringConstants.parcel),
                                value: Place.parcel,
                                groupValue: _place,
                                onChanged: handleSelection,
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                title: const Text(StringConstants.loose),
                                value: Place.loose,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RoundedInputField(
                                label: StringConstants.noOfCases,
                                controller: _noOfCasesController,
                                keyboardType: TextInputType.text,
                                type: StringConstants.username,
                                onChanged: (val) {
                                  setState(() {
                                    cases = val;
                                  });
                                },
                              ),
                              Text(
                                StringConstants.transport,
                                style: LotOfThemes.light14,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DropDown(
                                  menuItem: listTransportWidgets(_addProductController),
                                  hint: StringConstants.selectTransport,
                                  selectedValue: selectedTransportValue,
                                  onChanged: (value) => {
                                    setState(() => {
                                      selectedTransportValue = value,
                                      selectedTransportName = selectedTransportValue!.accountName,
                                    })
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              RoundedInputField(
                                label: StringConstants.booking,
                                controller: _bookingController,
                                keyboardType: TextInputType.text,
                                type: StringConstants.username,
                                onChanged: (val) {
                                  setState(() {
                                    booking = val;
                                    // model.caseValue = val;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RoundedInputField(
                                label: StringConstants.marka,
                                controller: _markaController,
                                keyboardType: TextInputType.text,
                                type: StringConstants.username,
                                onChanged: (val) {
                                  setState(() {
                                    marka = val;
                                    // model.caseValue = val;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        RoundedInputField(
                          label: StringConstants.dispatchRemark,
                          controller: _dispatchRemarkController,
                          keyboardType: TextInputType.text,
                          type: StringConstants.username,
                          onChanged: (val) {
                            setState(() {
                              dispatch = val;
                              // model.caseValue = val;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringConstants.billingType,
                          style: LotOfThemes.light14,
                        ),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.20,
                              child: Radio(
                                value: Billing.none,
                                groupValue: _billing,
                                onChanged: billingType,
                              ),
                            ),
                            Text(StringConstants.none, style: LotOfThemes
                                .light14),
                            Transform.scale(
                              scale: 1.20,
                              child: Radio(
                                value: Billing.direct,
                                groupValue: _billing,
                                onChanged: billingType,
                              ),
                            ),
                            Text(StringConstants.direct,
                                style: LotOfThemes.light14),
                            Transform.scale(
                              scale: 1.20,
                              child: Radio(
                                value: Billing.through,
                                groupValue: _billing,
                                onChanged: billingType,
                              ),
                            ),
                            Text(StringConstants.through,
                                style: LotOfThemes.light14),
                          ],
                        ),
                        if (_type)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                StringConstants.customerFirm,
                                style: LotOfThemes.light14,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: 45,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownSearch<String>(
                                    popupProps: PopupProps.dialog(
                                        dialogProps: DialogProps(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(2)),
                                        ),
                                        showSearchBox: true,
                                        showSelectedItems: true),
                                    items: const [
                                      'abc',
                                      'xyz',
                                      'stu',
                                      'qwe',
                                      'asd',
                                      'rtg'
                                    ],
                                    dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                        InputDecoration(
                                          border: InputBorder.none,
                                          // hintText: StringConstants.selectBillingDays
                                        )),
                                    onChanged: (val) {
                                      // selectedCustomer = val;
                                      setState(() {
                                        // initializeState(val);
                                      });
                                    },
                                    // selectedItem: _chosenValue1,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                StringConstants.shippingFirm,
                                style: LotOfThemes.light14,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: 45,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownSearch<String>(
                                    popupProps: PopupProps.dialog(
                                        dialogProps: DialogProps(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(2)),
                                        ),
                                        showSearchBox: true,
                                        showSelectedItems: true),
                                    items: const [
                                      'abc',
                                      'xyz',
                                      'stu',
                                      'qwe',
                                      'asd',
                                      'rtg'
                                    ],
                                    dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                        InputDecoration(
                                          border: InputBorder.none,
                                          // hintText: StringConstants.selectBillingDays
                                        )),
                                    onChanged: (val) {
                                      // selectedCustomer = val;
                                      setState(() {
                                        // initializeState(val);
                                      });
                                    },
                                    // selectedItem: _chosenValue1,
                                  )),
                            ],
                          ),
                        if (_type2)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                StringConstants.ownFirm,
                                style: LotOfThemes.light14,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              DropDown(
                                  menuItem: listOwnFirmWidgets(_addProductController),
                                  hint: StringConstants.select,
                                  selectedValue: selectedOwnValue,
                                  onChanged: (value) => {
                                    setState(() => {
                                      selectedOwnValue = value,
                                      selectedOwnName = selectedOwnValue!.accountName,
                                    })
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                StringConstants.customerFirm,
                                style: LotOfThemes.light14,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: 45,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownSearch<String>(
                                    popupProps: PopupProps.dialog(
                                        dialogProps: DialogProps(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(2)),
                                        ),
                                        showSearchBox: true,
                                        showSelectedItems: true),
                                    items: const [
                                      'abc',
                                      'xyz',
                                      'stu',
                                      'qwe',
                                      'asd',
                                      'rtg'
                                    ],
                                    dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                        InputDecoration(
                                          border: InputBorder.none,
                                          // hintText: StringConstants.selectBillingDays
                                        )),
                                    onChanged: (val) {
                                      // selectedCustomer = val;
                                      setState(() {
                                        // initializeState(val);
                                      });
                                    },
                                    // selectedItem: _chosenValue1,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                StringConstants.shippingFirm,
                                style: LotOfThemes.light14,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  height: 45,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownSearch<String>(
                                    popupProps: PopupProps.dialog(
                                        dialogProps: DialogProps(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(2)),
                                        ),
                                        showSearchBox: true,
                                        showSelectedItems: true),
                                    items: const [
                                      'abc',
                                      'xyz',
                                      'stu',
                                      'qwe',
                                      'asd',
                                      'rtg'
                                    ],
                                    dropdownDecoratorProps:
                                    const DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                        InputDecoration(
                                          border: InputBorder.none,
                                          // hintText: StringConstants.selectBillingDays
                                        )),
                                    onChanged: (val) {
                                      // selectedCustomer = val;
                                      setState(() {
                                        // initializeState(val);
                                      });
                                    },
                                    // selectedItem: _chosenValue1,
                                  )),
                            ],
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          StringConstants.billingDays,
                          style: LotOfThemes.light14,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 45,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownSearch<String>(
                              popupProps: PopupProps.dialog(
                                  dialogProps: DialogProps(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(2)),
                                  ),
                                  showSearchBox: true, showSelectedItems: true),
                              items: const [
                                'abc',
                                'xyz',
                                'stu',
                                'qwe',
                                'asd',
                                'rtg'
                              ],
                              dropdownDecoratorProps: const DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: StringConstants
                                          .selectBillingDays)),
                              onChanged: (val) {
                                // selectedCustomer = val;
                                setState(() {
                                  // initializeState(val);
                                });
                              },
                              // selectedItem: _chosenValue1,
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
                            text: StringConstants.submit,
                            btnColor: ColorConstants.primaryColor,
                            btnWidth: 290,
                            press: () {})),
                  ],
                ),
              )));
    });
  }

  listAccountWidgets(AddProductController controller){
    return controller.account!.map((item) => DropdownMenuItem<Parties>(
        value: item,
        child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
          overflow: TextOverflow.ellipsis,
        ))).toList();
  }

  listPartyWidgets(AddProductController controller){
    return controller.party!.map((item) => DropdownMenuItem<Parties>(
        value: item,
        child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
          overflow: TextOverflow.ellipsis,
        ))).toList();
  }

  listSalesmanWidgets(AddProductController controller){
    return controller.parties!.map((item) => DropdownMenuItem<Parties>(
        value: item,
        child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
          overflow: TextOverflow.ellipsis,
        ))).toList();
  }

  listTransportWidgets(AddProductController controller){
    return controller.transport!.map((item) => DropdownMenuItem<Parties>(
        value: item,
        child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
          overflow: TextOverflow.ellipsis,
        ))).toList();
  }

  listOwnFirmWidgets(AddProductController controller){
    return controller.ownFirm!.map((item) => DropdownMenuItem<Parties>(
        value: item,
        child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
          overflow: TextOverflow.ellipsis,
        ))).toList();
  }

  listSupplierWidgets(AddProductController controller){
    return controller.supplier!.map((item) => DropdownMenuItem<Parties>(
        value: item,
        child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
          overflow: TextOverflow.ellipsis,
        ))).toList();
  }

  listStyleWidgets(AddProductController controller){
    return controller.style!.map((item) => DropdownMenuItem<StyleCategories>(
        value: item,
        child: Text('${item.styleCategoryName}',style: LotOfThemes.txt14DarkSmall,
          overflow: TextOverflow.ellipsis,
        ))).toList();
  }

  void getStyle() async {
    await _addProductController.getStyleCategory(selectedSupplierName!);
  }
}
