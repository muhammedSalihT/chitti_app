import 'package:chit_app/constends/const_colors.dart';
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final bool hideData;
  final bool? readOnly;
  final String? hint;
  final IconData icon;
  final TextInputType textType;
  final String? label;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final String errorMessege;
  final VoidCallback? onTap;

  const TextFormWidget({
    Key? key,
    required this.hideData,
     this.hint,
    required this.icon,
    required this.textType,
    this.label,
    required this.controller,
    this.suffixIcon,
    required this.errorMessege,
    this.readOnly,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, right: 35.0),
      child: Column(
        children: [
          TextFormField(
            onTap: onTap,
            readOnly: readOnly ?? false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorMessege;
              } else {
                return null;
              }
            },
            controller: controller,
            keyboardType: textType,
            obscureText: hideData,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 22.0,
              fontWeight: FontWeight.w900,
            ),
            // controller: _mobileController,
            decoration: InputDecoration(
              labelText: label,
              prefixIcon: Icon(icon),
              suffix: suffixIcon,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              hintText: hint,
              hintStyle: const TextStyle(color: AppColors.bodyGrey),
            ),
          ),
        ],
      ),
    );
  }
}
