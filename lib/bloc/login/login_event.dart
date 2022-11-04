import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  List<Object> get props => [];
}

class LoginInitialEvent extends LoginEvent {}

class LogOutEvent extends LoginEvent {}


class LoginWithMobile extends LoginEvent {
  String mobile = '';
  LoginWithMobile(this.mobile);
  @override
  List<Object> get props => [mobile];
}
