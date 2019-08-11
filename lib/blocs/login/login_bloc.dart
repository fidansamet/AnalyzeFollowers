import 'package:bloc/bloc.dart';
import './bloc.dart';


class LoginBloc extends Bloc<SignInEvent, LoginState> {

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState (
      SignInEvent event
      ) async* {
    if (event is LoginEvent) {
      yield LoginLoading();

    } else if (event is ReturnToInitialState) {
      yield LoginInitial();
    }
  }
}
