import 'package:equatable/equatable.dart';

import '../form_submission_status.dart';

class LoginState extends Equatable{
  final String callSign;
  bool get isValidCallSign => callSign.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  LoginState({
    this.callSign = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? callSign,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      callSign: callSign ?? this.callSign,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [callSign, password, formStatus];
}
