import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Update extends Equatable {
  Update({
    @required this.date,
    @required this.hour,
    @required this.message,
  });

  final String date;
  final String hour;
  final String message;

  @override
  List<Object> get props => [
        date,
        hour,
        message,
      ];
}
