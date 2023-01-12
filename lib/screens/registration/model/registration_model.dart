import 'package:hive/hive.dart';

part 'registration_model.g.dart';

@HiveType(typeId: 1)
class RegistrationModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String mobileNumber;
  @HiveField(4)
  final String? gender;
  @HiveField(5)
  final String? password;
  @HiveField(6)
  bool? isLoging;

  RegistrationModel(this.name, this.email, this.mobileNumber, this.gender,
      this.password, this.id, this.isLoging);
}
