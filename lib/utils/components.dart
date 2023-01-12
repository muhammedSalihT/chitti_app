import 'package:flutter/material.dart';

class Components {
  static getSnackBar(BuildContext context, String snackText) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(snackText)));
  }
}
