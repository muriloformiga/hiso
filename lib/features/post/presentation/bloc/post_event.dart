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
  });

  final String name;
  final String lastName;
  final String hospital;
  final String healthNumber;
  final DateTime birthDate;

  @override
  List<Object> get props => [
        name,
        lastName,
        hospital,
        healthNumber,
        birthDate,
      ];
}