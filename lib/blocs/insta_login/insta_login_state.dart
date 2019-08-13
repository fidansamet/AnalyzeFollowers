import 'dart:convert';
import 'package:analyze_followers/models/auth_infos.dart';
import 'package:analyze_followers/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class InstaLoginState extends Equatable {
  InstaLoginState([List props = const []]) : super(props);
}

class InstaLoginInitial extends InstaLoginState {
  @override
  String toString() => 'LoginInitial';
}

class InstaLoginSuccessful extends InstaLoginState {
  @override
  String toString() => 'Login is successful';
  Utils utils = new Utils();
  String token;

  InstaLoginSuccessful(String token) {
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

class InstaLoginFailure extends InstaLoginState {
  InstaLoginFailure() : super();
}

class InstaLoginLoading extends InstaLoginState {}
