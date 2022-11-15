import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/login/login_bloc.dart';
import 'package:login_bloc/bloc/login/login_event.dart';
import 'package:login_bloc/model/UserModel.dart';

class HomePage extends StatelessWidget {
  UserModel user;
  HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
          actions: [
            IconButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(LogOutEvent());
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text("Welcome to Home Page  "),
        ));
  }
  //testttttt
  //testttt222
}
