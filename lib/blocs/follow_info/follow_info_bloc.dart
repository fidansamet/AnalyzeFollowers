import 'package:bloc/bloc.dart';
import 'bloc.dart';

class FollowInfoBloc extends Bloc<FollowInfoEvent, FollowInfoState> {
  @override
  FollowInfoState get initialState => FollowInfoInitial();

  @override
  Stream<FollowInfoState> mapEventToState(
    FollowInfoEvent event,
  ) async* {
    if (event is GetFollowers) {
      // request for followers
      final followers = null; // TODO
      if (followers != null) {
        yield FollowInfoSuccessful(followers);
      } else {
        final message = 'Could not connect to server!';
        yield FollowInfoFailure(message);
      }
    } else if (event is GetFollowings) {
      // request for followings
      final followings = null; // TODO
      if (followings != null) {
        yield FollowInfoSuccessful(followings);
      } else {
        final message = 'Could not connect to server!';
        yield FollowInfoFailure(message);
      }
    } else if (event is GetNotFollowers) {
      // request for not followers
      final notFollowers = null; // TODO
      if (notFollowers != null) {
        yield FollowInfoSuccessful(notFollowers);
      } else {
        final message = 'Could not connect to server!';
        yield FollowInfoFailure(message);
      }
    } else if (event is FollowInfoReload) {
      // TODO
    }
  }
}
