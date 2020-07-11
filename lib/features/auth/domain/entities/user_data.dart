import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserData extends Equatable {
  UserData({
    @required this.name,
    @required this.accountType,
    @required this.phone,
  });

  final String name;
  final String accountType;
  final String phone;

  @override
  List<Object> get props => [
        name,
        accountType,
        phone,
      ];
}
