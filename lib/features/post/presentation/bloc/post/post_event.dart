part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class PostPacientRegisterStarted extends PostEvent {
  PostPacientRegisterStarted({
    @required this.name,
    @required this.lastName,
    @required this.hospital,
    @required this.healthNumber,
    @required this.birthDate,
    @required this.message,
  });

  final String name;
  final String lastName;
  final String hospital;
  final String healthNumber;
  final String birthDate;
  final String message;

  @override
  List<Object> get props => [
        name,
        lastName,
        hospital,
        healthNumber,
        birthDate,
        message,
      ];
}
