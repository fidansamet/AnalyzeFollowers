import 'package:meta/meta.dart';

@immutable
abstract class FollowInfoState {}

class FollowInfoInitial extends FollowInfoState {}

class FollowInfoSuccessful extends FollowInfoState {
  final List usersList;

  FollowInfoSuccessful(this.usersList);
}

class FollowInfoLoading extends FollowInfoState {}

class FollowInfoFailure extends FollowInfoState {
  final String message;

  FollowInfoFailure(this.message);
}
