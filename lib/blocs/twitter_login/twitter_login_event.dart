import 'package:equatable/equatable.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TwitterSignInEvent extends Equatable {
  TwitterSignInEvent([List props = const []]) : super(props);
}

class TwitterLoginEvent extends TwitterSignInEvent {
  final TwitterLogin twitterLogin;

  TwitterLoginEvent(this.twitterLogin) : super([twitterLogin]);
}

class TwitterReturnInitialState extends TwitterSignInEvent {}
