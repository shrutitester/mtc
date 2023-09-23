import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/controller/add-product-controller.dart';
import 'package:myapp/model/listDesignations.dart';
import 'package:myapp/model/listSmsTypes.dart';

import '../component/custom-drop-down.dart';
import '../component/roundButton.dart';
import '../component/roundedInputField.dart';
import '../constants/stringConstants.dart';
import '../model/listParties.dart';
import '../utils/lot-of-themes.dart';

class AddContactPerson extends StatefulWidget {
  const AddContactPerson({super.key});

  @override
  State<AddContactPerson> createState() => _AddContactPersonState();
}

class _AddContactPersonState extends State<AddContactPerson> {
  final _formKey = GlobalKey<FormState>();
  final AddProductController _addProductController = Get.find();
  bool _visible = false;
  TextEditingController _contactController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _whatsAppController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _remarkController = TextEditingController();
  String? contact = '',
      mobile = '',
      whatsApp = '',
      email = '',
      remark = '';
  String? selectedDesignationName = 'Select Designation', selectedSmsName = 'Select Sms', selectedSupplierName = 'Select Account';
  Designations? selectedDesignationValue;
  SMSTypes? selectedSmsValue;
  Parties? selectedSupplierValue;

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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      DropDown(
                          menuItem: listAccountWidgets(controller),
                          hint: StringConstants.selectSupplier,
                          selectedValue: selectedSupplierValue,
                          onChanged: (value) => {
                            setState(() => {
                              selectedSupplierValue = value,
                              selectedSupplierName = selectedSupplierValue!.accountName,
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
                      RoundedInputField(
                        label: StringConstants.contactPerson,
                        controller: _contactController,
                        keyboardType: TextInputType.text,
                        type: StringConstants.username,
                        onChanged: (val) {
                          setState(() {
                            contact = val;
                            // model.caseValue = val;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropDown(
                          menuItem: listDesignationWidgets(controller),
                          hint: StringConstants.selectDesignation,
                          selectedValue: selectedDesignationValue,
                          onChanged: (value) =>
                          {
                            setState(() =>
                            {
                              selectedDesignationValue = value,
                              selectedDesignationName =
                                  selectedDesignationValue!.designationName,
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
                      //               hintText: StringConstants
                      //                   .selectDesignation)),
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
                      RoundedInputField(
                        label: StringConstants.mobile,
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
                      RoundedInputField(
                        label: StringConstants.whatsAppNo,
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

                      DropDown(
                          menuItem: listSMSWidgets(controller),
                          hint: StringConstants.selectSmsType,
                          selectedValue: selectedSmsValue,
                          onChanged: (value) => {
                            setState(() => {
                              selectedSmsValue = value,
                              selectedSmsName = selectedSmsValue!.sMSTypeName,
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
                      //               hintText: StringConstants.selectSmsType)),
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
                      DropDown(
                          menuItem: listSMSWidgets(controller),
                          hint: StringConstants.selectEmailType,
                          selectedValue: selectedSmsValue,
                          onChanged: (value) => {
                            setState(() => {
                              selectedSmsValue = value,
                              selectedSmsName = selectedSmsValue!.sMSTypeName,
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
                      //               hintText: StringConstants.selectEmailType)),
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
                  ),
                  _visible ?
                  SizedBox(
                      height: 40,
                      width: 240,
                      // width: MediaQuery.of(context).size.width,
                      child: FloatingActionButton(
                        backgroundColor: ColorConstants.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outline,
                              color: ColorConstants.mainBgColor,),
                            SizedBox(width: 10,),
                            Text(StringConstants.person, style: TextStyle(
                                color: ColorConstants.mainBgColor),)
                          ],
                        ),
                      )


                  ) : SizedBox.shrink()

                ],
              ),
            ),
          ),
        ),
        // floatingActionButton: SizedBox(
        //     height: 45,
        //     width: 180,
        //     child: FloatingActionButton(
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(30)
        //       ),
        //       onPressed: (){},
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Icon(Icons.add_circle_outline,color: ColorConstants.mainBgColor,),
        //           Text(StringConstants.person,style: TextStyle(color: ColorConstants.mainBgColor),)
        //         ],
        //       ),
        //     ),
        //   ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }

  listDesignationWidgets(AddProductController controller) {
    return controller.designation!
        .map((item) =>
        DropdownMenuItem<Designations>(
            value: item,
            child: Text('${item.designationName}',
                style: LotOfThemes.txt14DarkSmall,
                overflow: TextOverflow.ellipsis)))
        .toList();
  }

  listSMSWidgets(AddProductController controller) {
    return controller.sms!
        .map((item) =>
        DropdownMenuItem<SMSTypes>(
            value: item,
            child: Text('${item.sMSTypeName}',
                style: LotOfThemes.txt14DarkSmall,
                overflow: TextOverflow.ellipsis)))
        .toList();
  }

  listAccountWidgets(AddProductController controller){
    return controller.supplier!.map((item) => DropdownMenuItem<Parties>(
        value: item,
        child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
          overflow: TextOverflow.ellipsis,
        ))).toList();
  }
}
