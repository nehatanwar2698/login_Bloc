import 'package:equatable/equatable.dart';
import 'package:login_bloc/model/UserModel.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  UserModel userModel;
  LoginSuccess({required this.userModel});
}

class LoginPageState extends LoginState {}

class LoginFailure extends LoginState {
  String error = '';
  LoginFailure({required this.error});

  // @override
  // List<Object> get props => [error];
}

class LogOutState extends LoginState {}
