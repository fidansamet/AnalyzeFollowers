import 'package:meta/meta.dart';

@immutable
abstract class FollowInfoEvent {
  final String username;

  FollowInfoEvent(this.username);
}

class GetFollowers extends FollowInfoEvent {
  GetFollowers(String username) : super(username);
}

class GetFollowings extends FollowInfoEvent {
  GetFollowings(String username) : super(username);
}

class GetNotFollowers extends FollowInfoEvent {
  GetNotFollowers(String username) : super(username);
}

class FollowInfoReload extends FollowInfoEvent {
  FollowInfoReload(String username) : super(username);
}
