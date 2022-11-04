import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/Utility/loader.dart';
import 'package:login_bloc/bloc/login/login_bloc.dart';
import 'package:login_bloc/bloc/login/login_event.dart';
import 'package:login_bloc/bloc/login/login_state.dart';

import 'package:login_bloc/screens/home_page.dart';
import 'package:login_bloc/screens/login_page.dart';
import 'package:login_bloc/screens/otp_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _loadInitialState();
  }

  // _loadInitialState() async {
  //   BlocProvider.of<LoginBloc>(context).add(LoginInitialEvent());
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        print(state);

        if (state is LoginInitial) {
          BlocProvider.of<LoginBloc>(context).add(LoginInitialEvent());

          return Loader();
        } else if (state is LoginPageState || state is LoginFailure) {
          print(state);

          return LoginPage();
        } else if (state is LoginSuccess) {
          return OtpScreen(
            user: state.userModel,
          );
          // return Manage_Spams();
        }
        return Loader();
      },
    );
  }
}
