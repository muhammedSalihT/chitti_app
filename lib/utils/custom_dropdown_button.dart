import 'package:chit_app/screens/take_chitti/view_model/take_chit_provider.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TakeChitProvider>(builder: (context, valu, _) {
      return CustomDropdownButton2(
        buttonDecoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
        buttonWidth: 100,
        dropdownWidth: 50,
        buttonHeight: 50,
        value: valu.itemNumber,
        hint: 'Select Item',
        dropdownItems: const [
          "1",
          "2",
          "3",
        ],
        onChanged: (value) {
          valu.getItem(value!);
        },
      );
    });
  }
}
