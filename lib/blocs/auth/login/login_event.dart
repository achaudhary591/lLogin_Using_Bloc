import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginCallSignChanged extends LoginEvent {
  final String? callSign;

  LoginCallSignChanged({this.callSign});

  @override
  // TODO: implement props
  List<Object?> get props => [callSign];
}

class LoginPasswordChanged extends LoginEvent {
  final String? password;

  LoginPasswordChanged({this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}