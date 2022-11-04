import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/login/login_bloc.dart';
import 'package:login_bloc/screens/home_page.dart';
import 'package:login_bloc/screens/login_page.dart';
import 'package:login_bloc/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Login using bloc',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Login()),
    );
  }
}
