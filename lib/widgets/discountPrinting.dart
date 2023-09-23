import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/constants/stringConstants.dart';

import '../component/custom-drop-down.dart';
import '../component/roundButton.dart';
import '../controller/add-product-controller.dart';
import '../controller/thema-helper.dart';
import '../model/listParties.dart';
import '../model/listcities.dart';
import '../utils/lot-of-themes.dart';

class DiscountPrinting extends StatefulWidget {
  const DiscountPrinting({super.key});

  @override
  State<DiscountPrinting> createState() => _DiscountPrintingState();
}

class _DiscountPrintingState extends State<DiscountPrinting> {
  final AddProductController _addProductController = Get.find();

  Citys? selectedCityValue;
  String? selectedCityName = 'Select City', selectedAccountName = 'Select Customer', selectedSupplierName = 'Select supplier';
  Parties? selectedAccountValue;
  Parties? selectedSupplierValue;

  @override
  Widget build(BuildContext context) {
    // return GetBuilder(builder: ((AddProductController controller) {
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
            StringConstants.discountOutReport,
            style: TextStyle(color: ColorConstants.mainBgColor, fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DropDown(
                    menuItem: listAccountWidgets(controller),
                    hint: StringConstants.selectCustomer,
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
                DropDown(
                    menuItem: listSupplierWidgets(controller),
                    hint: StringConstants.selectSupplier,
                    selectedValue: selectedSupplierValue,
                    onChanged: (value) => {
                      setState(() => {
                        selectedSupplierValue = value,
                        selectedSupplierName = selectedSupplierValue!.accountName,
                      })
                    }),
                const SizedBox(
                  height: 10,
                ),
                DropDown(
                    menuItem: listCityWidgets(controller),
                    hint: StringConstants.selectCity,
                    selectedValue: selectedCityValue,
                    onChanged: (value) => {
                          setState(() => {
                            selectedCityValue = value,
                                selectedCityName = selectedCityValue!.cityName,
                              })
                        }),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 50,
                    // width: MediaQuery.of(context).size.width,
                    child: RoundedButton(
                        text: StringConstants.viewDiscountPrintingReport,
                        btnColor: ColorConstants.primaryColor,
                        btnWidth: 300,
                        press: () {}))
              ],
            ),
          ),
        ),
      );
    });
    // }));
  }
  listAccountWidgets(AddProductController controller){
    return controller.account!.map((item) => DropdownMenuItem<Parties>(
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

