import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserData extends Equatable {
  UserData({
    @required this.name,
    @required this.lastName,
    @required this.accountType,
    @required this.phone,
    @required this.code,
    @required this.cpf,
  });

  final String name;
  final String lastName;
  final String accountType;
  final String phone;
  final String code;
  final String cpf;

  @override
  List<Object> get props => [
        name,
        lastName,
        accountType,
        phone,
        code,
        cpf,
      ];
}
