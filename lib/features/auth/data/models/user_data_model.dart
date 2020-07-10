import 'package:hiso/features/auth/domain/entities/user_data.dart';
import 'package:meta/meta.dart';

class UserDataModel extends UserData {
  UserDataModel({
    @required String name,
    @required String accountType,
  }) : super(
          name: name,
          accountType: accountType,
        );

  factory UserDataModel.fromJson(Map<String, dynamic> data) {
    return UserDataModel(
      name: data['name'],
      accountType: data['accountType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'accountType': accountType,
    };
  }
}
