import 'package:bloc/bloc.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import './twitter_bloc.dart';

class TwitterLoginBloc extends Bloc<TwitterSignInEvent, TwitterLoginState> {
  @override
  TwitterLoginState get initialState => TwitterLoginInitial();

  @override
  Stream<TwitterLoginState> mapEventToState(TwitterSignInEvent event) async* {
    if (event is TwitterLoginEvent) {
      yield TwitterLoginLoading();

      final TwitterLoginResult result = await event.twitterLogin.authorize();
      String newMessage;

      switch (result.status) {
        case TwitterLoginStatus.loggedIn:
          newMessage = 'Logged in! username: ${result.session.username}';
          print(newMessage);
          print(result.session.token);
          yield TwitterLoginSuccessful(result.session.token);
          break;

        case TwitterLoginStatus.cancelledByUser:
          newMessage = 'Login cancelled by user.';
          yield TwitterLoginFailure();
          break;

        case TwitterLoginStatus.error:
          newMessage = 'Login error: ${result.errorMessage}';
          yield TwitterLoginFailure();
          break;

        default:
          yield TwitterLoginFailure();
          break;
      }
    } else if (event is TwitterReturnInitialState) {
      yield TwitterLoginInitial();
    }
  }
}
