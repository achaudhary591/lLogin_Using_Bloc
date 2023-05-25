import 'package:bloc/bloc.dart';
import '../auth_repository.dart';
import '../form_submission_status.dart';
import 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository? authRepo;

  LoginBloc({this.authRepo}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginCallSignChanged) {
      yield* _mapLoginCallSignChangedToState(event);
    } else if (event is LoginPasswordChanged) {
      yield* _mapLoginPasswordChangedToState(event);
    } else if (event is LoginSubmitted) {
      yield* _mapLoginSubmittedToState(event);
    }
  }

  Stream<LoginState> _mapLoginCallSignChangedToState(
      LoginCallSignChanged event) async* {
    yield state.copyWith(callSign: event.callSign);
  }

  Stream<LoginState> _mapLoginPasswordChangedToState(
      LoginPasswordChanged event) async* {
    yield state.copyWith(password: event.password);
  }

  Stream<LoginState> _mapLoginSubmittedToState(LoginSubmitted event) async* {
    yield state.copyWith(formStatus: FormSubmitting());

    try {
      await authRepo!.login();
      yield state.copyWith(formStatus: SubmissionSuccess());
    } on Exception catch (e) {
      yield state.copyWith(formStatus: SubmissionFailed(e));
    }
  }
}
