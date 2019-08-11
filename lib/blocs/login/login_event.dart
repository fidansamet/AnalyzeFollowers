import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SignInEvent extends Equatable {
  SignInEvent([List props = const[]]) : super(props);
}

class LoginEvent extends SignInEvent {
  LoginEvent() : super();
}

class ReturnToInitialState extends SignInEvent {}
