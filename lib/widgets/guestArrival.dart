import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/constants/stringConstants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/add-product-controller.dart';

import '../component/custom-drop-down.dart';
import '../component/roundButton.dart';
import '../component/roundedInputField.dart';
import '../model/listParties.dart';
import '../utils/lot-of-themes.dart';

class GuestArrival extends StatefulWidget {
  const GuestArrival({super.key});

  @override
  State<GuestArrival> createState() => _GuestArrivalState();
}

class _GuestArrivalState extends State<GuestArrival> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  File? image;
  String? dateValue;
  String? dateValue2;
  String? timeValue;
  String? timeValue2;
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput2 = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  TextEditingController timeInput2 = TextEditingController();
  TextEditingController _noOfGuestController = TextEditingController();
  TextEditingController _remarkController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _daysOfStayController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idNumberController = TextEditingController();
  String? guest = '',
      remark = '',
      mobile = '',
      stay = '',
      name = '',
      id = '';
  String? selectedTime;
  Parties? selectedPartyValue;
  String? selectedPartyName = 'Select Party', selectedAccountName = 'Select Account';
  Parties? selectedAccountValue;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
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
            StringConstants.customerArrival,
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
                      hintText: StringConstants.selectInDate,
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
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() {
                        timeValue = val;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select time';
                      }
                      return null;
                    },
                    controller: timeInput,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: StringConstants.selectInTime,
                      suffixIcon: Icon(Icons.watch_later_outlined),
                    ),
                    readOnly: true,
                    onTap: () async {
                      final TimeOfDay? time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      if (time != null) {
                        String formattedTime = time.format(context);
                        setState(() {
                          timeInput.text = formattedTime;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  StringConstants.selectInTime,
                  style: LotOfThemes.light14,
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
                Text(
                  StringConstants.party,
                  style: LotOfThemes.light14,
                ),
                DropDown(
                    menuItem: listPartyWidgets(controller),
                    hint: StringConstants.selectParty,
                    selectedValue: selectedPartyValue,
                    onChanged: (value) =>
                    {
                      setState(() =>
                      {
                        selectedPartyValue = value,
                        selectedPartyName = selectedPartyValue!.accountName,
                      })
                    }),
                // Container(
                //     height: 45,
                //     width: MediaQuery.of(context).size.width,
                //     padding: const EdgeInsets.symmetric(horizontal: 16),
                //     decoration: BoxDecoration(
                //         border: Border.all(color: Colors.grey, width: 1),
                //         borderRadius: BorderRadius.circular(5)),
                //     child: DropdownSearch<String>(
                //       popupProps:  PopupProps.dialog(
                //           dialogProps: DialogProps(
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(2)),
                //           ),
                //           showSearchBox: true, showSelectedItems: true),
                //       items: const ['abc', 'xyz', 'stu', 'qwe', 'asd', 'rtg'],
                //       dropdownDecoratorProps: const DropDownDecoratorProps(
                //           dropdownSearchDecoration: InputDecoration(
                //               border: InputBorder.none,
                //               hintText: StringConstants.selectParty)),
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
                // Text(
                //   StringConstants.nOfGuest,
                //   style: LotOfThemes.light14,
                // ),
                RoundedInputField(
                  label: StringConstants.nOfGuest,
                  controller: _noOfGuestController,
                  keyboardType: TextInputType.text,
                  type: StringConstants.username,
                  onChanged: (val) {
                    setState(() {
                      guest = val;
                      // model.caseValue = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // Text(
                //   StringConstants.remarkNewParty,
                //   style: LotOfThemes.light14,
                // ),
                RoundedInputField(
                  label: StringConstants.remarkNewParty,
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
                  height: 10,
                ),
                // Text(
                //   StringConstants.enterMobile,
                //   style: LotOfThemes.light14,
                // ),
                RoundedInputField(
                  label: StringConstants.enterMobile,
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
                Text(
                  StringConstants.location,
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
                      items: const ['abc', 'xyz', 'stu', 'qwe', 'asd', 'rtg'],
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: StringConstants.selectLocation)),
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
                // Text(
                //   StringConstants.daysOfStay,
                //   style: LotOfThemes.light14,
                // ),
                RoundedInputField(
                  label: StringConstants.daysOfStay,
                  controller: _daysOfStayController,
                  keyboardType: TextInputType.text,
                  type: StringConstants.username,
                  onChanged: (val) {
                    setState(() {
                      stay = val;
                      // model.caseValue = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                // Text(
                //   StringConstants.personName,
                //   style: LotOfThemes.light14,
                // ),
                RoundedInputField(
                  label: StringConstants.personName,
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  type: StringConstants.username,
                  onChanged: (val) {
                    setState(() {
                      name = val;
                      // model.caseValue = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  StringConstants.selectPhotoIdType,
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
                      items: const ['abc', 'xyz', 'stu', 'qwe', 'asd', 'rtg'],
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: StringConstants.selectIdType)),
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
                // Text(
                //   StringConstants.enterIdNumber,
                //   style: LotOfThemes.light14,
                // ),
                RoundedInputField(
                  label: StringConstants.enterIdNumber,
                  controller: _idNumberController,
                  keyboardType: TextInputType.text,
                  type: StringConstants.username,
                  onChanged: (val) {
                    setState(() {
                      id = val;
                      // model.caseValue = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   StringConstants.uploadDocument,
                    //   style: LotOfThemes.light14,
                    // ),
                    image != null
                        ? SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 4,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3,
                      child: Image.file(image!),
                    )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFF2C2C2C)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0x0fe0e0e0)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side:
                                      const BorderSide(color: Colors.grey)))),
                          onPressed: () {
                            pickImage();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.upload_file_rounded),
                              Text(
                                StringConstants.uploadDocument,
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          )),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                // Text(
                //   StringConstants.selectOutDate,
                //   style: LotOfThemes.light14,
                // ),
                SizedBox(
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
                      hintText: StringConstants.selectOutDate,
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
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() {
                        timeValue2 = val;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select time';
                      }
                      return null;
                    },
                    controller: timeInput2,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: StringConstants.selectOutTime,
                      suffixIcon: Icon(Icons.watch_later_outlined),
                    ),
                    readOnly: true,
                    onTap: () async {
                      final TimeOfDay? time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      if (time != null) {
                        String formattedTime2 = time.format(context);
                        setState(() {
                          timeInput2.text = formattedTime2;
                        });
                      }
                    },
                  ),
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
                        btnWidth: 300,
                        press: () {}))
              ],
            ),
          ),
        ),
      );
    });
  }

  listPartyWidgets(AddProductController controller){
    return controller.party!.map((item) => DropdownMenuItem<Parties>(
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
}
