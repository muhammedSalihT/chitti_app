import 'package:chit_app/constends/const_colors.dart';
import 'package:chit_app/screens/all_chitti/model/all_chitti_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllChittiProvider extends ChangeNotifier {
  List<AllChitiModel> allChitiList = [
    AllChitiModel(10, 5000, 100000, 10, " 10/1/2023", "10/10/2023",
        "DAY MONTHLY KURI FM01", AppColors.flutterBlue),
    AllChitiModel(20, 10000, 100000, 20, " 10/1/2023", "10/10/2023",
        "DAY MONTHLY KURI FM02", AppColors.primaryColor),
    AllChitiModel(20, 2000, 200000, 10, " 10/1/2023", "10/10/2023",
        "DAY MONTHLY KURI FM05", AppColors.bodyTextColor),
    AllChitiModel(10, 5000, 100000, 10, " 10/1/2023", "10/10/2023",
        "DAY MONTHLY KURI FM01", AppColors.flutterBlue),
    AllChitiModel(20, 10000, 100000, 20, " 10/1/2023", "10/10/2023",
        "DAY MONTHLY KURI FM02", AppColors.primaryColor),
    AllChitiModel(20, 2000, 200000, 10, " 10/1/2023", "10/10/2023",
        "DAY MONTHLY KURI FM05", AppColors.bodyTextColor),
  ];
}
