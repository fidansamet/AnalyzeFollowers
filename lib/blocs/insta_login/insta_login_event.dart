import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class InstaSignInEvent extends Equatable {
  InstaSignInEvent([List props = const []]) : super(props);
}

class InstaLoginEvent extends InstaSignInEvent {
  InstaLoginEvent() : super();
}

class InstaReturnInitialState extends InstaSignInEvent {}
