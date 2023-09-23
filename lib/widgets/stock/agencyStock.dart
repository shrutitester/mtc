import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myapp/constants/colorConstants.dart';
import 'package:myapp/controller/add-product-controller.dart';
import 'package:myapp/widgets/stock/stockListItem.dart';

import '../../component/custom-drop-down.dart';
import '../../component/roundButton.dart';
import '../../constants/stringConstants.dart';
import '../../model/listParties.dart';
import '../../utils/lot-of-themes.dart';


class AgencyStock extends StatefulWidget {
  const AgencyStock({super.key});

  @override
  State<AgencyStock> createState() => _AgencyStockState();
}

class _AgencyStockState extends State<AgencyStock> {
  String? dateValue;
  String? dateValue2;
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput2 = TextEditingController();
  final AddProductController _addProductController = Get.find();
  Parties? selectedPartyValue;
  String? selectedPartyName = 'Select Party', selectedSalesmanName = 'Select Salesman', selectedAccountName = 'Select Customer', selectedSupplierName = 'Select supplier';
  Parties? selectedSalesmanValue;
  Parties? selectedAccountValue;
  Parties? selectedSupplierValue;

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
            ),
          ),
          title: Text(
            StringConstants.stock,
            style: TextStyle(color: ColorConstants.mainBgColor, fontSize: 22),
          ),
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
                            child: DropDown(
                                menuItem: listAccountWidgets(controller),
                                hint: StringConstants.selectCustomer,
                                selectedValue: selectedAccountValue,
                                onChanged: (value) => {
                                  setState(() => {
                                    selectedAccountValue = value,
                                    selectedAccountName = selectedAccountValue!.accountName,
                                  })
                                }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child:  DropDown(
                                menuItem: listSupplierWidgets(controller),
                                hint: StringConstants.selectSupplier,
                                selectedValue: selectedSupplierValue,
                                onChanged: (value) => {
                                  setState(() => {
                                    selectedSupplierValue = value,
                                    selectedSupplierName = selectedSupplierValue!.accountName,
                                  })
                                }),
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
                            child:  DropDown(
                                menuItem: listSalesmanWidgets(controller),
                                hint: StringConstants.selectSalesman,
                                selectedValue: selectedSalesmanValue,
                                onChanged: (value) => {
                                  setState(() => {
                                    selectedSalesmanValue = value,
                                    selectedSalesmanName = selectedSalesmanValue!.accountName,
                                  })
                                }),),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: DropDown(
                                menuItem: listPartyWidgets(controller),
                                hint: StringConstants.selectSubParty,
                                selectedValue: selectedPartyValue,
                                onChanged: (value) => {
                                  setState(() => {
                                    selectedPartyValue = value,
                                    selectedPartyName = selectedPartyValue!.accountName,
                                  })
                                }),),
                      ],
                    ),
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
                    SizedBox(
                        height: 40,
                        // width: MediaQuery.of(context).size.width,
                        child: RoundedButton(
                            text: StringConstants.show,
                            btnColor: ColorConstants.primaryColor,
                            btnWidth: 300,
                            press: () {})),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.orders!.length,
                      itemBuilder: (BuildContext context, int index){
                        return StockListItem(controller.orders![index]);
                      }))
            ],
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

  listSupplierWidgets(AddProductController controller){
    return controller.supplier!.map((item) => DropdownMenuItem<Parties>(
        value: item,
        child: Text('${item.accountName}',style: LotOfThemes.txt14DarkSmall,
          overflow: TextOverflow.ellipsis,
        ))).toList();
  }
}
