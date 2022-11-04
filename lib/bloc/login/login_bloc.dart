import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/login/login_event.dart';
import 'package:login_bloc/bloc/login/login_state.dart';
import 'package:login_bloc/services/login_authentication_service.dart';
import 'package:login_bloc/model/UserModel.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginPageState()) {
    on<LoginInitialEvent>((event, emit) async {
      emit(LoginPageState());
    });

    on<LoginWithMobile>((event, emit) async {
      try {
        // emit(LoginLoading());
        print("loginwithmobile");
        if (event.mobile != "9900000000") {
          // print("entered wrong mobile");
          emit(LoginFailure(error: "you have entered wrong mobile number"));
        } else {
          UserModel res =
              await authenticationService.signInWithMobile(event.mobile);
          // print("login data --${res}");
          emit(LoginSuccess(userModel: res));
        }
      } catch (e) {
        emit(LoginFailure(error: 'Something went wrong'));
      }
    });
    //logout
    on<LogOutEvent>((event, emit) async {
      print("logout event");
      try {
        emit(LoginPageState());
      } catch (e) {
        emit(LoginPageState());
      }
    });
  }

  AuthenticationService authenticationService = new AuthenticationService();
}
