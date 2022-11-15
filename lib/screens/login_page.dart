import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_bloc/Utility/loader.dart';
import 'package:login_bloc/bloc/login/login_bloc.dart';
import 'package:login_bloc/bloc/login/login_event.dart';
import 'package:login_bloc/bloc/login/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: SafeArea(minimum: const EdgeInsets.all(16), child: _loginForm()));
  }
}

class _loginForm extends StatelessWidget {
  _loginForm({super.key});
  final _formkey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        print(state);
        if (state is LoginFailure) {
          print("login failure status --${state.error}");
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (state is LoginSuccess) {
          Fluttertoast.showToast(
              msg: state.userModel.userLoginApi?.result ?? "",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: const EdgeInsets.only(top: 60.0, bottom: 30),
                  child: Center(
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: mobileController,
                    maxLength: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Mobile Number";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mobile',
                        hintText: 'Please Enter Mobile Number'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      login(context);

                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => HomePage()));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
  

  void login(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      var mobileNumber = mobileController.text;
      BlocProvider.of<LoginBloc>(context).add(LoginWithMobile(mobileNumber));

      // loginBloc.add(LoginInWithMobile(mobile: mobileController.text));
    }
  }
}
