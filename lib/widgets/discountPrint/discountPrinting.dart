import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/constants/stringConstants.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../component/roundButton.dart';
import '../../controller/add-product-controller.dart';
import '../../model/listParties.dart';
import '../../model/listcities.dart';
import 'discount.dart';

class DiscountPrinting extends StatefulWidget {
  const DiscountPrinting({super.key});

  @override
  State<DiscountPrinting> createState() => _DiscountPrintingState();
}

class _DiscountPrintingState extends State<DiscountPrinting> {
  final AddProductController _addProductController = Get.find();
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  Citys? selectedCityValue;
  String? selectedCityName = 'Select City', selectedAccountName = 'Select Customer', selectedSupplierName = 'Select supplier';
  Parties? selectedAccountValue;
  Parties? selectedSupplierValue;
  String customer = '', supplier = '', city = '';
  var selected;
  List? selectedList;

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomSearchableDropDown(
                    items: controller.account ?? [],
                    label: StringConstants.selectCustomer,
                    multiSelectTag: 'Names',
                    multiSelectValuesAsWidget: true,
                    multiSelect: true,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                          color: Colors.grey)),
                    dropDownMenuItems: controller.account?.map((item) {
                      return item.accountName;}).toList() ?? [],
                    onChanged: (value){
                      print(value.toString());
                      if(value!=null)
                      {selectedList = jsonDecode(value);} else{
                        selectedList?.clear();
                      }
                      setState(() => {
                        selectedAccountValue = value,
                        selectedAccountName = selectedAccountValue!.accountName,
                        customer = selectedAccountValue!.accountId!
                      });
                    },
                  ),
                ),

                // const SizedBox(
                //   height: 10,
                // ),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomSearchableDropDown(
                    items: controller.supplier ?? [],
                    label: StringConstants.selectSupplier,
                    multiSelectTag: 'Names',
                    multiSelectValuesAsWidget: true,
                    multiSelect: true,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Colors.grey)),
                    dropDownMenuItems: controller.supplier?.map((item) {
                      return item.accountName;}).toList() ?? [],
                    onChanged: (value){
                      print(value.toString());
                      if(value!=null)
                      {selectedList = jsonDecode(value);} else{
                        selectedList?.clear();
                      }
                      setState(() => {
                        selectedSupplierValue = value,
                        selectedSupplierName = selectedSupplierValue!.accountName,
                        supplier = selectedSupplierValue!.accountId!
                      });
                    },
                  ),
                ),

                // const SizedBox(
                //   height: 10,
                // ),
                // DropDown(
                //     menuItem: listCityWidgets(controller),
                //     hint: StringConstants.selectCity,
                //     selectedValue: selectedCityValue,
                //     onChanged: (value) => {
                //           setState(() => {
                //             selectedCityValue = value,
                //                 selectedCityName = selectedCityValue!.cityName,
                //             city = selectedCityValue!.cityID!
                //               })
                //         }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomSearchableDropDown(
                    items: controller.city ?? [],
                    label: StringConstants.selectCity,
                    multiSelectTag: 'Names',
                    multiSelectValuesAsWidget: true,
                    multiSelect: true,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Colors.grey)),
                    dropDownMenuItems: controller.city?.map((item) {
                      return item.cityName;}).toList() ?? [],
                    onChanged: (value){
                      print(value.toString());
                      if(value!=null)
                      {selectedList = jsonDecode(value);} else{
                        selectedList?.clear();
                      }
                      setState(() => {
                        selectedCityValue = value,
                        selectedCityName = selectedCityValue!.cityName,
                        city = selectedCityValue!.cityID!
                      });
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
                        text: StringConstants.viewDiscountPrintingReport,
                        btnColor: ColorConstants.primaryColor,
                        btnWidth: 300,
                        press: () async {
                          await _addProductController.getSaveAgencyDiscountoutpdf(customer, supplier, city);
                          Get.to(Discount());
                        }))
              ],
            ),
          ),
        ),
      );
    });
    // }));
  }
  // listAccountWidgets(AddProductController controller){
  //   return controller.account!.map((item) => DropdownMenuItem<Parties>(
  //       value: item,
  //       child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
  //         overflow: TextOverflow.ellipsis,
  //       ))).toList();
  // }
  //
  // listSupplierWidgets(AddProductController controller){
  //   return controller.supplier!.map((item) => DropdownMenuItem<Parties>(
  //       value: item,
  //       child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
  //         overflow: TextOverflow.ellipsis,
  //       ))).toList();
  // }
  //
  // listCityWidgets(AddProductController controller) {
  //   return controller.city!
  //       .map((item) => DropdownMenuItem<Citys>(
  //           value: item,
  //           child: Text('${item.cityName}',
  //               style: LotOfThemes.txt14DarkSmall,
  //               overflow: TextOverflow.ellipsis)))
  //       .toList();
  // }


}

