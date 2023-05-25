import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../auth_repository.dart';
import '../form_submission_status.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository? authRepository;

  LoginBloc({this.authRepository}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // Username updated
    if (event is LoginCallSignChanged) {
      yield state.copyWith(callSign: event.callSign);

      // Password updated
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form submitted
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepository!.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } on Exception catch (e) {
        // TODO
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
