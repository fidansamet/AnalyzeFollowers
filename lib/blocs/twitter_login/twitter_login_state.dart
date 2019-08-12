import 'dart:convert';
import 'package:analyze_followers/models/auth_infos.dart';
import 'package:analyze_followers/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TwitterLoginState extends Equatable {
  TwitterLoginState([List props = const []]) : super(props);
}

class TwitterLoginInitial extends TwitterLoginState {
  @override
  String toString() => 'LoginInitial';
}

class TwitterLoginSuccessful extends TwitterLoginState {
  @override
  String toString() => 'Login is successful';
  Utils utils = new Utils();
  String token;

  TwitterLoginSuccessful(String token) {
    this.token = token;
    writeCache();
  }

  void writeCache() {
    AuthInfos userInfos = AuthInfos(this.token);
    final userInfosJson = userInfos.toMap();
    utils.writeUserInfos(json.encode(userInfosJson));
    utils.readUserInfos().then((String value) {
      print(value);
    });
  }
}

class TwitterLoginFailure extends TwitterLoginState {
  TwitterLoginFailure() : super();
}

class TwitterLoginLoading extends TwitterLoginState {}
