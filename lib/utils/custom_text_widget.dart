import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    Key? key,
    required this.text,
    this.textSize,
    this.textColor,
    this.textWeight,
    this.onTap,
  }) : super(key: key);

  final String text;
  final double? textSize;
  final Color? textColor;
  final FontWeight? textWeight;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: textSize ?? 20,
            fontWeight: textWeight),
      ),
    );
  }
}
