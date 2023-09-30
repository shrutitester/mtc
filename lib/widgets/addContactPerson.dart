import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/controller/add-product-controller.dart';
import 'package:myapp/model/listDesignations.dart';
import 'package:myapp/model/listSmsTypes.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';

import '../component/roundedInputField.dart';
import '../constants/stringConstants.dart';
import '../model/listParties.dart';

class AddContactPerson extends StatefulWidget {
  const AddContactPerson({super.key});

  @override
  State<AddContactPerson> createState() => _AddContactPersonState();
}

class _AddContactPersonState extends State<AddContactPerson> {
  final _formKey = GlobalKey<FormState>();
  final AddProductController _addProductController = Get.find();
  bool _visible = false;
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _whatsAppController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  String? contact = '',
      mobile = '',
      whatsApp = '',
      email = '',
      remark = '';
  String? selectedDesignationName = 'Select Designation', selectedSmsName = 'Select Sms', selectedSupplierName = 'Select Account';
  Designations? selectedDesignationValue;
  SMSTypes? selectedSmsValue;
  Parties? selectedSupplierValue;
  var selected;
  List? selectedList;

  void changed(bool visible) {
    setState(() {
      _visible = visible;
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
            StringConstants.contactPersonDetails,
            style: TextStyle(color: ColorConstants.mainBgColor, fontSize: 22),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  _visible ? null : changed(true);
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: ColorConstants.mainBgColor,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CustomSearchableDropDown(
                        items: controller.supplier ?? [],
                        label: StringConstants.selectAccount,
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
                            selectedSupplierName = selectedSupplierValue!.accountName,
                          });
                          // controller.getPendingCreditLimit(accountid!);
                        },
                      ),
                      _visible ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            label: StringConstants.whatsAppNo,
                            controller: _contactController,
                            keyboardType: TextInputType.phone,
                            type: StringConstants.username,
                            onChanged: (val) {
                              setState(() {
                                contact = val;
                                // model.caseValue = val;
                              });
                            },
                          ),
                          TextButton(
                            child: Text(
                              StringConstants.getOtp,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: ColorConstants.txtColorDark,
                                  // decorationThickness: 2,
                                  color: ColorConstants.txtColorDark,
                                  fontSize: 14),
                              textAlign: TextAlign.right,
                            ),
                            onPressed: () {},
                          ),
                          RoundedInputField(
                            label: StringConstants.contactPerson,
                            controller: _mobileController,
                            keyboardType: TextInputType.text,
                            type: StringConstants.username,
                            onChanged: (val) {
                              setState(() {
                                mobile = val;
                                // model.caseValue = val;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomSearchableDropDown(
                            items: controller.designation ?? [],
                            label: StringConstants.selectDesignation,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.grey)),
                            dropDownMenuItems: controller.designation?.map((item) {
                              return item.designationName;
                            }).toList() ??
                                [],
                            onChanged: (value) {
                              if (value != null) {
                                selected = value.toString();
                              } else {
                                selected = null;
                              }
                              setState(() => {
                                selectedDesignationValue = value,
                                selectedDesignationName =
                                    selectedDesignationValue!.designationName,
                              });
                              // controller.getPendingCreditLimit(accountid!);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            label: StringConstants.mobile,
                            controller: _whatsAppController,
                            keyboardType: TextInputType.text,
                            type: StringConstants.username,
                            onChanged: (val) {
                              setState(() {
                                whatsApp = val;
                                // model.caseValue = val;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomSearchableDropDown(
                            items: controller.sms ?? [],
                            label: StringConstants.selectSmsType,
                            multiSelectTag: 'Names',
                              multiSelectValuesAsWidget: true,
                              multiSelect: true,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.grey)),
                            dropDownMenuItems: controller.sms?.map((item) {
                              return item.sMSTypeName;
                            }).toList() ??
                                [],
                            onChanged: (value) {
                              if (value != null) {
                                selected = value.toString();
                              } else {
                                selected = null;
                              }
                              setState(() => {
                                selectedSmsValue = value,
                                        selectedSmsName = selectedSmsValue!.sMSTypeName,
                              });
                              // controller.getPendingCreditLimit(accountid!);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            label: StringConstants.emailId,
                            controller: _emailController,
                            keyboardType: TextInputType.text,
                            type: StringConstants.username,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                                // model.caseValue = val;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            label: StringConstants.remark,
                            controller: _remarkController,
                            keyboardType: TextInputType.text,
                            type: StringConstants.username,
                            onChanged: (val) {
                              setState(() {
                                remark = val;
                                // model.caseValue = val;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ) : const SizedBox.shrink(),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  // listDesignationWidgets(AddProductController controller) {
  //   return controller.designation!
  //       .map((item) =>
  //       DropdownMenuItem<Designations>(
  //           value: item,
  //           child: Text('${item.designationName}',
  //               style: LotOfThemes.txt14DarkSmall,
  //               overflow: TextOverflow.ellipsis)))
  //       .toList();
  // }
  //
  // listSMSWidgets(AddProductController controller) {
  //   return controller.sms!
  //       .map((item) =>
  //       DropdownMenuItem<SMSTypes>(
  //           value: item,
  //           child: Text('${item.sMSTypeName}',
  //               style: LotOfThemes.txt14DarkSmall,
  //               overflow: TextOverflow.ellipsis)))
  //       .toList();
  // }
  //
  // listAccountWidgets(AddProductController controller){
  //   return controller.supplier!.map((item) => DropdownMenuItem<Parties>(
  //       value: item,
  //       child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
  //         overflow: TextOverflow.ellipsis,
  //       ))).toList();
  // }
}
