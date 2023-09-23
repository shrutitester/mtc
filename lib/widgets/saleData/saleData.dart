import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/constants/stringConstants.dart';
import 'package:myapp/controller/add-product-controller.dart';
import 'package:myapp/widgets/saleData/saleDataListItem.dart';

import '../../component/custom-drop-down.dart';
import '../../component/roundButton.dart';
import '../../model/listParties.dart';
import '../../utils/lot-of-themes.dart';

class SaleData extends StatefulWidget {
  const SaleData({super.key});

  @override
  State<SaleData> createState() => _SaleDataState();
}

class _SaleDataState extends State<SaleData> {
  Parties? selectedAccountValue;
  String? selectedAccountName = 'Select Account';
  String accountid = '';

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (AddProductController controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.primaryColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorConstants.mainBgColor,
              size: 22,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            StringConstants.saleBills,
            style: TextStyle(color: ColorConstants.mainBgColor, fontSize: 22),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    DropDown(
                        menuItem: listAccountWidgets(controller),
                        hint: StringConstants.selectAccount,
                        selectedValue: selectedAccountValue,
                        onChanged: (value) => {
                          setState(() => {
                            selectedAccountValue = value,
                            selectedAccountName = selectedAccountValue!.accountName,
                            accountid = selectedAccountValue!.accountId!
                          })
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 50,
                        // width: MediaQuery.of(context).size.width,
                        child: RoundedButton(
                            text: StringConstants.showBil,
                            btnColor: ColorConstants.primaryColor,
                            btnWidth: 300,
                            press: () async{
                              await controller.getSaleBills(accountid!);
                            }))
                  ],
                ),
              ),
              Expanded(
                  flex: 8,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.bills!.length,
                      itemBuilder: (BuildContext context, int index){
                        return SaleDataListItem(controller.bills![index]);
                      }))
            ],
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

}
