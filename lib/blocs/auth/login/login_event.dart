part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginCallSignChanged extends LoginEvent {
  final String callSign;

  LoginCallSignChanged({required this.callSign});
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginSubmitted extends LoginEvent{

}