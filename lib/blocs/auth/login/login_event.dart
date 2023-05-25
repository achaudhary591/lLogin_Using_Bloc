abstract class LoginEvent {}

class LoginCallSignChanged extends LoginEvent {
  final String? callSign;

  LoginCallSignChanged({this.callSign});
}

class LoginPasswordChanged extends LoginEvent {
  final String? password;

  LoginPasswordChanged({this.password});
}

class LoginSubmitted extends LoginEvent {}