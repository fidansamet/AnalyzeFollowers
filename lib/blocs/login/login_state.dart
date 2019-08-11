import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const[]]) : super(props);
}

class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';
}

class LoginSuccessful extends LoginState {
  @override
  String toString() => 'Login is successful';
}

class LoginFailure extends LoginState {
  final int statusCode;
  final String error;
  LoginFailure(this.statusCode, this.error) : super([statusCode, error]);
}

class LoginLoading extends LoginState {}

class LoginCannotConnectServer extends LoginState {}
