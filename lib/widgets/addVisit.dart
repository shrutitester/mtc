import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:intl/intl.dart';
import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/constants/stringConstants.dart';
import 'package:myapp/model/listParties.dart';
import 'package:myapp/utils/lot-of-themes.dart';

import '../component/custom-drop-down.dart';
import '../component/roundButton.dart';
import '../component/roundedInputField.dart';
import '../controller/add-product-controller.dart';
import '../utils/preferences.dart';

class AddVisit extends StatefulWidget {
  const AddVisit({super.key});

  @override
  State<AddVisit> createState() => _AddVisitState();
}

enum Billing { none, direct, through }

class _AddVisitState extends State<AddVisit> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  bool selectedScheme = false;
  String? dateValue;
  TextEditingController dateinput = TextEditingController();
  Billing? _billing;
  bool _type = false;
  bool _type2 = false;
  TextEditingController _visitnameController = TextEditingController();
  TextEditingController _creditlimitController = TextEditingController();
  TextEditingController _creditlimitinWordsController = TextEditingController();
  TextEditingController _graceamountController = TextEditingController();
  TextEditingController _closedaysController = TextEditingController();
  String? visit = '', credit = '', creditlimit = '', grace = '', close = '';
  final preference = AppPreferences();
  final AddProductController _addProductController = Get.find();
  Parties? selectedSalesmanValue;
  String? selectedSalesmanName = 'Select Salesman', selectedAccountName = 'Select Account', selectedPartyName = 'Select Party', selectedOwnName = 'Select Own Firm';
  Parties? selectedAccountValue;
  Parties? selectedPartyValue;
  Parties? selectedOwnValue;


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
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AddProductController controller) {
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
          backgroundColor: ColorConstants.primaryColor,
          title: Text(
            StringConstants.agencyVisit,
            style: TextStyle(color: ColorConstants.mainBgColor, fontSize: 22),
          ),
        ),
        key: _globalKey,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  RoundedInputField(
                    label: StringConstants.visitName,
                    controller: _visitnameController,
                    keyboardType: TextInputType.text,
                    type: StringConstants.username,
                    onChanged: (val) {
                      setState(() {
                        visit = val;
                        // model.caseValue = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.salesman,
                        style: LotOfThemes.light14,
                        textAlign: TextAlign.start,
                      ),
                      DropDown(
                          menuItem: listSalesmanWidgets(controller),
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
                      SizedBox(
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
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        StringConstants.account,
                        style: LotOfThemes.light14,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        StringConstants.party,
                        style: LotOfThemes.light14,
                      ),
                      DropDown(
                          menuItem: listPartyWidgets(controller),
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
                        label: StringConstants.creditLimit,
                        controller: _creditlimitController,
                        keyboardType: TextInputType.text,
                        type: StringConstants.username,
                        onChanged: (val) {
                          setState(() {
                            credit = val;
                            // model.caseValue = val;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        label: StringConstants.creditLimitInWords,
                        controller: _creditlimitinWordsController,
                        keyboardType: TextInputType.text,
                        type: StringConstants.username,
                        onChanged: (val) {
                          setState(() {
                            creditlimit = val;
                            // model.caseValue = val;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        label: StringConstants.graceAmount,
                        controller: _graceamountController,
                        keyboardType: TextInputType.text,
                        type: StringConstants.username,
                        onChanged: (val) {
                          setState(() {
                            grace = val;
                            // model.caseValue = val;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundedInputField(
                              label: StringConstants.closeDays,
                              controller: _closedaysController,
                              keyboardType: TextInputType.text,
                              type: StringConstants.username,
                              onChanged: (val) {
                                setState(() {
                                  close = val;
                                  // model.caseValue = val;
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
                              )
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        StringConstants.allowedBillingOption,
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
                          Text(
                              StringConstants.none, style: LotOfThemes.light14),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps.dialog(
                                      dialogProps: DialogProps(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                2)),
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
                                      dropdownSearchDecoration: InputDecoration(
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps.dialog(
                                      dialogProps: DialogProps(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                2)),
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
                                      dropdownSearchDecoration: InputDecoration(
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
                                menuItem: listOwnFirmWidgets(controller),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps.dialog(
                                      dialogProps: DialogProps(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                2)),
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
                                      dropdownSearchDecoration: InputDecoration(
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps.dialog(
                                      dialogProps: DialogProps(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                2)),
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
                                      dropdownSearchDecoration: InputDecoration(
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
                      Container(
                          height: 45,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownSearch<String>(
                            popupProps: PopupProps.dialog(
                                dialogProps: DialogProps(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                                showSearchBox: true, showSelectedItems: true),
                            items: const [
                              '5',
                              '6',
                              '7',
                              '8',
                              '9',
                              '10'
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
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 50,
                      // width: MediaQuery.of(context).size.width,
                      child: RoundedButton(
                          text: StringConstants.submit,
                          btnColor: ColorConstants.primaryColor,
                          btnWidth: 300,
                          press: () => onSubmit(controller)))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  onSubmit(AddProductController controller) async {
    // await controller.addVisit(
    //     visit!,
    //     controller., DueDate, OwnFirmId, CustomerFirmId, SalesmanId, grace!, credit!, agencyVisitName, BillingPercentage, dueDays, shippingFirmId, AgencyBilllingTypeNameList, AgencyBillingTypeIDList)
  }

  listSalesmanWidgets(AddProductController controller){
    return controller.parties!.map((item) => DropdownMenuItem<Parties>(
      value: item,
        child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
            overflow: TextOverflow.ellipsis,
        ))).toList();
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

  listOwnFirmWidgets(AddProductController controller){
    return controller.ownFirm!.map((item) => DropdownMenuItem<Parties>(
      value: item,
        child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
            overflow: TextOverflow.ellipsis,
        ))).toList();
  }
}
