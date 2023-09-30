import 'package:flutter/material.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:myapp/constants/colorConstants.dart';

class DropDownSearch extends StatelessWidget {
  final String label;
  final dynamic selectedValue;
  final ValueChanged<dynamic> onChanged;
  final List<DropdownMenuItem> menuItem;

  const DropDownSearch(
      {Key? key,
        required this.label,
        required this.selectedValue,
        required this.onChanged,
        required this.menuItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: ColorConstants.grey)),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: CustomSearchableDropDown(
        items: menuItem,
        label: label,
        onChanged: onChanged,
        dropDownMenuItems: menuItem ,
      ),
    );
  }
}
