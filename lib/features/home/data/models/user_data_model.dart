import 'package:hiso/features/home/domain/entities/user_data.dart';
import 'package:meta/meta.dart';

class UserDataModel extends UserData {
  UserDataModel({
    @required String name,
    @required String lastName,
    @required String accountType,
    @required String phone,
    @required String code,
    @required String cpf,
  }) : super(
          name: name,
          lastName: lastName,
          accountType: accountType,
          phone: phone,
          code: code,
          cpf: cpf,
        );

  factory UserDataModel.fromJson(Map<String, dynamic> data) {
    return UserDataModel(
      name: data['name'],
      lastName: data['lastName'],
      accountType: data['accountType'],
      phone: data['phone'],
      code: data['code'],
      cpf: data['cpf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'accountType': accountType,
      'phone': phone,
      'code': code,
      'cpf': cpf,
    };
  }
}
