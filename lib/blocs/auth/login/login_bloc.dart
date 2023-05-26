import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import '../auth_repository.dart';
import '../form_submission_status.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository? authRepo;

  LoginBloc({this.authRepo}) : super(LoginState()) {
    on<LoginEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    // Username updated
    if (event is LoginCallSignChanged) {
      emit(state.copyWith(callSign: event.callSign));

      // Password updated
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));

      // Form submitted
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        await authRepo?.login();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } on Exception catch (e)  {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
