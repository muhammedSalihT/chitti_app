import 'package:hive_flutter/hive_flutter.dart';
part 'user_chitti_model.g.dart';

@HiveType(typeId: 2)
class UserChittiModel {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String? chittiName;
  @HiveField(2)
  final String? chitNumber;
  @HiveField(3)
  final String? userNumber;
  @HiveField(5)
  final String? userEmail;
  @HiveField(6)
  final String? totalAmmount;

  UserChittiModel(this.userId, this.chittiName, this.chitNumber,
      this.userNumber, this.userEmail, this.totalAmmount);
}
