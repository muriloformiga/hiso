import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserData extends Equatable {
  UserData({
    @required this.name,
    @required this.accountType,
  });

  final String name;
  final String accountType;

  @override
  List<Object> get props => [name, accountType];
}
