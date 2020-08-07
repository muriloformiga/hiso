import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hiso/features/post/domain/entities/update.dart';
import 'package:meta/meta.dart';

class UpdateModel extends Update {
  UpdateModel({
    @required String date,
    @required String hour,
    @required String message,
  }) : super(
          date: date,
          hour: hour,
          message: message,
        );

  factory UpdateModel.fromJson(Map<String, dynamic> data) {
    final Timestamp timestamp = data['date'];
    final DateTime dateTime = timestamp.toDate();
    return UpdateModel(
      date: '${dateTime.day}/${dateTime.month}/${dateTime.year}',
      hour: '${dateTime.hour}:${dateTime.minute}',
      message: data['message'],
    );
  }
}
